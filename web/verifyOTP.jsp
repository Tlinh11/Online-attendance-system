<%-- 
    Document   : verifyOTP
    Created on : Jan 22, 2024, 7:14:10 PM
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

            input[type="text"] {
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
        <h2>Enter OTP</h2>

        <%
            String error = (String)request.getAttribute("error");
            if (error != null) {
        %>
        <p style="color: red;"><%= error %></p>
        <%
            }
        %>

        <form action="verifyOTP" method="post">
            <label for="otp">OTP:</label>
            <input type="text" id="otp" name="otp" required>
            <br>
            <input type="submit" value="Verify OTP">
        </form>
    </body>
</html>
