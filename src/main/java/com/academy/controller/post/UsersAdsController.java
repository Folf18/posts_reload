package com.academy.controller.post;

import com.academy.controller.user.SignInController;
import com.academy.service.PostService;
import com.academy.service.PostStatusService;
import com.academy.service.PostTypeService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/my-ads")
public class UsersAdsController extends HttpServlet {
    final static Logger log = LogManager.getLogger(UsersAdsController.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        log.trace("doGet in UsersAdsController");
        req.setAttribute("postStatuses", PostStatusService.getInstance().getAllPostStatuses());

        int id = Integer.parseInt(String.valueOf(req.getSession(false).getAttribute("global_user_id")));

        String status;
        if(req.getParameter("status") == null)
        {
            status = "";
        }
        else {
            status = req.getParameter("status");
        }


                    //= req.getParameter("postStatus");
                    req.setAttribute("approvedForUser", PostService.getInstance().getUserPosts(status, id));
        req.getRequestDispatcher("/views/user-posts.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}
