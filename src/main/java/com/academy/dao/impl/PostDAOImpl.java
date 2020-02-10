package com.academy.dao.impl;

import com.academy.dao.IPostDAO;
import com.academy.model.Post;
import com.academy.model.PostStatus;
import com.academy.model.PostType;
import com.academy.model.User;
import com.academy.util.DBConnectionUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAOImpl implements IPostDAO {
    final static Logger log = LogManager.getLogger(PostDAOImpl.class);;

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    //CRUD
    private static final String GET_ALL_APPROVED_POSTS= "SELECT U.id, U.summary, U.description, R.name as post_type_name, D.name as post_status_name, Z.username as username\n" +
            "FROM post U \n" +
            "JOIN post_type R ON U.post_type_id = R.id\n" +
            "JOIN post_status D ON U.post_status_id = D.id \n" +
            "JOIN users Z ON U.user_id = Z.id \n" +
            "WHERE D.name = 'APPROVED'\n" +
            "ORDER BY U.id";

    @Override
    public List<Post> getAllPostsInfo() {
        List<Post> posts = null;
        Post post;
        User user;
        PostStatus postStatus;
        PostType postType;

        log.trace("Started getting all approved posts from database.");
        try {
            posts = new ArrayList<Post>();
            connection = DBConnectionUtil.getConnection();
            preparedStatement =  connection.prepareStatement(GET_ALL_APPROVED_POSTS);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                post = new Post();
                user = new User();
                postStatus = new PostStatus();
                postType = new PostType();
                post.setId(resultSet.getInt("id"));
                post.setSummary(resultSet.getString("summary"));
                post.setDescription(resultSet.getString("email"));

                postType.setName(resultSet.getString("post_type_name"));
                post.setPostType(postType);

                postStatus.setName(resultSet.getString("post_status_name"));
                post.setPostStatus(postStatus);

                user.setUsername(resultSet.getString("username"));
                post.setUser(user);

                posts.add(post);
            }
            log.trace("All approved post selected successfully");
        } catch (SQLException e) {
            log.error("Something went wrong", e);
        }
        return posts;
    }
}
