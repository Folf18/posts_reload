package com.academy.dao;


import com.academy.model.Post;
import java.util.List;

public interface IPostDAO {

    List<Post> getAllApprovedPosts();
    List<Post> getAllPostsByStatus(String status);
    void createPost(Post post);

}
