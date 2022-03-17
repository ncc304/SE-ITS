<%-- 
    Document   : recruitment_content
    Created on : Feb 13, 2022, 11:12:52 AM
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
        <link rel="stylesheet" href="./assets/css/recr.css">
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
           

            <div class="wrap_content">
                <div class="main_contain">
                    <div class="heading-section padding-top-86px">
                        <div class="site_map"><a href="../Homepage/homepage.html">Trang chủ > </a><a href="./Recruitment.html">Tuyển dụng > </a><a href="#">MODERN JAVASCRIPT DEVELOPER</a></div>
                        <h3 class="sub-heading">MODERN JAVASCRIPT DEVELOPER</h3>
                        <ul class="text-info">
                            <li>- Salary: up to 10.000$</li>
                            <li>- Địa điểm: AP Tower, 518B Điện Biên Phủ, Phường 21, Quận Bình Thạnh, Thành phố Hồ Chí Minh
                            </li>
                            <li>- Kinh nghiệm: 3 năm</li>
                            <li>- Chức vụ: nhân viên</li>
                            <li>- Full time</li>
                            <li>- Skills: Javascript, Front-end, ReactJS</li>
                        </ul>
                    </div>

                    <div class="main_contain-text para-heading--two-row">
                        <p>
                            If you are looking for a company where you can show your skills in a dynamic environment, please
                            come to us! Being part of our company, you will work with a funny and happy team

                            Additionally, you will also be able to contribute your skills, experience and knowledge to other
                            project teams.
                        </p>
                    </div>
                    <h3 class="text-info">Your role & responsibilities:</h3>
                    <div class="main_contain-text para-heading--two-row">
                        <ul class="list-qualified">
                            <li>Develop custom data driven application using Newest Technology.</li>
                            <li>Operate in an Agile/Scrum Environment.</li>
                            <li>Participate in team brainstorming and design sessions.</li>
                            <li>Communicate well with all team members, non-technical as well as technical.</li>
                            <li>Suggest and give feedback within the team to improve performance and product.</li>
                        </ul>
                    </div>
                    <h3 class="text-info">Your skills & qualifications:</h3>
                    <div class="main_contain-text para-heading--two-row">
                        <ul class="list-qualified">
                            <li>Must be used to Modern Javascript (Common JS and ES6 or later)</li>
                            <li>At least 3 years of career.</li>
                            <li>Willing to learn a new thing.</li>
                            <li>Back-end: good at handling Node.js with express, nest, koa). Be used to RDMS and SQL. Be able to make the service architecture quickly on AWS.</li>
                            <li>Front-end: good at using React.js (next.js) with redux or another else. Be able to make any reusable components. Be able to make structural JSX with detail finishing.</li>
                        </ul>
                    </div>
                    <h3 class="text-info">We don’t prefer:</h3>
                    <div class="main_contain-text para-heading--two-row">
                        <ul class="list-qualified">
                            <li>Someone says I’m right always without persuading or reasonable reason.</li>
                            <li>Someone is stubborn or cynical, complain or blame without a solution.</li>
                            <li>Someone wants to be an artist: we have deadlines and limited-condition for each project and situation. We want an ‘Engineer’. Not an artist.</li>
                            <li>Communicate well with all team members, non-technical as well as technical.</li>
                            <li>Someone thinks TDD or BDD is time-wasting.</li>
                        </ul>
                    </div>
                    <h3 class="text-info">Contact:</h3>
                    <div class="main_contain-text para-heading--two-row">
                        <ul class="list-qualified">
                            <li>Phone: 09090909</li>
                            <li>Email: FPTsoftware@gmail.com</li>
                            <li>Someone wants to be an artist: we have deadlines and limited-condition for each project and situation. We want an ‘Engineer’. Not an artist.</li>
                            <li>Address: AP Tower, 518B Điện Biên Phủ, Phường 21, Quận Bình Thạnh, Thành phố Hồ Chí Minh</li>
                        </ul>
                    </div>

                </div>
                <div class="relative_news para-heading--two-row">
                    <div class="heading-section padding-top-86px">
                        <h3 class="sub-heading">Công việc khác</h3>
                    </div>
                    <div class="thumb_item">
                        <div class="figure">
                            <div class="box_img">
                                <img src="assets/images/vng.jpg" />
                            </div>
                            <div class="caption">
                                <h5>
                                    <a href="http://">Java Developer</a>
                                </h5>
                            </div>
                        </div>
                    </div>
                    <div class="thumb_item">
                        <div class="figure">
                            <div class="box_img">
                                <img src="assets/images/job1.png" />
                            </div>
                            <div class="caption">
                                <h5>
                                    <a href="http://">NodeJS developer</a>
                                </h5>
                            </div>
                        </div>
                    </div>
                    <div class="thumb_item">
                        <div class="figure">
                            <div class="box_img">
                                <img src="assets/images/job2.png" />
                            </div>
                            <div class="caption">
                                <h5>
                                    <a href="http://">Ruby on Rails Developer</a>
                                </h5>
                            </div>
                        </div>
                    </div>
                    <div class="thumb_item">
                        <div class="figure">
                            <div class="box_img">
                                <img src="assets/images/job3.png" />
                            </div>
                            <div class="caption">
                                <h5>
                                    <a href="http://">JAVA Project Leader</a>
                                </h5>
                            </div>
                        </div>
                    </div>
                    <div class="tags_news">
                        <h3>Tags</h3>
                        <button class="btn-tag">Back-end</button>
                        <button class="btn-tag">HCM</button>
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
