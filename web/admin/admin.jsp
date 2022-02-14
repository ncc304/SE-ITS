<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://unpkg.com/@webpixels/css@1.1.5/dist/index.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/bootstrap-icons.svg">

        <title>Admin Page</title>
    </head>
    <body>

        <!-- Dashboard -->
        <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
            <!-- Vertical Navbar -->
            <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg" id="navbarVertical">
                <style>
                    .navbar-vertical.navbar-light{
                        background-color: #ff9900c2 !important;
                    }
                </style>
                <div class="container-fluid">
                    <!-- Toggler -->
                    <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Brand -->
                    <a class="navbar-brand py-lg-2 mb-lg-5 px-lg-6 me-0" href="#">
                        <img src="https://dnuni.fpt.edu.vn/wp-content/uploads/2020/02/logo-1.png" alt="..." style="height: 50px; width: 152px"/>
                        <hr style="background-color: while"/>      
                    </a>
                    
                    <div class="collapse navbar-collapse" id="sidebarCollapse">
                        <style>
                            .bi-house::before, .bi-newspaper::before, .bi-journal-bookmark::before, .bi-calendar-event::before, .bi-people::before,
                            .bi-person-square::before, .bi-box-arrow-left::before
                            {
                                color: black;
                            }
                        </style>

                        <!-- Navigation -->
                        <ul class="navbar-nav">
                            <li class="nav-item">

                                <a class="nav-link active" href = "<c:url value = "/admin/admin.jsp"/>">
                                    <i class="bi bi-house"></i> Trang chủ 

                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value = "/admin/news.jsp"/>">
                                    <i class="bi bi-newspaper"></i> Tin tức
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value = "/admin/major.jsp"/>">
                                    <i class="bi bi-journal-bookmark"></i> Ngành học

                                </a>

                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value = "/admin/event.jsp"/>">
                                    <i class="bi bi-calendar-event"></i> Sự kiện
                                </a>
                            </li>
<!--                            <li class="nav-item">
                                <a class="nav-link" href="< c:url value = "/admin/studentLecture.jsp"/>">
                                    <i class="bi bi-people"></i> Sinh viên & Giảng viên
                                </a>
                            </li>-->
<!--                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value = "/admin/lecture.jsp"/>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-mortarboard-fill" viewBox="0 0 16 16"
                                         style="margin-left: -3.5%; color: black;">
                                    <path d="M8.211 2.047a.5.5 0 0 0-.422 0l-7.5 3.5a.5.5 0 0 0 .025.917l7.5 3a.5.5 0 0 0 .372 0L14 7.14V13a1 1 0 0 0-1 1v2h3v-2a1 1 0 0 0-1-1V6.739l.686-.275a.5.5 0 0 0 .025-.917l-7.5-3.5Z"/>
                                    <path d="M4.176 9.032a.5.5 0 0 0-.656.327l-.5 1.7a.5.5 0 0 0 .294.605l4.5 1.8a.5.5 0 0 0 .372 0l4.5-1.8a.5.5 0 0 0 .294-.605l-.5-1.7a.5.5 0 0 0-.656-.327L8 10.466 4.176 9.032Z"/>
                                    </svg>
                                    <p style="margin-left: 3%">Giảng viên</p>
                                </a>
                            </li>-->
                        </ul>
                        <!-- Divider -->
                        <hr class="navbar-divider my-5 opacity-20">
                        <!-- Navigation -->
                        <!--                        <ul class="navbar-nav mb-md-4">
                                                    <li>
                                                        <div class="nav-link text-xs font-semibold text-uppercase text-muted ls-wide" href="#">
                                                            Contacts
                                                            <span class="badge bg-soft-primary text-primary rounded-pill d-inline-flex align-items-center ms-4">13</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="nav-link d-flex align-items-center">
                                                            <div class="me-4">
                                                                <div class="position-relative d-inline-block text-white">
                                                                    <img alt="Image Placeholder" src="https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar rounded-circle">
                                                                    <span class="position-absolute bottom-2 end-2 transform translate-x-1/2 translate-y-1/2 border-2 border-solid border-current w-3 h-3 bg-success rounded-circle"></span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <span class="d-block text-sm font-semibold">
                                                                    Marie Claire
                                                                </span>
                                                                <span class="d-block text-xs text-muted font-regular">
                                                                    Paris, FR
                                                                </span>
                                                            </div>
                                                            <div class="ms-auto">
                                                                <i class="bi bi-chat"></i>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="nav-link d-flex align-items-center">
                                                            <div class="me-4">
                                                                <div class="position-relative d-inline-block text-white">
                                                                    <span class="avatar bg-soft-warning text-warning rounded-circle">JW</span>
                                                                    <span class="position-absolute bottom-2 end-2 transform translate-x-1/2 translate-y-1/2 border-2 border-solid border-current w-3 h-3 bg-success rounded-circle"></span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <span class="d-block text-sm font-semibold">
                                                                    Michael Jordan
                                                                </span>
                                                                <span class="d-block text-xs text-muted font-regular">
                                                                    Bucharest, RO
                                                                </span>
                                                            </div>
                                                            <div class="ms-auto">
                                                                <i class="bi bi-chat"></i>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="nav-link d-flex align-items-center">
                                                            <div class="me-4">
                                                                <div class="position-relative d-inline-block text-white">
                                                                    <img alt="..." src="https://images.unsplash.com/photo-1610899922902-c471ae684eff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar rounded-circle">
                                                                    <span class="position-absolute bottom-2 end-2 transform translate-x-1/2 translate-y-1/2 border-2 border-solid border-current w-3 h-3 bg-danger rounded-circle"></span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <span class="d-block text-sm font-semibold">
                                                                    Heather Wright
                                                                </span>
                                                                <span class="d-block text-xs text-muted font-regular">
                                                                    London, UK
                                                                </span>
                                                            </div>
                                                            <div class="ms-auto">
                                                                <i class="bi bi-chat"></i>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </ul>-->
                        <!-- Push content down -->
                        <div class="mt-auto"></div>
                        <!-- User (md) -->
                        <ul class="navbar-nav">
