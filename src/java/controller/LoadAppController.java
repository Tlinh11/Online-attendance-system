/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ApplicationDBContext;
import model.Application;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author leduy
 */
public class LoadAppController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoadAppController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadAppController at " + request.getContextPath() + "</h1>");
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
        ApplicationDBContext dbContext = new ApplicationDBContext();

        ArrayList<Application> applications = dbContext.list();

        int totalApplications = applications.size();

        int currentPage = 1;
        int recordsPerPage = 5; 
        int totalPages = (int) Math.ceil((double) totalApplications / recordsPerPage);
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }

        int startIndex = (currentPage - 1) * recordsPerPage;
        int endIndex = Math.min(startIndex + recordsPerPage, totalApplications);

        ArrayList<Application> currentPageApplications = new ArrayList<>(applications.subList(startIndex, endIndex));

        request.setAttribute("applications", currentPageApplications);
        request.setAttribute("totalApplications", totalApplications);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);

        request.getRequestDispatcher("../LoadApp.jsp").forward(request, response);
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
        String appIdStr = request.getParameter("applicationId");
        int appId = Integer.parseInt(appIdStr);

        ApplicationDBContext updateAppDBContext = new ApplicationDBContext();
        updateAppDBContext.updateIsSend(appId);

        response.sendRedirect(request.getContextPath() + "/trainDept/viewCon");
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
