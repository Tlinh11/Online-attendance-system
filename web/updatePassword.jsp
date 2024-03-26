<%-- 
    Document   : updatePassword
    Created on : Jan 22, 2024, 7:44:14 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f0f0f0;
            }

            h2 {
                text-align: center;
                color: #333;
            }

            form {
                width: 300px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
                margin-top: 50px;
            }

            label {
                display: block;
                margin: 10px 0;
            }

            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            input[type="submit"] {
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                border: none;
                color: #fff;
                background-color: #007BFF;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            p {
                text-align: center;
                margin: 10px 0;
            }

        </style>
    </head>
    <body>
        <h2>Update Password</h2>

        <!-- Hiển thị thông báo lỗi nếu có -->
        <% String error = (String)request.getAttribute("error"); %>
        <% if (error != null && !error.isEmpty()) { %>
        <p style="color: red;"><%= error %></p>
        <% } %>

        <!-- Hiển thị thông báo thành công nếu có -->
        <% String successMessage = (String)request.getAttribute("successMessage"); %>
        <% if (successMessage != null && !successMessage.isEmpty()) { %>
        <p style="color: green;"><%= successMessage %></p>
        <% } %>

        <!-- Hiển thị form update password -->
        <form action="updatePassword" method="post">
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
            <input type="hidden" name="username" value="${username}">
            <br>
            <input type="submit" value="Update Password">
        </form>

    </body>
</html>
