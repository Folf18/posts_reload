package com.academy.service;

import com.academy.dao.PostStatusDAO;
import com.academy.model.PostStatus;

import java.io.Serializable;
import java.util.List;

public class PostStatusService implements Serializable {

    PostStatusDAO postStatusDAO = new PostStatusDAO();

    public List<PostStatus> getAllPostStatuses() {
        return postStatusDAO.getAllPostStatuses();
    }
}
