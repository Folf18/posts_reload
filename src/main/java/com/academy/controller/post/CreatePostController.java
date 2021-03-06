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


       // HttpSession session;
        post.setSummary(req.getParameter("summary").replaceAll("\\s+",""));
        post.setDescription(req.getParameter("description").replaceAll("\\s+",""));
        postType.setId(Integer.parseInt(req.getParameter("post_type_id")));
        post.setPostType(postType);
        user.setId(Integer.parseInt(String.valueOf(req.getSession(false).getAttribute("global_user_id"))));
        post.setUser(user);

        Set<ConstraintViolation<Post>> violations = validator.validate(post);


        if ((violations.isEmpty()) && ((!post.getSummary().isBlank()) && (!post.getDescription().isBlank()))){

            post.setSummary(req.getParameter("summary"));
            post.setDescription(req.getParameter("description"));
            postType.setId(Integer.parseInt(req.getParameter("post_type_id")));
            post.setPostType(postType);
            user.setId(Integer.parseInt(String.valueOf(req.getSession(false).getAttribute("global_user_id"))));
            post.setUser(user);

            PostService.getInstance().createNewPost(post);
            req.getRequestDispatcher("/views/post-published.jsp").forward(req, resp);
        }
        else if ((!post.getSummary().isBlank() && (!post.getDescription().isBlank()))){
            req.setAttribute("errors", violations);
            req.setAttribute("enteredSummary", req.getParameter("summary"));
            req.setAttribute("enteredDescription", req.getParameter("description"));
            req.setAttribute("enteredPostTypeId", Integer.parseInt(req.getParameter("post_type_id")));
            doGet(req, resp);
        }
        else {
            req.setAttribute("emptyError", "Summary or Description can not be empty");
            doGet(req, resp);
        }

    }
}
