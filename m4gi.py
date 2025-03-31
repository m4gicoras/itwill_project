import discord
import aiohttp
import requests
from discord.ext import commands
from dotenv import load_dotenv
from bs4 import BeautifulSoup
import os
import json
import random
import re
import io
import time
import asyncio
import platform
import psutil

from PIL import Image, ImageDraw, ImageFont

intents = discord.Intents.default()
intents.message_content = True
intents.guilds = True
intents.members = True
intents.reactions = True
intents.voice_states = True

last_forum_post = None

monitor_running = False
monitor_task = None
monitor_message = None

WEBHOOK_URL = "https://discord.com/api/webhooks/1349605119615959060/UAZmzgGW6jqHG34CvffWTU4tAn6U_k-VUOlgkzC2iyNqOPKrHj2wM16dnsuOias6-Gpw"

load_dotenv()

from bitget_futures import fetch_futures_balance

ALLOWED_GUILDS_FILE = "allowed_guilds.json"

IGNORE_LIST_FILE = "board_ignore_list.json"

def load_ignore_list():
    try:
        with open(IGNORE_LIST_FILE, "r", encoding="utf-8") as f:
            return json.load(f)  # 무시할 닉네임들을 리스트 형태로 저장
    except (FileNotFoundError, json.decoder.JSONDecodeError):
        return []

def save_ignore_list(ignore_list: list):
    with open(IGNORE_LIST_FILE, "w", encoding="utf-8") as f:
        json.dump(ignore_list, f, ensure_ascii=False, indent=2)

BOARD_IGNORE_LIST = load_ignore_list()

def load_allowed_guilds():
    try:
        with open(ALLOWED_GUILDS_FILE, "r", encoding="utf-8") as f:
            try:
                data = json.load(f)
                return {str(gid): name for gid, name in data.items()}
            except json.decoder.JSONDecodeError:
                # 파일이 비어 있거나 올바르지 않은 형식이면 빈 집합 반환
                return {}
    except FileNotFoundError:
        return {}

def save_allowed_guilds(allowed_guilds: dict):
    # 파일 열 때도 encoding="utf-8"로 지정
    with open(ALLOWED_GUILDS_FILE, "w", encoding="utf-8") as f:
        json.dump(allowed_guilds, f, ensure_ascii=False, indent=2)

ALLOWED_GUILDS = load_allowed_guilds()

TOKEN = os.getenv("M4gi")
if not TOKEN:
    raise Exception("Token Not Found.")

bot = discord.Bot(intents=intents)
Master_ID = 433514511513681920

# 전역 딕셔너리에 GET 요청으로 가져온 커스텀 이모지 문자열을 저장
custom_emojis = {}

# 각 이모지 이름과 해당 이모지 ID (실제 값으로 교체)
EMOJI_IDS = {
    "Boss": "1341330801823842367",
    "Card": "1341330811928051765",
    "2x": "1341330870556037152",
    "3x": "1341330879536173087",
    "5x": "1341330860112347187",
    "7x": "1341330833872523374",
    "8x": "1341330848414171136",
    "10x": "1341330825572122645"
}

async def monitor_forum():
    global last_forum_post
    await bot.wait_until_ready()
    while not bot.is_closed():
        try:
            async with aiohttp.ClientSession() as session:
                async with session.get("https://www.latale.com/community/forum") as resp:
                    if resp.status == 200:
                        text = await resp.text()
                        soup = BeautifulSoup(text, "html.parser")
                        a_tag = soup.find("a", href=re.compile(r"/community/forum/view/(\d+)"))
                        if a_tag:
                            new_post_link = a_tag["href"]
                            title = a_tag.get_text(strip=True)
                            # 작성자 정보 추출
                            author_tag = a_tag.find_next("div", class_="name")
                            author = author_tag.get_text(strip=True) if author_tag else "Unknown"
                            
                            # 무시 목록 체크: 무시 대상이면 이후 처리 건너뜀
                            if author in BOARD_IGNORE_LIST:
                                print(f"Ignored post from {author}")
                            else:
                                # 글 등록 시간 및 기타 정보 추출
                                row = a_tag.find_parent("tr")
                                if row:
                                    date_td = row.find("td", class_="write-date")
                                    if date_td:
                                        time_tag = date_td.find("time")
                                        write_date = time_tag.get_text(strip=True) if time_tag else "Unknown"
                                    else:
                                        write_date = "Unknown"
                                else:
                                    write_date = "Unknown"
                                
                                post_match = re.search(r"/community/forum/view/(\d+)", new_post_link)
                                if post_match:
                                    new_post_num = int(post_match.group(1))
                                    
                                    if last_forum_post is None:
                                        last_forum_post = new_post_num
                                    elif new_post_num > last_forum_post:
                                        last_forum_post = new_post_num
                                        full_link = new_post_link if new_post_link.startswith("http") else f"https://www.latale.com{new_post_link}"
                                        
                                        # 게시글 상세 내용 추출
                                        async with session.get(full_link) as post_resp:
                                            if post_resp.status == 200:
                                                post_text = await post_resp.text()
                                                post_soup = BeautifulSoup(post_text, "html.parser")
                                                content_div = post_soup.find("div", class_="board-content")
                                                if content_div:
                                                    paragraphs = content_div.find_all("p")
                                                    content_text = "\n".join(
                                                        p.get_text(" ", strip=True)
                                                        for p in paragraphs if p.get_text(strip=True)
                                                    )
                                                else:
                                                    content_text = "내용을 가져올 수 없습니다."
                                            else:
                                                content_text = "내용을 가져올 수 없습니다."
                                        
                                        if len(content_text) > 1024:
                                            content_text = content_text[:1021] + "..."
                                        
                                        embed = discord.Embed(
                                            title="자유게시판에 새로운 글이 등록되었습니다.",
                                            description=f"제목 : [{title}]({full_link})",
                                            color=discord.Color.blue()
                                        )
                                        embed.add_field(name="작성자", value=author, inline=True)
                                        embed.add_field(name="내용", value=content_text, inline=False)
                                        embed.set_footer(text=f"등록일: {write_date}")
                                        
                                        webhook_payload = {"embeds": [embed.to_dict()]}
                                        await session.post(WEBHOOK_URL, json=webhook_payload)
        except Exception as e:
            print("Error in forum monitoring:", e)
        await asyncio.sleep(30)

