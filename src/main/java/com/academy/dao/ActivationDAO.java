package com.academy.dao;


import com.academy.util.DBConnectionUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ActivationDAO implements Serializable {

    final static Logger log = LogManager.getLogger(UserDAO.class);

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    static final String ADD_TOKEN_TO_DB = "INSERT INTO account_activation (user_id, token, is_activated) VALUES(?, ?, ?)";

    static final String GET_USER_ID_BY_TOKEN = "SELECT * FROM account_activation WHERE token = ?";

    private static final String ACTIVATE_TOKEN = "UPDATE account_activation SET is_activated = true WHERE token = ?";

    public void saveToken(int userId, String token, boolean isActivated) {
        log.trace("Started saving token to database");
        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(ADD_TOKEN_TO_DB);
            preparedStatement.setInt(1, userId);
            preparedStatement.setString(2, token);
            preparedStatement.setBoolean(3, isActivated);
            preparedStatement.executeUpdate();
            log.debug("Token was successfully saved");
        } catch (SQLException e) {
            log.error("Token wasn't saved to database", e);

        }
    }

    public int getUserIdByToken(String token) {

        int userID = 0;
        log.trace("Started searching record with toke {} in database.", token);
        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_USER_ID_BY_TOKEN);
            preparedStatement.setString(1, token);
            resultSet = preparedStatement.executeQuery();

            if (!resultSet.wasNull()) {
                while (resultSet.next()) {
                    userID = (resultSet.getInt("user_id"));
                }
            }
            return userID;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userID;
    }

    public void markTokenAsActivated(String token){
        log.trace("Started activating token  {} from database.", token);

        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(ACTIVATE_TOKEN);
            preparedStatement.setString(1, token);
            int executionStatus = preparedStatement.executeUpdate();
            if (executionStatus == 0) {
                log.trace("No one token activated");
            }
            else {
                log.debug("Token {} was activated successfully", token);
            }
        } catch (SQLException e){
            log.error("Process of activating token {} has crashed", token, e);
        }

    }
}
