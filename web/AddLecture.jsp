<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.0.2/tailwind.min.css">
        <link rel="stylesheet" type="text/css" href="css/addStyles.css">
        <link rel="stylesheet" href="css/foster.css" type="text/css">
        <title>OAS Home</title>
        <style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    h1 {
        font-family: 'Poppins', sans-serif;
        color: black;
        text-align: center;
        font-size: 36px;
        margin-bottom: 20px;
    }

    form {
        max-width: 400px;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    form input {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        box-sizing: border-box;
        border: 1px solid #ccc; /* Màu viền */
        border-radius: 5px; /* Đường cong viền */
    }

    form input[type="submit"] {
        background-color: #4caf50;
        color: #fff;
        cursor: pointer;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        padding: 10px;
    }

    form input[type="submit"]:hover {
        background-color: #45a049;
    }

    /* Add more styles if needed */
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
<style>
    .flex { /*Flexbox for containers*/
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}
    .waves {
  position:relative;
  width: 100%;
  height:15vh;
  margin-bottom:-7px; 
  min-height:100px;
  max-height:150px;
}
.parallax > use {
  animation: move-forever 25s cubic-bezier(.55,.5,.45,.5)infinite;
}
.parallax > use:nth-child(1) {
  animation-delay: -2s;
  animation-duration: 7s;
}
.parallax > use:nth-child(2) {
  animation-delay: -3s;
  animation-duration: 10s;
}
.parallax > use:nth-child(3) {
  animation-delay: -4s;
  animation-duration: 13s;
}
.parallax > use:nth-child(4) {
  animation-delay: -5s;
  animation-duration: 20s;
}
@keyframes move-forever {
  0% {
   transform: translate3d(-90px,0,0);
  }
  100% { 
    transform: translate3d(85px,0,0);
  }
}
@media (max-width: 768px) {
  .waves {
    height:40px;
    min-height:40px;
  }
  .content {
    height:30vh;
  }
  h1 {
    font-size:24px;
  }
}
    </style>

    </head>
    <body>
        <nav class="navbar">
      <div class="">
        <i class="fa-solid fa-font-awesome"></i>
        <a><a href="home">
        <img src="https://scontent.fhan2-4.fna.fbcdn.net/v/t1.15752-9/429122120_371367415683940_1227749304622241657_n.png?_nc_cat=100&ccb=1-7&_nc_sid=8cd0a2&_nc_eui2=AeHWaRnl9Wao6BZVgJmEE6GliSCg-Ks2z4SJIKD4qzbPhHvFwKnBKMCkQbZvhexn5-jDmGZeml1efPdtRbhyo6MZ&_nc_ohc=QTEKgxN2dE0AX_M-yCV&_nc_ht=scontent.fhan2-4.fna&oh=03_AdQ4VUozaESvFAVXjY-FEzX_GvdiL5vjx9_KiBsLQSXupA&oe=66051A69" style="width:70px;height:60px;">
            </a>
        </div>
        <script>
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
            alert("<%= errorMessage %>");
            <% } %>
        </script>
      <div class="menu">
        <div class="menu-links">
       
<!--          <a href="timetable">Weekly Timetable</a>-->
          <a href="ListLecture">Lecture Manager</a>
        </div>
          <a href="../LogOut"> <button class="log-in">Log Out</button></a>
      </div>
      <div class="menu-btn">
        <i class="fa-solid fa-bars"></i>
      </div>
    </nav>
        <br>
        <h1>Add Lecture</h1>
        <form action="AddLecture" id="Addlec" method="post">
            ID: <input type="text" id="idL" name="id" required><br>
            Name: <input type="text" id="nameL" name="name" required><br>
            Date of Birth: <input type="date" id="dobL" name="dob" required><br>
            Email: <input type="text" id="emailL" name="email" required><br>
            <input type="submit" id="subL" value="addLecture">
        </form>
        <div class="header">

            <div>
                <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                     viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
                <defs>
                <path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
                </defs>
                <g class="parallax">
                <use xlink:href="#gentle-wave" x="48" y="0" fill="#616161" />
                <use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
                <use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)" />
                <use xlink:href="#gentle-wave" x="48" y="7" fill="#dbdbdb" />
                </g>
                </svg>
            </div>
        </div>


    </body>
</html>