@bot.event
async def on_ready():
    print(f'Logged in as {bot.user} (ID: {bot.user.id})')
    
    # application id는 그대로 사용 (필요에 따라 수정)
    application_id = "1341310627099967599"
    headers = {"Authorization": f"Bot {TOKEN}"}
    
    async with aiohttp.ClientSession() as session:
        for name, eid in EMOJI_IDS.items():
            emoji_url = f'https://discord.com/api/applications/{application_id}/emojis/{eid}'
            async with session.get(emoji_url, headers=headers) as response:
                if response.status == 200:
                    data = await response.json()
                    emoji_name = data.get("name", "unknown")
                    real_emoji_id = data.get("id", "0")
                    is_animated = data.get("animated", False)
                    prefix = "a" if is_animated else ""
                    custom_emojis[name] = f"<{prefix}:{emoji_name}:{real_emoji_id}>"
                    print(f"Fetched {name}: {custom_emojis[name]}")
                else:
                    print(f"Failed to fetch emoji {name}: {response.status}")
    print("Custom Emojis:", custom_emojis)

    bot.loop.create_task(monitor_forum())

def is_allowed_guild():
    async def predicate(ctx: discord.ApplicationContext):
        # 만약 명령어가 DM에서 실행되었거나 허용되지 않은 서버에서 실행되었다면...
        if ctx.guild is None or str(ctx.guild.id) not in ALLOWED_GUILDS:
            # 서버 정보가 있는 경우 __m4gi__에게 DM 전송
            if ctx.guild is not None:
                try:
                    m4gi_user = await bot.fetch_user(Master_ID)
                    if m4gi_user:
                        await m4gi_user.send(
                            f"허용되지 않은 서버에서 명령어 실행되었습니다.\n"
                            f"서버 이름: {ctx.guild.name}\n"
                            f"서버 ID: {ctx.guild.id}"
                        )
                except Exception as e:
                    print("Failed to send DM to __m4gi__:", e)
            await ctx.respond("허용되지 않은 서버입니다. Discord : \\_\\_m4gi\\_\\_로 문의 바랍니다.", ephemeral=True)
            return False
        return True
    return commands.check(predicate)

def is_master():
    async def predicate(ctx: discord.ApplicationContext):
        if ctx.author.id != Master_ID:
            await ctx.respond("이 명령어는 마스터만 사용할 수 있습니다.", ephemeral=True)
            return False
        return True
    return commands.check(predicate)

async def update_futures_balance_loop():
    global monitor_message, monitor_running
    while monitor_running:
        wallet_balance, unrealized_profit = fetch_futures_balance("USDT-FUTURES")
        if wallet_balance is not None:
            total = wallet_balance + unrealized_profit
            rate = get_usdt_to_krw_rate()
            if rate is not None:
                total_krw = total * rate
                conversion_text = f"**환산 잔고**: {total_krw:,.2f} KRW"
            else:
                conversion_text = "**환산 잔고**: 환율 정보를 가져올 수 없음"
            description_text = (
                f"**미실현 수익**: {unrealized_profit:,.2f} USDT\n"
                f"**현재 잔고**: {wallet_balance:,.2f} USDT\n"
                f"**합계 잔고**: {total:,.2f} USDT\n"
                f"{conversion_text}\n\n"
                f"업데이트 시각: <t:{int(time.time())}:T>"
            )
        else:
            description_text = "Bitget API 호출 실패. 잠시 후 다시 시도합니다."
        try:
            if monitor_message is not None:
                embed = discord.Embed(
                    title="USDT FUTURES 잔고 모니터링",
                    description=description_text,
                    color=discord.Color.blue()
                )
                await monitor_message.edit(embed=embed)
        except Exception as e:
            print("DEBUG - 메시지 수정 오류:", e)
        await asyncio.sleep(3)

def get_usdt_to_krw_rate():
    try:
        # Upbit의 ticker API를 사용 (인증 없이 사용 가능)
        response = requests.get("https://api.upbit.com/v1/ticker?markets=KRW-USDT")
        response.raise_for_status()
        data = response.json()
        if data and isinstance(data, list) and "trade_price" in data[0]:
            return float(data[0]["trade_price"])
        else:
            return None
    except Exception as e:
        print("Error fetching USDT to KRW rate:", e)
        return None        

@bot.event
async def on_application_command_error(ctx, error):
    if isinstance(error, commands.CheckFailure):
        # 이미 체크 함수에서 응답을 보냈으므로, 추가 에러 처리는 생략합니다.
        return
    # 다른 에러들에 대해서는 필요한 처리를 합니다.
    # 예를 들어, 로깅하고 re-raise 할 수도 있습니다.
    #print(f"Unhandled error: {error}")
    # 또는 re-raise 하고 싶다면:
    # raise error

@bot.slash_command(
    name="어드벤처", 
    description="현재 위치한 칸 수를 입력하여 이동 오브젝트와 기대 이동 칸 수를 확인합니다."
)

