package com.academy.controller.user;

import com.academy.service.EncryptingService;
import com.academy.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/signin")
public class SignInController extends HttpServlet {

    final static Logger log = LogManager.getLogger(SignInController.class);

    UserService userService;
    //User user = new User();

    public SignInController() {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/SignIn.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        boolean canSignIn = userService.isAbleToSignIn(req.getParameter("username"), EncryptingService.getInstance().encrypt(req.getParameter("password")));

        if (canSignIn){
            resp.sendRedirect("/posts");
        }
            else {

            req.setAttribute("message", "Username or password is incorrect");
            req.getRequestDispatcher("/views/SignIn.jsp").forward(req, resp);
        }

        //resp.sendRedirect("/si");
    }
}
