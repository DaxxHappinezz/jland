<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="loginId" value="${empty pageContext.request.session.getAttribute('id') ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginLink" value="${loginId == '' ? '/account/login' : '/account/logout'}"/>
<c:set var="isLogin" value="${loginId == '' ? 'Sign in' : 'Sign out'}"/>

<header class="header">
    <div>
        <ul class="header__logo">
            <a href="<c:url value='/'/>" title="home">
                <img class="header__logo__img" src="<c:url value="/resources/img/jland_logo.png"/>" alt="logo image">
            </a>
            <li><a class="header__logo__menu" href="<c:url value='/shop'/>">SHOP</a></li>
            <li><a class="header__logo__menu" href="<c:url value='/service'/>">HELP</a></li>
        </ul>
    </div>
    <nav>
        <ul class="header__menu">
            <li><a class="header__menu__item" href="<c:url value='${loginLink}'/>">${isLogin}</a></li>
            <li>
                <a class="header__menu__item" href="<c:url value='/cart'/>">
                    <i class="fa-solid fa-cart-plus"></i>
                </a>
            </li>
            <li>
                <a class="header__menu__item" href="<c:url value='/wishlist'/>">
                    <i class="fa-regular fa-heart"></i>
                </a>
            </li>
            <li>
                <a class="header__menu__item active" href="#none">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </a>
            </li>
        </ul>
    </nav>
</header>
