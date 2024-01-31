<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="loginId" value="${empty pageContext.request.session.getAttribute('id') ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginLink" value="${loginId == '' ? '/account/login' : '/account/logout'}"/>
<c:set var="isLogin" value="${loginId == '' ? 'Sign in' : 'Sign out'}"/>
<!DOCTYPE html>
<html>
<head>
    <title>J Land</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>"/>
    <style>
        .content {
            background-color: white;
            padding: 20px;
            margin-top: 20px;
        }
        .imgArea {
            position: relative;
        }
        .imgArea img {
            width: 100%; /* 이미지를 부모 요소의 너비에 맞게 조절 */
            height: auto; /* 가로 비율을 유지한 채 세로 비율 자동 조정 */
            display: block; /* 이미지 간격 등을 위해 블록 레벨 요소로 설정 */
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

<div class="main">
    <div class="content">
        <div class="imgArea">
            <img src="<c:url value='/resources/img/CEO.png'/>" alt="CEO">
        </div>
        <h2>TITLE HEADING</h2>
        <h5>Title description, Dec 7, 2017</h5>
        <div class="fakeimg" style="height:200px;">Image</div>
        <p>Some text..</p>
        <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    </div>
</div>

<div class="footer">
    <h2>Footer</h2>
</div>
</body>
</html>
