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
                                <a class="nav-link" href="${pageContext.request.contextPath}/admin/admin.jsp">
                                    <i class="bi bi-house"></i> Trang chủ
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="${pageContext.request.contextPath}/admin/news.jsp">
                                    <i class="bi bi-newspaper"></i> Tin tức
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/admin/major.jsp">
                                    <i class="bi bi-journal-bookmark"></i> Ngành học
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="${pageContext.request.contextPath}/admin/event.jsp">
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
                                    <h1 class="h2 mb-0 ls-tight">Sự kiện</h1>
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
                            <div class="card-header">
                                <!--                                <h5 class="mb-0">Tạo bài viết về Sự Kiện</h5>-->
                                <div class="col-10" style="margin-left: 2%; margin-top: 2%">
                                    <label class="p-3 mb-2 text-white" style="border-radius: 50px 20px; font-weight: bold; background-color: #F26F21">
                                        Cập nhật sự kiện
                                    </label>
                                </div>
                            </div>
                            <c:set var="dto" scope="request" value="${requestScope.EVENT}"/>
                            <c:set var="img" scope="request" value="${requestScope.IMG}"/>
                            
                            <div class="card-footer border-0 py-5">
                                <form method="POST" action="${pageContext.request.contextPath}/MainController" id="formSubmit">
                                    <div class="form-group">
                                        <span class="date1">
                                            <label>Ngày bắt đầu </label>
                                            <c:out value="${dto.startDate}"/>
                                            
                                            <!--<input value="$ {dto.startDate}" type="datetime-local" name="date1"  style="border: 1px solid #00000024; margin-left: 5px;">-->
                                            <input value="${dto.startDate}" type="datetime-local" name="date1"  style="border: 1px solid #00000024; margin-left: 5px;">
                                        </span>

                                        <span class="date2" style="margin-left: 10%">
                                            <label>Ngày kết thúc </label>
                                            <input type="datetime-local" name="date2" style="border: 1px solid #00000024; margin-left: 5px;">
                                        </span>
                                    </div>
                                    <br/>
                                    <div class="form-group">
                                        <label>Thumbnail</label> <br/>
                                        <input id="upload" type="file" name="thumbnail" onchange="readURL(this);" class="form-control" style="width: auto;">
                                        <!--<label id="upload-label" for="upload" class="font-weight-light text-muted">Choose file</label>-->
                                        <!--<span class="input-group-append">-->
                                        <!--<label for="upload" class="btn m-0 rounded-pill px-4" style="width: auto;">-->
                                        <!--<i class="fa fa-cloud-upload mr-2 text-muted"></i>-->
                                        <!--<small class="text-uppercase font-weight-bold text-muted">Choose file</small>-->
                                        <!--</label>-->
                                        <!--<p class="font-italic text-white text-center">The image uploaded will be rendered inside the box below.</p>-->
                                        <!--</span>-->  
                                        <div class="image-area">
                                            <img id="imageResult"
                                                 src="${pageContext.request.contextPath}/user/assets/images/${requestScope.IMG}"
                                                 alt=""
                                                 class="shadow-sm img-thumbnail rounded  mx-auto d-block" 
                                                 width="500" height="500">
                                        </div>   
                                    </div>

                                    <!--                                    <br/>
                                                                        <div class="form-group">
                                                                            <label>Thumbnail</label> <br/>
                                                                            <input type="file" class="form-control-file" accept="image/png, image/jpeg">
                                                                        </div>-->

                                    <br/>
                                    <div class="form-group">
                                        <label>Tiêu đề</label>
                                        <input type="text" class="form-control" name="txtTitle">
                                    </div>
                                    <br/>

                                    <div class="form-group">
                                        <label>Nội dung</label>
                                        <textarea class="form-control" rows="5" id="content" name="content"></textarea>
                                    </div>

                                    <br/>
                                    <span id="category">
                                        <label>Thể loại</label>
                                        <select class="custom-select custom-select-md" name="category" style="border: 1px solid #00000024; margin-left: 5px;">
                                            <option selected>--Chọn thể loại--</option>
<!--                                            <option value="ai">Trí tuệ nhân tạo</option>
                                            <option value="music">Nhạc cụ</option>-->
                                            <c:forEach items="${requestScope.EVENT_CATE}" var="cate">
                                                <option value="${cate.id}">${cate.nsme}</option>
                                            </c:forEach> 
                                        </select> 
                                    </span>
                                    <span id="method" style="margin-left: 40%;">
                                        <label>Phương thức</label>
                                        <select class="custom-select custom-select-md" name="method" style="border: 1px solid #00000024;">
                                            <option selected>--Chọn phương thức--</option>
                                            <option value="offline">Offline</option>
                                            <option value="online">Online</option>
                                        </select>
                                    </span>

                                    <br/><br/><br/>
                                    <input type="submit" value="Thêm sự kiện" name="action" id="btnCreate" class="btn btn-warning" style="margin-left: 50%"></input>
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

    })

//    function LayNoiDung() {
//        var data = CKEDITOR.instances.content.getData();
//        alert(data)
//    }
    // Data Picker Initialization

//    $(function () {
////        $('#datetimepicker6').datetimepicker();
////        $('#date1').datetimepicker({
////            useCurrent: false //Important! See issue #1075
////        });
//        $("#date1").on("dp.change", function (e) {
//            $('#date2').data("DateTimePicker").minDate(e.date);
//        });
//        $("#date2").on("dp.change", function (e) {
//            $('#date1').data("DateTimePicker").maxDate(e.date);
//        });
//    });
    //update thumbnail
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imageResult')
                        .attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    $(function () {
        $('#upload').on('change', function () {
            readURL(input);
        });
    });
    var input = document.getElementById('upload');
    var infoArea = document.getElementById('upload-label');

    input.addEventListener('change', showFileName);
    function showFileName(event) {
        var input = event.srcElement;
        var fileName = input.files[0].name;
        infoArea.textContent = 'File name: ' + fileName;
    }
</script>
</script>
