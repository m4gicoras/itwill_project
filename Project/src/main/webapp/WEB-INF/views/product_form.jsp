<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>상품 등록</title>
</head>
<body>
  <h1>상품 등록</h1>

  <form method="post" action="/product/new" enctype="multipart/form-data">
    <label>상품명</label>
    <input type="text" name="productName" required><br>

    <label>상품 설명</label>
    <textarea name="productDesc"></textarea><br>

    <label>상품 이미지</label>
    <input type="file" name="productImgFile"><br>

    <label>수량</label>
    <input type="number" name="productQtty" min="0" required><br>

    <label>카테고리</label>
    <input type="text" name="category"><br>

    <label>가격</label>
    <input type="number" name="price" min="0" required><br>

    <label>상태</label>
    <select name="status">
      <option value="0">정상</option>
      <option value="1">재고 없음</option>
      <option value="2">소진 임박</option>
      <option value="3">단종</option>
    </select><br>

    <button type="submit">등록</button>
  </form>
</body>
</html>
