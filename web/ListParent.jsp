<%-- 
    Document   : ListParent
    Created on : Jan 21, 2024, 9:03:49 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="model.Parent" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Email</th>
            <th>Password</th>
            <th>Username</th>
            <th>Job</th>
            <th>Place of Work</th>
        </tr>
        <% 
            Vector<Parent> parents = (Vector<Parent>) request.getAttribute("parent");
            for (Parent parent : parents) {
        %>
            <tr>
                <td><%= parent.getId() %></td>
                <td><%= parent.getName() %></td>
                <td><%= parent.getAdd() %></td>
                <td><%= parent.getEmail() %></td>
                <td><%= parent.getPass() %></td>
                <td><%= parent.getUserName() %></td>
                <td><%= parent.getJob() %></td>
                <td><%= parent.getPlaceOfWork() %></td>
            </tr>
        <% 
            }
        %>
    </table>
    </body>
</html>
