<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://unpkg.com/@webpixels/css@1.1.5/dist/index.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css">
        <title>Admin Page</title>
        <c:if test="${requestScope.MSG eq 'DELETE_RE_SUCCESS'}">
            <script>
                window.alert("Đã xóa tin Tuyển Dụng: ${requestScope.RENAME} thành công!");
            </script>
        </c:if>
        <c:if test="${requestScope.MSG eq 'CREATE_RE_SUCCESS'}">
            <script>
                window.alert("Đã thêm tin Tuyển Dụng: ${requestScope.RENAME} thành công!");
            </script>
        </c:if>
        <c:if test="${requestScope.MSG eq 'UPDATE_RE_SUCCESS'}">
            <script>
                window.alert("Đã cập nhật tin Tuyển Dụng: ${requestScope.MainDTO.name} với Mã Số: ${requestScope.MainDTO.id} thành công!");
            </script>
        </c:if>
    </head>
    <body>
        <!-- Dashboard -->
        <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary"  >
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

                    <!-- Collapse -->
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
                                <a class="nav-link active" href="/SE_ITS/MainController?action=goRecruitmentPage">
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
                                    <h1 class="h2 mb-0 ls-tight">Tin Tức</h1>
                                </div>
                                <!-- Actions -->
                                <div class="col-sm-6 col-12 text-sm-end">
                                    <div class="mx-n1">
                                        <a href="${pageContext.request.contextPath}/MainController?action=goCreateRe" 
                                           class="btn d-inline-flex btn-sm btn-primary mx-1">
                                            <span class=" pe-2">
                                                <i class="bi bi-plus"></i>
                                            </span>
                                            <span>Thêm</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- Nav -->
                            <br/>
                        </div>
                    </div>
                </header>
                <!-- Main -->
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">

                        <div class="card shadow border-0 mb-7">
                            <div class="card-header">
                                <h5 class="mb-0">Danh sách các bài viết về Tuyển Dụng</h5>
                            </div>
                            <div class="table-responsive">
                                <form action="MainController" method="POST">
                                    <c:if test="${requestScope.LIST_RE != null}">
                                        <c:if test="${not empty requestScope.LIST_RE}">
                                            <table class="table table-hover table-nowrap">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th scope="col">STT</th>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Tiêu đề</th>
                                                        <th scope="col">Tác giả</th>
                                                        <th scope="col">Ngày đăng</th>
                                                        <th scope="col">Trạng thái</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.LIST_RE}" var="re" varStatus="counter">
                                                        <tr>
                                                            <td>
                                                                <c:if test="${re.status}">
                                                                    <strong>${counter.count}</strong>
                                                                </c:if>
                                                                <c:if test="${!re.status}">
                                                                    ${counter.count}
                                                                </c:if>
                                                            </td>
                                                            <td>
                                                                ${re.id}
                                                            </td>
                                                            <td>
                                                                <c:if test="${re.status}">
                                                                    <a class="text-heading font-semibold" 
                                                                       href="MainController?action=goRecruitmentDetail&txtID=${re.id}">
                                                                        ${re.name}
                                                                    </a>
                                                                </c:if>

                                                                <c:if test="${!re.status}">
                                                                    ${re.name}
                                                                </c:if>
                                                            </td>
                                                            <td>
                                                                ${re.owner}
                                                            </td>
                                                            <td>
                                                                <c:if test="${re.status}">
                                                                    <a class="text-heading font-semibold" 
                                                                       href="MainController?action=goRecruitmentDetail&txtID=${re.id}">
                                                                        ${re.createDate}
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${!re.status}">
                                                                    ${re.createDate}
                                                                </c:if>
                                                            </td>

                                                            <td>
                                                                <c:if test="${re.status}">
                                                                    <span class="badge badge-lg badge-dot">
                                                                        <i class="bg-success"></i>Đã đăng
                                                                    </span>
                                                                </c:if>

                                                                <c:if test="${!re.status}">
                                                                    <span class="badge badge-lg badge-dot">
                                                                        <i class="bg-danger"></i>Đã xóa
                                                                    </span>
                                                                </c:if>
                                                            </td>
                                                            <td class="text-end">
                                                                <a href="MainController?action=goUpdateRE&txtID=${re.id}" 
                                                                   class="btn btn-sm btn-neutral"> 
                                                                    <i class="bi bi-pencil"></i>
                                                                </a>
                                                                <c:if test="${re.status}">
                                                                    <a  href="MainController?action=deleteRe&txtID=${re.id}"
                                                                        onclick='return confirm("Bạn có muốn xóa tin Tuyển Dụng này không?");'
                                                                        class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                                        <i class="bi bi-trash"></i>
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${!re.status}">
                                                                    <button disabled="true"
                                                                            class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                                        <i class="bi bi-trash"></i>
                                                                    </button>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:if>
                                    </c:if>
                                </form>
                                <c:if test="${requestScope.LIST_RE == null || empty requestScope.LIST_RE}">
                                    Not found Recruitment
                                </c:if>
                            </div>
                            <div class="card-footer border-0 py-5">
                                <span class="text-muted text-sm">Showing 10 items out of 250 results found</span>
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
