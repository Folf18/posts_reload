package com.academy.dao;

import com.academy.model.PostType;
import com.academy.util.DBConnectionUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostTypeDAO implements Serializable {
    final static Logger log = LogManager.getLogger(PostTypeDAO.class);

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    static final String GET_ALL_POST_TYPES = "SELECT * FROM post_type";

    public List<PostType> getAllPostTypes() {
        List<PostType> postTypes = null;
        PostType postType;

        log.trace("Started getting all posts types from database.");
        try {
            postTypes = new ArrayList<PostType>();
            connection = DBConnectionUtil.getConnection();
            preparedStatement =  connection.prepareStatement(GET_ALL_POST_TYPES);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                postType = new PostType();
                postType.setId(resultSet.getInt("id"));
                postType.setName(resultSet.getString("name"));
                postTypes.add(postType);
            }
            log.trace("All post types selected successfully");
        } catch (SQLException e) {
            log.error("Something went wrong", e);
        }
        return postTypes;
    }
}
