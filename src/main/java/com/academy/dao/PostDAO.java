package com.academy.dao;

import com.academy.model.Post;
import com.academy.model.PostStatus;
import com.academy.model.PostType;
import com.academy.model.User;
import com.academy.util.DBConnectionUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class PostDAO implements Serializable {
    final static Logger log = LogManager.getLogger(PostDAO.class);;

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    //SQL
        private static final String GET_ALL_APPROVED_POSTS= "SELECT U.id, U.summary, U.description, U.created_at, R.name as post_type_name, D.name as post_status_name, Z.username as username\n" +
                "FROM post U \n" +
                "JOIN post_type R ON U.post_type_id = R.id\n" +
                "JOIN post_status D ON U.post_status_id = D.id \n" +
                "JOIN users Z ON U.user_id = Z.id \n" +
                "WHERE D.name = 'APPROVED' \n" +
                "ORDER BY U.created_at DESC \n" +
                "LIMIT ? offset ?";




    private static final String GET_ALL_POSTS_BY_STATUS = "SELECT U.id, U.summary, U.description, U.created_at, R.name as post_type_name, D.name as post_status_name, Z.username as username\n" +
            "FROM post U \n" +
            "JOIN post_type R ON U.post_type_id = R.id\n" +
            "JOIN post_status D ON U.post_status_id = D.id \n" +
            "JOIN users Z ON U.user_id = Z.id \n" +
            "WHERE D.name = ? \n" +
            "ORDER BY U.created_at DESC \n" +
            "LIMIT ? offset ?";

    private static final String GET_USER_POSTS = "SELECT U.id, U.summary, U.description, U.created_at, R.name as post_type_name, D.name as post_status_name, Z.username as username\n" +
            " FROM post U \n" +
            " JOIN post_type R ON U.post_type_id = R.id\n" +
            " JOIN post_status D ON U.post_status_id = D.id\n" +
            " JOIN users Z ON U.user_id = Z.id\n" +
            " WHERE D.name = ?\n" +
            " AND Z.id = ?\n" +
            " ORDER BY U.created_at DESC ";

    private static final String GET_POST_INFO = "SELECT U.id, U.summary, U.description, U.created_at, R.name as post_type_name, D.name as post_status_name, Z.username as username, Z.email as email\n" +
            "FROM post U \n" +
            "JOIN post_type R ON U.post_type_id = R.id\n" +
            "JOIN post_status D ON U.post_status_id = D.id \n" +
            "JOIN users Z ON U.user_id = Z.id \n" +
            "WHERE U.id = ?";

    private static final String INSERT_POST = "INSERT INTO post (summary, description, post_type_id, user_id, post_status_id) VALUES(?, ?, ?, ?, ?)";

    private static final String APPROVE_POST = "UPDATE public.post SET post_status_id=2 WHERE id = ?";

    private static final String DECLINE_POST = "UPDATE public.post SET post_status_id=3 WHERE id = ?";

    private static final String GET_NUMBER_OF_APPROVED_POSTS = "SELECT COUNT(*)\n" +
                                                                "FROM post\n" +
                                                                "WHERE post_status_id = 2";

    private static final String GET_NUMBER_OF_POSTS_BY_STATUS = "SELECT COUNT(*)\n" +
                                                                "FROM post\n" +
                                                                "WHERE post_status_id = ?";



    public int numberOfApprovedRecords(){

        int number = 0;

        log.trace("Started getting number of approved ads");
        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement =  connection.prepareStatement(GET_NUMBER_OF_APPROVED_POSTS);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                number = resultSet.getInt(1);
            }
            log.trace("Number of ads = "+number);
            //connection.close();
        } catch (SQLException e) {
            log.error("Something went wrong", e);
        }
        return number;
    }

    public int numberOfRecordsByStatus(int id){

        int number = 0;

        log.trace("Started getting number of ads by status");
        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement =  connection.prepareStatement(GET_NUMBER_OF_POSTS_BY_STATUS);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                number = resultSet.getInt(1);
            }
            log.trace("Number of ads = "+number);
            //connection.close();
        } catch (SQLException e) {
            log.error("Something went wrong", e);
        }
        return number;
    }

    public List<Post> getAllApprovedPosts(int limit, int offset) {
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
            preparedStatement.setInt(1, limit);
            preparedStatement.setInt(2, offset);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                post = new Post();
                user = new User();
                postStatus = new PostStatus();
                postType = new PostType();
                post.setId(resultSet.getInt("id"));
                post.setSummary(resultSet.getString("summary"));
                post.setDescription(resultSet.getString("description"));

                postType.setName(resultSet.getString("post_type_name"));
                post.setPostType(postType);

                postStatus.setName(resultSet.getString("post_status_name"));
                post.setPostStatus(postStatus);

                OffsetDateTime createdAt  = resultSet.getObject("created_at", OffsetDateTime.class);
              /*  OffsetDateTime createdAt;
                createdAt = (OffsetDateTime) resultSet.getObject("created_at");
               */
                post.setCreatedAt(createdAt);

                user.setUsername(resultSet.getString("username"));
                post.setUser(user);

                posts.add(post);
            }
            log.trace("All approved post selected successfully");
            //connection.close();
        } catch (SQLException e) {
            log.error("Something went wrong", e);
        }
        return posts;
    }

    public void createPost(Post post) {
        log.trace("Started saving post to database");
        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(INSERT_POST);
            preparedStatement.setString(1, post.getSummary());
            preparedStatement.setString(2, post.getDescription());
            preparedStatement.setInt(3, post.getPostType().getId());
            preparedStatement.setInt(4, post.getUser().getId());
            preparedStatement.setInt(5, post.getPostStatus().getId());

            preparedStatement.executeUpdate();
            log.debug("Post was successfully saved");
        } catch (SQLException e){
            log.error("Post wasn't saved to database", e);

        }
    }

    public List<Post> getAllPostsByStatus(String status, int limit, int offset) {
        List<Post> posts = null;
        Post post;
        User user;
        PostStatus postStatus;
        PostType postType;

        log.trace("Started getting all posts by status {} from database.", status);
        try {
            posts = new ArrayList<Post>();
            connection = DBConnectionUtil.getConnection();
            preparedStatement =  connection.prepareStatement(GET_ALL_POSTS_BY_STATUS);
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, limit);
            preparedStatement.setInt(3, offset);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                post = new Post();
                user = new User();
                postStatus = new PostStatus();
                postType = new PostType();
                post.setId(resultSet.getInt("id"));
                post.setSummary(resultSet.getString("summary"));
                post.setDescription(resultSet.getString("description"));

                postType.setName(resultSet.getString("post_type_name"));
                post.setPostType(postType);

                postStatus.setName(resultSet.getString("post_status_name"));
                post.setPostStatus(postStatus);

                OffsetDateTime createdAt  = resultSet.getObject("created_at", OffsetDateTime.class);
                post.setCreatedAt(createdAt);

                user.setUsername(resultSet.getString("username"));
                post.setUser(user);

                posts.add(post);
            }
            log.trace("All new post selected successfully");
            //connection.close();
        } catch (SQLException e) {
            log.error("Something went wrong", e);
        }
        return posts;
    }

    public List<Post> getUserPosts(String status, int id){
        List<Post> posts = null;
        Post post;
        User user;
        PostStatus postStatus;
        PostType postType;

        log.trace("Started getting all posts for user with id {} from database.", id);
        try {
            posts = new ArrayList<Post>();
            connection = DBConnectionUtil.getConnection();
            preparedStatement =  connection.prepareStatement(GET_USER_POSTS);
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, id);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                post = new Post();
                user = new User();
                postStatus = new PostStatus();
                postType = new PostType();
                post.setId(resultSet.getInt("id"));
                post.setSummary(resultSet.getString("summary"));
                post.setDescription(resultSet.getString("description"));

                postType.setName(resultSet.getString("post_type_name"));
                post.setPostType(postType);

                postStatus.setName(resultSet.getString("post_status_name"));
                post.setPostStatus(postStatus);

                OffsetDateTime createdAt  = resultSet.getObject("created_at", OffsetDateTime.class);
                post.setCreatedAt(createdAt);

                user.setUsername(resultSet.getString("username"));
                post.setUser(user);

                posts.add(post);
            }
            log.trace("All ads selected successfully");
            //connection.close();
        } catch (SQLException e) {
            log.error("Something went wrong", e);
        }
        return posts;
    }

    public void approvePostById(int id) {
        log.trace("Started approving post with id {} from database.", id);

        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(APPROVE_POST);
            preparedStatement.setInt(1, id);
            int executionStatus = preparedStatement.executeUpdate();
            if (executionStatus == 0) {  log.trace("No one post was approved");}
            else log.debug("Post with id {} was approved successfully", id);
        } catch (SQLException e){
            log.error("Process of approving role with id {} has crashed", id, e);
        }

    }

    public void declinePostById(int id) {
        log.trace("Started declining post with id {} from database.", id);

        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(DECLINE_POST);
            preparedStatement.setInt(1, id);
            int executionStatus = preparedStatement.executeUpdate();
            if (executionStatus == 0) {  log.trace("No one post was declined");}
            else log.debug("Post with id {} was declined successfully", id);
        } catch (SQLException e){
            log.error("Process of declining role with id {} has crashed", id, e);
        }
    }

    public Post getPostInfo(int id) {
        Post post = new Post();
        User user;
        PostStatus postStatus;
        PostType postType;

        log.trace("Started getting post with id {} from database.", id);
        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement =  connection.prepareStatement(GET_POST_INFO);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                user = new User();
                postStatus = new PostStatus();
                postType = new PostType();

                post.setId(resultSet.getInt("id"));
                post.setSummary(resultSet.getString("summary"));
                post.setDescription(resultSet.getString("description"));

                postType.setName(resultSet.getString("post_type_name"));
                post.setPostType(postType);

                postStatus.setName(resultSet.getString("post_status_name"));
                post.setPostStatus(postStatus);

                OffsetDateTime createdAt  = resultSet.getObject("created_at", OffsetDateTime.class);
                post.setCreatedAt(createdAt);

                user.setUsername(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                post.setUser(user);

            }
            log.trace("Post selected successfully");
            return post;
            //connection.close();
        } catch (SQLException e) {
            log.error("Something went wrong", e);
        }
        return post;
    }

}
