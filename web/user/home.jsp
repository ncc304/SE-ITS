<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPT University</title>
        <link rel="icon" type="image/x-icon"
              href="${pageContext.request.contextPath}/user/assets/images/Những-thông-điệp-sâu-sắc-phía-sau-logo-FPT.png" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/responsive.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link
            href="https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&family=Poppins:wght@300;500;700&family=Roboto:wght@400;500;700&family=Satisfy&display=swap"
            rel="stylesheet">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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
                                        <a href="${pageContext.request.contextPath}/MainController?action=goITS" class="subnav__link" style="text-decoration: none;">ITS</a>
                                    </li>
                                    <li class="subnav__item">
                                        <a href="${pageContext.request.contextPath}/MainController?action=goSE" class="subnav__link" style="text-decoration: none;">SE</a>
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
            <div class="slideshow-container">

                <!--                <div class="mySlides fade">
                                    <img src="$ {pageContext.request.contextPath}/guest/assets/images/background-img/event1.jpg" style="width: 100%" class="banner__img2">
                                </div>
                
                                <div class="mySlides fade slider">
                                    <img src="$ {pageContext.request.contextPath}/guest/assets/images/background-img/76638495_2379894415466870_1693149431764877312_n.jpg" style="width: 100%" class="banner__img2">
                                </div>
                
                                <div class="mySlides fade">
                                    <img src="$ {pageContext.request.contextPath}/guest/assets/images/background-img/event.png" style="width: 100%" class="banner__img2">
                                </div>-->
                <div class="mySlides fade">
                    <img src="${pageContext.request.contextPath}/user/assets/images/background-img/thumnailhethongotovadieukhien-min.jpg" class="banner__img2">
                    <div class="banner__content banner__content--1">
                        <h2>Let's go now</h2>
                        <h1>SE and ITS</h1>
                        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minima expedita tenetur eius ipsum ea, voluptatibus possimus perspiciatis consequatur</p>
                    </div>
                </div>

                <div class="mySlides fade slider">
                    <img src="${pageContext.request.contextPath}/user/assets/images/background-img/event1.jpg" class="banner__img2">
                </div>

                <div class="mySlides fade">
                    <img src="${pageContext.request.contextPath}/user/assets/images/background-img/76638495_2379894415466870_1693149431764877312_n.jpg" class="banner__img2">
                </div>

                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>

            </div>
            <br>

            <div style="text-align:center">
                <span class="dot" onclick="currentSlide(1)"></span> 
                <span class="dot" onclick="currentSlide(2)"></span> 
                <span class="dot" onclick="currentSlide(3)"></span> 
            </div>
        </div>
        <div class="video-about" id="aboutus">
            <div class="grid wide">
                <div class="heading-section padding-top-86px">
                    <h3 class="sub-heading">Giới thiệu</h3>
                </div>
            </div>
            <div class="video__link">
                <iframe width="860" height="515" src="https://www.youtube.com/embed/b7OoE98yj5w"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen>
                </iframe>
            </div>
        </div>



        <div class="service" id="se">
            <img src="${pageContext.request.contextPath}/user/assets/images/SE5.jpg" 
                 alt="Image traveler" class="img_service" width="650">
                 

            <div class="heading-section padding-top-106px">
                <h3 class="sub-heading sub-heading--white">Bộ môn SE</h3>
                <p class="para-heading--two-row para-heading--white intro_major">
                    Tại Đại học FPT, Kỹ thuật phần mềm là chuyên ngành học có tiếng và lâu đời nhất. Hiện tại, sinh viên Đại học FPT đã và đang làm việc, học tập tại các quốc gia như Mỹ, Đức, Nhật Bản, Singapore – những thị trường CNTT quan trọng của thế giới. Đây là kết quả của chương trình đào tạo chuẩn quốc tế, chú trọng đào tạo ngoại ngữ, phát triển kỹ năng mềm cùng định hướng đầu ra đáp ứng nhu cầu doanh nghiệp.
                    Chương trình được thiết kế theo chuẩn của Hiệp hội Máy tính (Association for Computing Machinery-ACM), chuẩn đào tạo kỹ sư phần mềm của Accreditation Board for Engineering and Technology (ABET – Mỹ), Hiệp hội Phần mềm Việt Nam (VINASA), Chương trình Đào tạo của EC-Council, Học viện Mạng và Phần cứng Jetking (Ấn Độ); với sự tư vấn của các chuyên gia và doanh nghiệp CNTT như Tập đoàn FPT, Tập đoàn IBM, đồng thời tích hợp các chuẩn kiến thức của giới công nghiệp như Oracle, Cisco… Nội dung đào tạo chuyên ngành Kỹ thuật phần mềm của Đại học FPT tích hợp cân bằng giữa kiến thức nền tảng với công nghệ, kỹ thuật mới: không chỉ bao gồm các kiến thức về khoa học cơ bản của nhóm ngành CNTT mà còn đào tạo đầy đủ về quy trình phát triển phần mềm, từ phương pháp, kỹ thuật, công nghệ trong phân tích, thiết kế, phát triển, kiểm thử, bảo trì phần mềm và quản lý dự án phần mềm cũng như các ứng dụng CNTT; cân bằng giữa lý thuyết với ứng dụng và thực hành: thời gian học lý thuyết chiếm chỉ tối đa một nửa thời gian của hầu hết các môn học.
                </p>
                <div class="more_btn col l-3 m-6 c-12">
                    <a href="${pageContext.request.contextPath}/MainController?action=goSE" 
                       class="more_sub">Xem thêm</a>
                </div>
            </div>


        </div>

        <div class="service" id="its">
            <div class="heading-section padding-top-106px">
                <h3 class="sub-heading sub-heading--white">Bộ môn ITS</h3>
                <p class="para-heading--two-row para-heading--white intro_major">
                    Sinh viên sẽ được đào tạo các môn khoa học cơ bản của nhóm ngành CNTT, đào tạo chuyên sâu về quy trình, phương pháp, kỹ thuật, công nghệ trong phân tích, thiết kế, phát triển, kiểm thử, bảo trì phần mềm và quản lý dự án phần mềm cũng như trong lĩnh vực ứng dụng CNTT. Đồng thời, trong giai đoạn học chuyên sâu, sinh viên có thể lựa chọn các đề tài hẹp để theo học và làm đồ án tốt nghiệp như: Phần mềm nhúng; Phần mềm quản lý doanh nghiệp; Phần mềm cho các hệ thống di động; Hệ thống mạng và phân tán; Hệ thống tài chính và thương mại điện tử… theo xu hướng SMAC hiện nay của thế giới
                </p>
                <div class="more_btn col l-3 m-6 c-12">
                    <a href="${pageContext.request.contextPath}/MainController?action=goITS" 
                       class="more_sub">Xem thêm</a>
                </div>
            </div>
            <img src="${pageContext.request.contextPath}/user/assets/images/SE6.jpg" 
                 alt="Image traveler" class="img_service" width="650">

        </div>


        <div class="footer" style="height: fit-content">
            <div class="grid wide">
                <div class="row footer__content">
                    <div class="m-6 c-12 margin-bottom-tablet margin-bottom-mobile footer_access">
                        <div class="footer__logo-link">
                            <img src="${pageContext.request.contextPath}/user/assets/images/tải xuống.png" alt="" class="footer__logo-img">
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
                                        <input type="hidden" name="txtType" value="home"/>
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


<script>
    var slideIndex = 0;
    showSlides();

    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {
            slideIndex = 1
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
        setTimeout(showSlides, 3000); // Change image every 2 seconds
    }



</script>



</body>


</html>