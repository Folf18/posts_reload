package com.academy.service;


import com.academy.dao.PostDAO;
import com.academy.model.Post;
import com.academy.model.PostStatus;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.xml.transform.Source;
import java.io.Serializable;
import java.util.List;

public class PostService implements Serializable {
    final static Logger log = LogManager.getLogger(PostService.class);

    PostDAO postDAO = new PostDAO();

    private static PostService postService;

    public PostService() {}

    public static PostService getInstance() {
        if (postService == null) {
            postService = new PostService();
        }
        return postService;
    }

    public List<Post> getAllApprovedPosts(int page) {
        int recordsPerPage = 10;
        System.out.println("Empty page nu = "+ page);

        int offset = (page-1)*(10);

        System.out.println(recordsPerPage + "    " + offset);
        return postDAO.getAllApprovedPosts(recordsPerPage, offset);


    }

    public int getNumberOfApprovedRecords(){
        return postDAO.numberOfApprovedRecords();
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

    public List<Post> getUserPosts(String status, int id){
        if ((status.equals("")) || (status == null)){
            status = "NEW";
        }
       return postDAO.getUserPosts(status, id);
    }

    public void approvePost(int id) {
         postDAO.approvePostById(id);
    }


    public void declinePost(int id) {
        postDAO.declinePostById(id);
    }

    public Post getPostInfo(int id){
        return postDAO.getPostInfo(id);
    }
}
