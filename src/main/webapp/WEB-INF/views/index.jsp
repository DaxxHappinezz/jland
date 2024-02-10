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

        img {
            vertical-align: middle;
        }

        /* Position the image container (needed to position the left and right arrows) */
        .container {
            position: relative;
        }

        /* Hide the images by default */
        .mySlides {
            display: none;
        }

        /* Add a pointer when hovering over the thumbnail images */
        .cursor {
            cursor: pointer;
        }

        /* Next & previous buttons */
        .prev,
        .next {
            cursor: pointer;
            position: absolute;
            top: 40%;
            width: auto;
            padding: 16px;
            margin-top: -50px;
            color: white;
            font-weight: bold;
            font-size: 20px;
            border-radius: 0 3px 3px 0;
            user-select: none;
            -webkit-user-select: none;
        }

        /* Position the "next button" to the right */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover,
        .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        /* Container for image text */
        .caption-container {
            text-align: center;
            background-color: #222;
            padding: 2px 16px;
            color: white;
        }

        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Six columns side by side */
        .column {
            float: left;
            width: 16.66%;
        }

        /* Add a transparency effect for thumnbail images */
        .demo {
            opacity: 0.6;
        }

        .active,
        .demo:hover {
            opacity: 1;
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
        <h2 style="text-align:center">Welcome to J Land</h2>

        <div class="container">
            <div class="mySlides">
                <div class="numbertext">1 / 6</div>
                <img src="<c:url value='/resources/img/img_woods_wide.jpg'/>" style="width:100%">
            </div>

            <div class="mySlides">
                <div class="numbertext">2 / 6</div>
                <img src="<c:url value='/resources/img/img_5terre_wide.jpg'/>" style="width:100%">
            </div>

            <div class="mySlides">
                <div class="numbertext">3 / 6</div>
                <img src="<c:url value='/resources/img/img_mountains_wide.jpg'/>" style="width:100%">
            </div>

            <div class="mySlides">
                <div class="numbertext">4 / 6</div>
                <img src="<c:url value='/resources/img/img_lights_wide.jpg'/>" style="width:100%">
            </div>

            <div class="mySlides">
                <div class="numbertext">5 / 6</div>
                <img src="<c:url value='/resources/img/img_nature_wide.jpg'/>" style="width:100%">
            </div>

            <div class="mySlides">
                <div class="numbertext">6 / 6</div>
                <img src="<c:url value='/resources/img/img_snow_wide.jpg'/>" style="width:100%">
            </div>

            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a>
        </div>
    </div>
</div>

<div class="footer">
    <h2>Footer</h2>
</div>

<script>
    let slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("demo");
        let captionText = document.getElementById("caption");
        if (n > slides.length) {slideIndex = 1}
        if (n < 1) {slideIndex = slides.length}
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";
        dots[slideIndex-1].className += " active";
        captionText.innerHTML = dots[slideIndex-1].alt;
    }
</script>
</body>
</html>
