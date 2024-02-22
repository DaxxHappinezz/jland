<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>

<html>
<head>
    <title>J LAND</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>"/>
<%--    Favicon--%>
    <link rel="shortcut icon" href="<c:url value="/resources/img/jland_favicon.png"/>" type="image/x-icon">
<%--    Google Fonts--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/3303015ad2.js" crossorigin="anonymous"></script>
</head>
<body>
    <!-- header -->
    <tiles:insertAttribute name="header"/>

    <!-- content -->
    <tiles:insertAttribute name="content"/>

    <!-- footer -->
    <tiles:insertAttribute name="footer"/>

</body>
</html>
