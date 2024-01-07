<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html>
<head>
    <title>J Land</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>"/>
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

<div>
    <c:if test="${carList != null ? '장바구니' : ''}"/>
    <ul>
        <c:forEach var="product" items="${cartList}">
        <li>
            ${product.pno}
            ${product.pname}
            ${product.price}
            ${product.color}
            ${product.size}
        </li>
        </c:forEach>
    </ul>
</div>
<div>
    <c:if test="${cartList == null ? '장바구니가 비어있습니다' : '' }"/>
</div>

<div class="footer">
    <h2>Footer</h2>
</div>
</body>
</html>
