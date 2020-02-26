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
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@WebServlet(urlPatterns = "/add-ads")
public class CreatePostController extends HttpServlet {
    final static Logger log = LogManager.getLogger(SignInController.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.trace("doGet in CreatePostController");
        req.setAttribute("postTypes", PostTypeService.getInstance().getAllPostTypes());
        req.getRequestDispatcher("/views/create-post.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Post post = new Post();
        User user = new User();
        PostType postType = new PostType();
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();


        HttpSession session;

        post.setSummary(req.getParameter("summary"));
        post.setDescription(req.getParameter("description"));
        postType.setId(Integer.parseInt(req.getParameter("post_type_id")));
        post.setPostType(postType);


        int userId = Integer.parseInt(String.valueOf(req.getSession(false).getAttribute("global_user_id")));

        user.setId(userId);
        post.setUser(user);

        log.info("Post info "+post.toString());


        Set<ConstraintViolation<Post>> violations = validator.validate(post);


        if (violations.isEmpty()){
            req.setAttribute("errors", violations);
            PostService.getInstance().createNewPost(post);
            req.getRequestDispatcher("/views/post-published.jsp").forward(req, resp);
        }
        else {

            req.setAttribute("errors", violations);
            req.setAttribute("oldSummary", req.getParameter("summary"));
            req.setAttribute("oldDescription", req.getParameter("description"));
            req.setAttribute("oldPostTypeId", Integer.parseInt(req.getParameter("post_type_id")));
            doGet(req, resp);
        }

        //resp.sendRedirect("/add-post");

    }
}
