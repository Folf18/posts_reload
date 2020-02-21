package com.academy.controller.post;

import com.academy.model.Post;
import com.academy.service.PostService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/post"})
public class GetAllApprovedPostsController extends HttpServlet {
    final static Logger log = LogManager.getLogger(GetAllApprovedPostsController.class);


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getParameter("id") == null){
        List<Post> approvedPosts = PostService.getInstance().getAllApprovedPosts();
        log.info("GetAllApprovedPostsController");
        req.setAttribute("approvedPosts", approvedPosts);
        req.getRequestDispatcher("/views/posts.jsp").forward(req, resp);}
        else {
           req.setAttribute("postInfo", PostService.getInstance().getPostInfo(Integer.parseInt(req.getParameter("id"))));
           req.getRequestDispatcher("/views/single-post.jsp").forward(req, resp);
        }
    }
}
