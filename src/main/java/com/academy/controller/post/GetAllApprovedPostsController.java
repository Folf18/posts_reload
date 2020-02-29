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

@WebServlet(urlPatterns = {"/ads"})
public class GetAllApprovedPostsController extends HttpServlet {
    final static Logger log = LogManager.getLogger(GetAllApprovedPostsController.class);


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //default page is first
        int page = 1;

        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }

        //Get Ads for page
        List<Post> approvedPosts = PostService.getInstance().getAllApprovedPosts(page);

        req.setAttribute("approvedPosts", approvedPosts);

        float rows = PostService.getInstance().getNumberOfApprovedRecords();
        int nOfPages = (int) Math.ceil(rows / 10);


        req.setAttribute("noOfPages", nOfPages);
        req.setAttribute("page", page);

        req.getRequestDispatcher("/views/posts.jsp").forward(req, resp);

    }
}
