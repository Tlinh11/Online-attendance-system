<%-- 
    Document   : checkAttendance
    Created on : Mar 10, 2024, 2:52:25 PM
    Author     : -MSI-
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            .container {
        width: 90%;
        margin: 0 auto; 
    }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            .absent {
                background-color: #ffcccc;
            }


            .present {
                background-color: #ccffcc;
            }
            a {
                text-decoration: none;
                color: #333;
                display: inline-block;
                margin-bottom: 10px;
            }
            a:hover {
                color: #007bff;
            }


            .term-link, .course-link {
                padding: 10px 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f8f9fa;
                transition: all 0.3s ease;
            }


            .term-link:hover, .course-link:hover {
                background-color: #e9ecef;
            }
            #active${requestScope.active}{
                color:red;
            }
            #activecourse${requestScope.activeCourse}{
                color:red;
            }
            a:hover {
                background-color: #45a049;
            }
            .container-header{
                text-align: center;
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
        <br><br>

        <div class="container-header">
            <c:forEach items="${requestScope.term}" var="t"> 
                <a id="active${t.term.id}" href="checkabsent?term=${t.term.id}">
                    <div class="term-link">${t.term.description}</div>

                </a>
            </c:forEach>



        <br/>
     
            <c:forEach items="${requestScope.courseByTerm}" var="c">
                <a id="activecourse${c.course.id}" href="checkabsent?term=${requestScope.termid}&course=${c.course.id}">
                    <div class="course-link">${c.course.code}</div>
                </a>
            </c:forEach>
        </div>

<div class="container">
        <br/>
        <br/>
        <br/>
        <br/>
        <table>
            <thead>
            <th>No</th>
            <th>Date</th>
            <th>Slot</th>
            <th>Room</th>
            <th>Lecture</th>
            <th>Group</th>
            <th>Attendance Status</th>
            <th>Lecture comment</th>
        </thead>
        <tbody>
            <c:forEach items="${requestScope.attendance}" var="a" varStatus="loop">
                <tr>
                    <td>${loop.index +1}</td>
                    <td>${a.session.date}</td>
                    <td>${a.session.group.timeslot.id}</td>
                    <td>${a.session.group.room.description}</td>
                    <td>${a.session.group.teacher.name}</td>
                    <td>${a.session.group.name}</td>
                    <c:choose>
                        <c:when test="${a.status eq true}">
                            <td class="present">Present</td>
                        </c:when>
                        <c:when test="${a.status eq false}">
                            <td class="absent">Absent</td>
                        </c:when>
                        <c:otherwise>
                            <td style="background-color: #ccc;">Future</td>
                        </c:otherwise>
                    </c:choose>


                    <td>${a.description}</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="7"><h1>ABSENT: ${requestScope.percent}% ABSENT SO FAR (${requestScope.absent} ABSENT ON ${requestScope.total} TOTAL).</h1></td>
            </tr>
        </tbody>

    </table>
</div>
</body>
</html>
