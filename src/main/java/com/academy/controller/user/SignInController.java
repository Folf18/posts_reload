package com.academy.controller.user;

import com.academy.dao.UserDAO;
import com.academy.model.User;
import com.academy.service.EncryptingService;
import com.academy.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/signin")
public class SignInController extends HttpServlet {

    final static Logger log = LogManager.getLogger(SignInController.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/SignIn.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        int userId = UserService.getInstance().getUserIdByCredentials(username, password);

        if (userId != 0){
            try {
               User loggedUser = UserService.getInstance().getUserInfoById(userId);
                HttpSession session = req.getSession(true);
                session.setAttribute("user_id", loggedUser.getId());
                session.setAttribute("user_username", loggedUser.getUsername());
                session.setAttribute("user_role", loggedUser.getRole().getName());

                //req.getRequestDispatcher("/views/session.jsp").forward(req, resp);
                resp.sendRedirect("/add-post");
            } catch (Exception e){
                e.printStackTrace();
            }

        }
            else {

            req.setAttribute("message", "Username or password is incorrect");
            req.getRequestDispatcher("/views/SignIn.jsp").forward(req, resp);
        }

        //resp.sendRedirect("/add-post");
    }
}
