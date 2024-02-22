<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="loginId" value="${empty pageContext.request.session.getAttribute('id') ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginLink" value="${loginId == '' ? '/account/login' : '/account/logout'}"/>
<c:set var="isLogin" value="${loginId == '' ? 'Sign in' : 'Sign out'}"/>

<main>
    <section id="wishlist" class="section">
        <h2 class="wishlist__title">Wishlist</h2>
        <div class=wishlist__description>
            <ul class="wishlist__list">
                <li><p>위시리스트가 비어있습니다.</p></li>
                <a class="wishlist__shopBtn" href="/jland/shop">Go to SHOP</a>
            </ul>
        </div>
    </section>
</main>
