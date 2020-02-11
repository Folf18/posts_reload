package com.academy.dao;


import com.academy.model.Post;
import java.util.List;

public interface IPostDAO {

    List<Post> getAllApprovedPosts();
    void createPost(Post post);
    List<Post> getAllNewPosts();
}
