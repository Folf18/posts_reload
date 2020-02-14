package com.academy.service;


import com.academy.dao.interfaces.IPostDAO;
import com.academy.dao.PostDAOImpl;
import com.academy.model.Post;
import com.academy.model.PostStatus;
import com.academy.service.interfaces.IPostService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

public class PostServiceImpl implements IPostService {
    final static Logger log = LogManager.getLogger(PostServiceImpl.class);
    IPostDAO postDAO = new PostDAOImpl();
    @Override
    public List<Post> getAllApprovedPosts() {
        return postDAO.getAllApprovedPosts();
    }


    @Override
    public void createNewPost(Post post) {

        //Set status to NEW by default
        PostStatus postStatus = new PostStatus();
        postStatus.setId(1);
        post.setPostStatus(postStatus);


        postDAO.createPost(post);
    }

    @Override
    public List<Post> getAllPostsByStatus(String status) {
        log.trace("status " + status);
        status = status == null ? "NEW" : status;
        return postDAO.getAllPostsByStatus(status);
    }

    @Override
    public void approvePost(int id) {
         postDAO.approvePostById(id);
    }

    @Override
    public void declinePost(int id) {
        postDAO.declinePostById(id);
    }
}
