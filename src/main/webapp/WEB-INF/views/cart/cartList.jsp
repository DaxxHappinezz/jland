<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="loginId" value="${empty pageContext.request.session.getAttribute('id') ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginLink" value="${loginId == '' ? '/account/login' : '/account/logout'}"/>
<c:set var="isLogin" value="${loginId == '' ? 'Sign in' : 'Sign out'}"/>

<%-- Main --%>
<main class="main">
    <section id="cart" class="section">
        <h2 class="cart__title">Cart</h2>
        <div class=cart__description></div>
    </section>
</main>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        getCartList();
    });

    let getCartList = function() {
        let myCart = document.querySelector('.cart__description');
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
        let result = '<ul class=cart__list>';

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
        result += "<a class='cart__shopBtn' href='/jland/shop'>Go to SHOP</a>"
        return result += '</ul>';
    };
</script>