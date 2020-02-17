package com.academy.controller.post;

import com.academy.service.PostService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/approve")
public class ApprovePostController extends HttpServlet {
    final static Logger log = LogManager.getLogger(ApprovePostController.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("In ApprovePostController");
        int postId = Integer.parseInt(req.getParameter("id"));
        log.trace("Post id for approve = "+ postId);
        PostService.getInstance().approvePost(postId);

        //req.getRequestDispatcher("/posts-management").forward(req, resp);
        resp.sendRedirect("/posts-management");
    }
}
