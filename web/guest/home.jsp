<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FPT University</title>
    <link rel="icon" type="image/x-icon"
        href="./assets/images/Những-thông-điệp-sâu-sắc-phía-sau-logo-FPT.png" />
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link
        href="https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&family=Poppins:wght@300;500;700&family=Roboto:wght@400;500;700&family=Satisfy&display=swap"
        rel="stylesheet">
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
        <div class="slideshow-container">

            <div class="mySlides fade">
                <img src="./assets/images/background-img/nganhdaotao-banner2.png" style="width: 100%" class="banner__img2">
            </div>
            
            <div class="mySlides fade slider">
              <img src="./assets/images/background-img/tikcok.jpg" style="width: 100%" class="banner__img2">
            </div>
            
            <div class="mySlides fade">
              <img src="./assets/images/background-img/event.png" style="width: 100%" class="banner__img2">
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
                    allowfullscreen></iframe>
            </div>
        </div>

   

        <div class="service" id="se">
            <img src="./assets/images/background-img/fancy-image-13.jpg" alt="Image traveler" class="img_service">

            <div class="heading-section padding-top-106px">
                <h3 class="sub-heading sub-heading--white">Bộ môn SE</h3>
                <p class="para-heading--two-row para-heading--white intro_major">
                    Tại Đại học FPT, Kỹ thuật phần mềm là chuyên ngành học có tiếng và lâu đời nhất. Hiện tại, sinh viên Đại học FPT đã và đang làm việc, học tập tại các quốc gia như Mỹ, Đức, Nhật Bản, Singapore – những thị trường CNTT quan trọng của thế giới. Đây là kết quả của chương trình đào tạo chuẩn quốc tế, chú trọng đào tạo ngoại ngữ, phát triển kỹ năng mềm cùng định hướng đầu ra đáp ứng nhu cầu doanh nghiệp.
                    Chương trình được thiết kế theo chuẩn của Hiệp hội Máy tính (Association for Computing Machinery-ACM), chuẩn đào tạo kỹ sư phần mềm của Accreditation Board for Engineering and Technology (ABET – Mỹ), Hiệp hội Phần mềm Việt Nam (VINASA), Chương trình Đào tạo của EC-Council, Học viện Mạng và Phần cứng Jetking (Ấn Độ); với sự tư vấn của các chuyên gia và doanh nghiệp CNTT như Tập đoàn FPT, Tập đoàn IBM, đồng thời tích hợp các chuẩn kiến thức của giới công nghiệp như Oracle, Cisco… Nội dung đào tạo chuyên ngành Kỹ thuật phần mềm của Đại học FPT tích hợp cân bằng giữa kiến thức nền tảng với công nghệ, kỹ thuật mới: không chỉ bao gồm các kiến thức về khoa học cơ bản của nhóm ngành CNTT mà còn đào tạo đầy đủ về quy trình phát triển phần mềm, từ phương pháp, kỹ thuật, công nghệ trong phân tích, thiết kế, phát triển, kiểm thử, bảo trì phần mềm và quản lý dự án phần mềm cũng như các ứng dụng CNTT; cân bằng giữa lý thuyết với ứng dụng và thực hành: thời gian học lý thuyết chiếm chỉ tối đa một nửa thời gian của hầu hết các môn học.
                </p>
                <div class="more_btn col l-3 m-6 c-12">
                    <a href="../ITS_Page/its.html" class="more_sub">Xem thêm</a>
                </div>
            </div>


        </div>

        <div class="service" id="its">
            <div class="heading-section padding-top-106px">
                <h3 class="sub-heading sub-heading--white">Bộ môn ITS</h3>
                <p class="para-heading--two-row para-heading--white intro_major">
                    Tại Đại học FPT, Kỹ thuật phần mềm là chuyên ngành học có tiếng và lâu đời nhất. Hiện tại, sinh viên Đại học FPT đã và đang làm việc, học tập tại các quốc gia như Mỹ, Đức, Nhật Bản, Singapore – những thị trường CNTT quan trọng của thế giới. Đây là kết quả của chương trình đào tạo chuẩn quốc tế, chú trọng đào tạo ngoại ngữ, phát triển kỹ năng mềm cùng định hướng đầu ra đáp ứng nhu cầu doanh nghiệp.
                    Chương trình được thiết kế theo chuẩn của Hiệp hội Máy tính (Association for Computing Machinery-ACM), chuẩn đào tạo kỹ sư phần mềm của Accreditation Board for Engineering and Technology (ABET – Mỹ), Hiệp hội Phần mềm Việt Nam (VINASA), Chương trình Đào tạo của EC-Council, Học viện Mạng và Phần cứng Jetking (Ấn Độ); với sự tư vấn của các chuyên gia và doanh nghiệp CNTT như Tập đoàn FPT, Tập đoàn IBM, đồng thời tích hợp các chuẩn kiến thức của giới công nghiệp như Oracle, Cisco… Nội dung đào tạo chuyên ngành Kỹ thuật phần mềm của Đại học FPT tích hợp cân bằng giữa kiến thức nền tảng với công nghệ, kỹ thuật mới: không chỉ bao gồm các kiến thức về khoa học cơ bản của nhóm ngành CNTT mà còn đào tạo đầy đủ về quy trình phát triển phần mềm, từ phương pháp, kỹ thuật, công nghệ trong phân tích, thiết kế, phát triển, kiểm thử, bảo trì phần mềm và quản lý dự án phần mềm cũng như các ứng dụng CNTT; cân bằng giữa lý thuyết với ứng dụng và thực hành: thời gian học lý thuyết chiếm chỉ tối đa một nửa thời gian của hầu hết các môn học.
                </p>
                <div class="more_btn col l-3 m-6 c-12">
                    <a href="../ITS_Page/its.html" class="more_sub">Xem thêm</a>
                </div>
            </div>
            <img src="./assets/images/background-img/fancy-image-13.jpg" alt="Image traveler" class="img_service">

        </div>

    
        <div class="footer">

            <div class="grid wide">
                <div class="row footer__content">
                    <div class="m-6 c-12 margin-bottom-tablet margin-bottom-mobile footer_access">
                        <div class="footer__logo-link">
                            <img src="./assets/images/tải xuống.png" alt="" class="footer__logo-img">
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
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 3000); // Change image every 2 seconds
}
        </script>
        
        
</body>


</html>