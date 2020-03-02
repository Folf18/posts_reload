package com.academy.controller.user;

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

        int userId = UserService.getInstance().getUserIdByCredentials(username, EncryptingService.getInstance().encrypt(password));

        if (userId != 0) {
            User loggedUser = UserService.getInstance().getUserInfoById(userId);



            if ((loggedUser.getIsActive()) && (!loggedUser.getIsBlocked()))
            {


            HttpSession session = req.getSession(true);
            session.setAttribute("global_user_id", loggedUser.getId());
            session.setAttribute("global_user_username", loggedUser.getUsername());
            session.setAttribute("global_user_role", loggedUser.getRole().getName());

            //req.getRequestDispatcher("/views/session.jsp").forward(req, resp);
            resp.sendRedirect(req.getContextPath()+"/ads");
            }
            if ((!loggedUser.getIsActive())) {
                req.setAttribute("enteredUsername", username);
                req.setAttribute("enteredPassword", password);
                req.setAttribute("access", "Your account isn't activated. Please follow the link from the email to activate it.");
                req.getRequestDispatcher("/views/no-access.jsp").forward(req, resp);
            }
            if (loggedUser.getIsBlocked()){
                req.setAttribute("enteredUsername", username);
                req.setAttribute("enteredPassword", password);
                req.setAttribute("access", "Your account is blocked.");
                req.getRequestDispatcher("/views/no-access.jsp").forward(req, resp);
            }

        }
        else {
            req.setAttribute("enteredUsername", username);
            req.setAttribute("enteredPassword", password);
            req.setAttribute("message", "Account with such credentials doesn't exist. \n Maybe username or password is incorrect.");
            req.getRequestDispatcher("/views/SignIn.jsp").forward(req, resp);
        }
    }
}
