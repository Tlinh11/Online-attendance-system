<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Vector" %>
<%@ page import="model.Class" %>
<%@ page import="dal.DAOClass" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
<%@ page import="java.util.Iterator" %>


<%
    try {
        DAOClass daocla = new DAOClass();
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            int IdSubject = Integer.parseInt(idParam);
            // Get data from the database
            Vector<Class> classes = daocla.getData("select * from Class where IdSubject=" + IdSubject);
%>
<html>
    <head>
        <title>Class List</title>
    </head>
    <body>
        <h1>Class List</h1>

        <table>
            <tr>
                <th>Class</th>
            </tr>
            <%  
                Iterator<Class> iterator = classes.iterator();
                while (iterator.hasNext()) {
                    Class classs = iterator.next();
            %>
                <tr>
                    <td> <a href="StudentInClass.jsp?id=<%= classs.getIdClass() %>"><%= classs.getName() %></a></td>                  
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