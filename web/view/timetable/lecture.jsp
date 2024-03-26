<%-- 
    Document   : studentTimeTB
    Created on : Feb 16, 2024, 11:07:29 AM
    Author     : -MSI-
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .body {
            margin: 0;
            padding: 0;
        }
        /* Add your CSS styles here */
        .container {
        width: 90%;
        margin: 0 auto; 
    }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        .no-timetable {
            margin-top: 30px;
            text-align: center;
            font-size: 30px;
        }
        #header-timetable {
            text-align: center;
            font-size: 50px;
        }
        th,
        td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
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
        .attendanced {
            color: blue;

        }

        .take-attendance {
            color: red;
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
        <div>
            <h2 id="header-timetable">Lecture Time Table</h2>
        </div>
        <div>
            <label for="year">Select Year:</label>
            <select id="year">
                <option value="2022">2022</option>
                <option value="2023" >2023</option>
                <option value="2024" selected>2024</option>
                <option value="2025">2025</option>
            </select>
            <label for="week">Select Week:</label>
            <select id="week"></select>
        </div>
        <div id="timetable"></div>

        <script>
            var yearElement = document.querySelector("#year");
            var weekElement = document.querySelector("#week");
            var timetableContainer = document.getElementById("timetable");

            function updateWeeks() {
                var selectedYear = yearElement.value;
                var weeksInYear = getWeeksInYear(selectedYear);

                // Clear existing options
                weekElement.innerHTML = "";

                // Populate weeks
                for (var i = 1; i <= weeksInYear; i++) {
                    var weekRange = getWeekRange(selectedYear, i);
                    var option = document.createElement("option");
                    option.value = i;
                    option.text =
                            "Week " +
                            i +
                            ": " +
                            ("0" + weekRange.start.getDate()).slice(-2) +
                            "-" +
                            ("0" + (weekRange.start.getMonth() + 1)).slice(-2) +
                            " to " +
                            ("0" + weekRange.end.getDate()).slice(-2) +
                            "-" +
                            ("0" + (weekRange.end.getMonth() + 1)).slice(-2);
                    weekElement.add(option);
                }

                // Update timetable when weeks change
                updateTimetable();
            }

            function updateTimetable() {
                var selectedYear = yearElement.value;
                var selectedWeek = weekElement.value;

                timetableContainer.innerHTML = "";

                var timetableData = getTimetableData(selectedYear, selectedWeek);
                if (timetableData.length === 0) {
                    timetableContainer.innerHTML = `<div class="no-timetable">No timetable available for the selected week and year</div>`;
                    return;
                }

                var table = document.createElement("table");
                var headerRow = table.insertRow();

                var headers = ["Date", "Time Slot", "Course", "Group", "Room", "Attendance Status"];

                headers.forEach(function (headerText) {
                    var headerCell = document.createElement("th");
                    headerCell.textContent = headerText;
                    headerRow.appendChild(headerCell);
                });


                for (let entry of timetableData) {
                    const row = table.insertRow();
                    for (let key of ["date", "timeSlot", "course", "group", "room"]) {
                        const cell = row.insertCell();
                        cell.textContent = entry[key];
                    }

                    // Create a link for attendance status
                    const statusCell = row.insertCell();
                    const statusLink = document.createElement("a");
                    statusLink.textContent = entry["attendanceStatus"];

                    statusLink.href = "../lecture/attendance?sessionid=" + entry["sessionId"];

                    // Sẽ được thay đổi sau
                    statusLink.className = entry["attendanceStatus"] === "attendanced" ? "attendanced" : "take-attendance";
                    statusLink.addEventListener("click", function () {
                        // Redirect to another page when status is clicked
                        redirectToAttendancePage(entry["attendanceStatus"]);
                    });
                    statusCell.appendChild(statusLink);
                }


                timetableContainer.appendChild(table);
            }

            // Function to get the week number from a date
            Date.prototype.getWeek = function () {
                var date = new Date(this.getTime());
                date.setHours(0, 0, 0, 0);
                date.setDate(date.getDate() + 3 - ((date.getDay() + 6) % 7));
                var week1 = new Date(date.getFullYear(), 0, 4);
                return (
                        1 +
                        Math.round(
                                ((date.getTime() - week1.getTime()) / 86400000 -
                                        3 +
                                        ((week1.getDay() + 6) % 7)) /
                                7
                                )
                        );
            };

            // Function to get the number of weeks in a year
            function getWeeksInYear(year) {
                var date = new Date(year, 11, 31);
                var week = date.getWeek();
                return week === 1 ? 52 : week;
            }

            // Function to get the range of dates for a given week in a year
            function getWeekRange(year, weekNumber) {
                var firstDayOfYear = new Date(year, 0, 1);
                var daysToFirstMonday = (8 - firstDayOfYear.getDay()) % 7;
                var firstMondayOfYear = new Date(year, 0, 1 + daysToFirstMonday);

                var startOfWeek = new Date(firstMondayOfYear);
                startOfWeek.setDate(startOfWeek.getDate() + (weekNumber - 1) * 7);

                var endOfWeek = new Date(startOfWeek);
                endOfWeek.setDate(endOfWeek.getDate() + 6);

                return {
                    start: startOfWeek,
                    end: endOfWeek
                };
            }

            // Sample timetable data
            function getTimetableData(year, week) {

                const timetableData = [];
            <c:forEach items="${requestScope.list}" var="s">
                var timetable = {
                    date: "${s.date}",
                    timeSlot: "${s.group.timeslot.description}",
                    course: "${s.group.course.code}",
                    group: "${s.group.name}",
                    room: "${s.group.room.description}",
                    attendanceStatus: "${s.status}",
                    sessionId: "${s.id}"
                };
                console.log(timetable.attendanceStatus);
                timetableData.push(timetable);
            </c:forEach>


                // Filter timetable data based on selected week and year
                const filteredData = timetableData.filter((entry) => {
                    const entryDate = new Date(entry.date);
                    const entryWeek = entryDate.getWeek();
                    const entryYear = entryDate.getFullYear();
                    return entryWeek == week && entryYear == year;
                });

                return filteredData;
            }




            // Initialize weeks when the page loads
            updateWeeks();

            // Update weeks when the year changes
            yearElement.addEventListener("change", updateWeeks);

            // Update timetable when weeks change
            weekElement.addEventListener("change", updateTimetable);
        </script>
        </div>
    </body>
</html>
