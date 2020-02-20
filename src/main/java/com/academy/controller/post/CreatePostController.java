package com.academy.controller.post;

import com.academy.controller.user.SignInController;
import com.academy.model.Post;
import com.academy.model.PostType;
import com.academy.model.User;
import com.academy.service.PostService;
import com.academy.service.PostTypeService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/add-post")
public class CreatePostController extends HttpServlet {
    final static Logger log = LogManager.getLogger(SignInController.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // PostTypeService postTypeService = new PostTypeService();

        List<PostType> postTypes = PostTypeService.getInstance().getAllPostTypes();
        log.trace("doGet in CreatePostController");
        req.setAttribute("postTypes", postTypes);
        req.getRequestDispatcher("/views/create-post.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Post post = new Post();
        User user = new User();
        PostType postType = new PostType();

        HttpSession session;

        post.setSummary(req.getParameter("summary"));
        post.setDescription(req.getParameter("description"));

        postType.setId(Integer.parseInt(req.getParameter("post_type_id")));
        post.setPostType(postType);

       // String stringId = (String) req.getSession(false).getAttribute("user_id");
        System.out.println(req.getSession(false).getAttribute("global_user_id"));
        int userId = Integer.parseInt(String.valueOf(req.getSession(false).getAttribute("global_user_id")));
        System.out.println(userId);
        user.setId(userId);
        post.setUser(user);



        log.info("Post info "+post.toString());
        PostService.getInstance().createNewPost(post);

        req.getRequestDispatcher("/views/post-published.jsp").forward(req, resp);
        //resp.sendRedirect("/add-post");

    }
}
