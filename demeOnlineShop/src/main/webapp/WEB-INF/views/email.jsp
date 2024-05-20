<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 5/20/2024
  Time: 8:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/template/bootstrap.min.css' />"/>
    <link rel="stylesheet" href="<c:url value='/template/jquery.min.js' />"/>
    <link rel="stylesheet" href="<c:url value='/template/bootstrap.min.js' />"/>
</head>
<body>
<div class="container">
    <form action="/action_page.php">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
        </div>
        <div class="form-group">
            <label for="template">Template email:</label>
            <textarea class="form-control" rows="5" id="template"></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Send mail</button>
    </form>
</div>
</body>
</html>
