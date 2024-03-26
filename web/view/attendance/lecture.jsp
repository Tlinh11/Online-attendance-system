<%-- 
    Document   : lecture
    Created on : Feb 16, 2024, 9:10:59 PM
    Author     : -MSI-
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Điểm danh Sinh viên</title>
        <style>
            /* Styling cho table */
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }
            th {
                background-color: #f2f2f2;
            }
            /* Styling cho ảnh sinh viên */
            img {
                max-width: 100px;
                height: auto;
            }
            /* Styling cho ô radio */
            input[type="radio"] {
                margin-right: 10px;
            }
            #submit{
                padding:10px;
                margin:30px 0;
            }
            .footer {
                background-color: #ef9926;
                color: white;
                font-weight: bold;

                font-size: 20px;
                width: 100%;
                height: 100px;
                text-align: center;
                padding: 20px;
                position: relative;
                bottom: 0;
            }
            #submitAtd{
                text-align: center;
            }
            .header-attendance{
                font-size: 50px;
                text-align: center;
            }
            .home a {
                color: rgb(13, 90, 235);
                font-size: 25px;
                padding: 5px 10px;
            }
            .home {
                padding: 10px;
                border-radius: 5px;
                margin: 25px 0;
            }
            .container {
        width: 90%;
        margin: 0 auto; 
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
        <div class="menu-links">
<!--          <a href="ListLecture">Lecture Manager</a>-->
        </div>
       <a href="../LogOut"> <button class="log-in">Log Out</button></a>
      </div>
      <div class="menu-btn">
        <i class="fa-solid fa-bars"></i>
      </div>
    </nav>
      
        <div class="container">

            <h2 class="header-attendance">Điểm danh Sinh viên</h2>
            <form action="attendance" method="post">
                <table>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>Group</th>
                            <th>StudentID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Attendance Status</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${requestScope.list}" var="s" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${s.session.group.name}</td>
                                <td>${s.student.id}</td>
                                <td>${s.student.name}</td>                                  

                                <td><img src="../img/${s.student.imgUrl}" alt="Student image"></td>
                                <td>
                                    <c:if test="${s.session.status eq 1}">
                                        <label><input type="radio" name="attendance${s.student.id}" value="present" ${s.status eq 'true' ? 'checked' : ''}> Present</label>
                                        <label><input type="radio" name="attendance${s.student.id}" value="absent" ${s.status eq 'false' ? 'checked' : ''}> Absent</label>
                                        </c:if>

                                    <c:if test="${s.session.status eq 0}">
                                        <label><input type="radio" name="attendance${s.student.id}" value="present"> Present</label>
                                        <label><input type="radio" name="attendance${s.student.id}" value="absent"> Absent</label>
                                        </c:if>

                                </td>
                                <td>
                                    <input type="text" name="description${s.student.id}" value="${s.description}">
                                </td>

                        <input type="hidden" value="${s.session.id}" name="sessionid"/>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div id="submitAtd">
                    <input type="submit" id ="submit" value ="Save">
                </div>
            </form>


        </div>
        <div class="footer">
            <p>FPT UNIVERSITY</p>
            <span>DAI HOC FPT HA NOI</span>
        </div>
        <script>

        </script>
    </body>
</html>

