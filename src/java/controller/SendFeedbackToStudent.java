/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.Date;
import model.Feedback;

/**
 *
 * @author admin
 */
@WebServlet(name="SendFeedbackToStudent", urlPatterns={"/SendFeedbackToStudent"})
public class SendFeedbackToStudent extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Send Feedback</title>");
            out.println("<style>");
        out.println("body {");
        out.println("    font-family: Arial, sans-serif;");
        out.println("    background-color: #f0f0f0;");
        out.println("    margin: 0;");
        out.println("    padding: 0;");
        out.println("}");
        out.println("form {");
        out.println("    margin: 20px;");
        out.println("    padding: 20px;");
        out.println("    background-color: white;");
        out.println("    border-radius: 5px;");
        out.println("    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);");
        out.println("}");
        out.println("label {");
        out.println("    font-weight: bold;");
        out.println("}");
        out.println("textarea {");
        out.println("    width: 100%;");
        out.println("    height: 100px;");
        out.println("    margin-bottom: 10px;");
        out.println("}");
        out.println("input[type=\"submit\"] {");
        out.println("    padding: 10px 20px;");
        out.println("    border: none;");
        out.println("    border-radius: 5px;");
        out.println("    background-color: #ff6633;");
        out.println("    color: white;");
        out.println("    cursor: pointer;");
        out.println("}");
        out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<form action=\"SendFeedbackToStudent\" method=\"post\">");
            out.println("<input type=\"hidden\" id=\"idStudents\" name=\"idStudents\" value=\"" + request.getParameter("idStudents") + "\">");
            out.println("<input type=\"hidden\" id=\"idLectures\" name=\"idLectures\" value=\"" + request.getParameter("idLectures") + "\">");
            out.println("<label for=\"content\">Content:</label><br>");
            out.println("<textarea id=\"content\" name=\"content\" rows=\"4\" cols=\"50\"></textarea><br>");
            out.println("<input type=\"submit\" value=\"Send Feedback\">");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DAO d = new DAO();
        String studentId = request.getParameter("idStudents");
        String content = request.getParameter("content");
        String idLectures = request.getParameter("idLectures");
        Feedback feedback = new Feedback();
        feedback.setContent(content);
        feedback.setStudentId(studentId);
        feedback.setLectureId(idLectures);
        d.sendFeedback(feedback); // Lưu kết quả của phương thức sendFeedback
        response.sendRedirect("ListClassForFeedBack?idLectures=" + idLectures);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