@is_allowed_guild()
@discord.option("current_pos", int, description="현재 위치한 칸 수를 입력하세요 (1-2659)")
async def 어드벤처(ctx: discord.ApplicationContext, current_pos: int):
    if current_pos < 1 or current_pos > 2659:
        embed = discord.Embed(
            description="1부터 2659까지의 칸 수를 입력해주세요.",
            color=discord.Color.blue()
        )
        await ctx.respond(embed=embed, ephemeral=True)
        return

    # 이동 오브젝트 정보
    special_events = {
    ########## 1 ###########    
        3: 21,  # +21칸 이동
        5: 10,  # +10칸 이동
        9: 7,
        13: 15, # +15칸 이동
    ########## 2 ###########
        33: 8,
        39: 16,
        43: 6,
        46: 18,
    ########## 3 ###########
        67: 23,
        70: 12,
        74: 24,
        81: 13,
    ########## 4 ###########    
        105: 12,
        109: 17,
        116: 14,
        121: 13,
    ########## 5 ###########  
        140: 19,
        142: 10,
        147: 7,
        151: 15,
    ########## 6 ###########
        170: 12,
        179: 19,
        187: 7,
    ########## 7 ###########
        202: 8,
        206: 10,
        213: 15,
        219: 7,
    ########## 8 ###########    
        236: 10,
        240: 15,
        242: 19,
        249: 9,
    ########## 9 ###########    
        265: 8,
        267: 10,
        271: 10,
        284: 7,
    ########## 10 ###########     
        296: 7,
        305: 19,
        309: 10,
        314: 12,
    ########## 11 ###########
        329: 7,
        339: 6,
        348: 8,
        351: 10,
    ########## 12 ###########
        367: 12,
        370: 28,
        373: 12,
        382: 7,
        392: -14,
    ########## 13 ###########
        404: 10,
        409: 12,
        417: 9,
    ########## 14 ###########
        436: 13,
        441: 19,
        443: 12, 
    ########## 15 ###########
        466: 12,
        474: 21,
        482: 10,
    ########## 16 ###########
        502: 12,
        508: 10,
        522: 9,
    ########## 17 ###########
        542: 10,
        545: 21,
        554: 9,
    ########## 18 ###########
        572: 11,
        580: 19,
        588: 6,
    ########## 19 ###########
        606: 11,
        609: 18,
        615: 17,
    ########## 20 ###########
        638: 15,
        643: 7,
        657: 6,
    ########## 21 ###########    
        668: 26,
        678: 6,
        688: 10,
    ########## 22 ########### 
        704: 23,
        707: 10,
        714: 15,
    ########## 23 ###########     
        738: 21,
        743: 6,
        755: 10,
    ########## 24 ###########      
        772: 6,
        776: 23,
        784: 10,
    ########## 25 ########### 
        805: 15,
        809: 22,
        812: 16,
    ########## 26 ########### 
        839: 9,
        846: 23,
        856: 7,
        870: -20,
    ########## 27 ###########
        876: 12,
        882: 24,
        893: 9,
    ########## 28 ###########
        912: 16,
        919: 16,
        921: 17,
    ########## 29 ###########
        945: 23,
        951: 6,
        963: 10,
    ########## 30 ###########
        980: 10,
        986: 23,
        997: 8,
        1010: -18,
    ########## 31 ###########
        1016: 28,
        1022: 12,
        1028: 10,
    ########## 32 ###########
        1051: 22,
        1066: 15,
        1082: -18,
    ########## 33 ###########
        1086: 17,
        1091: 21,
        1097: 11,
    ########## 34 ###########
        1118: 11,
        1125: 22,
        1138: 6,
        1148: -14,
    ########## 35 ###########
        1157: 12,
        1165: 27,
        1171: -16,
        1174: 8,
    ########## 36 ###########
        1198: 18,
        1206: 22,
        1221: 11,
        1235: -18,
    ########## 37 ###########
        1244: 10,
        1258: 20,
        1263: 10,
    ########## 38 ###########
        1284: 10,
        1289: 20,
        1304: 10,
        1316: -20,
    ########## 39 ###########
        1325: 17,
        1328: 11,
        1336: 19,
    ########## 40 ###########
        1364: 11,
        1370: 28,
        1378: 8,
    ########## 41 ###########
        1406: 9,
        1418: 8,
        1420: -10,
        1422: 12,        
    ########## 42 ###########
        1439: 14,
        1446: 23,
        1456: 7,
        1465: -14,    
    ########## 43 ###########
        1477: 26,
        1481: 7,
        1496: -17,
        1497: 16,      
    ########## 44 ###########
        1520: 24,
        1524: 14,
        1534: 20,
        1549: -9,      
    ########## 45 ###########
        1562: 8,
        1568: 23,
        1585: 24,
    ########## 46 ###########
        1609: 21,
        1616: 9,
    ########## 47 ###########
        1637: 14,
        1643: 16,
        1657: 16,
    ########## 48 ###########
        1685: 34,
        1690: 14,
        1700: 14,    
    ########## 49 ###########
        1728: 12,
        1733: 22,
        1745: 12,  
    ########## 50 ###########
        1762: 24,
        1768: 10,
        1782: 9,      
    ########## 51 ###########
        1802: 12,
        1808: 24,
        1818: -19,
        1819: 9,     
    ########## 52 ###########
        1837: 16,
        1848: 24,
        1866: 12,         
    ########## 53 ###########
        1885: 12,
        1894: 23,
        1905: -17,   
        1906: 18,   
    ########## 54 ###########
        1929: 14,
        1937: 14,
        1948: 11,
    ########## 55 ###########
        1966: 14,
        1972: 19,
        1977: 10,      
    ########## 56 ###########
        1994: 28,
        2000: 13,
        2010: 20,      
    ########## 57 ###########
        2038: 10,
        2043: 10,
        2051: 9,    
    ########## 58 ###########
        2072: 11,
        2078: 13,
        2088: 17,
    ########## 59 ###########
        2111: 12,
        2117: 27,
        2126: 24,     
    ########## 60 ###########
        2162: 13,
        2172: 9,
    ########## 61 ###########
        2185: 16,
        2196: 24,    
        2209: 18,
    ########## 62 ###########
        2236: 12,
        2243: 21,    
        2251: 21,
    ########## 63 ###########
        2281: 12,
        2286: 17, 
        2299: -17,   
        2300: 15,
    ########## 64 ###########
        2324: 19,
        2327: 21,    
    ########## 65 ###########
        2355: 14,
        2365: 22,    
        2372: 11,
    ########## 66 ###########
        2393: 21,
        2401: 22,    
        2418: 15, 
    ########## 67 ###########
        2442: 13,
        2450: 12,    
        2460: 9,     
        2467: -9,
        2472: -20,
    ########## 68 ###########
        2478: 23,
        2487: 29,    
        2496: 14,   
    ########## 69 ###########
        2527: 25,
        2537: 25,    
        2543: 21,
    ########## 70 ###########
        2568: 16,
        2579: 24,    
        2593: 18,      
    ########## 71 ###########
        2620: 25,
        2630: 27,    
        2635: 19,                              
    }
    
    card_positions = [  
        ########## 1 ##########
        4, 8, 13, 16, 20, 23, 25, 28,
        ########## 2 ##########
        36, 41, 45, 51, 56, 59, 62,
        ########## 3 ##########
        69, 72, 76, 87, 93, 96, 99,
        ########## 4 ##########
        103, 107, 112, 115, 124, 129, 135,
        ########## 5 ##########
        143, 149, 154, 159,
        ########## 6 ##########
        172, 177, 183, 191, 196,
        ########## 7 ########## 
        204, 210, 217, 221, 229,
        ########## 8 ########## 
        233, 238, 245, 253, 258,
        ########## 9 ##########
        269, 273, 277, 285, 289,
        ########## 10 ##########
        299, 304, 307, 311, 319, 323, 
        ########## 11 ##########
        332, 341, 346, 356, 
        ########## 12 ##########
        366, 378, 387, 395, 
        ########## 13 ##########
        401, 414, 423, 427, 
        ########## 14 ##########
        433, 439, 452, 458, 
        ########## 15 ##########
        464, 472, 485, 493, 497, 
        ########## 16 ##########
        505, 512, 518, 528, 534, 
        ########## 17 ##########
        541, 551, 559, 566,
        ########## 18 ##########
        576, 577, 586, 597,
        ########## 19 ##########
        607, 613, 620, 627, 
        ########## 20 ##########
        636, 640, 649, 659, 
        ########## 21 ##########
        669, 676, 681, 692, 695, 
        ########## 22 ########## 
        703, 709, 721, 722,
        ########## 23 ##########  
        746, 753, 760, 765,
        ########## 24 ########## 
        771, 779, 785, 791, 798,
        ########## 25 ########## 
        808, 820, 826, 830,
        ########## 26 ########## 
        836, 845, 852, 860, 865,
        ########## 27 ########## 
        875, 880, 886, 895, 907,
        ########## 28 ########## 
        911, 916, 926, 938,
        ########## 29 ########## 
        942, 946, 959, 967, 972,
        ########## 30 ##########
        981, 990, 994, 1001, 1007,
        ########## 31 ##########
        1015, 1020, 1026, 1033, 1045,   
        ########## 32 ##########
        1053, 1062, 1069, 1075, 1081,
        ########## 33 ##########
        1088, 1101, 1105, 1111,
        ########## 34 ##########    
        1116, 1122, 1132, 1145, 1151,
        ########## 35 ##########
        1162, 1166, 1177, 1183, 1186, 1191,
        ########## 36 ##########
        1200, 1204, 1215, 1220, 1224, 1233,
        ########## 37 ##########
        1241, 1246, 1249, 1256, 1261, 1269, 1276,
        ########## 38 ##########
        1281, 1292, 1299, 1302, 1307, 1315,
        ########## 39 ##########
        1319, 1323, 1332, 1340, 1346, 1353,
        ########## 40 ##########
        1362, 1368, 1376, 1388, 1391, 1397,
        ########## 41 ##########
        1403, 1412, 1416, 1427, 1433,
        ########## 42 ##########
        1438, 1442, 1450, 1458, 1471,   
        ########## 43 ##########
        1474, 1479, 1490, 1501, 1507, 1515,
        ########## 44 ##########
        1518, 1523, 1527, 1532, 1537, 1546, 
        ########## 45 ##########
        1559, 1564, 1572, 1577, 1588, 1592, 1596, 1600,
        ########## 46 ##########
        1603, 1606, 1610, 1623, 1629,
        ########## 47 ##########
        1634, 1639, 1646, 1654, 1662, 1669, 1675,
        ########## 48 ##########
        1680, 1687, 1696, 1703, 1707, 1711, 1721,
        ########## 49 ##########
        1732, 1747, 1750, 1752,
        ########## 50 ##########
        1763, 1769, 1779, 1783, 1788, 1792,
        ########## 51 ##########    
        1799, 1807, 1812, 1821, 1824, 1831,
        ########## 52 ##########
        1838, 1844, 1849, 1855, 1859, 1871, 1875, 1880,
        ########## 53 ##########
        1888, 1892, 1898, 1902, 1912, 1915, 1923,
        ########## 54 ##########
        1927, 1933, 1940, 1946, 1953, 1958,
        ########## 55 ##########
        1963, 1968, 1974, 1982, 1986, 
        ########## 56 ##########
        1996, 2003, 2008, 2011, 2020, 2026, 
        ########## 57 ##########
        2035, 2040, 2045, 2052, 2061, 
        ########## 58 ##########
        2066, 2073, 2079, 2086, 2090, 2094, 2100,
        ########## 59 ##########
        2109, 2114, 2119, 2124, 2131, 2136, 2145, 
        ########## 60 ##########
        2176, 2177, 2178,
        ########## 61 ##########
        2187, 2192, 2195, 2205, 2212, 2218, 2222, 2228,
        ########## 62 ##########
        2232, 2240, 2249, 2255, 2261, 2269, 2274, 
        ########## 63 ##########
        2279, 2288, 2295, 2307, 2312, 2317, 
        ########## 64 ##########
        2322, 2325, 2328, 2333, 2336, 2342, 2346, 
        ########## 65 ##########
        2352, 2357, 2362, 2367, 2376, 2380, 2389, 
        ########## 66 ##########
        2395, 2400, 2409, 2416, 2425, 2429, 
        ########## 67 ##########
        2437, 2440, 2445, 2448, 2465, 
        ########## 68 ##########
        2476, 2481, 2485, 2494, 2500, 2504, 2509, 2517, 
        ########## 69 ##########
        2522, 2530, 2536, 2546, 2549, 2554, 2558, 
        ########## 70 ##########
        2570, 2574, 2583, 2592, 2596, 2600, 2604, 2607, 
        ########## 71 ##########
        2615, 2621, 2625, 2629, 2640, 2644, 2650, 2655, 

        #Available End 2658
    ]

    boss_positions = [136, 360, 459, 536, 631, 763, 829, 867, 971, 1078, 1311, 
                      1349, 1430, 1466, 1511, 1550, 1716, 1734, 1754, 1919, 1954, 
                      1989, 2029, 2056, 2082, 2103, 2122, 2148, 2199, 2225, 2247, 
                      2271, 2292, 2314, 2347, 2385, 2412, 2432, 2453, 2468, 2512, 2541, 2561, 2587, 2609, 2632, 2653]
    
    # 이모지 문자열은 전역 변수 custom_emojis에서 가져옴
    boss_emoji = custom_emojis.get("Boss", "")
    card_emoji = custom_emojis.get("Card", "")
    
    event_text = f"현재 칸 수: {current_pos}\n\n"

    # 현재 위치에서 +1 ~ +12칸 내의 오브젝트 확인
    for i in range(1, 13):
        next_pos = current_pos + i
        line = f"+{i}: "
        has_event = False

        if next_pos in boss_positions:
            line += f"{boss_emoji} 보스가 있습니다."
            has_event = True

        if next_pos in card_positions:
            line += f"{card_emoji} 카드가 있습니다."
            has_event = True

        if next_pos in special_events:
            move_value = special_events[next_pos]
            target_pos = next_pos + move_value
            line += f" 이동 오브젝트: {move_value}칸"
            if target_pos in card_positions:
                line += f" ({card_emoji} 카드가 있습니다.)"
            has_event = True

        if has_event:
            event_text += line + "\n"

    # 주사위 두 개의 합 (2~12)와 배수 적용
    dice_sums = [i + j for i in range(1, 7) for j in range(1, 7)]
    multipliers = [2, 3, 5, 7, 8, 10]
    cases_per_multiplier = {multiplier: {'count': 0, 'sums': []} for multiplier in multipliers}

    event_text += "\n배수 주사위 사용 시, 오브젝트를 만날 경우의 수:\n"
    event_text += "(뒤로 가는 오브젝트여도 카드를 획득하는 경우 포함)\n"

    for dice_sum in set(dice_sums):
        for multiplier in multipliers:
            multiplier_position = current_pos + dice_sum * multiplier
            if multiplier_position <= 2659:
                event_found = False
                if multiplier_position in special_events:
                    move_value = special_events[multiplier_position]
                    target_pos = multiplier_position + move_value
                    if move_value < 0:
                        if target_pos in card_positions:
                            event_found = True
                    else:
                        event_found = True
                if multiplier_position in card_positions:
                    event_found = True
                if event_found:
                    cases_per_multiplier[multiplier]['count'] += 1
                    cases_per_multiplier[multiplier]['sums'].append(dice_sum)

    # 상위 3개의 배수 결과를 정렬하여 출력
    sorted_cases = sorted(cases_per_multiplier.items(), key=lambda x: x[1]['count'], reverse=True)[:3]

    for multiplier, data in sorted_cases:
        # 주사위 이모지는 GET으로 불러온 custom_emojis 사용 ("2x", "3x", 등)
        dice_emoji = custom_emojis.get(f"{multiplier}x", "")
        unique_sums = sorted(set(data['sums']))
        dice_sums_str = ', '.join(map(str, unique_sums))
        event_text += f"{dice_emoji} : {data['count']}회 (눈금 합계: {dice_sums_str}) \n"
    
    embed = discord.Embed(
        title="어드벤처 도우미",
        description=event_text if event_text else "12칸 내에 아무런 오브젝트도 없습니다.",
        color=discord.Color.blue()
    )
    await ctx.respond(embed=embed)

