<%-- 
    Document   : major
    Created on : Feb 13, 2022, 11:41:56 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Major</title>
        <link rel="icon" type="image/x-icon"
              href="${pageContext.request.contextPath}/user/assets/images/Những-thông-điệp-sâu-sắc-phía-sau-logo-FPT.png" />
        <link rel="stylesheet" href="./assets/css/reset.css">
        <link rel="stylesheet" href="./assets/css/grid.css">
        <link rel="stylesheet" href="./assets/css/base.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/css/responsive.css">
        <link rel="stylesheet" href="./assets/css/content.css">
        <link rel="stylesheet" href="./assets/css/its.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link
            href="https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&family=Poppins:wght@300;500;700&family=Roboto:wght@400;500;700&family=Satisfy&display=swap"
            rel="stylesheet">
        <c:if test="${requestScope.MSG eq 'DKTUVAN_SUCCESS'}">
            <script>
                window.alert("Cám ơn bạn đã quan tâm đến trường đại học FPTU! Chúng tôi sẽ liên hệ với bạn trong vòng 24h.");
            </script>
        </c:if>
    </head>

    <body>
        

        <div class="wrapper" id="scroll-top">
            <!-- Header Navbar-->
            <div class="header">
                <div class="navbar">
                    <div class="grid wide header-navbar--flex">
                        <input type="checkbox" name="" id="navbar__mobile" hidden>
                        <label for="navbar__mobile" class="navbar-mobile__menu">
                            <i class="fas fa-bars"></i>
                        </label>
                        <div class="navbar__logo">
                            <a href="" class="logo__link">
                                <img src="${pageContext.request.contextPath}/user/assets/images/taixuong.png" alt="Setsail" class="navbar__logo-img">
                            </a>
                        </div>
                        <ul class="navbar__list">
                            <label for="navbar__mobile" class="navbar-mobile__menu-close">
                                <i class="fas fa-times"></i>
                            </label>
                            <li class="navbar__item">
                                <a href = "${pageContext.request.contextPath}/user/home.jsp" class="navbar__item-link" style="text-decoration: none;">Trang chủ</a>

                                <input type="radio" name="nav-select" id="show-subnav__list--1">
                            </li>
                            <li class="navbar__item">
                                <a href="${pageContext.request.contextPath}/MainController?action=goNewsUser" class="navbar__item-link" style="text-decoration: none;">Tin tức</a>
                                <input type="radio" name="nav-select" id="show-subnav__list--2">
                                <ul class="subnav__list">
                                    <li class="subnav__item">
                                        <a href="${pageContext.request.contextPath}/MainController?action=goNewsTagReadMore&txtTagID=1" class="subnav__link" style="text-decoration: none;">Đời sống sinh viên</a>
                                    </li>
                                    <li class="subnav__item">
                                        <a href="${pageContext.request.contextPath}/MainController?action=goNewsTagReadMore&txtTagID=2" class="subnav__link" style="text-decoration: none;">FPT High-tech</a>
                                    </li>
                                    <li class="subnav__item">
                                        <a href="${pageContext.request.contextPath}/MainController?action=goNewsTagReadMore&txtTagID=3" class="subnav__link" style="text-decoration: none;">Hội nhập quốc tế</a>
                                    </li>

                                </ul>
                            </li>
                            <li class="navbar__item">
                                <a href="<c:url value = "/user/major.jsp"/>" class="navbar__item-link" style="text-decoration: none;">Lộ trình môn chuyên sâu</a>
                                <input type="radio" name="nav-select" id="show-subnav__list--3">
                                <ul class="subnav__list">
                                    <li class="subnav__item">
                                        <a href="<c:url value = "/user/its.jsp"/>" class="subnav__link" style="text-decoration: none;">ITS</a>
                                    </li>
                                    <li class="subnav__item">
                                        <a href="<c:url value = "/user/se.jsp"/>" class="subnav__link" style="text-decoration: none;">SE</a>
                                    </li>

                                </ul>
                            </li>
                            <li class="navbar__item">
                                <a href="${pageContext.request.contextPath}/MainController?action=goEventUser" class="navbar__item-link" style="text-decoration: none;">Sự kiện</a>
                                <input type="radio" name="nav-select" id="show-subnav__list--4">
                                <c:if test="${sessionScope.USER_ID != null}">
                                    <ul class="subnav__list">
                                    <li class="subnav__item">
                                        <a href="${pageContext.request.contextPath}/MainController?action=goEventCancel" 
                                           class="subnav__link" style="text-decoration: none;">Quản lý Sự Kiện</a>
                                    </li>
                                    </ul>
                                </c:if>
                            </li>
                            <li class="navbar__item">
                                <a href="${pageContext.request.contextPath}/MainController?action=goRecruitmentUser" class="navbar__item-link" style="text-decoration: none;">Tuyển dụng</a>
                                <input type="radio" name="nav-select" id="show-subnav__list--5">
                            </li>
                            <li class="navbar__item">
                                <c:if test="${sessionScope.USER_ID == null}">
                                    <a href="${pageContext.request.contextPath}/login.jsp" class="navbar__item-link" data-toggle="modal" data-target="#loginModal" style="text-decoration: none;">
                                        Đăng nhập
                                    </a>
                                </c:if>
                                <c:if test="${sessionScope.USER_ID != null}">
                                    <a href="${pageContext.request.contextPath}/MainController?action=goLogout" class="navbar__item-link" data-toggle="modal" data-target="#loginModal" style="text-decoration: none;">
                                        Đăng Xuất
                                    </a>
                                </c:if>
                                <input type="radio" name="nav-select" id="show-subnav__list--5">
                            </li>
                        </ul>   

                        <a href="" class="navbar-mobile__user">
                            <i class="far fa-user-circle"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="slider">
                <div class="banner banner--1">
                    <img src="assets/images/background-img/imager_11738.jpg" alt="Friend" class="banner__img">
                    <div class="banner__content banner__content--1">
                        <h2>BỘ MÔN</h2>
                    </div>
                </div>
            </div>
            <div>

            </div>

            <div class="about-major" id="aboutus">
                <div class="heading-section padding-top-86px">
                    <h2 class="sub-heading">Tổng quan bộ môn ITS & SE</h2>
                </div>
                <div class="about-major_text">
                    <p>
                        Tại Đại học FPT, Kỹ thuật phần mềm là chuyên ngành học có tiếng và lâu đời nhất. Hiện tại, sinh viên
                        Đại học FPT đã và đang làm việc, học tập tại các quốc gia như Mỹ, Đức, Nhật Bản, Singapore – những
                        thị trường CNTT quan trọng của thế giới. Đây là kết quả của chương trình đào tạo chuẩn quốc tế, chú
                        trọng đào tạo ngoại ngữ, phát triển kỹ năng mềm cùng định hướng đầu ra đáp ứng nhu cầu doanh nghiệp.
                        Chương trình được thiết kế theo chuẩn của Hiệp hội Máy tính (Association for Computing
                        Machinery-ACM), chuẩn đào tạo kỹ sư phần mềm của Accreditation Board for Engineering and Technology
                        (ABET – Mỹ), Hiệp hội Phần mềm Việt Nam (VINASA), Chương trình Đào tạo của EC-Council, Học viện Mạng
                        và Phần cứng Jetking (Ấn Độ); với sự tư vấn của các chuyên gia và doanh nghiệp CNTT như Tập đoàn
                        FPT, Tập đoàn IBM, đồng thời tích hợp các chuẩn kiến thức của giới công nghiệp như Oracle, Cisco…
                        Nội dung đào tạo chuyên ngành Kỹ thuật phần mềm của Đại học FPT tích hợp cân bằng giữa kiến thức nền
                        tảng với công nghệ, kỹ thuật mới: không chỉ bao gồm các kiến thức về khoa học cơ bản của nhóm ngành
                        CNTT mà còn đào tạo đầy đủ về quy trình phát triển phần mềm, từ phương pháp, kỹ thuật, công nghệ
                        trong phân tích, thiết kế, phát triển, kiểm thử, bảo trì phần mềm và quản lý dự án phần mềm cũng như
                        các ứng dụng CNTT; cân bằng giữa lý thuyết với ứng dụng và thực hành: thời gian học lý thuyết chiếm
                        chỉ tối đa một nửa thời gian của hầu hết các môn học.
                    </p>

                </div>
            </div>
            <h3 class="sub-heading padding-top-86px">Kỹ năng đạt được ở từng bộ môn</h3>
            <div class="wrap_info">

                <div class="information_text" id="test">
                    <h3 class="sub-heading padding-top-40px">Bộ môn ITS</h3>
                    <div class="infor-section intro-m">
                        <p class="para-heading--two-row">
                            Hiện tại, sinh viên Đại học FPT đã và đang làm việc tại Mỹ, Đức, Nhật Bản, Singapore – những thị
                            trường Công nghệ Thông tin hàng đầu của thế giới.
                            Tốt nghiệp ngành Kỹ thuật Phần mềm, sinh viên trở thành Chuyên viên giải pháp phần mềm; Chuyên
                            viên phân tích dữ liệu; Chuyên viên kiểm thử phần mềm; Chuyên viên đảm bảo chất lượng phần mềm;
                            Chuyên viên phân tích nghiệp vụ sản phẩm phần mềm; Chuyên viên phát triển ứng dụng di động. Sinh
                            viên là những Kỹ sư lập trình, Kỹ sư phát triển hệ thống nhúng tương lai tại các doanh nghiệp
                            phần mềm, doanh nghiệp ứng dụng Công nghệ Thông tin vào vận hành.
                        </p>
                    </div>
                    <div class="more_btn l-3 m-6 c-12">
                        <a href="its.jsp" class="more_sub">Xem thêm</a>
                    </div>
                </div>

                <div class="information_text">
                    <h3 class="sub-heading padding-top-40px">Bộ môn SE</h3>
                    <div class="infor-section intro-m">
                        <p class="para-heading--two-row">
                            Hiện tại, sinh viên Đại học FPT đã và đang làm việc tại Mỹ, Đức, Nhật Bản, Singapore – những thị
                            trường Công nghệ Thông tin hàng đầu của thế giới.
                            Tốt nghiệp ngành Kỹ thuật Phần mềm, sinh viên trở thành Chuyên viên giải pháp phần mềm; Chuyên
                            viên phân tích dữ liệu; Chuyên viên kiểm thử phần mềm; Chuyên viên đảm bảo chất lượng phần mềm;
                            Chuyên viên phân tích nghiệp vụ sản phẩm phần mềm; Chuyên viên phát triển ứng dụng di động. Sinh
                            viên là những Kỹ sư lập trình, Kỹ sư phát triển hệ thống nhúng tương lai tại các doanh nghiệp
                            phần mềm, doanh nghiệp ứng dụng Công nghệ Thông tin vào vận hành.
                        </p>

                    </div>
                    <div class="more_btn l-3 m-6 c-12">
                        <a href="se.jsp" class="more_sub">Xem thêm</a>
                    </div>
                </div>

            </div>

            <div class="footer">

                <div class="grid wide">
                    <div class="row footer__content">
                        <div class="m-6 c-12 margin-bottom-tablet margin-bottom-mobile footer_access">
                            <div class="footer__logo-link">
                                <img src="assets/images/tải xuống.png" alt="" class="footer__logo-img">
                            </div>
                            <div class="footer__contact">
                                <div class="footer__contact-address">
                                    <a href="mailto:setsail@qode.com" class="footer__contact-gmail">
                                        <i class="footer__contact-icon far fa-envelope"></i>
                                        <span>daihocfpt@fpt.edu.vn</span>
                                    </a>
                                    <a href="tel:1 562 867 5309" class="footer__contact-phone">
                                        <i class="footer__contact-icon fas fa-phone-alt"></i>
                                        <span>028 7300 1866</span>
                                    </a>
                                    <div class="footer__contact-address-street">
                                        <i class="footer__contact-icon fas fa-map-marker-alt"></i>
                                        <span>Lô E2a-7, Đường D1 Khu Công nghệ cao, P. Long Thạnh Mỹ, TP. Thủ Đức, TP. Hồ
                                            Chí
                                            Minh</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col l-3 m-6 c-12 margin-bottom-mobile">
                        <div class="footer__subscribe">
                            <h5 class="footer__heading">Tư vấn học tập</h5>
                            <form action="${pageContext.request.contextPath}/MainController" method="POST">
                                <div class="footer__form">
                                    <div class="footer__form-item">
                                        <i class="footer__form-icon fa fa-user"></i>
                                        <input type="text" name="txtName"
                                               class="footer__form-input" placeholder="Tên" required>
                                    </div>
                                    <div class="footer__form-item">
                                        <i class="footer__form-icon fa fa-phone"></i>
                                        <input type="text" name="txtPhone"
                                               class="footer__form-input" placeholder="SĐT" maxlength="10" required>
                                    </div>
                                    <div class="footer__form-item">
                                        <input type="hidden" name="txtType" value="major"/>
                                        <button type="submit"  name="action" value="TuVan"
                                                class="footer__form-submit">Đăng ký</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    </div>
                </div>

                <div class="footer__copyright">
                    <div class="grid wide">
                        <p class="footer__copyright-text">
                            Powered by @
                            <a href="" class="footer__copyright-link">Team 4_SWP391</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="btn-scroll-top">
            <a href="#scroll-top" class="btn-scroll-top__link">Top</a>
        </div>
    </div>
</div>
</body>

</html>
