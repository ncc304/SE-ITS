<%-- 
    Document   : se
    Created on : Feb 13, 2022, 11:40:17 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SE</title>
        <link rel="icon" type="image/x-icon"
              href="../Homepage/assets/images/Những-thông-điệp-sâu-sắc-phía-sau-logo-FPT.png" />
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
    </head>

    <body>
        <!-- <div class="page-different">
            <div class="page-different-item">
                <a href="../ITS_Page/its.html">
                    <img src="../Homepage/assets/images/custom-icon/custom-icon-4.png" alt="Camera image"
                        class="service-travel__img">
                </a>
                <a href="../ITS_Page/its.html"class="page-different-text">ITS</a>
            </div>
            <div class="page-different-item">
                <a href="https://www.google.com.vn/?hl=vi">
                    <img src="../Homepage/assets/images/custom-icon/custom-icon-4.png" alt="Camera image"
                        class="service-travel__img">
                </a>
                <a href="../ITS_Page/SE.html" class="page-different-text">SE</a>
            </div>
        </div> -->

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
                                <img src="./assets/images/tải xuống.png" alt="Setsail" class="navbar__logo-img">
                            </a>
                        </div>
                        <ul class="navbar__list">
                            <label for="navbar__mobile" class="navbar-mobile__menu-close">
                                <i class="fas fa-times"></i>
                            </label>
                            <li class="navbar__item">
                                <a href="home.jsp" class="navbar__item-link">Trang chủ</a>
                                <input type="radio" name="nav-select" id="show-subnav__list--1">
                            </li>
                            <li class="navbar__item">
                                <a href="news.jsp" class="navbar__item-link">Tin tức</a>
                                <input type="radio" name="nav-select" id="show-subnav__list--2">
                                <ul class="subnav__list">
                                    <li class="subnav__item">
                                        <a href="its.jsp" class="subnav__link">Đời sống sinh viên</a>
                                    </li>
                                    <li class="subnav__item">
                                        <a href="se.jsp" class="subnav__link">FPT High-tech</a>
                                    </li>
                                    <li class="subnav__item">
                                        <a href="se.jsp" class="subnav__link">Hội nhập quốc tế</a>
                                    </li>

                                </ul>
                            </li>
                            <li class="navbar__item">
                                <a href="major.jsp" class="navbar__item-link">Lộ trình môn chuyên sâu</a>
                                <input type="radio" name="nav-select" id="show-subnav__list--3">
                                <ul class="subnav__list">
                                    <li class="subnav__item">
                                        <a href="its.jsp" class="subnav__link">ITS</a>
                                    </li>
                                    <li class="subnav__item">
                                        <a href="se.jsp" class="subnav__link">SE</a>
                                    </li>

                                </ul>
                            </li>
                            <li class="navbar__item">
                                <a href="event.jsp" class="navbar__item-link">Sự kiện</a>
                                <input type="radio" name="nav-select" id="show-subnav__list--4">
                            </li>
                            <li class="navbar__item">
                                <a href="recruitment.jsp" class="navbar__item-link">Tuyển dụng</a>
                                <input type="radio" name="nav-select" id="show-subnav__list--5">
                            </li>
                            <li class="navbar__item">
                                <a href="login.jsp" class="navbar__item-link">Đăng nhập</a>
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
                        <h2>SE</h2>
                    </div>
                </div>
            </div>
            <div>

            </div>

            <div class="about-major" id="aboutus">
                <div class="heading-section padding-top-86px">
                    <h2 class="sub-heading">Tổng quan về bộ môn SE</h2>
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
            <div class="information_text" id="test">
                <h3 class="sub-heading padding-top-86px">Kinh nghiệm tích lũy sau chương trình:</h3>
                <div class="infor-section">
                    <p class="para-heading--two-row">
                        Sinh viên sẽ được đào tạo các môn khoa học cơ bản của nhóm ngành CNTT, đào tạo chuyên sâu về quy
                        trình, phương pháp, kỹ thuật, công nghệ trong phân tích, thiết kế, phát triển, kiểm thử, bảo trì
                        phần mềm và quản lý dự án phần mềm cũng như trong lĩnh vực ứng dụng CNTT. Đồng thời, trong giai đoạn
                        học chuyên sâu, sinh viên có thể lựa chọn các đề tài hẹp để theo học và làm đồ án tốt nghiệp như:
                        Phần mềm nhúng; Phần mềm quản lý doanh nghiệp; Phần mềm cho các hệ thống di động; Hệ thống mạng và
                        phân tán; Hệ thống tài chính và thương mại điện tử… theo xu hướng SMAC hiện nay của thế giới (SMAC:
                        viết tắt của Social – Mạng xã hội, Mobility – Di động, Analytics – Phân tích dữ liệu, Cloud – Điện
                        toán đám mây).
                    </p>
                    <p class="para-heading--two-row">
                        Sinh viên sẽ được đào tạo các môn khoa học cơ bản của nhóm ngành CNTT, đào tạo chuyên sâu về quy
                        trình, phương pháp, kỹ thuật, công nghệ trong phân tích, thiết kế, phát triển, kiểm thử, bảo trì
                        phần mềm và quản lý dự án phần mềm cũng như trong lĩnh vực ứng dụng CNTT. Đồng thời, trong giai đoạn
                        học chuyên sâu, sinh viên có thể lựa chọn các đề tài hẹp để theo học và làm đồ án tốt nghiệp như:
                        Phần mềm nhúng; Phần mềm quản lý doanh nghiệp; Phần mềm cho các hệ thống di động; Hệ thống mạng và
                        phân tán; Hệ thống tài chính và thương mại điện tử… theo xu hướng SMAC hiện nay của thế giới (SMAC:
                        viết tắt của Social – Mạng xã hội, Mobility – Di động, Analytics – Phân tích dữ liệu, Cloud – Điện
                        toán đám mây).
                    </p>
                </div>
            </div>

            <div class="wrap_info">
                <div class="information_text" id="test">
                    <h3 class="sub-heading padding-top-86px">Kỹ năng đạt được</h3>
                    <div class="infor-section">
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
                </div>
                <div class="information_text" id="test">
                    <h3 class="sub-heading padding-top-86px">Cơ hội việc làm</h3>
                    <div class="infor-section-ul">
                        <ul class="para-heading--two-row-ul">
                            <li>
                                - Quản trị viên dự án phần mềm và CNTT
                            </li>
                            <li>
                                - Kỹ sư đảm bảo chất lượng phần mềm
                            </li>
                            <li>
                                - Quản lý dự án Công nghệ Thông tin
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
            <div>
                <h3 class="sub-heading padding-top-86px">Giáo trình môn học</h3>
                <div class="about-semester">
                    <div class="semester-section">
                        <div class="infor-section-ul head-semester-left">
                            <ul class="para-semester-section">
                                <li>
                                    <a href="#">Introduction to Software Engineering</a>
                                </li>
                                <li>
                                    <a href="#">Computer Networking</a>
                                </li>
                                <li>
                                    <a href="#">Java Web Application Development</a>
                                </li>
                                <li>
                                    <a href="#">Desktop Java Lab</a>
                                </li>
                                <li>
                                    <a href="#">	.NET and C#</a>
                                </li>

                            </ul>

                        </div>

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
                                <div class="footer__form">
                                    <div class="footer__form-item">
                                        <i class="footer__form-icon fas fa-user"></i>
                                        <input type="text" class="footer__form-input" placeholder="Tên" required>
                                    </div>
                                    <div class="footer__form-item">
                                        <i class="footer__form-icon far fa-envelope"></i>
                                        <input type="email" class="footer__form-input" placeholder="SĐT" required>
                                    </div>
                                    <div class="footer__form-item">
                                        <button type="submit" class="footer__form-submit">Đăng ký</button>
                                    </div>
                                </div>
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
