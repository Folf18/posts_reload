package com.academy.controller.user;

import com.academy.model.User;
import com.academy.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin/user")
public class ViewUsersController extends HttpServlet {
    final static Logger log = LogManager.getLogger(ViewUsersController.class);

    UserService userService;

    public ViewUsersController() {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users = userService.getAllUsers();
        log.info("ViewUsersController");
        req.setAttribute("users", users);
        req.getRequestDispatcher("/views/user/users-list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
