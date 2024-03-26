<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Vector" %>
<%@ page import="model.Student" %>
<%@ page import="dal.DAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
<%@ page import="java.util.Iterator" %>


<%
    try {
        DAO daoStu = new DAO();
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            int ClassId = Integer.parseInt(idParam);
            // Get data from the database
            Vector<Student> students = daoStu.getData("select*from students where ClassId=" + ClassId);
%>
<html>
    <head>
        <title>Student List</title>
    </head>
    <body>
        <h1>Student List</h1>

        <table>
            <tr>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Birth Day</th>
            </tr>
            <%  
                Iterator<Student> iterator = students.iterator();
                while (iterator.hasNext()) {
                    Student student = iterator.next();
            %>
                <tr>
                    <td> <%= student.getEmail() %></td>    
                     <td> <%= student.getPhoneNumber() %></td> 
                      <td> <%= student.getAddress() %></td> 
                       <td> <%= student.getDOB() %></td> 
                </tr>
            <% } %>
        </table>
    </body>
</html>
<%
        } else {
            out.println("Invalid or missing 'id' parameter.");
        }
    } catch (Exception e) {
        out.println("An exception occurred: " + e.getMessage());
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        e.printStackTrace(pw);
        out.println(sw.toString());
    }
%>