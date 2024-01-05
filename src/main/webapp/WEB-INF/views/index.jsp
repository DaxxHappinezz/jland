<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="loginId" value="${pageContext.request.getSession(false) == null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginLink" value="${loginId == '' ? '/account/login' : '/account/logout'}"/>
<c:set var="isLogin" value="${loginId == '' ? 'Sign in' : 'Sign out'}"/>
<html>
<body>
<h2>Hello World!</h2>
<h3>${loginId == '' ? '' : 'J Land에 돌아오신 걸 환영합니다.'} </h3>
<div>
    <ul>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='${loginLink}'/>">${isLogin}</a></li>
        <li><a href="<c:url value='/wishlist'/>">Wishlist</a></li>
        <li><a href="<c:url value='/cart'/>">My Cart</a></li>
    </ul>
</div>


<div>content</div>
<div>footer</div>
</body>
</html>
