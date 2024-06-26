<%-- 
    Document   : student
    Created on : Mar 10, 2024, 2:37:34 PM
    Author     : -MSI-
--%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông tin Sinh viên</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 80%;
                margin: 20px auto;
            }
            .student {
                margin-bottom: 20px;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                display: flex;
                align-items: center;
            }
            .student img {
                width: 100px;
                height: 100px;
                border-radius: 50%;
                margin-right: 20px;
            }
            .student-details {
                flex: 1;
            }
            .student h2 {
                margin-top: 0;
                color: #333;
            }
            .student p {
                margin: 5px 0;
                color: #666;
            }
            .links-container {
                display: flex;
                justify-content: flex-start;
                margin: 10px;
            }

            .link {
                text-decoration: none;
                color: #007bff;
                font-weight: bold;
                margin: 0 20px;
                padding: 10px 20px;
                border: 2px solid #007bff;
                border-radius: 5px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .link:hover {
                background-color: #007bff;
                color: #fff;
            }

        </style>
    </head>
    <body>
        <jsp:include page="../homebutton.jsp"></jsp:include>
            <div class="container">

                <h1 style="text-align: center;">User Detail</h1>

                <div class="train-details">
                    <p><strong>ID:</strong> ${requestScope.t.phone}</p>
                    <p><strong>Email:</strong> ${requestScope.t.email}</p>
            </div>
        </div>
    </body>
</html>
