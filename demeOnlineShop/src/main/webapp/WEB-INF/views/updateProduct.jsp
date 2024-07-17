<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 5/22/2024
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="shortcut icon" type="image/png" href="<c:url value='/template/admin/assets/images/logos/favicon.png'/>"/>
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/styles.min.css' />"/>
    <title>Update Product</title>
</head>
<body>
<!--  Body Wrapper -->
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <aside class="left-sidebar">
        <!-- Sidebar scroll-->
        <div>
            <div class="brand-logo d-flex align-items-center justify-content-between">
                <a href="./index.html" class="text-nowrap logo-img">
                    <img src="<c:url value="/template/admin/assets/images/logos/dark-logo.svg"/>" width="180" alt=""/>
                </a>
                <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                    <i class="ti ti-x fs-8"></i>
                </div>
            </div>
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
                <ul id="sidebarnav">
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Home</span>
                    </li>

                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./productList" aria-expanded="false">
                <span>
                  <i class="ti ti-cards"></i>
                </span>
                            <span class="hide-menu">Product List</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./salerPage" aria-expanded="false">
                <span>
                  <i class="ti ti-article"></i>
                </span>
                            <span class="hide-menu">Stock In</span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">AUTH</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/logout" aria-expanded="false">
                <span>
                  <i class="ti ti-login"></i>
                </span>
                            <span class="hide-menu">Log Out</span>
                        </a>
                    </li>

                </ul>

            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!--  Main wrapper -->
    <div class="body-wrapper">
        <!--  Header Start -->
        <header class="app-header">
            <nav class="navbar navbar-expand-lg navbar-light">
                <ul class="navbar-nav">
                    <li class="nav-item d-block d-xl-none">
                        <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                            <i class="ti ti-menu-2"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                            <i class="ti ti-bell-ringing"></i>
                            <div class="notification bg-primary rounded-circle"></div>
                        </a>
                    </li>
                </ul>
                <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
                    <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
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
                                    <a href="/user/changepass" class="d-flex align-items-center gap-2 dropdown-item">
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
            </nav>
        </header>
        <!--  Header End -->

        <div class="container-fluid">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title fw-semibold mb-4">Forms</h5>
                        <div class="card">
                            <div class="card-body">
                                <form>
                                    <div class="mb-3">
                                        <label class="form-label" for="product_id">PRODUCT ID</label>
                                        <input id="product_id" name="product_id" placeholder="PRODUCT ID"
                                               class="form-control"
                                               required="" type="text" readonly value="${product.productId}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="product_name">PRODUCT NAME</label>
                                        <input id="product_name" name="product_name" placeholder="PRODUCT NAME"
                                               class="form-control" required="" type="text"
                                               value="${product.productName}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="product_description">PRODUCT
                                            DESCRIPTION</label>

                                        <textarea class="form-control" id="product_description"
                                                  name="product_description">${product.productDescription}</textarea>

                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="product_price">PRICE</label>
                                        <input id="product_price" name="product_price" placeholder="PRICE"
                                               class="form-control input-md"
                                               required="" type="number" min="0"
                                               value="${product.productPrice}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="product_image">main_image</label>
                                        <input id="product_image" name="product_image" class="input-file"
                                               type="file">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="product_status">STATUS</label>
                                        <select id="product_status" name="product_status" class="form-control">
                                            <option value="true"
                                                    <c:if test="${product.productStatus == true}">selected</c:if>>
                                                Appear
                                            </option>
                                            <option value="false"
                                                    <c:if test="${product.productStatus == false}">selected</c:if>>
                                                Hide
                                            </option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="available_quantity">AVAILABLE
                                            QUANTITY</label>
                                        <input id="available_quantity" name="available_quantity"
                                               placeholder="AVAILABLE QUANTITY"
                                               class="form-control" required="" type="number" min="0"
                                               value="${product.productQuantity}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="product_categorie">PRODUCT
                                            CATEGORY</label>
                                        <select id="product_categorie" name="product_categorie"
                                                class="form-control">
                                            <option value="1"
                                                    <c:if test="${product.categoryId == 1}">selected</c:if>>Trái
                                                cây nhập
                                                khẩu
                                            </option>
                                            <option value="2"
                                                    <c:if test="${product.categoryId == 2}">selected</c:if>>Thực phẩm đồ
                                                khô
                                            </option>
                                        </select>

                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="uploadbutton"></label>
                                        <div class="col-md-7">
                                            <button id="uploadbutton" name="uploadbutton" class="btn btn-primary">
                                                UPLOAD PRODUCT
                                            </button>
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
</div>
<script type="text/javascript"
        src="<c:url value="/template/admin/assets/libs/jquery/dist/jquery.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/template/admin/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/admin/assets/js/sidebarmenu.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/admin/assets/js/app.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/template/admin/assets/libs/simplebar/dist/simplebar.js"/>"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#uploadbutton").click(function (event) {
            event.preventDefault();

            var productID = $("#product_id").val();
            var formData = {
                productName: $("#product_name").val(),
                productDescription: $("#product_description").val(),
                productPrice: parseFloat($("#product_price").val()),
                // productImage: $("#product_image").val(), // Lưu ý: File uploads cần xử lý khác
                productStatus: $("#product_status").val() === "true",
                productQuantity: parseInt($("#available_quantity").val()),
                categoryId: $("#product_categorie").val() === "1" ? 1 : 2
            };

            $.ajax({
                url: "/api/products/" + productID,  // URL của API
                type: "PUT",
                contentType: "application/json",
                data: JSON.stringify(formData),
                success: function (result) {
                    alert("update successfully");
                    location.replace("/saler/productList")
                },
                error: function (e) {
                    console.log(e);
                    alert("Error: " + e.responseText);
                }
            });
        });
    });
</script>
</body>
</html>
