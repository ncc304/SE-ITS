<%-- 
    Document   : event_online
    Created on : Mar 10, 2022, 11:35:34 PM
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
        <title>News Read More</title>
        <c:if test="${requestScope.MSG eq 'DKTUVAN_SUCCESS'}">
            <script>
                window.alert("Cám ơn bạn đã quan tâm đến trường đại học FPTU! Chúng tôi sẽ liên hệ với bạn trong vòng 24h.");
            </script>
        </c:if>
        <style>
            .search-name{
                width: 280px;
                height: 36px;
                border-radius: 5px;
                border: 1px solid #ccc;
                box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
                margin-right: 10px;
            }
            .search-name:focus{
                outline-color: rgb(71, 98, 250);
            }
            .btn-search{
                width: 100px;
                height: 28px;
                background-color: #003380;
                color: #fff;
                border-radius: 5px;
                border: none;
                margin-right: 15px;

            }
            .btn-search:hover{
                opacity: 0.8;
                cursor: pointer;
            }
            .search_form{
                float: right;
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

            <!--TAG 1-->
            <div class="slider">
                <div class="banner banner--1">
                    <img src="${pageContext.request.contextPath}/user/assets/images/news.jpg" alt="Friend" class="banner__img">
                </div>
                <div class="banner__content">
                    <h2>Tin Tức</h2>
                </div>
            </div> 

            <c:if test="${requestScope.txtTagID eq 1}">      
                <div class="type-travel">

                    <div class="grid wide">
                        <div class="heading-section padding-top-86px">
                            <div class="site_map" style="width: auto">
                                <a href="${pageContext.request.contextPath}/user/home.jsp" style="font-size: 1.30em ">Trang chủ › </a>
                                <a href="${pageContext.request.contextPath}/MainController?action=goNewsUser" 
                                   style="font-size: 1.30em; color: #0882d9">
                                    Tin Tức 
                                </a>
                                <a href="#" 
                                   style="font-size: 1.30em ">
                                    › Đời sống sinh viên
                                </a>
                            </div> 
                            <h3 class="sub-heading">Danh Sách Các Tin Tức Đời Sống Sinh Viên Gần Đây</h3>
                        </div>
                    </div> 

                    <form action="MainController">
                        <div class="search_form">
                            <input placeholder="Tìm kiếm theo Tên" type="text" class="search-name" name="searchName"></input>
                            <button type="submit" class="btn-search" name="action" value="Search_News_By_Name">Tìm kiếm</button>
                            <input type="hidden" name="txtTagID" value="1" />
                        </div>
                    </form>

                    <input type="radio" hidden name="dot" id="type-travel__input-one">
                    <input type="radio" hidden name="dot" id="type-travel__input-two">

                    <c:if test="${requestScope.TAG_READMORE != null}">
                        <div class="grid type-travel--width" style="flex-direction: column; flex-wrap: wrap;">
                            <div class="row margin-10px">
                                <c:forEach items="${requestScope.TAG_READMORE}" var="tag">
                                    <c:forEach items="${sessionScope.LIST_NEWS_IMG}" var="img">
                                        <c:if test="${tag.id eq img.newId}">
                                            <div class="col l-3 m-6 c-12">
                                                <div class="type-travel-item">
                                                    <a href="MainController?action=goNewsDetails&txtID=${tag.id}" class="type-travel__link">
                                                        <img src="${pageContext.request.contextPath}/user/assets/images/${img.link}" alt="" class="type-travel__img">
                                                    </a>
                                                    <div class="type-travel__intro">
                                                        <a class="type-travel__intro-link" 
                                                           href="MainController?action=goNewsDetails&txtID=${tag.id}">
                                                            ${tag.name}
                                                        </a>
                                                        <p class="type-travel__intro-text">
                                                            Ngày đăng: ${tag.createTime}
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
            </c:if>  

            <!--TAG 2-->
            <c:if test="${requestScope.txtTagID eq 2}">                    
                <div class="type-travel">
                    <div class="grid wide">
                        <div class="heading-section padding-top-86px">
                            <div class="site_map" style="width: auto">
                                <a href="${pageContext.request.contextPath}/user/home.jsp" style="font-size: 1.30em ">Trang chủ › </a>
                                <a href="${pageContext.request.contextPath}/MainController?action=goNewsUser" 
                                   style="font-size: 1.30em; color: #0882d9">
                                    Tin Tức 
                                </a>
                                <a href="#" 
                                   style="font-size: 1.30em ">
                                    › FPT High-tech
                                </a>
                            </div> 
                            <h3 class="sub-heading">Danh Sách Các Tin Tức FPT High-tech Gần Đây</h3>
                        </div>
                    </div>
                    <form action="MainController">
                        <div class="search_form">
                            <input placeholder="Tìm kiếm theo Tên" type="text" class="search-name" name="searchName"></input>
                            <button type="submit" class="btn-search" name="action" value="Search_News_By_Name">Tìm kiếm</button>
                            <input type="hidden" name="txtTagID" value="2" />
                        </div>
                    </form>
                    <input type="radio" hidden name="dot" id="type-travel__input-one">
                    <input type="radio" hidden name="dot" id="type-travel__input-two">

                    <c:if test="${requestScope.TAG_READMORE != null}">
                        <div class="grid type-travel--width" style="flex-direction: column; flex-wrap: wrap;">
                            <div class="row margin-10px">
                                <c:forEach items="${requestScope.TAG_READMORE}" var="tag">
                                    <c:forEach items="${sessionScope.LIST_NEWS_IMG}" var="img">
                                        <c:if test="${tag.id eq img.newId}">
                                            <div class="col l-3 m-6 c-12">
                                                <div class="type-travel-item">
                                                    <a href="MainController?action=goNewsDetails&txtID=${tag.id}" class="type-travel__link">
                                                        <img src="${pageContext.request.contextPath}/user/assets/images/${img.link}" alt="" class="type-travel__img">
                                                    </a>
                                                    <div class="type-travel__intro">
                                                        <a class="type-travel__intro-link" 
                                                           href="MainController?action=goNewsDetails&txtID=${tag.id}">
                                                            ${tag.name}
                                                        </a>
                                                        <p class="type-travel__intro-text">
                                                            Ngày đăng: ${tag.createTime}
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
            </c:if>  

            <!--TAG 3-->
            <c:if test="${requestScope.txtTagID eq 3}">                    
                <div class="type-travel">
                    <div class="grid wide">
                        <div class="heading-section padding-top-86px">
                            <div class="site_map" style="width: auto">
                                <a href="${pageContext.request.contextPath}/user/home.jsp" style="font-size: 1.30em ">Trang chủ › </a>
                                <a href="${pageContext.request.contextPath}/MainController?action=goNewsUser" 
                                   style="font-size: 1.30em; color: #0882d9">
                                    Tin Tức 
                                </a>
                                <a href="#" 
                                   style="font-size: 1.30em ">
                                    › Hội nhập quốc tế
                                </a>
                            </div>
                            <h3 class="sub-heading">Danh Sách Các Tin Tức Hội Nhập Quốc Tế Gần Đây</h3>
                        </div>
                    </div> 
                    <form action="MainController">
                        <div class="search_form">
                            <input placeholder="Tìm kiếm theo Tên" type="text" class="search-name" name="searchName"></input>
                            <button type="submit" class="btn-search" name="action" value="Search_News_By_Name">Tìm kiếm</button>
                            <input type="hidden" name="txtTagID" value="3" />
                        </div>
                    </form>
                    <input type="radio" hidden name="dot" id="type-travel__input-one">
                    <input type="radio" hidden name="dot" id="type-travel__input-two">

                    <c:if test="${requestScope.TAG_READMORE != null}">
                        <div class="grid type-travel--width" style="flex-direction: column; flex-wrap: wrap;">
                            <div class="row margin-10px">
                                <c:forEach items="${requestScope.TAG_READMORE}" var="tag">
                                    <c:forEach items="${sessionScope.LIST_NEWS_IMG}" var="img">
                                        <c:if test="${img.newId eq tag.id}">
                                            <div class="col l-3 m-6 c-12">
                                                <div class="type-travel-item">
                                                    <a href="MainController?action=goNewsDetails&txtID=${tag.id}" class="type-travel__link">
                                                        <img src="${pageContext.request.contextPath}/user/assets/images/${img.link}" alt="" class="type-travel__img">
                                                    </a>
                                                    <div class="type-travel__intro">
                                                        <a class="type-travel__intro-link" 
                                                           href="MainController?action=goNewsDetails&txtID=${tag.id}">
                                                            ${tag.name}
                                                        </a>
                                                        <p class="type-travel__intro-text">
                                                            Ngày đăng: ${tag.createTime}
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
            </c:if>  

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
                                        <input type="hidden" name="txtType" value="newsReadMore"/>
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
