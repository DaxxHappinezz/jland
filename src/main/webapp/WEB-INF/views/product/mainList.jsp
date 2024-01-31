<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="loginId" value="${empty pageContext.request.session.getAttribute('id') ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginLink" value="${loginId == '' ? '/account/login' : '/account/logout'}"/>
<c:set var="isLogin" value="${loginId == '' ? 'Sign in' : 'Sign out'}"/>
<html>
<head>
  <title>J Land</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>"/>
  <style>
    /* Create two unequal columns that floats next to each other */
    /* Left column */
    .leftcolumn {
      float: left;
      width: 25%;
      background-color: #f1f1f1;
      padding-right: 20px;
    }

    .leftcolumn ul > li {
      list-style-type: none;
    }

    /* Right column */
    .rightcolumn {
      float: left;
      width: 75%;
    }

    /* Fake image */
    .fakeimg {
      background-color: #aaa;
      width: 100%;
      padding: 20px;
    }

    /* Add a card effect for articles */
    .card {
      background-color: white;
      padding: 20px;
      margin-top: 20px;
    }

    .grid-container {
      display: grid;
      grid-template-columns: auto auto auto;
    }

    .grid-item {
      background-color: rgba(255, 255, 255, 0.8);
      border: 1px solid #dddddd;
      font-size: 16px;
      text-align: left;
      position: relative; /* 이미지 크기 조절을 위한 상대 위치 설정 */
    }

    .grid-item img {
      width: 100%; /* 이미지를 부모 요소의 너비에 맞게 조절 */
      height: auto; /* 가로 비율을 유지한 채 세로 비율 자동 조정 */
      display: block; /* 이미지 간격 등을 위해 블록 레벨 요소로 설정 */
    }

    /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
    @media screen and (max-width: 800px) {
      .leftcolumn, .rightcolumn {
        width: 100%;
        padding: 0;
      }
      .grid-container {
        grid-template-columns: auto;
      }

    }

    /* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
    @media screen and (max-width: 400px) {
      .topnav a {
        float: none;
        width: 100%;
      }
    }
  </style>
</head>
<body>

<div class="header">
  <h1>J Land</h1>
  <p>Resize the browser window to see the effect.</p>
</div>

<div class="topnav">
  <a href="<c:url value='/'/>">JLand</a>
  <a href="<c:url value='/products'/>">SHOP</a>
  <a href="<c:url value='/service'/>">HELP</a>
  <a href="<c:url value='${loginLink}'/>" class="topnav-right">${isLogin}</a>
  <a href="<c:url value='/cart'/>" class="topnav-right">My Cart</a>
  <a href="<c:url value='/wishlist'/>" class="topnav-right">Wishlist</a>
  <a href="<c:url value='/cart'/>" class="topnav-right">search</a>
</div>

<div class="row">
  <div class="leftcolumn">
    <div class="card">
      <h4>Product Type</h4>
      <ul>
        <li><input type="checkbox" name=""/>[type]</li>
        <li><input type="checkbox" name=""/>[type]</li>
        <li><input type="checkbox" name=""/>[type]</li>
        <li><input type="checkbox" name=""/>[type]</li>
      </ul>
      <hr>
      <h4>Price</h4>
      <ul>
        <li><input type="checkbox" name=""/>[type]</li>
        <li><input type="checkbox" name=""/>[type]</li>
        <li><input type="checkbox" name=""/>[type]</li>
        <li><input type="checkbox" name=""/>[type]</li>
      </ul>
    </div>
  </div>
  <div class="rightcolumn">
    <div class="card">
      <div class="grid-container">
        <c:forEach var="product" items="${productList}">
          <div class="grid-item">
            <a href="<c:url value='/products/${product.pno}'/>">
              <img src="<c:url value='/resources/img/test.png'/>" alt="product_image">
            </a>
            <p>${product.pno}</p>
            <a href="<c:url value='/products/${product.pno}'/>">
              <p>${product.pname}</p>
            </a>
            <p>${product.price}</p>
            <p>${product.color}</p>
            <p>${product.size}</p>
          </div>
        </c:forEach>
      </div>
    </div>
    <div class="card">
      <h2>TITLE HEADING</h2>
      <h5>Title description, Sep 2, 2017</h5>
      <div class="fakeimg" style="height:200px;">Image</div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    </div>
  </div>
</div>

<div class="footer">
  <h2>Footer</h2>
</div>
</body>
</html>
