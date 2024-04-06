<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Applications</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        
    <style>
        #container {
                max-width: 1000px;
                margin: 50px auto;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }
        .container-fluid{
            margin:0!important;
            padding: 0!important;
        }
        
        .table {
            width: 100%;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .toolbar_right {
    float: right; /* Dịch chuyển nút sang phải của thanh công cụ */
}

#add-button {
    background-color: #0394f4; 
    border: none; 
    color: white; 
    padding: 10px 20px; 
    text-align: center; 
    text-decoration: none; 
    display: inline-block; 
    font-size: 16px; 
    cursor: pointer; 
    border-radius: 20px; 
}

#add-button:hover {
    background-color: #45a049; 
}
.table1 {
        background-color: #0388f4; /* Màu nền đen đậm */
        color: white; /* Màu chữ trắng */
        border-radius: 10px; 
    }

    </style>
</head>
<body>

    <div id="container">
        <div>
            <a href="home" class="text-decoration-none text-black"><i class="fa-solid fa-house-chimney-user"></i> Back to Home</a>
        </div>
        <h1 class="mt-4">List Applications for Student: ${requestScope.student.name}</h1>
        <hr>
        <div class="toolbar_right"> 
                    <a href="createApp"><button id="add-button">Add <i class="fa-solid fa-plus"></i></button></a>
                </div>
        <br>

        <table class="table table-bordered mt-4">
    <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Content</th>
            <th>Feedback from the training department</th>
            <th>Create Date</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="application" items="${applications}">
            <tr>
                <td>${application.id}</td>
                <td>${application.content}</td>

                <td>${application.comment}</td>
                <td>
                    <fmt:formatDate value="${application.create_date}" pattern="dd-MM-yyyy" var="formattedDate" />
                    ${formattedDate}
                </td>
                <td>
                    <c:choose>
                        <c:when test="${application.isApprove}">
                            <span class="badge badge-success">Approved</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-danger">Not yet</span>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
