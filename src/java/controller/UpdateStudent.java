/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Student;

/**
 *
 * @author ASUS
 */
public class UpdateStudent extends HttpServlet {

    DAO dao;

    public void init() {
        dao = new DAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        List<Student> studentList = dao.getStudentById(id);
        if (!studentList.isEmpty()) {
            Student student = studentList.get(0);
            request.setAttribute("student", student);
            request.getRequestDispatcher("../UpdateStudent.jsp").forward(request, response);
        } else {
            // Xử lý trường hợp không tìm thấy sinh viên
            response.sendRedirect("ListStudent");
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String imgUrl = request.getParameter("imgUrl");
        String username = request.getParameter("username");

        dao.updateStudent(id, name, dob, email, imgUrl, username);

        response.sendRedirect("ListStudent");
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
