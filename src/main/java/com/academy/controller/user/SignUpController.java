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

    UserService userService;


    public SignUpController() {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String token = req.getParameter("token");

     /*    if (token != null) {

            ActivationService activationService = ActivationService.getInstance();

            String email = activationService.use(token);

            if (!email.equals("")) {

                UserRepository userRepository = UserRepository.getInstance(req.getSession());

                Long id = userRepository.findByUsername(email);

                if (id != null) {

                    userRepository.activate(email);
                    req.getSession().setAttribute(AuthenticationService.USER_AUTHENTICATION_KEY, id);

                    resp.sendRedirect(req.getContextPath());

                    return;

                }

            }

            req.setAttribute("message", "Wrong activation token");

        }
        */

            req.getRequestDispatcher("/views/SignUp.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        user.setUsername(req.getParameter("username"));
        user.setEmail(req.getParameter("email"));
        user.setPassword(EncryptingService.getInstance().encrypt(req.getParameter("password")));

        userService.createUser(user);

        ActivationService activationService = ActivationService.getInstance();
        activationService.sendActivationMail(user.getEmail());

        req.getRequestDispatcher("/views/activate-message.jsp").forward(req, resp);
    }
}
