<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 6/25/2024
  Time: 8:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cart</title>
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
    <style>
        #update-cart {
            background-color: #82ae46; /* Màu nền */
            border: 1px; /* Không viền */
            color: white; /* Màu chữ */
            padding: 15px 32px; /* Đệm */
            text-align: center; /* Căn giữa chữ */
            text-decoration: none; /* Không gạch chân */
            display: inline-block;
            font-size: 16px; /* Kích thước chữ */
            margin: 4px 2px;
            cursor: pointer; /* Con trỏ chuột */
            border-radius: 12px; /* Bo góc */
        }

        #update-cart:hover {
            background-color: #45a049; /* Màu nền khi di chuột qua */
        }

        #update-cart:disabled {
            background-color: #ccc; /* Màu nền khi nút bị vô hiệu hóa */
            cursor: not-allowed; /* Con trỏ chuột khi nút bị vô hiệu hóa */
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
        <a class="navbar-brand" href="/home">Vegefoods</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="/home" class="nav-link">Home</a></li>
                <li class="nav-item active dropdown">
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
                <li class="nav-item"><a href="/common/aboutPage" class="nav-link">About</a></li>
                <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
                <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
                <li class="nav-item cta cta-colored"><a href="/customer/cart" class="nav-link"><span id="cart-count"
                                                                                                     class="icon-shopping_cart"></span></a>
                </li>

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
                <p class="breadcrumbs"><span class="mr-2"><a href="/home">Home</a></span> <span>Cart</span></p>
                <h1 class="mb-0 bread">My Cart</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section ftco-cart">
    <div class="container">
        <div class="row">
            <div class="col-md-12 ftco-animate">
                <div>
                    CARD ID :<input type="text" class="cart-id-num" value="${cart.id}" readonly>
                </div>
                <div class="cart-list">
                    <table class="table">
                        <thead class="thead-primary">
                        <tr class="text-center">
                            <th>&nbsp;</th>
                            <th>Product ID</th>
                            <th>Product Image</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${cart.items}">
                            <tr>
                                <td class="product-remove"><a data-id="${item.id}">${item.id}<span class="ion-ios-close"></span></a></td>
                                <td>${item.product.productId}</td>
                                <td class="image-prod">
                                    <div class="img" style="background-image:url('<c:url
                                            value="${item.product.productImage}"/>');"></div>
                                </td>
                                <td>${item.product.productName}</td>
                                <td class="price">${item.product.productPrice} VND</td>
                                <td class="quantity">
                                    <div class="input-group mb-3">
                                        <input type="number" name="quantity" class="quantity form-control input-number"
                                               value="${item.quantity}" min="1" max="100" oninput="updateTotal(this)">
                                    </div>
                                </td>
                                <td class="total">${item.product.productPrice * item.quantity} VND</td>
                            </tr>
                            <c:set var="delivery" value="${totalDelivery + (item.product.productPrice * item.quantity)}"/>
                            <c:set var="totalDelivery" value="${delivery - 20000}"/>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row justify-content-end">
            <div class="col-lg-12 mt-5 cart-wrap ftco-animate">
                <button id = "update-cart" disabled>Update Cart</button>
                <div class="cart-total mb-3">
                    <h3>Cart Totals</h3>
                    <p class="d-flex">
                        <span>Subtotal</span>
                        <span>${delivery} VND</span>
                    </p>
                    <p class="d-flex">
                        <span>Delivery</span>
                        <span>20000 VND</span>
                    </p>
                    <p class="d-flex">
                        <span>Discount</span>
                        <span>0%</span>
                    </p>
                    <hr>
                    <p class="d-flex total-price">
                        <span>Total</span>
                        <span>${totalDelivery} VND</span>
                    </p>
                </div>
                <p><a href="/customer/checkout" class="btn btn-primary py-3 px-4">Proceed to Checkout</a></p>
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
                        <li><a href="/common/showProduct" class="py-2 d-block">Shop</a></li>
                        <li><a href="/common/aboutPage" class="py-2 d-block">About</a></li>
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

<script>
    function updateTotalForRow(row) {
        //get the price and quantity
        var price = parseFloat(row.querySelector('.price').textContent);
        var quantityInput = row.querySelector('.quantity.form-control.input-number');
        var quantity = parseInt(quantityInput.value);

        //if quantity is more than 100, set it to 100
        if (quantity > 100) {
            quantity = 100;
            quantityInput.value = 100;
        }
        else if(quantity < 1){
            quantity = 1;
            quantityInput.value = 1;
        }
        //caculate the total
        var total = price * quantity;

        //update the total column
        row.querySelector('.total').textContent = total.toFixed(2);
    }
    function updateTotal(input){
        var row = input.closest('tr');
        updateTotalForRow(row);
    }

    //khi thay đổi số lượng sản phẩm thì enable button update
    $('.quantity.form-control.input-number').on('input', function () {
        //kích hoạt nút "cập nhật giỏ hàng"
        $('#update-cart').prop('disabled', false);
    });

    //khi người dùng nhấn nút update-cart
    $('#update-cart').click(function (event){
        event.preventDefault()
        // Loop through all items in the cart
        $('.quantity.form-control.input-number').each(function(){
            var id = $(this).closest('tr').find('.product-remove a').data('id');
            var quantity = $(this).val();

            var formData = {
                id: id,
                quantity: quantity
            }
            $.ajax({
                url: '/cart/update',
                type: 'PUT',
                contentType: "application/json",
                data: JSON.stringify(formData),
                success: function (response){
                    location.reload();
                },
                error: function (response){
                    alert(response.responseText);
                }
            })
        });

        // $('#update-cart').prop('disabled', true);
    });
    $(document).ready(function () {
        $('.product-remove a').on('click', function(e){
            e.preventDefault();
            var itemId = $(this).data('id');

            var userConfirmed = confirm("Are you sure you want to remove this item from cart?");
            if(userConfirmed) {
                $.ajax({
                    url: '../cart/remove/' + itemId,
                    type: 'DELETE',
                    success: function (response) {
                        location.reload();
                    },
                    error: function (response) {
                        aleart('an error occurred');
                    }
                })
            }
        })

        //validate input number
        $('.quantity.form-control.input-number').on('input', function () {
            var input = $(this);
            setTimeout(function () {
                var value = parseInt(input.val());
                input.val(value);
                updateTotal(input);
            }, 0);
        }).on('keydown', function (e){
            // Allow: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                // Allow: Ctrl+A, Command+A
                (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                // Allow: home, end, left, right, down, up
                (e.keyCode >= 35 && e.keyCode <= 40)) {
                // let it happen, don't do anything
                return;
            }
            // Ensure that it is a number and stop the keypress
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }
        })

        $.ajax({
            url: "/cart/count",
            type: "GET",
            success: function (response) {
                $("#cart-count").text(response);
            }
        });

        var quantitiy = 0;
        $('.quantity-right-plus').click(function (e) {

            // Stop acting like a button
            e.preventDefault();
            // Get the field name
            var quantity = parseInt($('#quantity').val());

            // If is not undefined

            $('#quantity').val(quantity + 1);


            // Increment

        });

        $('.quantity-left-minus').click(function (e) {
            // Stop acting like a button
            e.preventDefault();
            // Get the field name
            var quantity = parseInt($('#quantity').val());

            // If is not undefined

            // Increment
            if (quantity > 0) {
                $('#quantity').val(quantity - 1);
            }
        });

    });
</script>

</body>
</html>
