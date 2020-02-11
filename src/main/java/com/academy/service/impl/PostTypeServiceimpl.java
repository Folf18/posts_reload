package com.academy.service.impl;

import com.academy.dao.IPostTypeDAO;
import com.academy.dao.impl.PostTypeDAOImpl;
import com.academy.model.PostType;
import com.academy.service.IPostService;
import com.academy.service.IPostTypeService;

import java.util.List;


public class PostTypeServiceimpl implements IPostTypeService {

    IPostTypeDAO postTypeDAO = new PostTypeDAOImpl();

    @Override
    public List<PostType> getAllPostTypes() {
        return postTypeDAO.getAllPostTypes();
    }
}
