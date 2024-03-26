/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigInteger;
import java.util.ArrayList;
import model.Student;

/**
 *
 * @author admin
 */
@WebServlet(name="ListStudentEachClass", urlPatterns={"/ListStudentEachClass"})
public class ListStudentEachClass extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListStudentEachClass</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListStudentEachClass at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DAO d = new DAO();
        String classIdParam = request.getParameter("idClass");
        String lectureIdParam = request.getParameter("idLectures");
        int classId = Integer.parseInt(classIdParam);
        ArrayList<Student> studentIds = d.getStudentIdsByClassId(classId, lectureIdParam);
        request.setAttribute("studentIds", studentIds);
        RequestDispatcher dispatcher = request.getRequestDispatcher("../ListStudentEachClass.jsp");
        dispatcher.forward(request, response);
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
