package com.academy.service;

import com.academy.dao.PostTypeDAO;
import com.academy.model.PostType;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


import java.io.Serializable;
import java.util.List;


public class PostTypeService implements Serializable {
    final static Logger log = LogManager.getLogger(PostTypeService.class);

    private static PostTypeService postTypeService;

    public PostTypeService() {}

    public static PostTypeService getInstance() {
        if (postTypeService == null) {
            postTypeService = new PostTypeService();
        }
        return postTypeService;
    }



    PostTypeDAO postTypeDAO = new PostTypeDAO();

    public List<PostType> getAllPostTypes() {


        return postTypeDAO.getAllPostTypes();
    }
}
