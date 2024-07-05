<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 5/29/2024
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Show All Shop's Products</title>
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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/dist/tabler-icons.min.css"/>
    <style>
        .add-to-cart-button {
            border-radius: 50%; /* Tạo hiệu ứng bo tròn */
            background-color: #82ae46; /* Đặt màu nền là xanh */
            color: white; /* Đặt màu chữ là trắng */
            border: none; /* Loại bỏ viền */
            padding: 10px 15px; /* Thêm padding để nút có kích thước phù hợp */
        }
    </style>
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
        <a class="navbar-brand" href="index.html">Vegefoods</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
                <li class="nav-item active dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">Shop</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="/common/showProduct">Shop</a>
                        <a class="dropdown-item" href="wishlist.html">Wishlist</a>
                        <a class="dropdown-item" href="product-single.html">Single Product</a>
                        <a class="dropdown-item" href="/customer/cart">Cart</a>
                        <a class="dropdown-item" href="checkout.html">Checkout</a>
                    </div>
                </li>
                <li class="nav-item"><a href="/common/aboutPage" class="nav-link">About</a></li>
                <li class="nav-item"><a href="/common/aboutPage" class="nav-link">Blog</a></li>
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
                            <a href="/user/changepass/${user.id}" class="d-flex align-items-center gap-2 dropdown-item">
                                <i class="ti ti-mail fs-6"></i>
                                <p class="mb-0 fs-3">Change Password</p>
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

        <a class="navbar-brand"> Hello ${user.username}</a>
    </div>
</nav>
<!-- END nav -->

<div class="hero-wrap hero-bread" style="background-image: url('<c:url value="/template/homepage/images/bg_1.jpg"/>');">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="/home">Home</a></span> <span>Products</span></p>
                <h1 class="mb-0 bread">Products</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10 mb-5 text-center">
                <ul class="product-category">
                    <li><a href="?category=" class="active">All</a></li>
                    <li><a href="?category=1">Hoa quả nhập khẩu</a></li>
                    <li><a href="?category=2">Hoa quả nội địa </a></li>
                </ul>
            </div>
        </div>
        <div class="row" id="shopprolist">
            <c:forEach var="i" items="${listProduct.content}">
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="/common/productDetails/${i.productId}" class="img-prod"><img class="img-fluid" src="${i.productImage}"
                                                          alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="/common/productDetails/${i.productId}">${i.productName}</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>${i.productPrice} VNĐ</span></p>
                                    </p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-3">
                                <div class="m-auto d-flex">
                                    <button class="add-to-cart-button" data-product-id="${i.productId}">
                                        <i class="ti ti-playlist-add"></i>
                                    </button>
                                    <a href="/customer/buyNow/${i.productId}"
                                       class="buy-now d-flex justify-content-center align-items-center mx-1">
                                        <span><i class="ion-ios-cart"></i></span>
                                    </a>
                                    <a href="/customer/voteHeart/${i.productId}"
                                       class="heart d-flex justify-content-center align-items-center ">
                                        <span><i class="ion-ios-heart"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="row mt-5">
            <div class="col text-center">
                <div class="block-27">
                    <ul>
                        <c:if test="${listProduct.hasPrevious()}">
                            <li>
                                <a href="?page=${listProduct.number - 1}&size=${listProduct.size}<c:if test='${not empty param.category}'>&category=${param.category}</c:if>">&lt;</a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${listProduct.totalPages}" var="i">
                            <c:choose>
                                <c:when test="${i == (listProduct.number + 1)}">
                                    <li class="active"><span>${i}</span></li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="?page=${i - 1}&size=${listProduct.size}<c:if test='${not empty param.category}'>&category=${param.category}</c:if>">${i}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${listProduct.hasNext()}">
                            <li>
                                <a href="?page=${listProduct.number + 1}&size=${listProduct.size}<c:if test='${not empty param.category}'>&category=${param.category}</c:if>">&gt;</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</section>

<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
    <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
            <div class="col-md-6">
                <h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
                <span>Get e-mail updates about our latest shops and special offers</span>
            </div>
            <div class="col-md-6 d-flex align-items-center">
                <form action="#" class="subscribe-form">
                    <div class="form-group d-flex">
                        <input type="text" class="form-control" placeholder="Enter email address">
                        <input type="submit" value="Subscribe" class="submit px-3">
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<footer class="ftco-footer ftco-section">
    <div class="container">
        <div class="row">
            <div class="mouse">
                <a href="#" class="mouse-icon">
                    <div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
                </a>
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Vegefoods</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
                    <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                        <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4 ml-md-5">
                    <h2 class="ftco-heading-2">Menu</h2>
                    <ul class="list-unstyled">
                        <li><a href="#" class="py-2 d-block">Shop</a></li>
                        <li><a href="#" class="py-2 d-block">About</a></li>
                        <li><a href="#" class="py-2 d-block">Journal</a></li>
                        <li><a href="#" class="py-2 d-block">Contact Us</a></li>

                    </ul>
                </div>
            </div>
            <div class="col-md-4">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Help</h2>
                    <div class="d-flex">
                        <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
                            <li><a href="#" class="py-2 d-block">Shipping Information</a></li>
                            <li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
                            <li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
                            <li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
                        </ul>
                        <ul class="list-unstyled">
                            <li><a href="#" class="py-2 d-block">FAQs</a></li>
                            <li><a href="#" class="py-2 d-block">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Have a Questions?</h2>
                    <div class="block-23 mb-3">
                        <ul>
                            <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span>
                            </li>
                            <li><a href="#"><span class="icon icon-phone"></span><span
                                    class="text">+2 392 3929 210</span></a></li>
                            <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">

                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                    All rights reserved | This template is made with <i class="icon-heart color-danger"
                                                                        aria-hidden="true"></i> by <a
                            href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
            </div>
        </div>
    </div>
</footer>


<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"/>
    </svg>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
    $(document).ready(function () {
        $.ajax({
            url: "/cart/count",
            type: "GET",
            success: function (response) {
                $("#cart-count").text(response);
            }
        });

        $(".add-to-cart-button").click(function () {
            var productId = $(this).data("product-id");

            $.ajax({
                url: "/cart/add/" + productId,
                type: "POST",
                success: function (response) {
                    alert("Add to cart successfully!");

                    //get the currtent cart item count
                    $.ajax({
                        url: "/cart/count",
                        type: "GET",
                        success: function (response) {
                            $("#cart-count").text(response);
                        }
                    });
                },
                error: function (response) {
                    alert("An error occurred");
                }
            });
        });
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/google-map.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/homepage/js/main.js"/>"></script>

</body>
</html>