@bot.slash_command(
        name="추출", 
        description="사용자 ID로 프로필 이미지 다운로드 URL을 추출합니다.",
        guild_ids=[1341306889895415883, 1339024660465057794]
)
async def 추출(ctx: discord.ApplicationContext, userid: str):
    user_api_url = f"https://discord.com/api/users/{userid}"
    headers = {"Authorization": f"Bot {TOKEN}"}
    
    r = requests.get(user_api_url, headers=headers)
    if r.status_code == 200:
        user_data = r.json()
        avatar_hash = user_data.get("avatar")
        user_id = user_data.get("id")
        
        if avatar_hash:
            # CDN URL 생성 (PNG, 사이즈 1024)
            avatar_url = f"https://cdn.discordapp.com/avatars/{user_id}/{avatar_hash}.png?size=1024"
            await ctx.respond(f"프로필 이미지 다운로드 URL: {avatar_url}")
        else:
            await ctx.respond("해당 사용자에게 커스텀 아바타가 없습니다.")
    else:
        await ctx.respond(f"유저 정보 가져오기 실패: {r.status_code} {r.text}")

@bot.slash_command(name="허용", description="허용 서버 목록에 서버 추가")
@is_master()
@discord.option("guild_id", str, description="추가할 서버 ID")
async def guild_allow(ctx: discord.ApplicationContext, guild_id: str):
    # 1) 우선 get_guild()로 캐시에 있는지 확인
    # 2) 캐시에 없으면 fetch_guild()로 Discord API에서 가져옴
    guild = bot.get_guild(int(guild_id)) or await bot.fetch_guild(int(guild_id))

    # 실제 길드 이름 (봇이 들어있는 서버라면 가져올 수 있음)
    guild_name = guild.name if guild else "Unknown"

    # 딕셔너리에 서버 ID와 이름 저장
    ALLOWED_GUILDS[guild_id] = guild_name
    save_allowed_guilds(ALLOWED_GUILDS)

    await ctx.respond(f"서버 {guild_id} ({guild_name})가 허용 목록에 추가되었습니다.", ephemeral=True)

