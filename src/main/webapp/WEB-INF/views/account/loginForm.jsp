<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JLand Sign in</title>
</head>
<body>
<h2>Sign in</h2>
<form action="<c:url value='/account/login'/>" method="post">
    <fieldset>
        <label>Your ID
            <input type="text" name="id" value="${cookie.id == null ? "" : cookie.id.value}" placeholder="Your ID"/>
        </label>
        <br>
        <small><a href="#none">Forgot ID?</a></small>
        <br>
        <label>Your Password
            <input type="password" name="pw" placeholder="Your Password"/>
        </label>
        <br>
        <small><a href="#none">Forgot Password?</a></small>
        <br>
        <input type="checkbox" name="rememberId" ${cookie.id == null ? " " : "checked"}/>Remember Id
        <br>
        <button>Sign in</button>
    </fieldset>
</form>
<div>
    <h3>Join us?</h3>
    <a href="<c:url value='/account/add'/>">Create Account</a>
</div>
<script>
    let msg = "${msg}"

    if (msg == "LOG_ERR") alert("ID 또는 Password를 확인 후 이용해 주세요.");
</script>
</body>
</html>
