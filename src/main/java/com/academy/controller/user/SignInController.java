package com.academy.controller.user;

import com.academy.model.User;
import com.academy.service.IUserService;
import com.academy.service.impl.UserServiceImpl;
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

    IUserService userService;
    User user = new User();

    public SignInController() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/SignIn.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        user.setUsername(req.getParameter("username"));
        user.setPassword(req.getParameter("password"));
        //userService.createUser(user);

        resp.sendRedirect("/post");
    }
}