@bot.slash_command(name="제거", 
                   description="허용 서버 목록에서 서버 제거", 
                   guild_ids=[1341306889895415883])
@is_master()
@discord.option("guild_id", str, description="제거할 서버 ID")
async def guild_remove(ctx: discord.ApplicationContext, guild_id: str):
    if guild_id not in ALLOWED_GUILDS:
        await ctx.respond(f"서버 {guild_id}는 허용 목록에 없습니다.", ephemeral=True)
    else:
        removed_name = ALLOWED_GUILDS.pop(guild_id)
        save_allowed_guilds(ALLOWED_GUILDS)
        await ctx.respond(f"서버 {guild_id} ({removed_name})가 허용 목록에서 제거되었습니다.", ephemeral=True)

@discord.option("닉네임", str, description="인게임 닉네임을 입력해주세요.")
@bot.slash_command(
    name="랭킹검색", 
    description="캐릭터 닉네임으로 랭킹을 검색합니다.",
    guild_ids=[1341306889895415883, 1339024660465057794]
)
async def 랭킹검색(ctx: discord.ApplicationContext, 닉네임: str):
    url = "https://www.latale.com/Ranking/Individual"
    
    try:
        # [1] 일반 랭킹 검색 (RankType: "2")
        data_normal = {
            "RankType": "2",
            "World": "0",
            "CharName": 닉네임
        }

        response_normal = requests.post(url, data=data_normal)
        if response_normal.status_code != 200:
            await ctx.respond("랭킹 검색 요청에 실패했습니다.")
            return

        soup_normal = BeautifulSoup(response_normal.text, "html.parser")
        table_section_normal = soup_normal.find("section", class_="ranking-table")
        tbody_normal = table_section_normal.find("tbody")
        row_normal = tbody_normal.find("tr")
        if not row_normal:
            await ctx.respond("랭킹 검색 결과가 없습니다.")
            return

        # 일반 랭킹 데이터 추출
        rank_elem = row_normal.find("td", class_="rank")
        #name_elem = row_normal.find("div", class_="charter-name")
        server_elem = row_normal.find("td", class_="server")
        level_elem = row_normal.find("td", class_="level")
        date_elem = row_normal.find("td", class_="date")
        job_elem = row_normal.find("td", class_="job")
        beforejob_elem = row_normal.find("td", class_="beforejob")
        
        rank = rank_elem.get_text(strip=True) if rank_elem else "없음"
        #name = name_elem.get_text(strip=True) if name_elem else "없음"
        server = server_elem.get_text(strip=True) if server_elem else "없음"
        level = level_elem.get_text(strip=True) if level_elem else "없음"
        date = date_elem.get_text(strip=True) if date_elem else "없음"
        job = job_elem.get_text(strip=True) if job_elem else "없음"
        beforejob = beforejob_elem.get_text(strip=True) if beforejob_elem else "없음"

        img_elem = row_normal.find("div", class_="charter-img")
        img_url = ""
        if img_elem:
            style = img_elem.get("style", "")
            match = re.search(r"url\(['\"]?(.*?)['\"]?\)", style)
            if match:
                img_url = match.group(1)
                if img_url.startswith("//"):
                    img_url = "https:" + img_url
        
        # [2] 각성 랭킹 검색 (RankType: "1") → level 데이터를 각성 레벨(awaken level)로 취급
        data_awaken = {
            "RankType": "1",
            "World": "0",
            "CharName": 닉네임
        }
        response_awaken = requests.post(url, data=data_awaken)
        if response_awaken.status_code != 200:
            await ctx.respond("랭킹 검색 요청에 실패했습니다.")
        else:
            soup_awaken = BeautifulSoup(response_awaken.text, "html.parser")
            awaken_level_elem = soup_awaken.find("td", class_="level")
            awaken_level = awaken_level_elem.get_text(strip=True) if awaken_level_elem else "없음"

        lines = [
            f"{'랭킹: ' + rank}",
            f"{'초월 레벨: ' + level}",
            f"{'각성 레벨: ' + awaken_level}",
            f"{'메인클래스: ' + job}",
            f"{'서브클래스: ' + beforejob}",
            f"{'달성일자: ' + date}",
        ]
        
        # 코드 블록에 넣어 공백 보존 (monospace 폰트 사용)
        description_text = "```\n" + "\n".join(lines) + "\n```"
        
        embed = discord.Embed(
            title="랭킹 검색 결과",
            description=f"**닉네임:** {닉네임}\n{description_text}",
            color=discord.Color.blurple()
        )
        
        if img_url:
            embed.set_thumbnail(url=img_url)

        await ctx.respond(embed=embed)
    except Exception as e:
        await ctx.respond(f"오류 발생: {e}")

