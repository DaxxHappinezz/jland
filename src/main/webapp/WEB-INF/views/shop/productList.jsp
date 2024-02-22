<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="loginId" value="${empty pageContext.request.session.getAttribute('id') ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginLink" value="${loginId == '' ? '/account/login' : '/account/logout'}"/>
<c:set var="isLogin" value="${loginId == '' ? 'Sign in' : 'Sign out'}"/>

<!-- Main -->
<main>
  <div id="shop">
    <!-- Filter -->
    <section id="shop__filter" class="section">
      <div>
        <h2>Category</h2>
        <ul class="categories">
          <li><button class="category category--selected" data-category="all">All<span class="category__count">5</span></button></li>
          <li><button class="category" data-category="city">City<span class="category__count">1</span></button></li>
          <li><button class="category" data-category="disney">Disney<span class="category__count">2</span></button></li>
          <li><button class="category" data-category="etc">etc<span class="category__count">2</span></button></li>
        </ul>
      </div>
      <!-- <div>
          <h2>Price</h2>
          <ul>
              <li><button></button></li>
              <li><button></button></li>
              <li><button></button></li>
              <li><button></button></li>
          </ul>
      </div> -->
    </section>

    <!-- Products Grid -->
    <section class="section">
      <ul class="products">
        <c:forEach var="product" items="${productList}">
          <li class="product" data-category="${product.category}">
            <a href="<c:url value='/shop/${product.pno}'/>">
              <img src="<c:url value="/resources/img/product/RapunzelsTowerTheSnugglyDuckling.webp"/>" alt="${product.pname}" class="product__img"/>
            </a>
            <div class="product__metadata">
              <a href="<c:url value='/shop/${product.pno}'/>">
                <p class="product__metadata__name">${product.pname}</p>
              </a>
              <p class="product__metadata__price">$ ${product.price}</p>
            </div>
          </li>
        </c:forEach>
      </ul>
    </section>
  </div>
</main>
<script src="<c:url value="/resources/js/shop/productList.js"/>"></script>