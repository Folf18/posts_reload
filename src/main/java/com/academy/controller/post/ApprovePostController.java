package com.academy.controller.post;

import com.academy.model.Post;
import com.academy.service.MailService;
import com.academy.service.PostService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/manage/approve")
public class ApprovePostController extends HttpServlet {
    final static Logger log = LogManager.getLogger(ApprovePostController.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("In ApprovePostController");
        int postId = Integer.parseInt(req.getParameter("id"));
        log.trace("Post id for approve = "+ postId);
        PostService.getInstance().approvePost(postId);
        Post post = PostService.getInstance().getPostInfo(postId);
        try {
            MailService.getInstance().sendAdsStatus(post.getUser().getUsername(), post.getUser().getEmail(), post.getSummary(), post.getPostStatus().getName());
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        resp.sendRedirect(req.getContextPath()+"/ads-management");
    }
}
