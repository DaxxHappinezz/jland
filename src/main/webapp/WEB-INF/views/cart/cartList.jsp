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
</head>
<body>

<%-- Header --%>
<div class="header">
    <h1>J Land</h1>
    <p>Resize the browser window to see the effect.</p>
</div>

<div class="topnav">
    <a href="<c:url value='/'/>">JLand</a>
    <a href="<c:url value='/shop'/>">SHOP</a>
    <a href="<c:url value='/service'/>">HELP</a>
    <a href="<c:url value='${loginLink}'/>" class="topnav-right">${isLogin}</a>
    <a href="<c:url value='/cart'/>" class="topnav-right">My Cart</a>
    <a href="<c:url value='/wishlist'/>" class="topnav-right">Wishlist</a>
    <a href="<c:url value='/cart'/>" class="topnav-right">search</a>
</div>

<%-- Main --%>
<div class="main">
    <div class="content">
        <section class="content__section">
            <h2 class="section__title">장바구니</h2>
            <div class=section__cart></div>
        </section>
    </div>
</div>

<%-- Footer --%>
<div class="footer">
    <h2>Footer</h2>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        getCartList();
    });

    let getCartList = function() {
        let myCart = document.querySelector('.section__cart');
        fetch(`/jland/cart/get`, {
            method: 'GET',
        })
            .then(response => {
                if (response.status === 203) {
                    return response;
                }

                if (!response.ok) {
                    throw new Error('Server response was not ok');
                }

                return response.json();
            })
            .then(data => {
                myCart.innerHTML = toHtml(data);
            })
            .catch(error => {
                console.error('error: ', error);
            });
    };

    let toHtml = function(list) {
        console.log("list: ", list);
        let result = '<ul>';

        if (list.length > 0) {
            list.forEach(function(item) {
                result += '<li data-cno=' + item.cno
                result += ' data-pno=' + item.pno + '>'
                result += '<span class="product-name">' + item.pname + '</span>'
                result += '<span class="quantity">' + item.quantity + '</span>'
                result += '<span class="price">' + item.price + '</span></li>'
            });
            return result += '</ul>';
        }

        result += "<li><p>장바구니가 비었습니다.</p></li>"
        result += "<button><a href='/jland/shop'>Go to SHOP</a></button>"
        return result += '</ul>';
    };
</script>
</body>
</html>
