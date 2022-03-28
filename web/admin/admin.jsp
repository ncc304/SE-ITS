<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://unpkg.com/@webpixels/css@1.1.5/dist/index.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css">

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
                            .bi-house::before, .bi-newspaper::before, .bi-journal-bookmark::before, 
                            .bi-calendar-event::before, .bi-people::before,
                            .bi-person-square::before, .bi-box-arrow-left::before, .bi-briefcase-fill::before, 
                            .bi-person-fill::before, .bi-telephone-fill::before, .bi-building::before,
                            .bi-book::before
                            {
                                color: black; 
                           }
                        </style>

                        <!-- Navigation -->
                        <ul class="navbar-nav">
                            <li class="nav-item">

                                <a class="nav-link active" href = "/SE_ITS/MainController?action=goDashBoard">
                                    <i class="bi bi-house"></i> Trang chủ 

                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="/SE_ITS/MainController?action=goNewsPage">
                                    <i class="bi bi-newspaper"></i> Tin tức
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/SE_ITS/MainController?action=goRecruitmentPage">
                                    <i class="bi bi-briefcase-fill"></i> Tuyển dụng
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/SE_ITS/MainController?action=goEventPage">
                                    <i class="bi bi-calendar-event"></i> Sự kiện
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/SE_ITS/MainController?action=goMajorPage">
                                    <i class="bi bi-journal-bookmark"></i> Bộ môn
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/SE_ITS/MainController?action=goUserPage">
                                    <i class="bi bi-person-fill"></i> Người dùng
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/SE_ITS/MainController?action=goTuVanPage">
                                    <i class="bi bi-telephone-fill"></i> Tư vấn học tập
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/SE_ITS/MainController?action=goCompany">
                                    <i class="bi bi-building"></i> Công ty
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/SE_ITS/MainController?action=goSubject">
                                    <i class="bi bi-book"></i> Môn học
                                </a>
                            </li>
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
                            <li class="nav-item">
                                <a class="nav-link" href="/SE_ITS/MainController?action=goLogout">
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
                            <br/>
                            <div class="row">
                                <div class="col-10" style="margin-left: 2%">
                                    <label class="p-3 mb-2 text-white" style="border-radius: 50px 20px; font-weight: bold; background-color: #0066B2">
                                        Tin tức
                                    </label>
                                    <!--xanh #0066B2  cam #F26F21  xanh la #0EB04C-->
                                </div>
                                <div class="col-3">
                                    <a href="MainController?action=goNewsDetails&txtID=${requestScope.NEWS.id}">
                                        <img src="${pageContext.request.contextPath}/user/assets/images/${requestScope.NEWS_IMG[0].link}"
                                             style="width: 150px; height: 100px; margin-left: 50%">
                                    </a>
                                </div>
                                <div class="col-7">
                                    <a href="MainController?action=goNewsDetails&txtID=${requestScope.NEWS.id}" 
                                       class="text-warning">${requestScope.NEWS.name}.</a> <br/><br/>
                                    <label style="font-weight: bold">Tác giả: </label> 
                                    <span class="text-dark" style="background-color: #ff9400b3;border-radius: 15px;padding: 2px 5px;">
                                        <label style="font-weight: 500; font-size: 14px;">${requestScope.NEWS.author}</label>
                                    </span>
                                </div>
                                <br>

                                <div class="col-10" style="margin-left: 2%; margin-top: 2%">
                                    <label class="p-3 mb-2 text-white" style="border-radius: 50px 20px; font-weight: bold; background-color: #F26F21">
                                        Tuyển Dụng
                                    </label>
                                </div>
                                <div class="col-3">
                                    <a href="MainController?action=goRecruitmentDetail&txtID=${requestScope.RE.id}">
                                        <img src="${pageContext.request.contextPath}/user/assets/images/${requestScope.RE_IMG[0].link}"
                                             style="width: 150px; height: 100px; margin-left: 50%">
                                    </a>
                                </div>
                                <div class="col-7">
                                    <a href="MainController?action=goRecruitmentDetail&txtID=${requestScope.RE.id}" 
                                       class="text-warning">${requestScope.RE.name}.</a> <br/><br/>
                                    <label style="font-weight: bold">Tác giả: </label> 
                                    <span class="text-dark" style="background-color: #ff9400b3;border-radius: 15px;padding: 2px 5px;">
                                        <label style="font-weight: 500; font-size: 14px;">${requestScope.RE.owner}</label>
                                    </span>
                                </div>
                                <br>

                                <div class="col-10" style="margin-left: 2%; margin-top: 2%">
                                    <label class="p-3 mb-2 text-white" style="border-radius: 50px 20px; font-weight: bold; background-color: #0EB04C">
                                        Sự kiện
                                    </label>
                                </div>
                                <c:set var="event" scope="request" value="${requestScope.EVENT}"/>
                                <c:forEach items="${sessionScope.LIST_EVENT_IMG}" var="img">
                                    <c:if test="${img.eventId eq event.id}">
                                        <div class="col-3">
                                            <a href="MainController?action=goEventDetails&txtID=${event.id}">
                                                <img src="${pageContext.request.contextPath}/user/assets/images/${img.link}"
                                                     style="width: 150px; height: 100px; margin-left: 50%">
                                            </a>
                                        </div>

                                        <div class="col-7">
                                            <a href="MainController?action=goEventDetails&txtID=${event.id}" 
                                               class="text-warning">${event.name}.</a> <br/><br/>
                                            <label style="font-weight: bold">Tác giả: </label> 
                                            <span class="text-dark" style="background-color: #ff9400b3;border-radius: 15px;padding: 2px 5px;">
                                                <label style="font-weight: 500; font-size: 14px;">${event.owner}</label>
                                            </span>
                                        </div>
                                                
                                    </c:if>
                                </c:forEach>
                                <br>

                                <!--                                <div class="col-10" style="margin-left: 2%; margin-top: 2%">
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
                                                                </div>-->

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
