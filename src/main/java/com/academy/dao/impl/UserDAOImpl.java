package com.academy.dao.impl;

import com.academy.dao.IUserDAO;
import com.academy.model.Role;
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

public class UserDAOImpl implements IUserDAO {
    final static Logger log = LogManager.getLogger(UserDAOImpl.class);;

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    //CRUD

    static final String GET_ALL_USERS = "SELECT U.id, U.username, U.email, U.is_blocked, U.role_id, R.name as role_name FROM users U LEFT JOIN role R ON U.role_id = R.id ORDER BY U.id";
    static final String INSERT_USER = "INSERT INTO users (username, email, password) VALUES(?, ?, ?)";
    //ADDITIONAL QUERIES
    //static final String BLOCK_USER = "UPDATE users SET is_blocked = ? WHERE id = ?";






    @Override
    public List<User> getAllUsersInfo() {
        List<User> users = null;
        User user;
        Role role;

        log.trace("Started getting all users from database.");
        try {
            users = new ArrayList<User>();
            connection = DBConnectionUtil.getConnection();
            preparedStatement =  connection.prepareStatement(GET_ALL_USERS);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                user = new User();
                role = new Role();
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setIsBlocked(resultSet.getBoolean("is_blocked"));
                role.setId(resultSet.getInt("role_id"));
                role.setName(resultSet.getString("role_name"));
                user.setRole(role);
                users.add(user);
            }
            log.trace("All users selected successfully");
        } catch (SQLException e) {
            log.error("Something went wrong", e);
        }
        return users;
    }

    @Override
    public void insertUser(User user) {
        log.trace("Started saving user to database");
        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(INSERT_USER);
            preparedStatement.setObject(1, user.getUsername());
            preparedStatement.setObject(2, user.getEmail());
            preparedStatement.setObject(3, user.getPassword());
            preparedStatement.executeUpdate();
            log.debug("User was successfully saved");
        } catch (SQLException e){
            log.error("User wasn't saved to database", e);

        }
    }

}
