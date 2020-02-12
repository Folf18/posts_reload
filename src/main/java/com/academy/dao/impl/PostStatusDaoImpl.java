package com.academy.dao.impl;

import com.academy.dao.IPostStatusDAO;
import com.academy.model.PostStatus;
import com.academy.util.DBConnectionUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostStatusDaoImpl implements IPostStatusDAO {
    final static Logger log = LogManager.getLogger(PostTypeDAOImpl.class);

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    static final String GET_ALL_POST_STATUSES = "SELECT * FROM post_status";
    @Override
    public List<PostStatus> getAllPostStatuses() {
        List<PostStatus> postStatuses = null;
        PostStatus postStatus;

        log.trace("Started getting all posts statuses from database.");
        try {
            postStatuses = new ArrayList<PostStatus>();
            connection = DBConnectionUtil.getConnection();
            preparedStatement =  connection.prepareStatement(GET_ALL_POST_STATUSES);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                postStatus = new PostStatus();
                postStatus.setId(resultSet.getInt("id"));
                postStatus.setName(resultSet.getString("name"));
                postStatuses.add(postStatus);
            }
            log.trace("All post statuses selected successfully");
        } catch (SQLException e) {
            log.error("Something went wrong", e);
        }
        return postStatuses;
    }
}
