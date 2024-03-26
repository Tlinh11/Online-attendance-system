<%-- 
    Document   : forgotPassword
    Created on : Jan 22, 2024, 6:04:14 PM
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

            input[type="text"], input[type="email"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            button {
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                border: none;
                color: #fff;
                background-color: #007BFF;
                cursor: pointer;
            }

            button:hover {
                background-color: #0056b3;
            }

            p {
                text-align: center;
                margin: 10px 0;
            }

        </style>
    </head>
    <body>
        <h2>Forgot Password</h2>

        <%-- Hiển thị thông báo lỗi nếu có --%>
        <% String error = (String)request.getAttribute("error"); %>
        <% if (error != null && !error.isEmpty()) { %>
        <p style="color: red;"><%= error %></p>
        <% } %>

        <%-- Hiển thị thông báo thành công nếu có --%>
        <% String mess = (String)request.getAttribute("mess"); %>
        <% if (mess != null && !mess.isEmpty()) { %>
        <p style="color: green;"><%= mess %></p>
        <% } %>

        <%-- Form để nhập thông tin --%>
        <form action="forgotPassword" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>

            <button type="submit">Submit</button>
        </form>
    </body>
</html>
