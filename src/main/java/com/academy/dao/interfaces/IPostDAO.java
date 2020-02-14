package com.academy.dao.interfaces;


import com.academy.model.Post;
import java.util.List;

public interface IPostDAO {

    List<Post> getAllApprovedPosts();
    List<Post> getAllPostsByStatus(String status);
    void createPost(Post post);
    void approvePostById(int id);
    void declinePostById(int id);

}
