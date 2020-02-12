package com.academy.controller.post;

import com.academy.controller.user.SignInController;
import com.academy.model.Post;
import com.academy.model.PostType;
import com.academy.model.User;
import com.academy.service.IPostService;
import com.academy.service.IPostTypeService;
import com.academy.service.impl.PostServiceImpl;
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

@WebServlet(urlPatterns = "/add-post")
public class CreatePostController extends HttpServlet {
    final static Logger log = LogManager.getLogger(SignInController.class);

    IPostService postService;
    IPostTypeService postTypeService;



    public CreatePostController() {
        postService = new PostServiceImpl();
        postTypeService = new PostTypeServiceimpl();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // IPostTypeService postTypeService = new PostTypeServiceimpl();
        List<PostType> postTypes = postTypeService.getAllPostTypes();
        log.trace("doGet in CreatePostController");
        req.setAttribute("postTypes", postTypes);
        req.getRequestDispatcher("/views/create-post.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Post post = new Post();
        User user = new User();
        PostType postType = new PostType();
        post.setSummary(req.getParameter("summary"));
        post.setDescription(req.getParameter("description"));

        postType.setId(Integer.parseInt(req.getParameter("post_type_id")));
        post.setPostType(postType);

        user.setId(Integer.parseInt(req.getParameter("user_id")));
        post.setUser(user);

        log.info("Post info "+post.toString());
        postService.createNewPost(post);

        resp.sendRedirect("/post");

    }
}
