<%@ page import="java.util.Vector" %>
<%@ page import="model.Lecture" %>
<%@ page import="dal.DAOLecture" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.math.BigInteger" %>



<%
    // Initialize DAO
    DAOLecture dao = new DAOLecture();

    // Get data from the database
    Vector<Lecture> lectures = dao.getData("SELECT * FROM Lectures");

    // Handle form submissions
    String action = request.getParameter("action");

    if (action != null) {
       if (action.equals("add")) {
       try{
    // Handle add form submission
    BigInteger id = new BigInteger(request.getParameter("id"));
    String email = request.getParameter("email");
    String lectureName = request.getParameter("lectureName");
    int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
    String address = request.getParameter("address");
    Date dob = Date.valueOf(request.getParameter("dob"));

    Lecture newLecture = new Lecture(id, email, lectureName, phoneNumber, address, dob);
    dao.addLectureByPrepared(newLecture);
     } catch (NumberFormatException e) {
                // Handle the exception (e.g., provide an error message or redirect to an error page)
                e.printStackTrace(); // Print the stack trace for debugging
            }
} else if (action.equals("update")) {
try{
    // Handle update form submission
    BigInteger id = new BigInteger(request.getParameter("id"));
    String email = request.getParameter("email");
    String lectureName = request.getParameter("lectureName");
    int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
    String address = request.getParameter("address");
    Date dob = Date.valueOf(request.getParameter("dob"));

    Lecture updatedLecture = new Lecture(id, email, lectureName, phoneNumber, address, dob);
    dao.updateLecture(updatedLecture);
      } catch (NumberFormatException e) {
                // Handle the exception (e.g., provide an error message or redirect to an error page)
                e.printStackTrace(); // Print the stack trace for debugging
            }
} else if (action.equals("delete")) {
    // Handle delete form submission
    int id = Integer.parseInt(request.getParameter("id"));
    dao.deleteLecture(id);
}

    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Lecture Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        tr:hover {background-color: #f5f5f5;}
        form {
            background-color: #fff;
            margin: 20px auto;
            padding: 20px;
            width: 80%;
            box-shadow: 0px 0px 20px 0px rgba(0,0,0,0.15);
        }
        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            opacity: 0.8;
        }
        .form-container {
            display: none;
        }
    </style>
    <script>
        function showForm(formId) {
            var forms = document.getElementsByClassName('form-container');
            for (var i = 0; i < forms.length; i++) {
                forms[i].style.display = 'none';
            }
            document.getElementById(formId).style.display = 'block';
        }
    </script>
</head>
<body>

<h1>Lecture Management</h1>

<!-- Display the list of lectures -->
<table border="1">
    <tr>
        <th>ID</th>
        <th>Email</th>
        <th>Lecture Name</th>
        <th>Phone Number</th>
        <th>Address</th>
        <th>Date of Birth</th>
        <th>Action</th>
    </tr>
    <%
        Iterator<Lecture> iterator = lectures.iterator();
        while (iterator.hasNext()) {
            Lecture lecture = iterator.next();
    %>
    <tr>
        <td><%= lecture.getIdLectures() %></td>
        <td><%= lecture.getEmail() %></td>
        <td><%= lecture.getLectureName() %></td>
        <td><%= lecture.getPhoneNumber() %></td>
        <td><%= lecture.getAddress() %></td>
        <td><%= lecture.getDateOfBirth() %></td>
        <td>
       
            <a href="?action=delete&id=<%= lecture.getIdLectures() %>">Delete</a>
        </td>
    </tr>
    <%
        }
    %>
</table>

<hr>
<button onclick="showForm('insertForm')">Insert</button>
    <button onclick="showForm('updateForm')">Update</button>
<!-- Form for adding or updating lectures -->
 <div id="insertForm" class="form-container">
<form action="LectureManage.jsp" method="post">
    <input type="hidden" name="action" value="add">
    <label>ID:</label>
    <input type="text" name="id" required><br>
    <label>Email:</label>
    <input type="text" name="email" required><br>
    <label>Lecture Name:</label>
    <input type="text" name="lectureName" required><br>
    <label>Phone Number:</label>
    <input type="text" name="phoneNumber" required><br>
    <label>Address:</label>
    <input type="text" name="address" required><br>
    <label>Date of Birth:</label>
    <input type="date" name="dob" required><br>
    <input type="submit" value="Add Lecture">
</form>
 </div>
 <div id="updateForm" class="form-container">
<form action="LectureManage.jsp" method="post">
    <input type="hidden" name="action" value="update">
    <label>ID:</label>
    <input type="text" name="id" required><br>
    <label>Email:</label>
    <input type="text" name="email" required><br>
    <label>Lecture Name:</label>
    <input type="text" name="lectureName" required><br>
    <label>Phone Number:</label>
    <input type="text" name="phoneNumber" required><br>
    <label>Address:</label>
    <input type="text" name="address" required><br>
    <label>Date of Birth:</label>
    <input type="date" name="dob" required><br>
    <input type="submit" value="Update Lecture">
</form>
 </div>
</body>
</html>