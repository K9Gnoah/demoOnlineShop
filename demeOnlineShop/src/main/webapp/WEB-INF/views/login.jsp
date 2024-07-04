<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 5/20/2024
  Time: 5:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/template/login/style.css' />"/>
    <script type="text/javascript" src="<c:url value="/template/login/scripts.js"/>"></script>
    <style>
        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">

        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-login">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <a href="#" class="active" id="login-form-link">Login</a>
                            </div>
                            <div class="col-xs-6">
                                <a href="#" id="register-form-link">Register</a>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <c:if test="${not empty message}">
                                    <div class="alert alert-success" >${message}</div>
                                </c:if>
                                <form id="login-form" method="post" action="${pageContext.request.contextPath}/login" role="form" style="display: block;">
                                    <div class="form-group">
                                        <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password" required>
                                    </div>
                                    <div class="form-group text-center">
                                        <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                        <label for="remember"> Remember Me</label>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6 col-sm-offset-3">
                                                <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="text-center">
                                                    <a href="https://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <form id="register-form" action="${pageContext.request.contextPath}/register/save" method="post" role="form" style="display: none;">
                                    <div class="form-group">
                                        <input type="text" name="firstName" id="firstName" tabindex="1" class="form-control" placeholder="Enter First Name" value="${user.firstName}" required>
                                        <c:if test="${not empty errors.firstName}">
                                            <p class="text-danger">${errors.firstName}</p>
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="lastName" id="lastName" tabindex="1" class="form-control" placeholder="Enter Last Name" value="${user.lastName}" required>
                                        <c:if test="${not empty errors.lastName}">
                                            <p class="text-danger">${errors.lastName}</p>
                                        </c:if>
                                    </div>

                                    <div class="form-group">
                                        <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="${user.email}" required>
                                        <c:if test="${not empty errors.email}">
                                            <p class="text-danger">${errors.email}</p>
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password" value="${user.password}" required>
                                        <c:if test="${not empty errors.password}">
                                            <p class="text-danger">${errors.password}</p>
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6 col-sm-offset-3">
                                                <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
