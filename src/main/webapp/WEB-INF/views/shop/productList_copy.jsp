<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="loginId" value="${empty pageContext.request.session.getAttribute('id') ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginLink" value="${loginId == '' ? '/account/login' : '/account/logout'}"/>
<c:set var="isLogin" value="${loginId == '' ? 'Sign in' : 'Sign out'}"/>
<html>
<head>
  <title>J Land</title>
  <link rel="stylesheet" href="<c:url value="/resources/css/main.css?after"/>"/>
  <style>
    button {
      background-color: #333;
      color: #dddddd;
      font-weight: bold;
      width: 100%;
    }
    /* Create two unequal columns that floats next to each other */
    /* Left column */
    .leftcolumn {
      float: left;
      width: 25%;
      background-color: white;
      padding-right: 20px;
    }

    .leftcolumn ul > li {
      list-style-type: none;
    }

    /* Right column */
    .rightcolumn {
      background-color: white;
      float: left;
      width: 75%;
    }

    /* Fake image */
    .fakeimg {
      background-color: #aaa;
      width: 100%;
      padding: 20px;
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

<main class="row">
  <div class="leftcolumn">
    <div class="card">
      <div class="categories">
        <h4>Product Type</h4>
        <ul class="categories__product">
          <li><button class="category" data-category="all">All</button></li>
          <li><button class="category" data-category="nature">Nature</button></li>
          <li><button class="category" data-category="city">City</button></li>
          <li><button class="category" data-category="etc">ETC</button></li>
        </ul>
        <hr>
        <h4>Price</h4>
        <ul class="categories__price">
          <li><button class="category" data-category="">All</button></li>
          <li><button class="category" data-category="">Nature</button></li>
          <li><button class="category" data-category="">City</button></li>
          <li><button class="category" data-category="">ETC</button></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="rightcolumn">
    <div class="card">
      <div class="grid-container">
        <c:forEach var="product" items="${productList}">
          <div class="grid-item" data-category="${product.category}">
            <a href="<c:url value='/shop/${product.pno}'/>">
              <img src="<c:url value='/resources/img/test.png'/>" alt="product_image">
            </a>
            <p>${product.pno}</p>
            <a href="<c:url value='/shop/${product.pno}'/>">
              <p>${product.pname}</p>
            </a>
            <p>${product.price}</p>
            <p>${product.color}</p>
            <p>${product.size}</p>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
</main>

<script>
  const categoriesProduct = document.querySelector('.categories__product');
  const products = document.querySelectorAll('.grid-item');
  categoriesProduct.addEventListener("click", (event) => {
    let filter = event.target.dataset.category;
    if (filter == null) {
      return;
    }
    console.log("filter: ", filter);
    products.forEach(product => {
      console.log(product)
      if (filter === 'all' || filter === product.dataset.category) {
        product.style.display = 'block';
      } else {
        product.style.display = 'none';
      }
    });
  });

</script>
</body>
</html>