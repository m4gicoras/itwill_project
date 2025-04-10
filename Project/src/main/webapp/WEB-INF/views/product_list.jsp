<%@ page import="java.util.List" %>
<%@ page import="com.m4gi.domain.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% System.out.println("JSP 렌더링 시작"); %>
<!DOCTYPE html>
<html>
<head>
    <title>상품 목록</title>
</head>
<body>
<h2>내 상품 목록</h2>
<table border="1">
    <thead>
        <tr>
            <th>상품코드</th>
            <th>상품명</th>
            <th>수량</th>
            <th>단가</th>
            <th>등록일</th>
            <th>상태</th>
        </tr>
    </thead>
    <tbody>
    <%
        List<Product> productList = (List<Product>) request.getAttribute("productList");
        if (productList != null && !productList.isEmpty()) {
            for (Product p : productList) {
    %>
        <tr>
            <td><%= p.getProduct_id() %></td>
            <td><%= p.getProduct_name() %></td>
            <td><%= p.getProduct_img() %></td>
            <td><%= String.format("%,d", p.getPrice()) %></td>
            <%-- <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(p.getCreatedAt()) %></td> --%>
            <td>
			<%
			    if (p.getCreated_at() != null) {
			        out.print(new java.text.SimpleDateFormat("yyyy-MM-dd").format(p.getCreated_at()));
			    } else {
			        out.print("-");
			    }
			%>
			</td>
            <td>
                <%
                    switch (p.getStatus()) {
                        case 0: out.print("정상"); break;
                        case 1: out.print("품절"); break;
                        case 2: out.print("소진 임박"); break;
                        case 3: out.print("단종"); break;
                    }
                %>
            </td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="6" style="text-align:center;">등록된 상품이 없습니다.</td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