@discord.option("닉네임", str, description="인게임 닉네임을 입력해주세요.")
@bot.slash_command(
    name="랭킹검색2", 
    description="캐릭터 닉네임으로 랭킹을 검색합니다.",
    guild_ids=[1341306889895415883, 1339024660465057794]
)
async def 랭킹검색2(ctx: discord.ApplicationContext, 닉네임: str):
    await ctx.defer()
    url = "https://www.latale.com/Ranking/Individual"
    try:
        # 1) 일반 랭킹 검색 (RankType: "2")
        data_normal = {"RankType": "2", "World": "0", "CharName": 닉네임}
        response_normal = requests.post(url, data=data_normal)
        if response_normal.status_code != 200:
            await ctx.respond("랭킹 검색 요청에 실패했습니다.")
            return

        soup_normal = BeautifulSoup(response_normal.text, "html.parser")
        table_section = soup_normal.find("section", class_="ranking-table")
        tbody = table_section.find("tbody")
        row = tbody.find("tr")
        if not row:
            await ctx.respond("랭킹 검색 결과가 없습니다.")
            return

        # 데이터 추출 (각 요소가 없으면 "없음" 처리)
        rank = row.find("td", class_="rank").get_text(strip=True) if row.find("td", class_="rank") else "없음"
        #server = row.find("td", class_="server").get_text(strip=True) if row.find("td", class_="server") else "없음"
        level = row.find("td", class_="level").get_text(strip=True) if row.find("td", class_="level") else "없음"
        date = row.find("td", class_="date").get_text(strip=True) if row.find("td", class_="date") else "없음"
        job = row.find("td", class_="job").get_text(strip=True) if row.find("td", class_="job") else "없음"
        beforejob = row.find("td", class_="beforejob").get_text(strip=True) if row.find("td", class_="beforejob") else "없음"
        same_exists = bool(row.find("td", class_="variable same"))
        variable_up_elem = row.find("td", class_="variable up")
        variable_down_elem = row.find("td", class_="variable down")

        # 캐릭터 썸네일 이미지 URL 추출
        img_url = ""
        img_elem = row.find("div", class_="charter-img")
        if img_elem:
            style = img_elem.get("style", "")
            match = re.search(r"url\(['\"]?(.*?)['\"]?\)", style)
            if match:
                img_url = match.group(1)
                if img_url.startswith("//"):
                    img_url = "https:" + img_url

        # 2) 각성 랭킹 검색 (RankType: "1") → 각성 레벨 추출
        data_awaken = {"RankType": "1", "World": "0", "CharName": 닉네임}
        response_awaken = requests.post(url, data=data_awaken)
        if response_awaken.status_code != 200:
            awaken_level = "검색 요청 실패"
        else:
            soup_awaken = BeautifulSoup(response_awaken.text, "html.parser")
            awaken_elem = soup_awaken.find("td", class_="level")
            awaken_level = awaken_elem.get_text(strip=True) if awaken_elem else "없음"
        
        # ----------------------------
        # 이미지 합성 작업 (Pillow)
        # ----------------------------
        # (1) base.png 로드 (동일 경로에 있어야 함)
        base_img = Image.open("base.png").convert("RGBA")
        composite_img = base_img.copy()
        base_width, base_height = base_img.size

        # (A) 캐릭터 썸네일 불러오기
        if img_url:
            thumb_data = requests.get(img_url).content
            thumb_img = Image.open(io.BytesIO(thumb_data)).convert("RGBA")
        else:
            thumb_img = Image.new("RGBA", (100, 100), (255, 255, 255, 0))

        # 썸네일 위치 (기존 로직)
        thumb_w, thumb_h = thumb_img.size
        new_size = (int(thumb_w * 1.5), int(thumb_h * 1.5))
        thumb_img = thumb_img.resize(new_size, resample=Image.Resampling.LANCZOS)
        # 리사이즈 후 새로운 크기를 다시 계산합니다.
        thumb_w, thumb_h = thumb_img.size  
        pos_x_thumb = (base_width - thumb_w) // 2
        pos_y_thumb = (base_height - thumb_h) // 2 - 150

        # 합성 (썸네일)
        composite_img.paste(thumb_img, (pos_x_thumb, pos_y_thumb), thumb_img)

        # (B) world.png 불러오기 (원본 그대로 붙이기)
        world_img = Image.open("world.png").convert("RGBA")
        w_w, w_h = world_img.size

        # world.png를 한 번만, 크기 변경 없이 붙이기
        # 예) 썸네일 아래 10px
        pos_x_world = (base_width - w_w) // 2
        pos_y_world = pos_y_thumb + thumb_h + 50
        composite_img.paste(world_img, (pos_x_world, pos_y_world), world_img)

        # (C) 텍스트 그리기
        draw = ImageDraw.Draw(composite_img)
        try:
            font = ImageFont.truetype("malgun.ttf", 22)
        except:
            font = ImageFont.load_default()

        # 최신 Pillow draw.textbbox() 이용
        def get_text_size(txt, fnt):
            bbox = draw.textbbox((0, 0), txt, font=fnt)
            return bbox[2] - bbox[0], bbox[3] - bbox[1]

        # 1) 각성 정보
        awakening_line = f"각성 {awaken_level}"
        awlw, awlh = get_text_size(awakening_line, font)

        # 첫 줄의 시작 위치
        y_current = pos_y_world + w_h + 50
        x_awaken = (base_width - awlw) // 2

        draw.text((x_awaken, y_current), awakening_line, fill=(0,0,0,255), font=font)

        # 다음 줄로 이동 (적절한 간격 10~15 정도)
        y_current += awlh + 15

        #####################################
        # 2) 레벨 + 닉네임
        #    - level만 분홍색, nickname은 검정색
        level_text = f"{level} "
        nickname_text = 닉네임

        # 전체 문자열 길이 측정
        full_text = level_text + nickname_text
        full_width, full_height = get_text_size(full_text, font)
        x_center = (base_width - full_width) // 2

        # level(분홍색)
        draw.text((x_center, y_current), level_text, fill=(255,105,168,255), font=font)

        # level만의 너비
        level_width, _ = get_text_size(level_text, font)

        # nickname(검정색)
        draw.text((x_center + level_width, y_current), nickname_text, fill=(0,0,0,255), font=font)

        # 다음 줄로 이동
        y_current += full_height + 10

        #####################################
        # 3) 이전 직업 / 현재 직업
        job_line = f"{beforejob} / {job}"
        jlw, jlh = get_text_size(job_line, font)
        x_job = (base_width - jlw) // 2

        draw.text((x_job, y_current), job_line, fill=(128,128,128,255), font=font)

        y_current += jlh + 10

        #####################################
        rank_line = f"{rank}위"
        rank_width, rank_height = get_text_size(rank_line, font)  # 높이값은 사용 안 함
        
        x_rank = (base_width - rank_width) // 2
        draw.text((x_rank, y_current), rank_line, fill=(0,0,0,255), font=font)

        scale = 1.5

        if same_exists:
            same_img = Image.open("same.png").convert("RGBA")
            same_w, same_h = same_img.size
            new_same_h = int(rank_height * scale)
            new_same_w = int(same_w * (new_same_h / same_h))
            same_img = same_img.resize((new_same_w, new_same_h), resample=Image.Resampling.LANCZOS)
            
            pos_x_same = x_rank + rank_width + 3
            pos_y_same = y_current + (rank_height - new_same_h) // 2 + 9
            composite_img.paste(same_img, (pos_x_same, pos_y_same), same_img)

        try:
            small_font = ImageFont.truetype("malgun.ttf", int(22 * 0.55))
        except:
            small_font = ImageFont.load_default()

        # up.png 처리 (variable up 요소가 있는 경우)
        if variable_up_elem:
            up_value = variable_up_elem.get_text(strip=True)
            up_img = Image.open("up.png").convert("RGBA")
            up_w, up_h = up_img.size
            # Rank 텍스트 높이와 동일하게 이미지 높이를 조정
            new_up_h = int(rank_height * scale)
            new_up_w = int(up_w * (new_up_h / up_h))
            up_img = up_img.resize((new_up_w, new_up_h), resample=Image.Resampling.LANCZOS)
            
            # 이미지 중앙에 up_value 텍스트 그리기 (텍스트 색: #ff5f5f, 작은 폰트 사용)
            up_draw = ImageDraw.Draw(up_img)
            up_text_width, up_text_height = get_text_size(up_value, small_font)
            up_text_x = (new_up_w - up_text_width) // 2 + 2
            up_text_y = (new_up_h - up_text_height) // 2 - 5
            up_draw.text((up_text_x, up_text_y), up_value, fill="#ff5f5f", font=small_font)
            
            # 위치 조정 (Rank 텍스트 오른쪽에 +2px 간격, 미세 보정 +8)
            pos_x_up = x_rank + rank_width + 3
            pos_y_up = y_current + (rank_height - new_up_h) // 2 + 7
            composite_img.paste(up_img, (pos_x_up, pos_y_up), up_img)

        # down.png 처리 (variable down 요소가 있는 경우)
        if variable_down_elem:
            down_value = variable_down_elem.get_text(strip=True)
            down_img = Image.open("down.png").convert("RGBA")
            down_w, down_h = down_img.size
            # Rank 텍스트 높이와 동일하게 이미지 높이를 조정
            new_down_h = int(rank_height * scale)
            new_down_w = int(down_w * (new_down_h / down_h))
            down_img = down_img.resize((new_down_w, new_down_h), resample=Image.Resampling.LANCZOS)
            
            # 이미지 중앙에 down_value 텍스트 그리기 (텍스트 색: #62a8f5, 작은 폰트 사용)
            down_draw = ImageDraw.Draw(down_img)
            down_text_width, down_text_height = get_text_size(down_value, small_font)
            down_text_x = (new_down_w - down_text_width) // 2 + 2
            down_text_y = (new_down_h - down_text_height) // 2 - 5
            down_draw.text((down_text_x, down_text_y), down_value, fill="#62a8f5", font=small_font)
            
            # 위치 조정 (Rank 텍스트 오른쪽에 +2px 간격, 미세 보정 +8)
            pos_x_down = x_rank + rank_width + 3
            pos_y_down = y_current + (rank_height - new_down_h) // 2 + 7
            composite_img.paste(down_img, (pos_x_down, pos_y_down), down_img)
        
        # 최종 결과 전송
        # ----------------------------
        buffer = io.BytesIO()
        composite_img.save(buffer, format="PNG")
        buffer.seek(0)

        file = discord.File(fp=buffer, filename="composite.png")
        embed = discord.Embed(title="랭킹 검색 결과", color=discord.Color.blurple())
        embed.set_image(url="attachment://composite.png")
        embed.set_footer(text=f"달성일자: {date}")

        await ctx.respond(file=file, embed=embed)

    except Exception as e:
        await ctx.respond(f"오류 발생: {e}")

