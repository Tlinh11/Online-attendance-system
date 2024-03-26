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
import java.math.BigInteger;

/**
 *
 * @author admin
 */
@WebServlet(name="updatePassword", urlPatterns={"/updatePassword"})
public class updatePassword extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet updatePassword</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updatePassword at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String newPassword = request.getParameter("newPassword");

    if (newPassword == null || newPassword.isEmpty()) {
        request.setAttribute("error", "New password cannot be empty.");
        request.getRequestDispatcher("updatePassword.jsp").forward(request, response);
        return;
    }

    try {
        String username = (String) request.getSession().getAttribute("username");

        if (username == null || username.isEmpty()) {
            request.setAttribute("error", "Username not found in session.");
            request.getRequestDispatcher("updatePassword.jsp").forward(request, response);
            return;
        }

        DAO dao = new DAO();
        BigInteger idParent = dao.getIdParentByUsername(username);

        if (idParent == null) {
            request.setAttribute("error", "No parent ID found for the given username.");
            request.getRequestDispatcher("updatePassword.jsp").forward(request, response);
            return;
        }

        dao.updatePassword(username, newPassword, idParent);
        response.sendRedirect("login.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("error", "Failed to update password. Please try again.");
        request.getRequestDispatcher("updatePassword.jsp").forward(request, response);
    }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
