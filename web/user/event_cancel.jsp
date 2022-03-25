<%-- 
    Document   : event_offline
    Created on : Mar 10, 2022, 11:55:12 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/x-icon"
              href="../Homepage/assets/images/Những-thông-điệp-sâu-sắc-phía-sau-logo-FPT.png" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/responsive.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link
            href="https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&family=Poppins:wght@300;500;700&family=Roboto:wght@400;500;700&family=Satisfy&display=swap"
            rel="stylesheet">
        <title>JSP Page</title>
        <style>
            .regis_link{
                text-align: center;
                height: 60px;
            }
            .regis_link-item{
                padding: 18px 40px;
                background-color: #0004d8;
                color: #fff;
                text-decoration: none;
            }
            .regis_link:hover{
                opacity: 0.8
            }

        </style>
        <c:if test="${requestScope.MSG eq 'SUCCESS'}">
            <script>
                window.alert("Đã hủy đăng ký Sự Kiện: ${requestScope.EVENT_NAME} thành công");
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
                    <img src="${pageContext.request.contextPath}/user/assets/images/news.jpg" alt="Friend" class="banner__img">
                </div>
                <div class="banner__content">
                    <h2>Quản Lý Sự Kiện</h2>
                </div>
            </div>

            <div class="type-travel">
                <div class="grid wide">
                    <div class="heading-section padding-top-86px">
                        <div class="site_map" style="width: auto;">
                            <a href="${pageContext.request.contextPath}/user/home.jsp" style="font-size: 1.30em ">Trang chủ › </a>
                            <a href="${pageContext.request.contextPath}/MainController?action=goEventUser" 
                               style="font-size: 1.30em; color: #0882d9">
                                Sự kiện 
                            </a>
                            <a href="#" style="font-size: 1.30em ">› Offline</a>
                        </div>
                        <h3 class="sub-heading">Danh sách các Sự Kiện Offline Bạn đã tham gia</h3>

                    </div>

                </div> 
                <input type="radio" hidden name="dot" id="type-travel__input-one">
                <input type="radio" hidden name="dot" id="type-travel__input-two">

                <c:if test="${requestScope.LIST_EVENT != null}">
                    <div class="grid type-travel--width">
                        <div class="row margin-10px">
                            <c:forEach items="${requestScope.LIST_EVENT}" var="listEvent">
                                <c:forEach items="${requestScope.LIST_EVENT_IMG}" var="img">
                                    <c:forEach items="${requestScope.LIST_EA}" var="listEA">
                                        <c:if test="${listEvent.id eq img.eventId}">
                                            <c:if test="${listEvent.id eq listEA.eventId}">
                                                <div class="col l-3 m-6 c-12">
                                                    <div class="type-travel-item">
                                                        <a href="MainController?action=goEventDetails&txtID=${listEvent.id}" class="type-travel__link">
                                                            <img src="${pageContext.request.contextPath}/user/assets/images/${img.link}" alt="" class="type-travel__img">
                                                        </a>
                                                        <div class="type-travel__intro">
                                                            <a class="type-travel__intro-link" href="MainController?action=goEventDetails&txtID=${listEvent.id}">
                                                                ${listEvent.name}
                                                            </a>
                                                            <p class="type-travel__intro-text">
                                                                Ngày đăng: ${listEvent.createDate}
                                                            </p>

                                                            <c:if test="${listEA.status}">
                                                                <div class="regis_link" style="margin-top: 15%;">
                                                                    <a class="regis_link-item" style="font-family: Verdana; font-size: 12px;"
                                                                       href="MainController?action=cancelEvent&txtID=${listEvent.id}&txtName=${listEvent.name}">
                                                                        Hủy đăng ký
                                                                    </a>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${!listEA.status}">
                                                                <div class="regis_link">
                                                                    <button class="regis_link-item" 
                                                                            style="background-color: #6c757d; height: 48.8px; width: 143px; margin-top: 8%; font-family: Verdana" 
                                                                            disabled="true">
                                                                        Đã hủy
                                                                    </button>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>

                                </c:forEach>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                <c:if test="${requestScope.LIST_EVENT == null}">
                    <p class="sub-heading" style="font-size: 25px;">Hiện tại bạn chưa đăng ký Sự Kiện nào</p>
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