@bot.slash_command(name="잔고추적", description="선물 잔고를 주기적으로 갱신하여 메시지로 보여줍니다.", guild_ids=[1341306889895415883, 1339024660465057794])
async def USDT(ctx: discord.ApplicationContext):
    global monitor_running, monitor_task, monitor_message
    if monitor_running:
        await ctx.respond("이미 선물 모니터링이 진행 중입니다!", ephemeral=True)
        return

    monitor_running = True
    # 일반 메시지를 보내기 위해 ctx.channel 사용
    channel = ctx.channel
    initial_embed = discord.Embed(
        title="USDT FUTURES 잔고 모니터링",
        description="데이터 로드 중...",
        color=discord.Color.blue()
    )
    # 일반 메시지로 전송하므로 15분 제한이 없음
    msg = await channel.send(embed=initial_embed)
    monitor_message = msg
    monitor_task = bot.loop.create_task(update_futures_balance_loop())
    # 인터랙션에는 간단한 확인 메시지를 에페메랄로 응답
    await ctx.respond("모니터링을 시작했습니다.", ephemeral=True)

@bot.slash_command(name="잔고추적종료", description="진행 중인 선물 잔고 모니터링을 중단합니다.", guild_ids=[1341306889895415883, 1339024660465057794])
async def USDT_OFF(ctx: discord.ApplicationContext):
    global monitor_running, monitor_task

    if not monitor_running or monitor_task is None or monitor_task.done():
        await ctx.respond("진행 중인 모니터링이 없습니다.", ephemeral=True)
        return

    monitor_running = False
    monitor_task.cancel()
    monitor_task = None
    await ctx.respond("Bitget 선물 잔고 모니터링을 중단합니다.", ephemeral=True)

@bot.slash_command(name="author_ignore", description="게시판 작성자를 무시 목록에 추가합니다.", guild_ids=[1341306889895415883, 1339024660465057794])
@is_master()  # (필요에 따라 권한 조정)
@discord.option("닉네임", str, description="무시할 게시판 작성자의 닉네임을 입력하세요.")
async def author_ignore(ctx: discord.ApplicationContext, nickname: str):
    global BOARD_IGNORE_LIST
    if nickname not in BOARD_IGNORE_LIST:
        BOARD_IGNORE_LIST.append(nickname)
        save_ignore_list(BOARD_IGNORE_LIST)
        await ctx.respond(f"{nickname} 님을 무시 목록에 추가했습니다.", ephemeral=True)
    else:
        await ctx.respond(f"{nickname} 님은 이미 무시 목록에 있습니다.", ephemeral=True)

bot.run(TOKEN)
