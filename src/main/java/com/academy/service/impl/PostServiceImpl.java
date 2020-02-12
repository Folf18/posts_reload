package com.academy.service.impl;


import com.academy.dao.IPostDAO;
import com.academy.dao.impl.PostDAOImpl;
import com.academy.model.Post;
import com.academy.service.IPostService;
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
        postDAO.createPost(post);
    }
    @Override
    public List<Post> getAllPostsByStatus(String status) {
        log.trace("status " + status);
        status = status == null ? "NEW" : status;
        return postDAO.getAllPostsByStatus(status);
    }
}
