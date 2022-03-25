<%-- 
    Document   : news
    Created on : Feb 13, 2022, 10:48:39 AM
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
        <title>News</title>
        <link rel="icon" type="image/x-icon"
              href="./assets/images/Những-thông-điệp-sâu-sắc-phía-sau-logo-FPT.png" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/responsive.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link
            href="https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&family=Poppins:wght@300;500;700&family=Roboto:wght@400;500;700&family=Satisfy&display=swap"
            rel="stylesheet">
        <style>
            .category-recruit {
                font-size: 23px;
                background: linear-gradient(45deg, #003380 0%, #000000 100%);
                padding: 1%;
                color: #fdfbfb;
                text-align: center;
                margin-top: 50px;
            }

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
            .more_news-item {
                text-decoration: none;
                font-size: 12px;
                color: #fdfbfb;
                margin-right: 2rem;
            }
            .navigation_img {
                /* display: grid;
                grid-template-columns: 1fr 1fr 1fr;
                grid-template-rows: calc(100%/3) calc(100%/3);
                grid-gap: 2rem; */

                display: flex;
                margin: 0 15px 15px 15px;
            }
            .big_img {
                flex: 2;
                margin-top: 16px;
            }
            .navigation_img--item {
                border-radius: 10px;
                width: 100%;
            }
            .small_img > .nav_img--item {
                margin-bottom: 16px;
            }
            .small_img {
                flex: 1;
                display: flex;
                flex-direction: column;
                margin: 16px;
            }
            /* .nav_img--item:first-child{
              grid-column: 1/3;
              grid-row: 1/3;
            
            } */
            .img__content {
                position: absolute;
                top: 70%;
                left: 30%;
                transform: translate(-50%, -50%);
                color: rgb(255, 254, 254);
                text-align: center;
                width: 45%;
                font-size: 18px;
                font-weight: bold;
                background: rgb(0, 0, 0);
                background: rgba(0, 0, 0, 0.5); /* Black see-through */
                transition: 0.5s ease;
                opacity: 0;
                padding: 20px;

            }

            .img__content a {
                text-decoration: none;
                font-size: 22px;
                color: rgb(247, 244, 244);
                overflow: hidden;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
            }

            .img__content p {
                -webkit-text-stroke-width: 0.5px;
                -webkit-text-stroke-color: rgb(14, 13, 13, 0.8);
            }
            .nav_img--item:hover .img__content {
                opacity: 1;
                cursor: pointer;
            }
            .img__content-small {
                position: relative;
                top: -13%;
                margin-bottom: 20px;
                max-width: 70%;
                text-align: center;
                background: rgba(0, 0, 0, 0.5);
                padding: 5px;
                left: 50px;
                transition: 0.5s ease;
                opacity: 0;
            }
            .img__content-small a{
                text-decoration: none;
                font-size: 18px;
                color: rgb(247, 244, 244);
                overflow: hidden;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
            }
            .nav_img--item-small:hover .img__content-small a  {
                color:#eff2f7;
                cursor: pointer;
            }
            .nav_img--item-small:hover .img__content-small{
                opacity: 1;
            }
            .navigation_banner {
                position: relative;
                font-size: 1.5em;
                background: linear-gradient(45deg, #003380 0%, #000000 100%);
                color: #fff;
                width: 25rem;
                opacity: 0.8;
                width: 80%;
                margin: auto;
                padding: 10px;
                display: flex;
                justify-content: space-evenly;
            }
            .navigation_banner_items:nth-child(1)::after, .navigation_banner_items:nth-child(2)::after{
                content: "";
                border-right: 1px solid #a1a0a0;
                position: relative;
                height: 17px;
                left: 104px;

            }
            .navigation_banner_items{
                color: #fff;
                text-decoration: none;
            }
            .navigation_banner_items:hover{
                color: rgb(71, 98, 250);
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

            <div class="grid wide">
                <div class="heading-section padding-top-40px">
                    <h3 class="sub-heading">Tin Tức Nóng Hổi</h3>
                </div>
            </div> 
            <c:set var="img" scope="session" value="${sessionScope.LIST_3_News_IMG}"/>
            <c:if test="${requestScope.BIG_NEWS_1 != null && requestScope.BIG_NEWS_2 != null && requestScope.BIG_NEWS_3 != null}">                        

                <div class="navigation_img">
                    <div class="nav_img--item big_img">
                        <a href="MainController?action=goNewsDetails&txtID=${requestScope.BIG_NEWS_1.id}">
                            <img class="navigation_img--item" width="943" height="550"
                                 src="${pageContext.request.contextPath}/user/assets/images/${img[0].link}"/>
                        </a>

                        <div class="img__content">
                            <a href="MainController?action=goNewsDetails&txtID=${requestScope.BIG_NEWS_1.id}">
                                ${requestScope.BIG_NEWS_1.name}
                            </a>
                        </div>
                    </div>
                    <div class="small_img">
                        <div class="nav_img--item-small">
                            <a href="MainController?action=goNewsDetails&txtID=${requestScope.BIG_NEWS_2.id}">
                                <img class="navigation_img--item"  width="471" height="275"
                                     src="${pageContext.request.contextPath}/user/assets/images/${img[1].link}"/>
                            </a>
                            <div class="img__content-small">
                                <a href="MainController?action=goNewsDetails&txtID=${requestScope.BIG_NEWS_2.id}">
                                    ${requestScope.BIG_NEWS_2.name}
                                </a>
                            </div>
                        </div>
                        <div class="nav_img--item-small">
                            <a href="MainController?action=goNewsDetails&txtID=${requestScope.BIG_NEWS_3.id}">
                                <img class="navigation_img--item" width="471" height="275"
                                     src="${pageContext.request.contextPath}/user/assets/images/${img[2].link}"/>
                            </a>
                            <div class="img__content-small">
                                <a href="MainController?action=goNewsDetails&txtID=${requestScope.BIG_NEWS_3.id}">
                                    ${requestScope.BIG_NEWS_3.name}
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </c:if>
            <div class="type-travel">

                <div class="more_news">
                    <p>Đời sống sinh viên</p>
                    <a href="MainController?action=goNewsTagReadMore&txtTagID=1" class="more_news-item">Xem thêm</a>
                </div>
                <input type="radio" hidden name="dot" id="type-travel__input-one">
                <input type="radio" hidden name="dot" id="type-travel__input-two">
                <c:if test="${requestScope.LIST_TAG1 != null}">
                    <div class="grid type-travel--width">
                        <div class="row margin-10px">
                            <c:forEach items="${requestScope.LIST_TAG1}" var="tag1">
                                <c:forEach items="${sessionScope.LIST_NEWS_IMG}" var="img">
                                    <c:if test="${img.newId eq tag1.id}">
                                        <div class="col l-3 m-6 c-12">
                                            <div class="type-travel-item">
                                                <a href="MainController?action=goNewsDetails&txtID=${tag1.id}" class="type-travel__link">
                                                    <img src="${pageContext.request.contextPath}/user/assets/images/${img.link}" alt="" class="type-travel__img">
                                                </a>
                                                <div class="type-travel__intro">
                                                    <a class="type-travel__intro-link" href="MainController?action=goNewsDetails&txtID=${tag1.id}">
                                                        ${tag1.name}
                                                    </a>
                                                    <p class="type-travel__intro-text">
                                                        Ngày đăng: ${tag1.createTime}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </div>

                    </div>
                </c:if>

                <div class="more_news">
                    <p>FPT High-tech</p>
                    <a href="MainController?action=goNewsTagReadMore&txtTagID=2" class="more_news-item">Xem thêm</a>
                </div>
                <c:if test="${requestScope.LIST_TAG2 != null}">

                    <div class="grid type-travel--width">
                        <div class="row margin-10px">
                            <c:forEach items="${requestScope.LIST_TAG2}" var="tag2">
                                <c:forEach items="${sessionScope.LIST_NEWS_IMG}" var="img">
                                    <c:if test="${img.newId eq tag2.id}">
                                        <div class="col l-3 m-6 c-12">
                                            <div class="type-travel-item">
                                                <a href="MainController?action=goNewsDetails&txtID=${tag2.id}" 
                                                    class="type-travel__link">
                                                    <img src="${pageContext.request.contextPath}/user/assets/images/${img.link}" alt="" class="type-travel__img">
                                                </a>
                                                <div class="type-travel__intro">
                                                    <a class="type-travel__intro-link" 
                                                       href="MainController?action=goNewsDetails&txtID=${tag2.id}">
                                                        ${tag2.name}
                                                    </a>
                                                    <p class="type-travel__intro-text">
                                                        Ngày đăng: ${tag2.createTime}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                <div class="more_news">
                    <p>Hội nhập quốc tế</p>
                    <a href="MainController?action=goNewsTagReadMore&txtTagID=3" class="more_news-item">Xem thêm</a>
                </div>
                <c:if test="${requestScope.LIST_TAG3 != null}">
                    <div class="grid type-travel--width">
                        <div class="row margin-10px">
                            <c:forEach items="${requestScope.LIST_TAG3}" var="tag3">
                                <c:forEach items="${sessionScope.LIST_NEWS_IMG}" var="img">
                                    <c:if test="${img.newId eq tag3.id}">
                                        <div class="col l-3 m-6 c-12">
                                            <div class="type-travel-item">
                                                <a href="MainController?action=goNewsDetails&txtID=${tag3.id}" class="type-travel__link">
                                                    <img src="${pageContext.request.contextPath}/user/assets/images/${img.link}" alt="" class="type-travel__img">
                                                </a>
                                                <div class="type-travel__intro">
                                                    <a class="type-travel__intro-link" 
                                                       href="MainController?action=goNewsDetails&txtID=${tag3.id}">
                                                        ${tag3.name}
                                                    </a>
                                                    <p class="type-travel__intro-text">
                                                        Ngày đăng: ${tag3.createTime}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </div>
                    </div>
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
