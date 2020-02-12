package com.academy.service.impl;

import com.academy.dao.IPostDAO;
import com.academy.dao.impl.PostDAOImpl;
import com.academy.model.Post;
import com.academy.service.IPostService;

import java.util.List;

public class PostServiceImpl implements IPostService {

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
        return postDAO.getAllPostsByStatus(status);
    }
}
