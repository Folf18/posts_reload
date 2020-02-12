package com.academy.service.impl;

import com.academy.dao.IPostStatusDAO;
import com.academy.dao.impl.PostStatusDaoImpl;
import com.academy.model.PostStatus;
import com.academy.service.IPostStatusService;

import java.util.List;

public class PostStatusesServiceImpl implements IPostStatusService {

    IPostStatusDAO postStatusDAO = new PostStatusDaoImpl();
    @Override
    public List<PostStatus> getAllPostStatuses() {
        return postStatusDAO.getAllPostStatuses();
    }
}
