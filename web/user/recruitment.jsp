<%-- 
    Document   : recruitment
    Created on : Feb 13, 2022, 11:03:11 AM
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
        <title>Recruitment</title>
        <link rel="icon" type="image/x-icon"
              href="../Homepage/assets/images/Những-thông-điệp-sâu-sắc-phía-sau-logo-FPT.png" />
        <link rel="stylesheet" href="./assets/css/reset.css">
        <link rel="stylesheet" href="./assets/css/grid.css">
        <link rel="stylesheet" href="./assets/css/base.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/css/responsive.css">
        <link rel="stylesheet" href="./recr.css">
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
                                <img src="${pageContext.request.contextPath}/user/assets/images/taixuong.png" alt="Setsail" class="navbar__logo-img">
                            </a>
                        </div>
                        <ul class="navbar__list">
                            <label for="navbar__mobile" class="navbar-mobile__menu-close">
                                <i class="fas fa-times"></i>
                            </label>
                            <li class="navbar__item">
                                <a href = "<c:url value = "/user/home.jsp"/>" class="navbar__item-link" style="text-decoration: none;">Trang chủ</a>

                                <input type="radio" name="nav-select" id="show-subnav__list--1">
                            </li>
                            <li class="navbar__item">
                                <a href="<c:url value = "/user/news.jsp"/>" class="navbar__item-link" style="text-decoration: none;">Tin tức</a>
                                <input type="radio" name="nav-select" id="show-subnav__list--2">
                                <ul class="subnav__list">
                                    <li class="subnav__item">
                                        <a href="<c:url value = "/user/its.jsp"/>" class="subnav__link" style="text-decoration: none;">Đời sống sinh viên</a>
                                    </li>
                                    <li class="subnav__item">
                                        <a href="<c:url value = "/user/se.jsp"/>" class="subnav__link" style="text-decoration: none;">FPT High-tech</a>
                                    </li>
                                    <li class="subnav__item">
                                        <a href="<c:url value = "/user/se.jsp"/>" class="subnav__link" style="text-decoration: none;">Hội nhập quốc tế</a>
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
                            </li>
                            <li class="navbar__item">
                                <a href="<c:url value = "/user/recruitment.jsp"/>" class="navbar__item-link" style="text-decoration: none;">Tuyển dụng</a>
                                <input type="radio" name="nav-select" id="show-subnav__list--5">
                            </li>
                            <li class="navbar__item">
                                <a href="${pageContext.request.contextPath}/login.jsp" class="navbar__item-link" data-toggle="modal" data-target="#loginModal" style="text-decoration: none;">
                                    Đăng nhập
                                </a>
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
                    <img src="assets/images/background-img/full-slide1.jpg" alt="Friend" class="banner__img">
                </div>
                <div class="banner__content banner__content-event">
                    <h2>NGHỀ NGHIỆP</h2>
                </div>
            </div>

            <div class="type-travel">
                <div class="grid wide">
                    <div class="heading-section padding-top-86px">
                        <h3 class="sub-heading">Tin tuyển dụng</h3>
                    </div>
                </div> 
                <div class="category-recruit">
                    <p>Back-end</p>
                </div>
                <div class="grid type-travel--width">
                    <div class="row margin-10px">
                        <div class="col l-3 m-6 c-12">
                            <div class="type-travel-item">
                                <a href="recruitment_content.jsp" class="type-travel__link">
                                    <img src="assets/images/Những-thông-điệp-sâu-sắc-phía-sau-logo-FPT.png" alt="" class="type-travel__img">
                                </a>
                                <div class="type-travel__plan">
                                    <a class="type-travel__plan-link" href="recruitment_content.jsp">
                                        <!-- <i class="type-travel__plan-icon fas fa-map-marker-alt"></i> -->
                                        <span>FPT Software HCM</span>
                                    </a>
                                </div>
                                <div class="type-travel__intro">
                                    <a class="type-travel__intro-link" href="">MODERN JAVASCRIPT DEVELOPER</a>
                                    <div class="type-travel__info">
                                        <span class="type-travel__info-price">Lương lên đến 10.000$</span>
                                    </div>
                                    <p class="type-travel__intro-text">Bình Thạnh, TP.HCM</p>

                                </div>
                            </div>
                        </div>
                        <div class="col l-3 m-6 c-12">
                            <div class="type-travel-item">
                                <a href="recruitment_content.jsp" class="type-travel__link">
                                    <img src="https://scontent.fhan3-4.fna.fbcdn.net/v/t1.15752-9/251312062_900563330575510_4873178814651720165_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=ae9488&_nc_ohc=-6RDwJZuOqMAX_re0J-&_nc_ht=scontent.fhan3-4.fna&oh=03_AVI2zmu_JJdmghH8KaQUciAygcsjrbiyYtY_SZqMU8NokA&oe=622EB3E7" alt="" class="type-travel__img">
                                </a>
                                <div class="type-travel__plan">
                                    <a class="type-travel__plan-link" href="recruitment_content.jsp">
                                        <!-- <i class="type-travel__plan-icon fas fa-map-marker-alt"></i> -->
                                        <span>FPT Software HCM</span>
                                    </a>
                                </div>
                                <div class="type-travel__intro">
                                    <a class="type-travel__intro-link" href="">MODERN JAVASCRIPT DEVELOPER</a>
                                    <div class="type-travel__info">
                                        <span class="type-travel__info-price">Lương lên đến 10.000$</span>
                                    </div>
                                    <p class="type-travel__intro-text">Bình Thạnh, TP.HCM</p>

                                </div>
                            </div>
                        </div>
                        <div class="col l-3 m-6 c-12">
                            <div class="type-travel-item">
                                <a href="recruitment_content.jsp" class="type-travel__link">
                                    <img src="https://scontent.fhan3-5.fna.fbcdn.net/v/t1.15752-9/272656727_988723208738125_3316638437383492412_n.png?_nc_cat=110&ccb=1-5&_nc_sid=ae9488&_nc_ohc=zazb4l7mthkAX8qMb49&_nc_ht=scontent.fhan3-5.fna&oh=03_AVIvr3aPuPYMfmfV5mVasHVjmYC7kow4fIkHNCXFRCSr2A&oe=622C5FFC" alt="" class="type-travel__img">
                                </a>
                                <div class="type-travel__plan">
                                    <a class="type-travel__plan-link" href="recruitment_content.jsp">
                                        <!-- <i class="type-travel__plan-icon fas fa-map-marker-alt"></i> -->
                                        <span>FPT Software HCM</span>
                                    </a>
                                </div>
                                <div class="type-travel__intro">
                                    <a class="type-travel__intro-link" href="">MODERN JAVASCRIPT DEVELOPER</a>
                                    <div class="type-travel__info">
                                        <span class="type-travel__info-price">Lương lên đến 10.000$</span>
                                    </div>
                                    <p class="type-travel__intro-text">Bình Thạnh, TP.HCM</p>

                                </div>
                            </div>
                        </div>
                        <div class="col l-3 m-6 c-12">
                            <div class="type-travel-item">
                                <a href="recruitment_content.jsp" class="type-travel__link">
                                    <img src="https://scontent.fhan3-5.fna.fbcdn.net/v/t1.15752-9/272656727_988723208738125_3316638437383492412_n.png?_nc_cat=110&ccb=1-5&_nc_sid=ae9488&_nc_ohc=zazb4l7mthkAX8qMb49&_nc_ht=scontent.fhan3-5.fna&oh=03_AVIvr3aPuPYMfmfV5mVasHVjmYC7kow4fIkHNCXFRCSr2A&oe=622C5FFC" alt="" class="type-travel__img">
                                </a>
                                <div class="type-travel__plan">
                                    <a class="type-travel__plan-link" href="recruitment_content.jsp">
                                        <!-- <i class="type-travel__plan-icon fas fa-map-marker-alt"></i> -->
                                        <span>FPT Software HCM</span>
                                    </a>
                                </div>
                                <div class="type-travel__intro">
                                    <a class="type-travel__intro-link" href="">MODERN JAVASCRIPT DEVELOPER</a>
                                    <div class="type-travel__info">
                                        <span class="type-travel__info-price">Lương lên đến 10.000$</span>
                                    </div>
                                    <p class="type-travel__intro-text">Bình Thạnh, TP.HCM</p>

                                </div>
                            </div>
                        </div>

                    </div>


                </div>
                <div class="category-recruit">
                    <p>Front-end</p>
                </div>
                <div class="grid type-travel--width">
                    <div class="row margin-10px">
                        <div class="col l-3 m-6 c-12">
                            <div class="type-travel-item">
                                <a href="recruitment_content.jsp" class="type-travel__link">
                                    <img src="assets/images/Những-thông-điệp-sâu-sắc-phía-sau-logo-FPT.png" alt="" class="type-travel__img">
                                </a>
                                <div class="type-travel__plan">
                                    <a class="type-travel__plan-link" href="recruitment_content.jsp">
                                        <!-- <i class="type-travel__plan-icon fas fa-map-marker-alt"></i> -->
                                        <span>FPT Software HCM</span>
                                    </a>
                                </div>
                                <div class="type-travel__intro">
                                    <a class="type-travel__intro-link" href="">MODERN JAVASCRIPT DEVELOPER</a>
                                    <div class="type-travel__info">
                                        <span class="type-travel__info-price">Lương lên đến 10.000$</span>
                                    </div>
                                    <p class="type-travel__intro-text">Bình Thạnh, TP.HCM</p>

                                </div>
                            </div>
                        </div>
                        <div class="col l-3 m-6 c-12">
                            <div class="type-travel-item">
                                <a href="recruitment_content.jsp" class="type-travel__link">
                                    <img src="assets/images/job1.png" alt="" class="type-travel__img">
                                </a>
                                <div class="type-travel__plan">
                                    <a class="type-travel__plan-link" href="recruitment_content.jsp">
                                        <!-- <i class="type-travel__plan-icon fas fa-map-marker-alt"></i> -->
                                        <span>FPT Software HCM</span>
                                    </a>
                                </div>
                                <div class="type-travel__intro">
                                    <a class="type-travel__intro-link" href="">MODERN JAVASCRIPT DEVELOPER</a>
                                    <div class="type-travel__info">
                                        <span class="type-travel__info-price">Lương lên đến 10.000$</span>
                                    </div>
                                    <p class="type-travel__intro-text">Bình Thạnh, TP.HCM</p>

                                </div>
                            </div>
                        </div>
                        <div class="col l-3 m-6 c-12">
                            <div class="type-travel-item">
                                <a href="recruitment_content.jsp" class="type-travel__link">
                                    <img src="assets/images/job2.png" alt="" class="type-travel__img">
                                </a>
                                <div class="type-travel__plan">
                                    <a class="type-travel__plan-link" href="recruitment_content.jsp">
                                        <!-- <i class="type-travel__plan-icon fas fa-map-marker-alt"></i> -->
                                        <span>FPT Software HCM</span>
                                    </a>
                                </div>
                                <div class="type-travel__intro">
                                    <a class="type-travel__intro-link" href="">MODERN JAVASCRIPT DEVELOPER</a>
                                    <div class="type-travel__info">
                                        <span class="type-travel__info-price">Lương lên đến 10.000$</span>
                                    </div>
                                    <p class="type-travel__intro-text">Bình Thạnh, TP.HCM</p>

                                </div>
                            </div>
                        </div>
                        <div class="col l-3 m-6 c-12">
                            <div class="type-travel-item">
                                <a href="recruitment_content.jsp" class="type-travel__link">
                                    <img src="assets/images/job3.png" alt="" class="type-travel__img">
                                </a>
                                <div class="type-travel__plan">
                                    <a class="type-travel__plan-link" href="recruitment_content.jsp">
                                        <!-- <i class="type-travel__plan-icon fas fa-map-marker-alt"></i> -->
                                        <span>FPT Software HCM</span>
                                    </a>
                                </div>
                                <div class="type-travel__intro">
                                    <a class="type-travel__intro-link" href="">MODERN JAVASCRIPT DEVELOPER</a>
                                    <div class="type-travel__info">
                                        <span class="type-travel__info-price">Lương lên đến 10.000$</span>
                                    </div>
                                    <p class="type-travel__intro-text">Bình Thạnh, TP.HCM</p>

                                </div>
                            </div>
                        </div>

                    </div>


                </div>

            </div>

        </div> 

        <div class="footer">

            <div class="grid wide">
                <div class="row footer__content">
                    <div class="m-6 c-12 margin-bottom-tablet margin-bottom-mobile footer_access">
                        <div  class="footer__logo-link">
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
                                    <span>Lô E2a-7, Đường D1 Khu Công nghệ cao, P. Long Thạnh Mỹ, TP. Thủ Đức, TP. Hồ Chí
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
