<%-- 
    Document   : UpdateFeedback
    Created on : Feb 28, 2024, 8:30:24 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="UpdateFeedback" method="post">
        <input type="hidden" id="idStudents" name="idStudents" value="${param.idStudents}">
        <input type="hidden" id="idLectures" name="idLectures" value="${param.idLectures}">
        <label for="content">Content:</label><br>
        <textarea id="content" name="content" rows="4" cols="50"></textarea><br>
        <input type="submit" value="Send Feedback">
    </form>
    </body>
</html>
