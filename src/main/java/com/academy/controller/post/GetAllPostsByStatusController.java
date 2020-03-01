package com.academy.controller.post;

import com.academy.model.Post;
import com.academy.model.PostStatus;
import com.academy.service.PostService;
import com.academy.service.PostStatusService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/ads-management")
public class GetAllPostsByStatusController extends HttpServlet {
    final static Logger log = LogManager.getLogger(GetAllPostsByStatusController.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //Pagination
        int page = 1;

        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }

        //GET Post statuses
        List<PostStatus> postStatuses =  PostStatusService.getInstance().getAllPostStatuses();
        log.trace("doGet in GetAllPostsByStatusController");
        req.setAttribute("postStatuses", postStatuses);


        //GET posts by parameter
        String status = req.getParameter("status");

        List<Post> newPosts = PostService.getInstance().getAllPostsByStatus(status, page);
        log.info("GetPostsController");
        req.setAttribute("newPosts", newPosts);


        int statusId = PostStatusService.getInstance().getIdByName(status);
        float rows = PostService.getInstance().getNumberOfRecordsByStatus(statusId);
        int nOfPages = (int) Math.ceil(rows / 10);


        req.setAttribute("noOfPages", nOfPages);
        req.setAttribute("page", page);


        req.getRequestDispatcher("/views/posts-management.jsp").forward(req, resp);

    }

}
