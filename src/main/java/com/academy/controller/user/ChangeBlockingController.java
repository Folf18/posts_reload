package com.academy.controller.user;

import com.academy.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin/changeBlocking")
public class ChangeBlockingController extends HttpServlet {
    final static Logger log = LogManager.getLogger(ChangeBlockingController.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("In ChangeBlockingController");

        String currentPage = req.getParameter("page");

        int userId = Integer.parseInt(req.getParameter("userId"));
        boolean currentStatus = Boolean.valueOf(req.getParameter("isBlocked"));
        log.info("User id for changes = "+ userId);
        log.info(currentStatus + " in ChangeBlockingController");
        req.setAttribute("message", UserService.getInstance().blockUserById(userId, currentStatus));

        int page = currentPage == null ? 1 : Integer.parseInt(currentPage);
           resp.sendRedirect(req.getContextPath()+"/users-management?page="+page);

    }
}
