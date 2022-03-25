<%-- 
    Document   : login
    Created on : Jan 9, 2022, 12:16:58 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
    </head>
    <body>
        <h1>login page</h1>
        <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/SE_ITS/LoginGoogleServlet&response_type=code
    &client_id=271591125288-cfqpinm6g112ddkbh2v0da5oo5d2g0ig.apps.googleusercontent.com&approval_prompt=force">
            <img src="https://freesvg.org/img/1534129544.png" height="80px" width="80px"/>
            Login with Google
        </a>
    </body>
</html>-->

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Document</title>
        <style>
            body{
                background: url(/SE_ITS/user/assets/images/bg-login.jpg);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="wrapper">
                <div class="form_container">
                    <img class="login-form-title" src="${pageContext.request.contextPath}/user/assets/images/tải xuống.png" style="position: static;"> </img>
                    <div class="container-login-form-btn">
                        
                        <a class="login-form-btn" style="text-decoration: none"
                           href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/SE_ITS/LoginGoogleServlet&response_type=code
                           &client_id=271591125288-cfqpinm6g112ddkbh2v0da5oo5d2g0ig.apps.googleusercontent.com&approval_prompt=force">
                            Login with Google
                            <i class="fab fa-google"></i>
                            <%--<c:param name="txtID" value="${requestScope.txtID}"/>--%>
                            
                            <!--<input type="hidden" name="txtID" value="$ {param.txtID}"/>-->
                        </a>
                        <c:if test="${sessionScope.XACTHUC != null}">
                            
<!--                            <div class="xacthuc">
                                <p style="color: red; margin: 2.5% 1%; position: absolute;">
                                    Thông báo: $ {sessionScope.XACTHUC}
                                </p>
                            </div>-->
                        </c:if>
                        
                    </div>                    
                </div>
            </div>
                   
            <div class="wrap_img">
                <img class="img_login" src="${pageContext.request.contextPath}/user/assets/images/bg-form-login.jpg"/>
                
            </div>
        </div>
    </body>
</html>
