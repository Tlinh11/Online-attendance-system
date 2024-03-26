<%-- 
    Document   : index
    Created on : Jan 19, 2024, 8:56:04 PM
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
        <h1>Index</h1>
         <%
    String id = (session.getAttribute("id") != null) ? session.getAttribute("id").toString() : "";
    String idLectures = (session.getAttribute("idLectures") != null) ? session.getAttribute("idLectures").toString() : "";
    String idAdmin = (session.getAttribute("idAdmin") != null) ? session.getAttribute("idAdmin").toString() : "";
    String email = (session.getAttribute("email") != null) ? session.getAttribute("email").toString() : "";
    String lectureName = (session.getAttribute("lectureName") != null) ? session.getAttribute("lectureName").toString() : "";
    String phoneNumber = (session.getAttribute("phoneNumber") != null) ? session.getAttribute("phoneNumber").toString() : "";
    String address = (session.getAttribute("address") != null) ? session.getAttribute("address").toString() : "";
    String dob = (session.getAttribute("dob") != null) ? session.getAttribute("dob").toString() : "";
    String dateOfBirth = (session.getAttribute("dateOfBirth") != null) ? session.getAttribute("dateOfBirth").toString() : "";
    String idTrain = (session.getAttribute("idTrain") != null) ? session.getAttribute("idTrain").toString() : "";
    String phoneTrain = (session.getAttribute("phone") != null) ? session.getAttribute("phone").toString() : "";
    String emailTrain = (session.getAttribute("email") != null) ? session.getAttribute("email").toString() : "";
    String username = (session.getAttribute("username") != null) ? session.getAttribute("username").toString() : "";

    if (!idLectures.isEmpty()) {
        out.print("Id: " + idLectures);
        out.print("<br/>Email: " + email);
        out.print("<br/>Lecture Name: " + lectureName);
        out.print("<br/>Phone Number: " + phoneNumber);
        out.print("<br/>Address: " + address);
        out.print("<br/>Date of Birth: " + dateOfBirth);
    } else if (!idAdmin.isEmpty()) {
        out.print("Id: " + idAdmin);
        out.print("<br/>Email: " + email);
    } else if(!idTrain.isEmpty()) {
        out.print("Id: " + idTrain);
        out.print("<br/>Email: " + emailTrain);
        out.print("<br/>Phone Number: " + phoneTrain);
    }
    else {
        out.print("Id: " + id);
        out.print("<br/>Email: " + email);
        out.print("<br/>Phone Number: " + phoneNumber);
        out.print("<br/>Address: " + address);
        out.print("<br/>Date of Birth: " + dob);
        out.print("<br/>UserName: " + username);
    }
%>
    </body>
</html>