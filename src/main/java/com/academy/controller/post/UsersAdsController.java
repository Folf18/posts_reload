package com.academy.controller.post;

import com.academy.model.Post;
import com.academy.service.PostService;
import com.academy.service.PostStatusService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/my-ads")
public class UsersAdsController extends HttpServlet {
    final static Logger log = LogManager.getLogger(UsersAdsController.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        log.trace("doGet in UsersAdsController");
        req.setAttribute("postStatuses", PostStatusService.getInstance().getAllPostStatuses());

        int id = Integer.parseInt(String.valueOf(req.getSession(false).getAttribute("global_user_id")));

        String status = req.getParameter("status");

        List<Post> approvedForUser =PostService.getInstance().getUserPosts(status, id);

        req.setAttribute("approvedForUser", approvedForUser);
        req.getRequestDispatcher("/views/user-posts.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}
