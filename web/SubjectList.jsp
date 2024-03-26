<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Vector" %>
<%@ page import="model.Subject" %>
<%@ page import="dal.DAOSubject" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
<%@ page import="java.util.Iterator" %>


<%
    try {
        DAOSubject daoSu = new DAOSubject();
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            int SessionId = Integer.parseInt(idParam);
            // Get data from the database
            Vector<Subject> subjects = daoSu.getData("select * from subject where SemesterId=" + SessionId);
%>
<html>
    <head>
        <title>Subject List</title>
    </head>
    <body>
        <h1>Subject List</h1>

        <table>
            <tr>
                <th>Subject</th>
            </tr>
            <%  
                Iterator<Subject> iterator = subjects.iterator();
                while (iterator.hasNext()) {
                    Subject subject = iterator.next();
            %>
                <tr>
                    <td> <a href="ClassList.jsp?id=<%= subject.getIdSubject() %>"><%= subject.getSubjectName() %></a></td>                  
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