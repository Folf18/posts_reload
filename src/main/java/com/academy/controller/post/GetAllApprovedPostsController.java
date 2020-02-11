package com.academy.controller.post;

import com.academy.model.Post;
import com.academy.service.IPostService;
import com.academy.service.impl.PostServiceImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/", "/post"})
public class GetAllApprovedPostsController extends HttpServlet {
    final static Logger log = LogManager.getLogger(GetAllApprovedPostsController.class);

    IPostService postService;

    public GetAllApprovedPostsController() {
        postService = new PostServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Post> approvedPosts = postService.getAllApprovedPosts();
        log.info("GetAllApprovedPostsController");
        req.setAttribute("approvedPosts", approvedPosts);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
