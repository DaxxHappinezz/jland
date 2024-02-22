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
  <style>
  </style>
</head>
<body>

<main>
  <section id="service" class="section">
    <h2 class="service__title">Help Service</h2>
    <div class=service__description>
      <h2>Hey! How can we help you?</h2>
    </div>
  </section>
</main>
</body>
</html>