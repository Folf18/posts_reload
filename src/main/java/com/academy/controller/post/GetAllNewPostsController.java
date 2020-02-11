package com.academy.controller.post;

import com.academy.model.Post;
import com.academy.model.PostStatus;
import com.academy.model.PostType;
import com.academy.service.IPostService;
import com.academy.service.IPostTypeService;
import com.academy.service.impl.PostServiceImpl;
import com.academy.service.impl.PostStatusesServiceImpl;
import com.academy.service.impl.PostTypeServiceimpl;
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
public class GetAllNewPostsController extends HttpServlet {
    final static Logger log = LogManager.getLogger(GetAllNewPostsController.class);

    IPostService postService;

    public GetAllNewPostsController() {
        postService = new PostServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        
        List<PostStatus> postStatuses = new PostStatusesServiceImpl().getAllPostStatuses();
        log.trace("doGet in GetAllNewPostsController");
        req.setAttribute("postStatuses", postStatuses);

        List<Post> newPosts = postService.getAllNewPosts();
        log.info("GetAllNewPostsController");
        req.setAttribute("newPosts", newPosts);
        req.getRequestDispatcher("/views/posts-management.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
