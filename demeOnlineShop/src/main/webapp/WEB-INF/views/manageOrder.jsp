<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 7/9/2024
  Time: 5:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Manage Order</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="shortcut icon" type="image/png" href="<c:url value='/template/admin/assets/images/logos/favicon.png'/>"/>
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/styles.min.css' />"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/template/homepage/css/style.css' />"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .table-wrapper {
            margin: 20px 0;
            background: #fff;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .table thead th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
        }

        .table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .form-inline {
            display: flex;
            align-items: center;
        }

        .form-inline select, .form-inline input[type="submit"] {
            margin: 0 5px;
        }
    </style>

    <script>
        $(document).ready(function () {
            var successMessage = "${successMessage}";
            var errorMessage = "${errorMessage}";
            if (successMessage) {
                alert(successMessage);
            }
            if (errorMessage) {
                alert(errorMessage);
            }
        });
    </script>
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
                        <a class="sidebar-link" href="/saler/productList" aria-expanded="false">
                <span>
                  <i class="ti ti-cards"></i>
                </span>
                            <span class="hide-menu">Product List</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./stockIn" aria-expanded="false">
                <span>
                  <i class="ti ti-article"></i>
                </span>
                            <span class="hide-menu">Stock In</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="./manageOrder" aria-expanded="false">
                <span>
                  <i class="ti ti-file-description"></i>
                </span>
                            <span class="hide-menu">Manage Order</span>
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
    <div class="container-fluid">
        <div class="container mt-4">
            <div class="table-wrapper">
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Address</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Items</th>
                            <th>Update Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <tr>
                                <td>${order.id}</td>
                                <td>${order.orderDate}</td>
                                <td>${order.status}</td>
                                <td>${order.address}</td>
                                <td>${order.name}</td>
                                <td>${order.phone}</td>
                                <td>
                                    <ul>
                                        <c:forEach items="${order.orderItems}" var="item">
                                            <li>${item.product.productName} - Quantity: ${item.quantity}</li>
                                        </c:forEach>
                                    </ul>
                                </td>
                                <td>
                                    <c:if test="${order.status == 'PENDING'}">
                                        <form action="/saler/updateOrderStatus" method="post" class="form-inline">
                                            <input type="hidden" name="orderId" value="${order.id}"/>
                                            <input type="hidden" name="orderItemId" value="${item.id}"/>
                                            <input type="hidden" name="quantity" value="${item.quantity}"/>
                                            <select name="status" class="form-control">
                                                <option value="PENDING">Pending</option>
                                                <option value="DELIVERING">Delivering</option>
                                            </select>
                                            <select name="deliveryPersonId" class="form-control">
                                                <c:forEach items="${listDeliveryPerson}" var="deliverer">
                                                    <option value="${deliverer.id}">${deliverer.username}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="submit" value="Update" class="btn btn-primary"/>
                                        </form>
                                    </c:if>
                                    <c:if test="${order.status != 'PENDING'}">
                                        Status cannot be updated
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

</body>
</html>