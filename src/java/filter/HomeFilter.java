package filter;

import dal.AccountDBContext;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

public class HomeFilter implements Filter {

    private FilterConfig filterConfig = null;

    public HomeFilter() {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        AccountDBContext adbc = new AccountDBContext();

        HttpSession session = httpRequest.getSession();
        String account = (String) session.getAttribute("email");
        Account a = adbc.getAccountByEmail(account);

        if (a == null) {
            httpResponse.sendRedirect("../LoginGoogle");
        } else {
            String role = a.getRole();
            String urlPattern = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

            if (role.equals("2") && urlPattern.startsWith("/lecture")) {
                chain.doFilter(request, response);
            } else if ((role.equals("3") && urlPattern.startsWith("/student"))) {
                chain.doFilter(request, response);
            }else if ((role.equals("1") && urlPattern.startsWith("/trainDept"))){
                chain.doFilter(request, response);
            } else {
                httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied.");
            }
        }
    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

}
