<%-- 
    Document   : ListFeedbackByStudentId
    Created on : Feb 28, 2024, 8:13:31 AM
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
        /* CSS cho trang */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .container {
        width: 90%;
        margin: 0 auto; 
    }
        h1 {
            background-color: #ff6633;
            color: white;
            padding: 10px;
            text-align: center;
        }
        p {
            margin-top: 20px;
            margin-bottom: 10px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #ff6633;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        a {
            text-decoration: none;
            color: #ff6633;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
            <style>

      *,
      *::before,
      *::after {
        box-sizing: border-box;
      }

      body {
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
        font-family: "Ubuntu", sans-serif;
      }

      a {
        text-decoration: none;
      }

      button {
        border: 0;
        outline: none;
        font-family: inherit;
        font-size: inherit;
        cursor: pointer;
      }

      .navbar {
        height: 90px;
        background-color: hsl(0, 0%, 10%);
        padding: 20px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .navbar .logo i {
        color: #0aa5ff;
        font-size: 22px;
      }

      .navbar .logo a {
        font-size: 24px;
        font-weight: 700;
        color: white;
        margin-left: 12px;
      }

      .menu {
        display: flex;
        align-items: center;
        gap: 32px;
      }

      .menu-links {
        display: flex;
        gap: 24px;
        border-right: 1px solid #999999;
        padding-inline: 24px;
      }

      .menu-links a {
        font-weight: 500;
        color: #999999;
        padding: 8px 16px;
      }

      .menu-links a:hover {
        color: white;
      }

      .log-in {
        font-weight: 500;
        padding: 12px 22px;
        background-color: transparent;
        color: #999999;
        border-radius: 10px;
        border: 2px solid #0aa5ff;
        transition: 0.2s;
      }

      .log-in:hover {
        background-color: #0aa5ff;
        color: white;
      }

      .menu-btn {
        font-size: 32px;
        color: white;
        display: none;
        cursor: pointer;
      }

      @media (max-width: 53rem) {
        .menu {
          display: none;
        }

        .menu-btn {
          display: block;
        }
      }
    </style>
    </head>
    <body>
        <nav class="navbar">
      <div class="">
        <i class="fa-solid fa-font-awesome"></i>
        <a href="home">
            <img src="https://scontent.fhan2-4.fna.fbcdn.net/v/t1.15752-9/429122120_371367415683940_1227749304622241657_n.png?_nc_cat=100&ccb=1-7&_nc_sid=8cd0a2&_nc_eui2=AeHWaRnl9Wao6BZVgJmEE6GliSCg-Ks2z4SJIKD4qzbPhHvFwKnBKMCkQbZvhexn5-jDmGZeml1efPdtRbhyo6MZ&_nc_ohc=QTEKgxN2dE0AX_M-yCV&_nc_ht=scontent.fhan2-4.fna&oh=03_AdQ4VUozaESvFAVXjY-FEzX_GvdiL5vjx9_KiBsLQSXupA&oe=66051A69" alt="Girl in a jacket" style="width:70px;height:60px;">
        </a>
      </div>
      <div class="menu">
       
       <a href="../LogOut"> <button class="log-in">Log Out</button></a>
      </div>
      <div class="menu-btn">
        <i class="fa-solid fa-bars"></i>
      </div>
    </nav>
        <div class="container">
        <h1>Feedback List</h1>
        <%
    String idLectures = request.getParameter("idLectures");
%>
<p>Lecture ID: <%= idLectures %></p>
    <table>
        <tr>
            <th>FeedBack ID</th>
            <th>Student ID</th>
            <th>Content</th>
            <th>Date</th>
            <th>Update feedback</th>
        </tr>
        <c:forEach var="feedback" items="${feedbackList}">
            <tr>
                <td>${feedback.id}</td>
                <td>${feedback.studentId}</td>
                <td>${feedback.content}</td>
                <td>${feedback.date}</td>
                <td><a href="UpdateFeedback?idFeedBack=${feedback.id}&idStudents=${feedback.studentId}&idLectures=<%= idLectures %>">Update feedback</a></td>
            </tr>
        </c:forEach>
    </table>
    </div>
    </body>
</html>
