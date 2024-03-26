<%-- 
    Document   : ListStudent
    Created on : Jan 21, 2024, 8:42:22 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="model.Student" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.0.2/tailwind.min.css">
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                border: 1px solid #ddd; /* Thêm border cho toàn bộ bảng */
            }
            .container {
                width: 90%;
                margin: 0 auto; /* Để căn giữa container */
                /* Thêm các thuộc tính khác tùy theo nhu cầu */
            }
            h2{
                padding-top: 10px;
                text-align: center;
                font-family: Arial, sans-serif;
                font-size: 50px;
                font-style: initial
            }
            th,
            td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd; /* Thêm đường kẻ bên dưới mỗi ô */
                border-right: 1px solid #ddd; /* Thêm đường kẻ bên phải mỗi ô */
            }

            th:last-child,
            td:last-child {
                border-right: none; /* Loại bỏ đường kẻ bên phải của ô cuối cùng */
            }
            th.id {
                width: 30px;
            }
            th.date {
                width: 100px;
            }
            th {
                text-align: center;
            }
            td{
                text-align: center;
            }
            .toolbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin: 20px 50px;
            }

            .toolbar_left {
                display: flex;
                align-items: center;
            }

            #search-input {
                padding: 5px;
                border-radius: 4px;
                border: 1px solid #ccc;
            }

            #search-button {
                margin-left: 10px;
                padding: 5px 10px;
                background-color: #ff6633;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            #search-button:hover {
                background-color: #f15926;
            }

            .toolbar_right {
                display: flex;
                align-items: center;
            }

            #add-button {
                padding: 15px 25px;
                background-color: #4caf50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            #add-button:hover {
                background-color: #45a049;
            }
            .btn {
                width: 100px;
                height: 40px;
                border: 3px solid #ff6633;
                border-radius: 45px;
                transition: all 0.3s;
                cursor: pointer;
                background: white;
                font-size: 1.2em;
                font-weight: 250;
                font-family: 'Montserrat', sans-serif;
                margin: 5px 10px;
            }

            .btn:hover {
                background: #ff6633;
                color: white;
                font-size: 1.5em;
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
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            // L?y thông tin t? session
            String id = (session.getAttribute("id") != null) ? session.getAttribute("id").toString() : "";

//            out.print("Id: " + id);
                    %>
        <nav class="navbar">
      <div class="">
        <i class="fa-solid fa-font-awesome"></i>
        <a href="home">
            <img src="https://scontent.fhan2-4.fna.fbcdn.net/v/t1.15752-9/429122120_371367415683940_1227749304622241657_n.png?_nc_cat=100&ccb=1-7&_nc_sid=8cd0a2&_nc_eui2=AeHWaRnl9Wao6BZVgJmEE6GliSCg-Ks2z4SJIKD4qzbPhHvFwKnBKMCkQbZvhexn5-jDmGZeml1efPdtRbhyo6MZ&_nc_ohc=QTEKgxN2dE0AX_M-yCV&_nc_ht=scontent.fhan2-4.fna&oh=03_AdQ4VUozaESvFAVXjY-FEzX_GvdiL5vjx9_KiBsLQSXupA&oe=66051A69" alt="Girl in a jacket" style="width:70px;height:60px;">
        </a>
      </div>
      <div class="menu">
        <div class="menu-links">
          <a href="ListStudent">Student Manager</a>
        </div>
       <a href="../LogOut"> <button class="log-in">Log Out</button></a>
      </div>
      <div class="menu-btn">
        <i class="fa-solid fa-bars"></i>
      </div>
    </nav>
        </header>
                <div class="container">
                <table>
            <h2>List of Student</h2>
            <div class="toolbar">
                <div class="toolbar_left">
                    <form action="SearchStudent" method="post">
                        <input type="text" name="txt" id="search-input" placeholder="Search..." />
                        <button type="submit" id="search-button">Search</button>
                    </form>
                    <a href="ListStudent" ><button id="search-button">Back to list</button></a>
                </div>
                <div class="toolbar_right"> 
                    <a href="AddStudent"><button id="add-button">Add</button></a>
                </div>
            </div>
            <thead>
                <tr>
                    <th class="id">ID</th>
                    <th class="date">Name</th>
                    <th class="date">DOB</th>
                    <th class="date">Email</th>
                    <th class="date">Image</th>
                    <th class="date">Username</th>
                    <th class="date">Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Vector<Student> students = (Vector<Student>) request.getAttribute("students");
                    for (Student student : students) {
                %>
                <tr>
                    <td><%= student.getId() %></td>
                    <td><%= student.getName() %></td>
                    <td><%= student.getDob() %></td>
                    <td><%= student.getEmail() %></td>
                    <td><%= student.getImgUrl() %></td>
                    <td><%= student.getUsername() %></td>
                    <td>
                        <a href="UpdateStudent?id=<%= student.getId() %>"><button class="btn">Update</button></a>
                        <form method="post" action="DeleteStudent">
                            <input type="hidden" name="id" value="<%= student.getId() %>">
                            <button type="submit" class="btn" onclick="return confirm('Bạn có chắc chắn muốn xóa sinh viên <%= student.getId() %>')">Delete</button>
                        </form>

                    </td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
            </div>
             <section class="text-gray-700 body-font border-t border-gray-200">
        <div class="container px-5 py-24 mx-auto">
          <div class="xl:w-1/2 lg:w-3/4 w-full mx-auto text-center">
            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="inline-block w-8 h-8 text-gray-400 mb-8" viewBox="0 0 975.036 975.036">
              <path d="M925.036 57.197h-304c-27.6 0-50 22.4-50 50v304c0 27.601 22.4 50 50 50h145.5c-1.9 79.601-20.4 143.3-55.4 191.2-27.6 37.8-69.399 69.1-125.3 93.8-25.7 11.3-36.8 41.7-24.8 67.101l36 76c11.6 24.399 40.3 35.1 65.1 24.399 66.2-28.6 122.101-64.8 167.7-108.8 55.601-53.7 93.7-114.3 114.3-181.9 20.601-67.6 30.9-159.8 30.9-276.8v-239c0-27.599-22.401-50-50-50zM106.036 913.497c65.4-28.5 121-64.699 166.9-108.6 56.1-53.7 94.4-114.1 115-181.2 20.6-67.1 30.899-159.6 30.899-277.5v-239c0-27.6-22.399-50-50-50h-304c-27.6 0-50 22.4-50 50v304c0 27.601 22.4 50 50 50h145.5c-1.9 79.601-20.4 143.3-55.4 191.2-27.6 37.8-69.4 69.1-125.3 93.8-25.7 11.3-36.8 41.7-24.8 67.101l35.9 75.8c11.601 24.399 40.501 35.2 65.301 24.399z"></path>
            </svg>
            <p class="leading-relaxed text-lg"> 
            </p>
            <span class="inline-block h-1 w-10 rounded bg-indigo-500 mt-8 mb-6"></span>
            <h2 class="text-gray-900 font-medium title-font tracking-wider text-sm">Author</h2>
            <p class="text-gray-500">Online attendance system</p>
          </div>
        </div>
      </section>
    </body>
</html>
