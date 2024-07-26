<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 7/9/2024
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Blog Management</title>
    <link rel="shortcut icon" type="image/png" href="<c:url value='/template/admin/assets/images/logos/favicon.png'/>"/>
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/styles.min.css' />"/>
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
                        <a class="sidebar-link" href="./blogManagement" aria-expanded="false">
                <span>
                  <i class="ti ti-cards"></i>
                </span>
                            <span class="hide-menu">Blog Management</span>
                        </a>
                    </li>
                    <%--                    <li class="sidebar-item">--%>
                    <%--                        <a class="sidebar-link" href="./salerPage" aria-expanded="false">--%>
                    <%--                <span>--%>
                    <%--                  <i class="ti ti-article"></i>--%>
                    <%--                </span>--%>
                    <%--                            <span class="hide-menu">Stock In</span>--%>
                    <%--                        </a>--%>
                    <%--                    </li>--%>
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
    <!--  Sidebar End -->

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
                        <li><a class="navbar-brand"> Hello ${user.username}</a></li>
                        <li class="nav-item dropdown">
                            <div class="nav-item dropdown">
                                <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2"
                                   data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    <img src="${user.avatar}" alt=""
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
                                        <a href="/customer/myOrder" class="d-flex align-items-center gap-2 dropdown-item">
                                            <i class="ti ti-list-check fs-6"></i>
                                            <p class="mb-0 fs-3">My Order</p>
                                        </a>
                                        <a href="/logout"
                                           class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                                    </div>
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
                            <th>Author</th>
                            <th>Title</th>
                            <th>Content</th>
                            <th>Image</th>
                            <th>Create At</th>
                            <th>Update At</th>
                            <th>Status</th>
                            <th>Views</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="blog" items="${blogs}">
                            <tr>
                                <td>${blog.id}</td>
                                <td>${blog.author}</td>
                                <td>${blog.title}</td>
                                <td>${blog.content}</td>
                                <td><img src="${blog.image}" class="img-fluid" style="max-width: 100px;"></td>
                                <td>${blog.createAt}</td>
                                <td>${blog.updateAt}</td>
                                <td>${blog.status}</td>
                                <td>${blog.views}</td>
                                <td>
                                    <a href="/marketer/updateBlog/${blog.id}" class="btn btn-primary mb-2">Update</a>
                                    <button class="deleteblog btn btn-danger" data-id="${blog.id}">Delete
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <form id="createBlogForm">
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" required>
                </div>
                <div class="form-group">
                    <label for="content">Content:</label>
                    <textarea id="content" name="content" required></textarea>
                </div>
                <button id="createblog" name="createblog" class="btn btn-primary">Create Blog</button>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="<c:url value="/template/admin/assets/libs/jquery/dist/jquery.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/template/admin/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/admin/assets/js/sidebarmenu.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/admin/assets/js/app.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/admin/assets/libs/simplebar/dist/simplebar.js"/>"></script>
<script type="text/javascript" src="<c:url value="/template/admin/assets/js/dashboard.js"/>"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".deleteblog").click(function (event) {
            event.preventDefault();

            var id = $(this).data("id");
            // Hiển thị hộp thoại xác nhận
            var confirmation = confirm("Are you sure you want to delete this blog ?");
            if(confirmation) {
                $.ajax({
                    url:"/api/blogs/" + id,
                    type: "DELETE",
                    success: function (result) {
                        alert(result);
                        location.reload();
                    },
                    error: function(e){
                        console.log(e);
                        alert("Error: " + e.responseText);
                    }
                });
            } else{
                alert("Delete blog canceled");
            }
        });

        $("#createblog").click(function (event) {
            event.preventDefault();

            var formData = {
                author: "${user.username}",
                title: $("#title").val(),
                content: $("#content").val()
            };

            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/api/blogs",
                data: JSON.stringify(formData),
                dataType: 'json',
                success: function (result) {
                    console.log("Blog created successfully:", result);
                    alert("Blog created successfully");
                },
                error: function (e) {
                    console.log("Error creating blog:", e);
                    alert("Error: " + e.responseText);
                }
            });
        });
    });
</script>
</body>
</html>
