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
              href="${pageContext.request.contextPath}/guest/assets/images/Những-thông-điệp-sâu-sắc-phía-sau-logo-FPT.png" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/recr.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link
            href="https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&family=Poppins:wght@300;500;700&family=Roboto:wght@400;500;700&family=Satisfy&display=swap"
            rel="stylesheet">

        <style>
            .more_news {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 23px;
                background: linear-gradient(45deg, #003380 0%, #000000 100%);
                padding: 1%;
                color: #fdfbfb;
                text-align: center;
                margin-top: 50px;
            }
            .more_news p{
                margin: 0 auto;

            }
            .more_news-item {
                text-decoration: none;
                font-size: 12px;
                color: #fdfbfb;
                margin-right: 2rem;
            }
        </style>
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
                                <a href = "<c:url value = "/user/home.jsp"/>" class="navbar__item-link" style="text-decoration: none;">Trang chủ</a>

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
                            </li>
                            <li class="navbar__item">
                                <a href="${pageContext.request.contextPath}/MainController?action=goRecruitmentUser" class="navbar__item-link" style="text-decoration: none;">Tuyển dụng</a>
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
                    <img src="${pageContext.request.contextPath}/user/assets/images/background-img/full-slide1.jpg" alt="Friend" class="banner__img">
                </div>
                <div class="banner__content banner__content-event">
                    <h2>NGHỀ NGHIỆP</h2>
                </div>
            </div>

            <div class="type-travel">
                <div class="grid wide">
                    <div class="heading-section padding-top-86px">
                        <h3 class="sub-heading">TIN TUYỂN DỤNG, VIỆC LÀM TỐT NHẤT</h3>
                    </div>
                </div> 
                <!--<div class="category-recruit">-->
                <div class="more_news">
                    <p>Front-end</p>
                    <a href="MainController?action=goRecruitmentReadMore&txtCateID=4" 
                       style="float: right;"
                       class="more_news-item">
                        Xem thêm
                    </a>
                </div>
                <c:if test="${requestScope.LIST_REC1 != null}">
                    <c:if test="${not empty requestScope.LIST_REC1}">
                        <div class="grid type-travel--width">
                            <div class="row margin-10px">
                                <c:forEach items="${requestScope.LIST_REC1}" var="list1">
                                    <c:forEach items="${requestScope.COM1}" var="c1">
                                        <c:if test="${list1.companyId eq c1.id}">
                                            <div class="col l-3 m-6 c-12">
                                                <div class="type-travel-item">
                                                    <a href="MainController?action=goRecruitmentDetail&txtID=${list1.id}" 
                                                        class="type-travel__link">
                                                        <img src="${pageContext.request.contextPath}/user/assets/images/${c1.link}" alt="" class="type-travel__img">
                                                    </a>
                                                    <div class="type-travel__plan">
                                                        <a class="type-travel__plan-link" href="MainController?action=goRecruitmentDetail&txtID=${list1.id}">
                                                            <!-- <i class="type-travel__plan-icon fas fa-map-marker-alt"></i> -->
                                                            <span>${c1.name}</span>
                                                        </a>
                                                    </div>
                                                    <div class="type-travel__intro">
                                                        <a  href="MainController?action=goRecruitmentDetail&txtID=${list1.id}"
                                                            class="type-travel__intro-link" >
                                                            ${list1.name}
                                                        </a>
                                                        <div class="type-travel__info">
                                                            <span class="type-travel__info-price">Lương khởi đầu ${list1.salary} triệu</span>
                                                        </div>
                                                        <p class="type-travel__intro-text">${c1.address}</p>

                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>
                </c:if>

                <!--<div class="category-recruit">-->
                <div class="more_news">
                    <p>Back-end</p>
                    <a href="MainController?action=goRecruitmentReadMore&txtCateID=5"
                       style="float: right;"
                       class="more_news-item">
                        Xem thêm
                    </a>
                </div>
                <c:if test="${requestScope.LIST_REC2 != null}">
                    <c:if test="${not empty requestScope.LIST_REC2}">
                        <div class="grid type-travel--width">
                            <div class="row margin-10px">
                                <c:forEach items="${requestScope.LIST_REC2}" var="list2">
                                    <c:forEach items="${requestScope.COM2}" var="c2">
                                        <c:if test="${list2.companyId eq c2.id}">
                                            <div class="col l-3 m-6 c-12">
                                                <div class="type-travel-item">
                                                    <a href="MainController?action=goRecruitmentDetail&txtID=${list2.id}" 
                                                       class="type-travel__link">
                                                        <img src="${pageContext.request.contextPath}/user/assets/images/${c2.link}" alt="" class="type-travel__img">
                                                    </a>
                                                    <div class="type-travel__plan">
                                                        <a class="type-travel__plan-link" 
                                                           href="MainController?action=goRecruitmentDetail&txtID=${list2.id}">
                                                            <!-- <i class="type-travel__plan-icon fas fa-map-marker-alt"></i> -->
                                                            <span>${c2.name}</span>
                                                        </a>
                                                    </div>
                                                    <div class="type-travel__intro">
                                                        <a class="type-travel__intro-link" 
                                                           href="MainController?action=goRecruitmentDetail&txtID=${list2.id}">
                                                            ${list2.name}
                                                        </a>
                                                        <div class="type-travel__info">
                                                            <span class="type-travel__info-price">Lương khởi đầu ${list2.salary} triệu</span>
                                                        </div>
                                                        <p class="type-travel__intro-text">${c2.address}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </div>

                        </div>
                    </c:if>
                </c:if>

                <div class="more_news">
                    <p>Mobile</p>
                    <a href="MainController?action=goRecruitmentReadMore&txtCateID=6" 
                       style="float: right;"
                       class="more_news-item">
                        Xem thêm
                    </a>
                </div>
                <c:if test="${requestScope.LIST_REC3 != null}">
                    <c:if test="${not empty requestScope.LIST_REC3}">
                        <div class="grid type-travel--width">
                            <div class="row margin-10px">
                                <c:forEach items="${requestScope.LIST_REC3}" var="list3">
                                    <c:forEach items="${requestScope.COM3}" var="c3">
                                        <c:if test="${list3.companyId eq c3.id}">
                                            <div class="col l-3 m-6 c-12">
                                                <div class="type-travel-item">
                                                    <a href="MainController?action=goRecruitmentDetail&txtID=${list3.id}" 
                                                       class="type-travel__link">
                                                        <img src="${pageContext.request.contextPath}/user/assets/images/${c3.link}" alt="" class="type-travel__img">
                                                    </a>
                                                    <div class="type-travel__plan">
                                                        <a class="type-travel__plan-link" 
                                                           href="MainController?action=goRecruitmentDetail&txtID=${list3.id}">
                                                            <!-- <i class="type-travel__plan-icon fas fa-map-marker-alt"></i> -->
                                                            <span>${c3.name}</span>
                                                        </a>
                                                    </div>
                                                    <div class="type-travel__intro">
                                                        <a class="type-travel__intro-link" 
                                                           href="MainController?action=goRecruitmentDetail&txtID=${list3.id}">
                                                            ${list3.name}
                                                        </a>
                                                        <div class="type-travel__info">
                                                            <span class="type-travel__info-price">Lương khởi đầu ${list3.salary} triệu</span>
                                                        </div>
                                                        <p class="type-travel__intro-text">${c3.address}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </div>

                        </div>
                    </c:if>
                </c:if>
                <div class="more_news">
                    <p>Full-Stack</p>
                    <a href="MainController?action=goRecruitmentReadMore&txtCateID=7" 
                       style="float: right;"
                       class="more_news-item">
                        Xem thêm
                    </a>
                </div>
                <c:if test="${requestScope.LIST_REC4 != null}">
                    <c:if test="${not empty requestScope.LIST_REC4}">
                        <div class="grid type-travel--width">
                            <div class="row margin-10px">
                                <c:forEach items="${requestScope.LIST_REC4}" var="list4">
                                    <c:forEach items="${requestScope.COM4}" var="c4">
                                        <c:if test="${list4.companyId eq c4.id}">
                                            <div class="col l-3 m-6 c-12">
                                                <div class="type-travel-item">
                                                    <a href="MainController?action=goRecruitmentDetail&txtID=${list4.id}" 
                                                       class="type-travel__link">
                                                        <img src="${pageContext.request.contextPath}/user/assets/images/${c4.link}" alt="" class="type-travel__img">
                                                    </a>
                                                    <div class="type-travel__plan">
                                                        <a class="type-travel__plan-link" 
                                                           href="MainController?action=goRecruitmentDetail&txtID=${list4.id}">
                                                            <!-- <i class="type-travel__plan-icon fas fa-map-marker-alt"></i> -->
                                                            <span>${c4.name}</span>
                                                        </a>
                                                    </div>
                                                    <div class="type-travel__intro">
                                                        <a class="type-travel__intro-link" 
                                                           href="MainController?action=goRecruitmentDetail&txtID=${list4.id}">
                                                            ${list4.name}
                                                        </a>
                                                        <div class="type-travel__info">
                                                            <span class="type-travel__info-price">Lương khởi đầu ${list4.salary} triệu</span>
                                                        </div>
                                                        <p class="type-travel__intro-text">${c4.address}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>
                </c:if>
            </div>


        </div> 

        <div class="footer">

            <div class="grid wide">
                <div class="row footer__content">
                    <div class="m-6 c-12 margin-bottom-tablet margin-bottom-mobile footer_access">
                        <div  class="footer__logo-link">
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
