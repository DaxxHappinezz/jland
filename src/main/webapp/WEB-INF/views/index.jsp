<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="loginId" value="${empty pageContext.request.session.getAttribute('id') ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginLink" value="${loginId == '' ? '/account/login' : '/account/logout'}"/>
<c:set var="isLogin" value="${loginId == '' ? 'Sign in' : 'Sign out'}"/>

<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>"/>
<%--    Google Fonts--%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3303015ad2.js" crossorigin="anonymous"></script>
<style>

    img {
        vertical-align: middle;
    }

    /* Hide the images by default */
    .mySlides {
        display: none;
    }

    .home__container {
        margin-top: 0.5rem;
    }

    /* Next & previous buttons */
    .prev,
    .next {
        align-items: center;
        cursor: pointer;
        position: absolute;
        top: 50%;
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
        right: 3rem;
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
        /*top: 0;*/
    }
</style>

<main class="main">
    <section id="home" class="section">
        <h2 class="home__title">Welcome to J Land</h2>
        <div class="home__container">
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
    </section>
</main>

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
        if (n > slides.length) {slideIndex = 1}
        if (n < 1) {slideIndex = slides.length}
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex-1].style.display = "block";
    }
</script>
</body>
</html>
