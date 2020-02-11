package com.academy.service;

import com.academy.model.Post;

import java.util.List;

public interface IPostService {

    List<Post> getAllApprovedPosts();
    List<Post> getAllNewPosts();
    void createNewPost(Post post);
}
