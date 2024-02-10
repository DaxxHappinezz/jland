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
        .content {
            background-color: white;
            padding: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<%-- Header --%>
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
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log("data: ", data);
                myCart.innerHTML = toHtml(data);
            })
            .catch(error => {
                console.error('There has been a problem with your fetch operation:', error);
            });
    };

    let toHtml = function(list) {
        let result = '<ul>';

        if (list.length === 0) {
            result += "<li><p>장바구니가 비었습니다.</p></li>"
            result += "<button><a href='<c:url value="/products"/>'>Go to SHOP</a></button>"
            return result += '</ul>';
        }

        list.forEach(function(item) {
            result += '<li data-cno=' + item.cno
            result += ' data-pno=' + item.pno + '>'
            result += '<span class="product-name">' + item.pname + '</span>'
            result += '<span class="quantity">' + item.quantity + '</span>'
            result += '<span class="price">' + item.price + '</span></li>'
        });
        result += '</ul>';
        console.log("item result: ", result);
        return result;
    };
</script>
</body>
</html>
