package com.academy.service;

import com.academy.dao.interfaces.IPostStatusDAO;
import com.academy.dao.PostStatusDaoImpl;
import com.academy.model.PostStatus;
import com.academy.service.interfaces.IPostStatusService;

import java.util.List;

public class PostStatusesServiceImpl implements IPostStatusService {

    IPostStatusDAO postStatusDAO = new PostStatusDaoImpl();
    @Override
    public List<PostStatus> getAllPostStatuses() {
        return postStatusDAO.getAllPostStatuses();
    }
}
