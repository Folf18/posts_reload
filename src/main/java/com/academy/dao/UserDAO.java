package com.academy.dao;

import com.academy.model.Role;
import com.academy.model.User;
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

public class UserDAO implements Serializable {
    final static Logger log = LogManager.getLogger(UserDAO.class);

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    //CRUD

    static final String GET_ALL_USERS = "SELECT U.id, U.username, U.email, U.is_blocked,  U.is_active, U.role_id, R.name as role_name \n" +
            "FROM users U LEFT JOIN role R ON U.role_id = R.id \n" +
            "ORDER BY U.id";

    static final String INSERT_USER = "INSERT INTO users (username, email, password, is_active, is_blocked, role_id) VALUES(?, ?, ?, ?, ?, ?)";

    static final String FIND_USER_IN_DB_BY_CREDENTIALS = "SELECT users.id FROM users WHERE username = ?  AND password = ?";

    static final String FIND_USER_IN_DB_BY_EMAIL = "SELECT * FROM users WHERE email = ?";

    static final String FIND_USER_IN_DB_BY_ID = "SELECT U.id, U.username, U.email, U.is_blocked,  U.is_active, U.role_id, R.name as role_name \n" +
            "FROM users U LEFT JOIN role R ON U.role_id = R.id \n" +
            "WHERE U.id = ?\n" +
            "ORDER BY U.id";

    private static final String ACTIVATE_USER = "UPDATE users SET is_active = true WHERE id = ?";

    private static final String CHANGE_BLOCKING_STATUS = "UPDATE users SET is_blocked = ? WHERE id = ?";

    private static final String CHANGE_ROLE = "UPDATE users SET role_id = ? WHERE id = ?";

    private static final String CHECK_IF_USERNAME_EXIST = "SELECT id FROM users WHERE username = ?";

    private static final String CHECK_IF_EMAIL_EXIST = "SELECT id FROM users WHERE email = ?";




    public List<User> getAllUsersInfo() {
        List<User> users = null;
        User user;
        Role role;

        log.trace("Started getting all users from database.");
        try {
            users = new ArrayList<User>();
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_ALL_USERS);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                user = new User();
                role = new Role();
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setIsBlocked(resultSet.getBoolean("is_blocked"));
                user.setIsActive(resultSet.getBoolean("is_active"));
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


    public void insertUser(User user) {
        log.trace("Started saving user to database");
        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(INSERT_USER);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setBoolean(4, user.getIsActive());
            preparedStatement.setBoolean(5, user.getIsBlocked());
            preparedStatement.setInt(6, user.getRole().getId());
            preparedStatement.executeUpdate();
            log.debug("User was successfully saved");
        } catch (SQLException e) {
            log.error("User wasn't saved to database", e);

        }
    }

    public User getUserByEmail(String email){

        User user = null;

        log.trace("Started searching user with email {} in database", email);
        try {
            user = new User();
            Role role = new Role();
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(FIND_USER_IN_DB_BY_EMAIL);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();

            if (!resultSet.wasNull()) {
                while (resultSet.next()) {
                    user.setId(resultSet.getInt("id"));
                    user.setUsername(resultSet.getString("username"));
                    user.setEmail(resultSet.getString("email"));
                    user.setIsBlocked(resultSet.getBoolean("is_blocked"));

                    role.setId(resultSet.getInt("role_id"));
                    //role.setName(resultSet.getString("role_name"));

                    user.setRole(role);
                }
            }
            return user;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public User getUserById(int id){

        User user = null;

        log.trace("Started searching user with id {} in database", id);
        try {
            user = new User();
            Role role = new Role();
            //RoleDAO roleDAO = new RoleDAO();
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(FIND_USER_IN_DB_BY_ID);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if (!resultSet.wasNull()) {
                while (resultSet.next()) {
                    user.setId(resultSet.getInt("id"));
                    user.setUsername(resultSet.getString("username"));
                    user.setEmail(resultSet.getString("email"));
                    user.setIsBlocked(resultSet.getBoolean("is_blocked"));
                    user.setIsActive(resultSet.getBoolean("is_active"));
                    role.setId(resultSet.getInt("role_id"));
                    role.setName(resultSet.getString("role_name"));
                    user.setRole(role);
                }
            }
            return user;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }


    public int getUserIdByCredentials(String username, String password) {
        int userId = 0;

        log.trace("Started searching user in database.");
        try {
            Role role = new Role();
            RoleDAO roleDAO = new RoleDAO();
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(FIND_USER_IN_DB_BY_CREDENTIALS);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();

            if (!resultSet.wasNull()) {
                while (resultSet.next()) {
                    userId = resultSet.getInt("id");
                }
            }
            return userId;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userId;
    }

    public boolean activateUserById(int id){
        log.trace("Started activating user with id {} from database.", id);

        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(CHANGE_BLOCKING_STATUS);
            preparedStatement.setInt(1, id);
            int executionStatus = preparedStatement.executeUpdate();
            if (executionStatus == 0) {
                log.trace("No one user activated");
                return false;
            }
            else {
                log.debug("User with id {} was activated successfully", id);
                return true;
            }
        } catch (SQLException e){
            log.error("Process of activating user with id {} has crashed", id, e);
        }

        return false;
    }

    public boolean changeUserRole(int id, int role_id){
        log.trace("Started changing role for user with id {}.", id);

        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(CHANGE_ROLE);
            preparedStatement.setInt(1, role_id);
            preparedStatement.setInt(2, id);
            int executionStatus = preparedStatement.executeUpdate();
            if (executionStatus == 0) {
                log.trace("No one user role changed");
                return false;
            }
            else {
                log.debug("User role change for user with id {} is successful", id);
                return true;
            }
        } catch (SQLException e){
            log.error("Process of changing  of user role  with id {} has crashed", id, e);
        }

        return false;
    }

    public boolean blockUserById(int id, boolean status){
        log.trace("Started blocking user with id {} in database.", id);

        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(CHANGE_BLOCKING_STATUS);
            preparedStatement.setBoolean(1, status);
            preparedStatement.setInt(2, id);
            int executionStatus = preparedStatement.executeUpdate();
            if (executionStatus == 0) {
                log.trace("No one user blocked");
                return false;
            }
            else {
                log.debug("User blocking change  with id {}  successfully", id);
                return true;
            }
        } catch (SQLException e){
            log.error("Process of changing blocking of user with id {} has crashed", id, e);
        }

        return false;
    }

    public int usernameExists(String username){
        log.trace("Started verifying if user with username {} already exists.", username);
        int id = 0;
        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(CHECK_IF_USERNAME_EXIST);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                id = resultSet.getInt("id");

            }
            log.info("User with username {} already exists.", username);
            return id;


        } catch (SQLException e){
            log.error("Process of seraching of user with username {} has crashed", username, e);
        }

        log.info("User with username {} doesn't exist.", username);
        return id;
    }

    public int emailExists(String email) {
        log.trace("Started verifying if user with email {} already exists.", email);
        int id = 0;
        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(CHECK_IF_EMAIL_EXIST);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                id = resultSet.getInt("id");

            }
            return id;
        } catch (SQLException ex) {
            log.error("Process of seraching of user with email {} has crashed ", email, ex);


            return id;
        }
    }
}
