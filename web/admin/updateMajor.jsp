<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://unpkg.com/@webpixels/css@1.1.92/dist/index.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css">


        <!--for CKEditor:-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdn.ckeditor.com/4.17.1/full-all/ckeditor.js"></script>

        <!--DatePicker-->
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">-->
        <!--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>-->
        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">-->
        <style>
            label{
                font-weight: 500;
            }
        </style>

        <title>Admin Page</title>

    </head>
    <body>

        <!-- Dashboard -->
        <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
            <!-- Vertical Navbar -->
            <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg" id="navbarVertical">
                <style>
                    .navbar-vertical.navbar-light {
                        background-color: #ff9900c2 !important;
                    }
                </style>

                <div class="container-fluid">
                    <!-- Toggler -->
                    <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Brand -->
                    <a class="navbar-brand py-lg-2 mb-lg-5 px-lg-6 me-0" href="${pageContext.request.contextPath}/user/home.jsp">
                        <img src="https://dnuni.fpt.edu.vn/wp-content/uploads/2020/02/logo-1.png" alt="..." style="height: 50px; width: 152px"/>
                        <hr style="background-color: while"/>    
                    </a>

                    <!-- Collapse -->
                    <div class="collapse navbar-collapse" id="sidebarCollapse">
                        <style>
                            .bi-house::before, .bi-newspaper::before, .bi-journal-bookmark::before, 
                            .bi-calendar-event::before, .bi-people::before,
                            .bi-person-square::before, .bi-box-arrow-left::before, .bi-briefcase-fill::before, 
                            .bi-person-fill::before, .bi-telephone-fill::before, .bi-building::before,
                            .bi-book::before, .bi-calendar2-check-fill::before
                            {
                                color: black; 
                           }
                        </style>

                        <!-- Navigation -->
                        <ul class="navbar-nav">
                            <li class="nav-item">

                                <a class="nav-link " href = "/SE_ITS/MainController?action=goDashBoard">
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
                                <a class="nav-link active" href="/SE_ITS/MainController?action=goMajorPage">
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
                            <li class="nav-item">
                                <a class="nav-link" href="/SE_ITS/MainController?action=goApplyEvent">
                                    <i class="bi bi-calendar2-check-fill"></i> Đăng ký Sự Kiện
                                </a>
                            </li>
                        </ul>
                        <!-- Divider -->
                        <hr class="navbar-divider my-5 opacity-20">

                        <!-- Push content down -->
                        <div class="mt-auto"></div>
                        <!-- User (md) -->
                        <ul class="navbar-nav">

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
                                    <h1 class="h2 mb-0 ls-tight">Bộ Môn</h1>
                                </div>

                            </div>

                            <br/>
                        </div>
                    </div>
                </header>
                <!-- Main -->
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">

                        <div class="card shadow border-0 mb-7">
                            <div class="card-header" style="border-bottom: 1px solid #eceef3">
                                <!--                                <h5 class="mb-0">Tạo bài viết về Sự Kiện</h5>-->
                                <div class="col-10" style="margin-left: 2%; margin-top: 2%">
                                    <label class="p-3 mb-2 text-white" style="border-radius: 50px 20px; font-weight: bold; background-color: #F26F21">
                                        Cập Nhật Bộ Môn
                                    </label>
                                </div>
                            </div>
                            <c:set var="dto" scope="request" value="${requestScope.MAJOR}"/>
                            <div class="card-footer border-0 py-5">
                                <form method="POST" action="${pageContext.request.contextPath}/MainController" id="formSubmit">
                                    <div class="form-group">
                                        <label>ID</label>
                                        <input type="text" value="${dto.id}" class="form-control" name="txtID" readonly="true">
                                    </div>
                                    <br/>
                                    <div class="form-group">
                                        <label>Tên</label>
                                        <input type="text" value="${dto.name}" class="form-control" name="txtName">
                                    </div>
                                    <br/>

                                    <div class="form-group">
                                        <label>Tổng quan về bộ môn ${dto.name}</label>
                                        <textarea class="form-control" rows="5" id="content" name="overView">
                                            ${dto.overview}
                                        </textarea>
                                    </div>
                                    <br/>

                                    <div class="form-group">
                                        <label>Kỹ năng đạt được</label>
                                        <textarea class="form-control" rows="5" id="content2" name="skill">
                                            ${dto.skill}
                                        </textarea>
                                    </div>
                                    <br/>

                                    <div class="form-group">
                                        <label>Cơ hội việc làm</label>
                                        <textarea class="form-control" rows="5" id="content3" name="opportunity">
                                            ${dto.job_opportunity}
                                        </textarea>
                                    </div>
                                    <br/>

                                    <br/><br/><br/>
                                    <input type="submit" value="Cập nhập bộ môn" name="action" id="btnCreate" class="btn btn-warning" style="margin-left: 42%"></input>
                                </form>
                            </div>
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

<script>
    var editor = '';
    $(document).ready(function () {
        editor = CKEDITOR.replace('content');
        editor = CKEDITOR.replace('content2');
        editor = CKEDITOR.replace('content3');

    });

</script>

