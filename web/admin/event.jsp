<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://unpkg.com/@webpixels/css@1.1.5/dist/index.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">

        <title>Admin Page</title>
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
                            .bi-house::before, .bi-newspaper::before, .bi-journal-bookmark::before, .bi-calendar-event::before, .bi-people::before,
                            .bi-person-square::before, .bi-box-arrow-left::before   
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
                                <a class="nav-link active" href="/SE_ITS/MainController?action=goEventPage">
                                    <i class="bi bi-calendar-event"></i> Sự kiện
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
                                    <h1 class="h2 mb-0 ls-tight">Sự Kiện</h1>
                                </div>
                                <!-- Actions -->
                                <div class="col-sm-6 col-12 text-sm-end">
                                    <div class="mx-n1">
                                        <a href="${pageContext.request.contextPath}/MainController?action=goCreateEvent" class="btn d-inline-flex btn-sm btn-primary mx-1">
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
                                <h5 class="mb-0">Danh sách các bài viết về Sự Kiện</h5>
                            </div>
                            <div class="table-responsive">
                                <form action="MainController" method="POST">
                                    <c:if test="${requestScope.LIST_EVENT != null}">
                                        <c:if test="${not empty requestScope.LIST_EVENT}">
                                            <table class="table table-hover table-nowrap">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th scope="col">STT</th>
                                                        <th scope="col">Tiêu đề</th>
                                                        <th scope="col">Tác giả</th>
                                                        <th scope="col">Ngày bắt đầu</th>
                                                        <th scope="col">Ngày kết thúc</th>
                                                        <th scope="col">Trạng thái</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.LIST_EVENT}" var="event" varStatus="counter">
                                                        <c:forEach items="${requestScope.LIST_EVENT_IMG}" var="eventImg">
                                                            <tr>
                                                                <c:if test="${event.id eq eventImg.eventId}">
                                                                    <td><strong>${counter.count}</strong></td>
                                                                    <td>
                                                                        <img alt="..." src="${pageContext.request.contextPath}/user/assets/images/${eventImg.link}" class="avatar avatar-sm rounded-circle me-2">
                                                                        <a class="text-heading font-semibold" href="#">
                                                                            ${event.name}
                                                                        </a>
                                                                    </td>
                                                                    <td>
                                                                        ${event.owner}
                                                                    </td>
                                                                    <td>
                                                                        <!--<img alt="..." src="https://preview.webpixels.io/web/img/other/logos/logo-1.png" class="avatar avatar-xs rounded-circle me-2">-->
                                                                        <a class="text-heading font-semibold" href="#">
                                                                            ${event.startDate}
                                                                        </a>
                                                                    </td>
                                                                    <td>
                                                                        <a class="text-heading font-semibold" href="#">
                                                                            ${event.endDate}
                                                                        </a>
                                                                    </td>
                                                                    <td>
                                                                        <span class="badge badge-lg badge-dot">
                                                                            <c:choose>
                                                                                <c:when test="${event.status}">
                                                                                    <i class="bg-success"></i>Đã đăng
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <i class="bg-danger"></i>Đã xóa
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </span>
                                                                    </td>
                                                                    <td class="text-end">
                                                                        <!--<input type="hidden" name="txtStatus" value="$ {param.txtStatus}"/>-->
                                                                        <a class="btn btn-sm btn-neutral"  
                                                                           href="MainController?action=goUpdateEvent&txtEventID=${event.id}&txtEventName=${event.name}&txtStart=${event.startDate}&txtEnd=${event.endDate}&txtStatus=${event.status}&txtType=${event.type}&txtImg=${eventImg.link}">
                                                                           
                                                                            <i class="bi bi-pencil"></i>
                                                                        </a>
                                                                        <a class="btn btn-sm btn-square btn-neutral text-danger-hover"
                                                                           href="MainController?action=deleteEvent&txtEventID=${event.id}"
                                                                           onclick='return confirm("Bạn có muốn xóa Sự Kiện này không?");'>
                                                                            <i class="bi bi-trash"></i>
                                                                        </a>
                                                                    </td>
                                                                </c:if>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:if>
                                    </c:if>
                                </form>
                                <c:if test="${requestScope.LIST_EVENT == null || empty requestScope.LIST_EVENT}">
                                    Not found Event
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
