<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application Details</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .container {
                margin-top: 50px;
            }
            #container {
                max-width:1000px;
                margin: 50px auto;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }
            .btn {
                margin-right: 10px;
            }
            .textarea-comment {
                width: 100%;
                margin-top: 20px;
            }
        </style>
        <script>
            function showMessage(message) {
                alert(message);
            }
        </script>
    </head>
    <body>
        <div id="container">
            <h1 class="">Application Details</h1>
            <div class="row">
                <div class="col-md-6">
                    <p><strong>Student ID:</strong> ${application.student.id}</p>
                    <p><strong>Student Name:</strong> ${application.student.name}</p>
                    <p><strong>Content:</strong> ${application.content}</p>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/trainDept/appCon" method="post">
                <input type="hidden" name="appId" value="${application.id}">
                <textarea name="comment" class="form-control textarea-comment" rows="4" placeholder="Enter your comment..."></textarea>
                <br><br/>
                <button type="submit" class="btn btn-success" name="approve" onclick="showMessage('Approve successful')">Approve</button>
                <button type="submit" class="btn btn-danger" name="reject" onclick="showMessage('Reject successful')">Reject</button>
            </form>
        </div>
    </body>
</html>