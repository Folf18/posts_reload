package com.academy.service.interfaces;

import com.academy.model.Post;

import java.util.List;

public interface IPostService {

    List<Post> getAllApprovedPosts();
    List<Post> getAllPostsByStatus(String status);
    void createNewPost(Post post);
    void approvePost(int id);
    void declinePost(int id);
}
