package com.academy.service.impl;

import com.academy.controller.post.GetAllPostsByStatusController;
import com.academy.dao.IPostTypeDAO;
import com.academy.dao.impl.PostTypeDAOImpl;
import com.academy.model.PostType;
import com.academy.service.IPostService;
import com.academy.service.IPostTypeService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;


public class PostTypeServiceimpl implements IPostTypeService {
    final static Logger log = LogManager.getLogger(PostTypeServiceimpl.class);

    IPostTypeDAO postTypeDAO = new PostTypeDAOImpl();

    @Override
    public List<PostType> getAllPostTypes() {


        return postTypeDAO.getAllPostTypes();
    }
}
