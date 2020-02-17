package com.academy.controller.user;


import com.academy.dao.ActivationDAO;
import com.academy.service.ActivationService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/activateAccount")
public class ActivateUserController extends HttpServlet {

    final static Logger log = LogManager.getLogger(ActivateUserController.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String token = req.getParameter("token");

        if (token != null) {
            if (ActivationService.getInstance().activateAccountAndSendMail(token) == true){
                req.setAttribute("greetingMessage", "Your account successfully activated");
                req.getRequestDispatcher("/views/greetings.jsp").forward(req, resp);
            }
            else {
                req.setAttribute("greetingMessage", "SOMETHING WENT WRONG. <br> Please follow the link in email again. <br> If problem still exists contact fedir199@gmail.com");
                req.getRequestDispatcher("/views/greetings.jsp").forward(req, resp);
            }
        }


    }
}
