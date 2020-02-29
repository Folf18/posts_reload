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

@WebServlet(urlPatterns = "/admin/changeRole")
public class ChangeRoleController extends HttpServlet {
    final static Logger log = LogManager.getLogger(ChangeRoleController.class);


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("In ChangeRoleController");

        String currentPage = req.getParameter("page");

        int userId = Integer.parseInt(req.getParameter("userId"));
        int  roleId = Integer.parseInt(req.getParameter("roleId"));

        log.info("User id for changes = "+ userId);
        log.info("Role id for changes = "+ roleId);

        req.setAttribute("message", UserService.getInstance().changeUserRole(userId, roleId));

        int page = currentPage == null ? 1 : Integer.parseInt(currentPage);
        resp.sendRedirect("/users-management?page="+page);
    }
}
