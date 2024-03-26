<%-- 
    Document   : sendFeedbackToStudent
    Created on : Feb 20, 2024, 3:51:42 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
    </head>
    <body>
        <%String idLectures = request.getParameter("idLectures");%>
        
        <form action="SendFeedBackToStudent" method="post">
        <label for="content">Content:</label><br>
        <textarea id="content" name="content" rows="4" cols="50"></textarea><br>
        
        <input type="submit" value="Send Feedback">
        </form>
    </body>
</html>
