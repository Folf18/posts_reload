package com.academy.controller.post;

import com.academy.model.Post;
import com.academy.model.PostStatus;
import com.academy.service.IPostService;
import com.academy.service.impl.PostServiceImpl;
import com.academy.service.impl.PostStatusesServiceImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/posts-management")
public class GetAllPostsByStatusController extends HttpServlet {
    final static Logger log = LogManager.getLogger(GetAllPostsByStatusController.class);

    IPostService postService;

    public GetAllPostsByStatusController() {
        postService = new PostServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String status = req.getParameter("status");

            log.trace("status" + status);
            status = status == null ? "NEW" : status;

        List<PostStatus> postStatuses = new PostStatusesServiceImpl().getAllPostStatuses();
        log.trace("doGet in GetAllPostsByStatusController");
        req.setAttribute("postStatuses", postStatuses);

        /*
        List<Post> newPosts = postService.getAllNewPosts();
        log.info("GetAllPostsByStatusController");
        req.setAttribute("newPosts", newPosts);

         */

        List<Post> newPosts = postService.getAllPostsByStatus(status);
        log.info("GetPostsController");
        req.setAttribute("newPosts", newPosts);

        req.getRequestDispatcher("/views/posts-management.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
