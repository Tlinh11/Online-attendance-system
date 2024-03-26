/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Feedback;

/**
 *
 * @author admin
 */
@WebServlet(name = "SendFeedbackToLecture", urlPatterns = {"/SendFeedbackToLecture"})
public class SendFeedbackToLecture extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendFeedbackToLecture</title>");
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
            out.println("<form action=\"SendFeedbackToLecture\" method=\"post\">");
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        response.sendRedirect("ListLectureEachStudent?id=" + studentId);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
