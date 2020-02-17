package com.academy.service;

import com.academy.dao.PostStatusDAO;
import com.academy.model.PostStatus;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.Serializable;
import java.util.List;

public class PostStatusService implements Serializable {
    final static Logger log = LogManager.getLogger(PostStatusService.class);

    private static PostStatusService postStatusService;

    public PostStatusService() {}

    public static PostStatusService getInstance() {
        if (postStatusService == null) {
            postStatusService = new PostStatusService();
        }
        return postStatusService;
    }

    PostStatusDAO postStatusDAO = new PostStatusDAO();

    public List<PostStatus> getAllPostStatuses() {
        return postStatusDAO.getAllPostStatuses();
    }
}
