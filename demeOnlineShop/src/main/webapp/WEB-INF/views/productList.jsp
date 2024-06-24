<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 5/21/2024
  Time: 8:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product List</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="shortcut icon" type="image/png" href="<c:url value='/template/admin/assets/images/logos/favicon.png'/>"/>
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/styles.min.css' />"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/style.css' />"/>
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
                        <a class="sidebar-link" href="/adminDashBoard" aria-expanded="false">
                <span>
                  <i class="ti ti-layout-dashboard"></i>
                </span>
                            <span class="hide-menu">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">UI COMPONENTS</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./manageAccount" aria-expanded="false">
                <span>
                  <i class="ti ti-article"></i>
                </span>
                            <span class="hide-menu">Manage Account</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./ui-alerts.html" aria-expanded="false">
                <span>
                  <i class="ti ti-alert-circle"></i>
                </span>
                            <span class="hide-menu">Alerts</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/productList" aria-expanded="false">
                <span>
                  <i class="ti ti-cards"></i>
                </span>
                            <span class="hide-menu">Product List</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./ui-forms.html" aria-expanded="false">
                <span>
                  <i class="ti ti-file-description"></i>
                </span>
                            <span class="hide-menu">Forms</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./ui-typography.html" aria-expanded="false">
                <span>
                  <i class="ti ti-typography"></i>
                </span>
                            <span class="hide-menu">Typography</span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">AUTH</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./authentication-login.html" aria-expanded="false">
                <span>
                  <i class="ti ti-login"></i>
                </span>
                            <span class="hide-menu">Login</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./authentication-register.html" aria-expanded="false">
                <span>
                  <i class="ti ti-user-plus"></i>
                </span>
                            <span class="hide-menu">Register</span>
                        </a>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">EXTRA</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./icon-tabler.html" aria-expanded="false">
                <span>
                  <i class="ti ti-mood-happy"></i>
                </span>
                            <span class="hide-menu">Icons</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./sample-page.html" aria-expanded="false">
                <span>
                  <i class="ti ti-aperture"></i>
                </span>
                            <span class="hide-menu">Sample Page</span>
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
                        <a href="https://adminmart.com/product/modernize-free-bootstrap-admin-dashboard/"
                           target="_blank" class="btn btn-primary">Download Free</a>
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
                                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
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
            </nav>
        </header>
        <!--  Header End -->
        <div class="container-fluid">
            <div class="container mt-4">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Image</th>
                            <th>Status</th>
                            <th>Quantity</th>
                            <th>Category</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="i" items="${listProduct.content}">
                            <tr>
                                <td>${i.productId}</td>
                                <td>${i.productName}</td>
                                <td>${i.productDescription}</td>
                                <td>${i.productPrice}</td>
                                <td><img src="${i.productImage}" class="img-fluid" style="max-width: 100px;"></td>
                                <td>${i.productStatus}</td>
                                <td>${i.productQuantity}</td>
                                <td>${i.category.categoryId}</td>
                                <td>
                                    <a href="/updateProduct/${i.productId}" class="btn btn-primary mb-2">Update</a>
                                    <button class="deleteproduct btn btn-danger" data-id="${i.productId}">Delete
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                    <a href="/addProductForm">Add product</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col text-center">
            <div class="block-27">
                <ul>
                    <c:if test="${listProduct.hasPrevious()}">
                        <li><a href="?page=${listProduct.number - 1}&size=${listProduct.size}">&lt;</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${listProduct.totalPages}" var="i">
                        <c:choose>
                            <c:when test="${i == (listProduct.number + 1)}">
                                <li class="active"><span>${i}</span></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="?page=${i - 1}&size=${listProduct.size}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${listProduct.hasNext()}">
                        <li><a href="?page=${listProduct.number + 1}&size=${listProduct.size}">&gt;</a></li>
                    </c:if>
                </ul>
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
        src="<c:url value="/template/admin/assets/libs/apexcharts/dist/apexcharts.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/template/admin/assets/libs/simplebar/dist/simplebar.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/admin/assets/js/dashboard.js"/>"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".deleteproduct").click(function (event) {
            event.preventDefault();

            var productId = $(this).data("id");
            // Hiển thị hộp thoại xác nhận
            var confirmation = confirm("Are you sure you want to delete this product?");
            if (confirmation) {
                // Người dùng chọn Yes, thực hiện xóa sản phẩm
                $.ajax({
                    url: "/api/products/" + productId,  // URL của API
                    type: "DELETE",
                    success: function (result) {
                        alert(result);
                        location.reload();  // Reload lại trang sau khi xóa thành công
                    },
                    error: function (e) {
                        console.log(e);
                        alert("Error: " + e.responseText);
                    }
                });
            } else {
                // Người dùng chọn No, hủy bỏ hành động xóa
                alert("Delete action was cancelled.");
            }

        });
    });
</script>

</body>
</html>
