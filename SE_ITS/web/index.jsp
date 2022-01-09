<%-- 
    Document   : index
    Created on : Jan 9, 2022, 12:16:06 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Index page</h1>
        <a href="login.jsp">login</a>
        <c:if test="${sessionScope.email != null}">
            <h2>${sessionScope.email}</h2>
        </c:if>
    </body>
</html>
