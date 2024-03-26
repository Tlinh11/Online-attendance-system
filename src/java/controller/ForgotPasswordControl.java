package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dal.DAO;
import jakarta.servlet.http.HttpSession;
import java.util.Random;

import model.Parent;
import model.Email;
import model.EmailUtils;

/**
 * Servlet implementation class ForgotPasswordControl
 */
@WebServlet(name = "ForgotPasswordControl", urlPatterns = {"/forgotPassword"})
public class ForgotPasswordControl extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html;charset=UTF-8");

        try {
            String emailAddress = request.getParameter("email");
            String username = request.getParameter("username");

            DAO dao = new DAO();
            Parent pa = dao.checkPaForgotPassword(username, emailAddress);
            if (pa == null) {
                request.setAttribute("error", "Email hoac username sai!");
            }
            if (pa != null) {
                // Generate a random OTP
                String otp = generateRandomOTP();

                // Save the OTP in the session
                HttpSession session = request.getSession();
                session.setAttribute("otp", otp);
                session.setAttribute("username", username);
                // Send the OTP via email
                Email email = new Email();
                email.setFrom("ddominh16@gmail.com");
                email.setFromPassword("nucextkqdrriteev");
                email.setTo(emailAddress);
                email.setSubject("Forgot Password Function - OTP");
                StringBuilder sb = new StringBuilder();
                sb.append("Dear ").append(username).append("<br>");
                sb.append("You have used the forgot password feature. <br> ");
                sb.append("Your OTP is <b>").append(otp).append(" </b> <br>");
                sb.append("Use this OTP to reset your password. <br>");
                sb.append("Regards<br>");
                sb.append("Administrator");

                email.setContent(sb.toString());
                EmailUtils.send(email);

                // Set a flag or update the database to indicate that an OTP was sent
                dao.updateOTPSentStatus(username, true);

                // Forward to verifyOTP.jsp for OTP verification
                request.getRequestDispatcher("verifyOTP.jsp").forward(request, response);
                return; // Make sure to return after forwarding to avoid further processing
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }

    private String generateRandomOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000); // Random number between 100000 and 999999
        return String.valueOf(otp);
    }

}