<!--                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-person-square"></i> Tài khoản
                                </a>
                            </li>-->
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-box-arrow-left"></i> Đăng xuất
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Main content -->
            <div class="h-screen flex-grow-1 overflow-y-lg-auto">
                <!-- Header -->
                <header class="bg-surface-primary border-bottom pt-6">
                    <div class="container-fluid">
                        <div class="mb-npx">
                            <div class="row align-items-center">
                                <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                                    <!-- Title -->
                                    <h1 class="h2 mb-0 ls-tight">Trang Chủ</h1>
                                </div>

                            </div>
                            <!-- Nav -->
                            <br/>
                        </div>
                    </div>
                </header> <br/>
                <!-- Main -->     
                <main>
                    <div class="container-fluid">
                        <div class="card shadow border-0 mb-7">
                            <div class="card-header">
                                <h5 class="mb-0">Danh sách các bài viết gần đây nhất</h5>
                            </div>
                            <div class="row">
                                <div class="col-10" style="margin-left: 2%">
                                    <p>Tin tức</p>
                                </div>
                                <div class="col-3">
                                    <a href="#">
                                        <img src="https://daihoc.fpt.edu.vn/media/2022/01/271273208_5410510728964838_5683207586585387410_n-373x206.jpeg"
                                             style="width: 150px; height: 100px; margin-left: 50%">
                                    </a>

                                </div>
                                <div class="col-7">
                                    <a href="#">SV FPTU TP. HCM nhìn lại hành trình “Brothers & Sisters”.</a>
                                </div>
                                <br>
                                
                                <div class="col-10" style="margin-left: 2%; margin-top: 2%">
                                    <p>Ngành học</p>
                                </div>
                                <div class="col-3">
                                    <a href="#">
                                        <img src="https://daihoc.fpt.edu.vn/media/2022/01/271273208_5410510728964838_5683207586585387410_n-373x206.jpeg"
                                             style="width: 150px; height: 100px; margin-left: 50%">
                                    </a>
                                </div>
                                <div class="col-7">
                                    <a href="#">SV FPTU TP. HCM nhìn lại hành trình “Brothers & Sisters”.</a>
                                </div>
                                <br>
                                
                                <div class="col-10" style="margin-left: 2%; margin-top: 2%">
                                    <p>Sự kiện</p>
                                </div>
                                <div class="col-3">
                                    <a href="#">
                                        <img src="https://daihoc.fpt.edu.vn/media/2022/01/271273208_5410510728964838_5683207586585387410_n-373x206.jpeg"
                                             style="width: 150px; height: 100px; margin-left: 50%">
                                    </a>
                                </div>
                                <div class="col-7">
                                    <a href="#">SV FPTU TP. HCM nhìn lại hành trình “Brothers & Sisters”.</a>
                                </div>
                                <br>

                                <div class="col-10" style="margin-left: 2%; margin-top: 2%">
                                    <p>Sinh viên & Giảng viên</p>
                                </div>
                                <div class="col-3">
                                    <a href="#">
                                        <img src="https://daihoc.fpt.edu.vn/media/2022/01/271273208_5410510728964838_5683207586585387410_n-373x206.jpeg"
                                             style="width: 150px; height: 100px; margin-left: 50%; margin-top: 1% ">
                                    </a>
                                </div>
                                <div class="col-7">
                                    <a href="#">SV FPTU TP. HCM nhìn lại hành trình “Brothers & Sisters”.</a>
                                </div>

                            </div>
                            <br>
                        </div>
                    </div>
                </main>
                <footer>
                    <div class="card text-center">
                        <div class="card-footer text-muted">
                            © 2022 Bản quyền thuộc về Nhóm 4.
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </body>
</html>
