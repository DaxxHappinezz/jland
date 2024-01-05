<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2> this is wishlist page </h2>
<div>
    <ul>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='${loginLink}'/>">${isLogin}</a></li>
        <li><a href="<c:url value='/wishlist'/>">Wishlist</a></li>
        <li><a href="<c:url value='/cart'/>">My Cart</a></li>
    </ul>
</div>
<div>
    <h1>${myCart == null ? '위시리스트가 비어있습니다' : ''}</h1>
</div>
<div>footer</div>
</body>
</html>
