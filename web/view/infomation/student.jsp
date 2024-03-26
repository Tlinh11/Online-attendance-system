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

                <h1 style="text-align: center;">User Detail</h1>

                <div class="student">
                    <img src="../img/${requestScope.student.imgUrl}" alt="Avatar">
                <div class="student-details">
                    <h2>Login: ${requestScope.student.username}</h2>
                    <h2>${requestScope.student.name}</h2>
                    <p><strong>ID:</strong> ${requestScope.student.id}</p>
                    <p><strong>Date of Birth:</strong> ${requestScope.student.dob}</p>
                    <p><strong>Email:</strong> ${requestScope.student.email}</p>
                </div>
            </div>



        </div>


    </body>
</html>
