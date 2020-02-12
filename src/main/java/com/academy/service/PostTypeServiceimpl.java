package com.academy.service;

import com.academy.dao.interfaces.IPostTypeDAO;
import com.academy.dao.PostTypeDAOImpl;
import com.academy.model.PostType;
import com.academy.service.interfaces.IPostTypeService;
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
