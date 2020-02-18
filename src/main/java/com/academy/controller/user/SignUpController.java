package com.academy.controller.user;

import com.academy.model.User;
import com.academy.service.ActivationService;
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

@WebServlet(urlPatterns = "/signup")
public class SignUpController extends HttpServlet {
    final static Logger log = LogManager.getLogger(SignUpController.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            req.getRequestDispatcher("/views/SignUp.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        user.setUsername(req.getParameter("username"));
        user.setEmail(req.getParameter("email"));
        user.setPassword(EncryptingService.getInstance().encrypt(req.getParameter("password")));

        UserService.getInstance().createUser(user);

        ActivationService activationService = ActivationService.getInstance();
        activationService.saveAndSendMail(user.getEmail());

        req.setAttribute("enteredEmail", user.getEmail());

        req.getRequestDispatcher("/views/activate-message.jsp").forward(req, resp);
    }
}
