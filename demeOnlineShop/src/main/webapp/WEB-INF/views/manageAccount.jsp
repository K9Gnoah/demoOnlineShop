<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 6/10/2024
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Manage Account</title>
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
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./manageAccount" aria-expanded="false">
                <span>
                  <i class="ti ti-article"></i>
                </span>
                            <span class="hide-menu">Manage Account</span>
                        </a>
                    </li>

                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">AUTH</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./logout" aria-expanded="false">
                <span>
                  <i class="ti ti-login"></i>
                </span>
                            <span class="hide-menu">Log Out</span>
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
                        <li><h3>Hello ${user.username}</h3></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                <img src="${user.avatar}" alt="" width="35" height="35" class="rounded-circle">
                            </a>
                            <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                                <div class="message-body">
                                    <a href="/user/profile" class="d-flex align-items-center gap-2 dropdown-item">
                                        <i class="ti ti-user fs-6"></i>
                                        <p class="mb-0 fs-3">My Profile</p>
                                    </a>
                                    <a href="/user/changepass" class="d-flex align-items-center gap-2 dropdown-item">
                                        <i class="ti ti-list-check fs-6"></i>
                                        <p class="mb-0 fs-3">Change Password</p>
                                    </a>
                                    <a href="/logout" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
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
                            <th>Email</th>
                            <th>Full Name</th>
                            <th>Address</th>
                            <th>Avatar</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="i" items="${listUser.content}">
                            <tr>
                                <td>${i.id}</td>
                                <td>${i.email}</td>
                                <td>${i.username}</td>
                                <td>${i.address}</td>
                                <td>${i.avatar}</td>
                                <td>${i.phone}</td>
                                <td>
                                    <c:forEach var="role" items="${i.roles}">
                                        ${role.name} <br/>
                                    </c:forEach>
                                </td>
                                <td>
                                    <a href="/updateAdmin/${i.id}" class="btn btn-primary mb-2">Update</a>
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
                    <c:if test="${listUser.hasPrevious()}">
                        <li><a href="?page=${listUser.number - 1}&size=${listUser.size}">&lt;</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${listUser.totalPages}" var="i">
                        <c:choose>
                            <c:when test="${i == (listUser.number + 1)}">
                                <li class="active"><span>${i}</span></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="?page=${i - 1}&size=${listUser.size}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${listUser.hasNext()}">
                        <li><a href="?page=${listUser.number + 1}&size=${listUser.size}">&gt;</a></li>
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
