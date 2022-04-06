<%-- 
    Document   : eventDetail
    Created on : Mar 14, 2022, 8:43:19 AM
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
        <title>News Details</title>
        <link rel="icon" type="image/x-icon"
              href="${pageContext.request.contextPath}/user/assets/images/Những-thông-điệp-sâu-sắc-phía-sau-logo-FPT.png" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/content.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link
            href="https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&family=Poppins:wght@300;500;700&family=Roboto:wght@400;500;700&family=Satisfy&display=swap"
            rel="stylesheet">
        <c:if test="${requestScope.MSG eq 'DKTUVAN_SUCCESS'}">
            <script>
                window.alert("Cám ơn bạn đã quan tâm đến trường đại học FPTU! Chúng tôi sẽ liên hệ với bạn trong vòng 24h.");
            </script>
        </c:if>
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
            .relative_news::after{
                content: "";
                display: block;
                position: absolute;
                width: 1px;
                height: 59%;
                background-color: #979797;
                right: 339px;
                top: 30%;
                /* transform: translateY(-50%); */
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

            <div class="wrap_content">
                <div class="main_contain">

                    <div class="heading-section padding-top-86px">

                        <div class="site_map" style="width: auto">
                            <a href="${pageContext.request.contextPath}/user/home.jsp" 
                               style="font-size: 1.30em;">
                                Trang chủ › 
                            </a>
                            <a href="${pageContext.request.contextPath}/MainController?action=goNewsUser" 
                               style="font-size: 1.30em; color: #0882d9">
                                Tin tức 
                            </a>
                            <c:if test="${requestScope.TAG_ID.newTagId eq 4}">
                                <a href="MainController?action=goNewsTagReadMore&txtTagID=1" style="font-size: 1.30em;">› Đời sống sinh viên </a>
                            </c:if>
                            <c:if test="${requestScope.TAG_ID.newTagId eq 5}">
                                <a href="MainController?action=goNewsTagReadMore&txtTagID=2" style="font-size: 1.30em;">› FPT High-tech </a>
                            </c:if>
                            <c:if test="${requestScope.TAG_ID.newTagId eq 6}">
                                <a href="MainController?action=goNewsTagReadMore&txtTagID=3" style="font-size: 1.30em;">› Hội nhập quốc tế </a>
                            </c:if>
                            <a href="#" style="font-size: 1.30em;">› ${requestScope.NEWS_DETAIL.name}</a> 
                            <div class="pubDate" style="float: right; font-size: 1.30em;">
                                <div class="view" style="margin-left: 73%; position: relative">
                                    <span class="viewIcon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16" style="color: gray;">
                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                                        </svg>
                                    </span>
                                    <span class="viewNum" style="font-size: 14px; position: absolute; bottom: 4px; right: 4px;">
                                        ${requestScope.NEWS_DETAIL.view}
                                    </span>
                                </div>
                                <br/>
                                &ensp; ${requestScope.NEWS_DETAIL.createTime} 
                            </div>

                        </div>
                        <h3 class="sub-heading">${requestScope.NEWS_DETAIL.name}</h3>   
                        <!--                    <ul class="text-info">
                                                <li>Ngày đăng: $ {requestScope.NEWS_DETAIL.createTime}</li>
                                                <li>Địa điểm: đại học FPT - HCM</li>
                                            </ul>-->
                    </div>

                    <div class="main_contain-text para-heading--two-row">
                        <p>
                            ${requestScope.NEWS_DETAIL.content}
                        </p>
                    </div>
                    <br/>
                    
                </div>

                <div class="relative_news para-heading--two-row" style="margin-left: auto">

                    <div class="heading-section padding-top-86px">
                        <h3 class="sub-heading">Tin Tức gần đây</h3>
                    </div>
                    <c:if test="${requestScope.LIST4_RECENT != null}">
                        <c:forEach items="${requestScope.LIST4_RECENT}" var="list4">
                            <c:forEach items="${sessionScope.LIST_NEWS_IMG}" var="img">
                                <c:if test="${img.newId eq list4.id}">
                                    <div class="thumb_item">
                                        <div class="figure">
                                            <div class="box_img">
                                                <a href="MainController?action=goNewsDetails&txtID=${list4.id}">
                                                    <img src="${pageContext.request.contextPath}/user/assets/images/${img.link}"/>
                                                </a>
                                            </div>
                                            <div class="caption">
                                                <h5>
                                                    <a href="MainController?action=goNewsDetails&txtID=${list4.id}">
                                                        ${list4.name}
                                                    </a>
                                                    <br/>
                                                    <p style="font-size: 11px; font-style: italic;">
                                                        ${list4.createTime}
                                                    </p>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </c:if>
                    <div class="tags_news">
                        <h3>Tags</h3>
                        <a class="btn-tag" 
                           style="text-decoration: none;"
                           href="${pageContext.request.contextPath}/MainController?action=goNewsUser">
                            Tin tức
                        </a>
                        <c:if test="${requestScope.TAG_ID.newTagId eq 4}">
                            <a class="btn-tag" 
                               style="text-decoration: none;"
                               href="${pageContext.request.contextPath}/MainController?action=goNewsTagReadMore&txtTagID=1">
                                Đời sống sinh viên
                            </a>
                        </c:if>
                        <c:if test="${requestScope.TAG_ID.newTagId eq 5}">
                            <a class="btn-tag" 
                               style="text-decoration: none;"
                               href="${pageContext.request.contextPath}/MainController?action=goNewsTagReadMore&txtTagID=2">
                                FPT High-tech
                            </a>
                        </c:if>
                        <c:if test="${requestScope.TAG_ID.newTagId eq 6}">
                            <a class="btn-tag" 
                               style="text-decoration: none;"
                               href="${pageContext.request.contextPath}/MainController?action=goNewsTagReadMore&txtTagID=3">
                                Hội nhập quốc tế
                            </a>
                        </c:if>

                        <!--                        <button class="btn-tag">Back-end</button>
                                                <button class="btn-tag">HCM</button>-->
                    </div>
                </div>
            </div>
            <br/> 

            <div class="footer">
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
                                            <input type="hidden" name="txtType" value="newsDetail"/>
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
