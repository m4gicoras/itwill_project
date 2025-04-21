document.addEventListener("DOMContentLoaded", function () {

  // 1) 알림 뱃지 숫자 표시
  fetch(`${contextPath}/notification/unreadCount`)
    .then(res => res.text())
    .then(count => {
      const badge = document.getElementById("noti-badge");
      if (badge && parseInt(count) > 0) {
        badge.innerText = count;
        badge.classList.remove("hidden");
      } else if (badge) {
        badge.classList.add("hidden");
      }
    });

  // 2) 메뉴 hover 효과
  document.querySelectorAll('.menu-item').forEach(item => {
    item.addEventListener('mouseenter', () => {
      item.classList.replace('font-medium','font-semibold');
      item.classList.add('bg-zinc-950','text-white');
      const p = item.querySelector('p');
      if (p) p.classList.replace('text-zinc-950','text-white');
      const svg = item.querySelector('.svg-item');
      if (svg) svg.classList.replace('text-zinc-950','text-white');
    });
    item.addEventListener('mouseleave', () => {
      item.classList.replace('font-semibold','font-medium');
      item.classList.remove('bg-zinc-950','text-white');
      const p = item.querySelector('p');
      if (p) p.classList.replace('text-white','text-zinc-950');
      const svg = item.querySelector('.svg-item');
      if (svg) svg.classList.replace('text-white','text-zinc-950');
    });
  });

  // 3) 검색 박스 open/close
  const searchContainer = document.querySelector('.search-container');
  if (searchContainer) {
    searchContainer.addEventListener('click', e => {
      if (e.target.closest('.search-input')) return;
      e.stopPropagation();
      searchContainer.classList.toggle('active');
      if (searchContainer.classList.contains('active')) {
        const input = searchContainer.querySelector('.search-input');
        if (input) setTimeout(() => input.focus(), 300);
      }
    });
    document.addEventListener('click', e => {
      if (!searchContainer.contains(e.target)) {
        searchContainer.classList.remove('active');
      }
    });
  }
});

// 팝업 관련 (클릭시 알림 읽음 처리)
function showPopup(content, date) {
  document.getElementById("popupContent").innerText = content;
  document.getElementById("popupDate").innerText = date;
  document.getElementById("notificationOverlay").classList.remove("hidden");
}
function closePopup() {
  document.getElementById("notificationOverlay").classList.add("hidden");
}
function handleRowClick(row) {
  showPopup(row.dataset.content, row.dataset.date);
  fetch(`${contextPath}/notification/read`, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: "notificationId=" + encodeURIComponent(row.dataset.id),
  }).then(() => {
    const span = row.querySelector("span");
    span.innerText = "읽음";
    span.className = "inline-block rounded-md px-2 py-1 text-xs font-medium bg-gray-200 text-gray-600";
    updateNotificationBadge();
  });
}
function updateNotificationBadge() {
  fetch(`${contextPath}/notification/unreadCount`)
    .then(res => res.text())
    .then(count => {
      const badge = document.getElementById("noti-badge");
      const num = parseInt(count);
      if (num > 0) {
        badge.innerText = num;
        badge.classList.remove("hidden");
      } else {
        badge.classList.add("hidden");
      }
    });
}