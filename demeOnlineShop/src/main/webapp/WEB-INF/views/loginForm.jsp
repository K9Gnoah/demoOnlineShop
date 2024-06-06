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
    <title>Login</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/template/login/style.css' />"/>
    <script type="text/javascript" src="<c:url value="/template/login/scripts.js"/>"></script>
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
                                <form action="${pageContext.request.contextPath}/login" method="post" id="login-form" role="form" style="display: block;">
                                    <div class="form-group">
                                        <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
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
                                <form id="register-form" action="https://phpoll.com/register/process" method="post" role="form" style="display: none;">
                                    <div class="form-group">
                                        <input type="text" name="username1" id="username1" tabindex="1" class="form-control" placeholder="Username" value="">
                                    </div>
                                    <div class="form-group">
                                        <input type="email" name="email1" id="email1" tabindex="1" class="form-control" placeholder="Email Address" value="">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password1" id="password1" tabindex="2" class="form-control" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
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
<script>
    // $("#login-submit").click(function(e) {
    //     e.preventDefault();
    //     $.ajax({
    //         url: '/auth/log-in',
    //         type: 'POST',
    //         contentType: 'application/json',
    //         data: JSON.stringify({
    //             userName: $("#username").val(),
    //             password: $("#password").val()
    //         }),
    //         success: function(response) {
    //             if (response.result && response.result.authenticated) {
    //                 localStorage.setItem('token', response.result.token);
    //                 window.location.href = '/adminDashBoard';
    //                 $.ajax({
    //                     url: '/adminDashBoard',
    //                     type: 'GET',
    //                     beforeSend: function(xhr) {
    //                         xhr.setRequestHeader('Authorization', 'Bearer ' + localStorage.getItem('token'));
    //                     },
    //                     success: function(response) {
    //                         $('body').html(response);
    //                         window.location.href='/adminDashBoard'
    //                     },
    //                     error: function(jqXHR, textStatus, errorThrown) {
    //                         if (jqXHR.status === 401) {
    //                             window.location.href = '/showLoginForm';
    //                         }
    //                     }
    //                 });
    //             } else {
    //                 alert('Invalid username or password');
    //             }
    //         }
    //     });
    // });
</script>
</body>
</html>
