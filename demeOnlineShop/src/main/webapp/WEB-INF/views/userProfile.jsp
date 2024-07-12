<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 6/21/2024
  Time: 9:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Profile</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/open-iconic-bootstrap.min.css' />"/>
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/animate.css' />"/>
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/owl.carousel.min.css' />"/>
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/owl.theme.default.min.css' />"/>
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/magnific-popup.css' />"/>
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/aos.css' />"/>
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/ionicons.min.css' />"/>
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/bootstrap-datepicker.css' />"/>
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/jquery.timepicker.css' />"/>
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/flaticon.css' />"/>
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/icomoon.css' />"/>
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/style.css' />"/>
</head>
<body class="goto-here">
<div class="py-1 bg-primary">
    <div class="container">
        <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
            <div class="col-lg-12 d-block">
                <div class="row d-flex">
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span
                                class="icon-phone2"></span></div>
                        <span class="text">+ 1235 2355 98</span>
                    </div>
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span
                                class="icon-paper-plane"></span></div>
                        <span class="text">youremail@email.com</span>
                    </div>
                    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                        <span class="text">3-5 Business days delivery &amp; Free Returns</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="/home">Vegefoods</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="/home" class="nav-link">Home</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">Shop</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="/common/showProduct">Shop</a>
                        <a class="dropdown-item" href="wishlist.html">Wishlist</a>
                        <a class="dropdown-item" href="product-single.html">Single Product</a>
                        <a class="dropdown-item" href="/customer/cart">Cart</a>
                        <a class="dropdown-item" href="/customer/checkout">Checkout</a>
                    </div>
                </li>
                <li class="nav-item active"><a href="/common/aboutPage" class="nav-link">About</a></li>
                <li class="nav-item"><a href="/common/blog" class="nav-link">Blog</a></li>
                <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
                <li class="nav-item cta cta-colored"><a href="/customer/cart" class="nav-link"><span id="cart-count"
                                                                                                     class="icon-shopping_cart"></span></a>
                </li>
                <%--                info--%>

                <li class="nav-item dropdown">
                    <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2"
                       data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <img src="<c:url value="/template/admin/assets/images/profile/user-1.jpg"/>" alt=""
                             width="35" height="35" class="rounded-circle">
                    </a>
                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
                         aria-labelledby="drop2">
                        <div class="message-body">
                            <a href="/user/profile" class="d-flex align-items-center gap-2 dropdown-item">
                                <i class="ti ti-user fs-6"></i>
                                <p class="mb-0 fs-3">My Profile</p>
                            </a>
                            <a href="/user" class="d-flex align-items-center gap-2 dropdown-item">
                                <i class="ti ti-mail fs-6"></i>
                                <p class="mb-0 fs-3">My Account</p>
                            </a>
                            <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                                <i class="ti ti-list-check fs-6"></i>
                                <p class="mb-0 fs-3">My Task</p>
                            </a>
                            <a href="/logout"
                               class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->

    <h1>${user.id}!</h1>
    <h1>${user.email}!</h1>
    <h1>${user.password}!</h1>
    <h1>${user.username}!</h1>
    <h1>${user.address}!</h1>
    <form id="uploadForm" enctype="multipart/form-data">
        <input type="file" id="file" name="file" required/>
        <button type="submit">Upload</button>
    </form>
    Avatar : <p><img src="${user.avatar}" alt="User avatar" width="200"/></p>
    <h1>${user.phone}!</h1>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const uploadForm = document.getElementById('uploadForm');
        if (uploadForm) {
            uploadForm.addEventListener('submit', function(event) {
                event.preventDefault();

                const fileInput = document.getElementById('file');
                const formData = new FormData();
                formData.append('file', fileInput.files[0]);

                fetch('/api/files/upload', {
                    method: 'POST',
                    body: formData
                })
                    .then(response => response.text())
                    .then(data => {
                        alert(data);
                        location.reload(); // Reload page to update the avatar image
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('Failed to upload file.');
                    });
            });
        }
    });
</script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/jquery-migrate-3.0.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/popper.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/jquery.easing.1.3.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/jquery.waypoints.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/jquery.stellar.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/owl.carousel.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/jquery.magnific-popup.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/aos.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/jquery.animateNumber.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/bootstrap-datepicker.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/scrollax.min.js"/>"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"/></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/google-map.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/main.js"/>"></script>
</body>
</html>
