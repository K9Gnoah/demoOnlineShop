<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 7/17/2024
  Time: 8:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="shortcut icon" type="image/png" href="<c:url value='/template/admin/assets/images/logos/favicon.png'/>"/>
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/styles.min.css' />"/>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
    <title>Update Blog</title>
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
                        <a class="sidebar-link" href="/marketer/blogManagement" aria-expanded="false">
                <span>
                  <i class="ti ti-cards"></i>
                </span>
                            <span class="hide-menu">Blog Management</span>
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
                                        <label class="form-label" for="blog_id">BLOG ID</label>
                                        <input id="blog_id" name="blog_id" placeholder="BLOG ID"
                                               class="form-control"
                                               required="" type="text" readonly value="${blog.id}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="blog_title">BLOG TITLE</label>
                                        <input id="blog_title" name="blog_title" placeholder="BLOG TITLE"
                                               class="form-control" required="" autofocus type="text"
                                               value="${blog.title}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="blog_content">BLOG CONTENT</label>

                                        <textarea class="form-control" id="blog_content"
                                                  name="blog_content">${blog.content}</textarea>

                                    </div>



                                    <div class="mb-3">
                                        <label class="form-label" for="blog_status">STATUS</label>
                                        <select id="blog_status" name="blog_status" class="form-control">
                                            <option value="true"
                                                    <c:if test="${blog.status == true}">selected</c:if>>
                                                Appear
                                            </option>
                                            <option value="false"
                                                    <c:if test="${blog.status == false}">selected</c:if>>
                                                Hide
                                            </option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="uploadbutton"></label>
                                        <div class="col-md-7">
                                            <button id="uploadbutton" name="uploadbutton" class="btn btn-primary">
                                                UPDATE BLOG
                                            </button>
                                        </div>
                                    </div>

                                </form>
                                <div class="mb-3">
                                    <label class="form-label" >MAIN IMAGE</label>
                                    <img src="${blog.image}" class="img-fluid" style="max-width: 100px;">
                                    <form id="uploadForm" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <input type="file" id="file" name="file" class="form-control" required/>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Upload</button>
                                    </form>
                                </div>
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
<script>
    $(document).ready(function () {
        $('#uploadbutton').click(function (event) {
            event.preventDefault();

            var blog_id = $('#blog_id').val();
            var formData = {
                title: $('#blog_title').val(),
                content: $('#blog_content').val(),
                status: $('#blog_status').val() === "true" ? true : false
            };

            $.ajax({
                url: "/api/blogs/" + blog_id,
                type: "PUT",
                contentType: "application/json",
                data: JSON.stringify(formData),
                success: function (result) {
                    alert("update succesfully");
                    location.replace("/marketer/blogManagement")
                },
                error: function (xhr, status, error) {
                    console.error("Update failed: " + status + " - " + error);
                    alert("Update failed: " + xhr.responseText);
                }
            });
        });
    });
    document.addEventListener('DOMContentLoaded', function() {
        const uploadForm = document.getElementById('uploadForm');
        if (uploadForm) {
            uploadForm.addEventListener('submit', function(event) {
                event.preventDefault();

                const fileInput = document.getElementById('file');
                const formData = new FormData();
                const blogId = document.getElementById('blog_id').value;
                formData.append('file', fileInput.files[0]);

                console.log('attemping to upload file');

                fetch(`/api/files/uploadBlogImg/${blogId}`, {
                    method: 'POST',
                    body: formData
                })
                    .then(response => response.text())
                    .then(data => {
                        console.log('Upload response:', data);
                        alert(data);
                        // location.reload(); // Reload page to update the avatar image
                    })
                    .catch(error => {
                        console.error('Error during file upload', error);
                        alert('Failed to upload file.');
                    });
            });
        }
    });
</script>
</body>
</html>
