package com.academy.controller.user;

import com.academy.model.User;
import com.academy.service.PostService;
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

@WebServlet(urlPatterns = "/users-management")
public class ViewUsersController extends HttpServlet {
    final static Logger log = LogManager.getLogger(ViewUsersController.class);



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //Pagination
        int page = 1;

        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }

        //Get users for page
        List<User> users = UserService.getInstance().getAllUsers(page);
        log.info("ViewUsersController");
        req.setAttribute("users", users);


        float rows = UserService.getInstance().getNumberOfUsers();
        int nOfPages = (int) Math.ceil(rows / 10);


        req.setAttribute("noOfPages", nOfPages);
        req.setAttribute("page", page);

        req.getRequestDispatcher("/views/users-list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
