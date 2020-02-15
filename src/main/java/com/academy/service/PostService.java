package com.academy.service;


import com.academy.dao.PostDAO;
import com.academy.model.Post;
import com.academy.model.PostStatus;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.Serializable;
import java.util.List;

public class PostService implements Serializable {
    final static Logger log = LogManager.getLogger(PostService.class);
    PostDAO postDAO = new PostDAO();

    public List<Post> getAllApprovedPosts() {
        return postDAO.getAllApprovedPosts();
    }



    public void createNewPost(Post post) {

        //Set status to NEW by default
        PostStatus postStatus = new PostStatus();
        postStatus.setId(1);
        post.setPostStatus(postStatus);


        postDAO.createPost(post);
    }


    public List<Post> getAllPostsByStatus(String status) {
        log.trace("status " + status);
        status = status == null ? "NEW" : status;
        return postDAO.getAllPostsByStatus(status);
    }


    public void approvePost(int id) {
         postDAO.approvePostById(id);
    }


    public void declinePost(int id) {
        postDAO.declinePostById(id);
    }
}
