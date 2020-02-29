package com.academy.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(urlPatterns = {"/add-ads", "/my-ads"})
public class UserFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;


        if ((req.getSession().getAttribute("global_user_username") != null) && (String.valueOf(req.getSession().getAttribute("global_user_role")).equals("USER") )){
            chain.doFilter(request,response);
        }
        else {
            request.getRequestDispatcher("/views/access-denied.jsp").forward(request, response);
            //filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
