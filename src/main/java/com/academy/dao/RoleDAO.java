package com.academy.dao;

import com.academy.model.Role;
import com.academy.util.DBConnectionUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleDAO implements Serializable {

    final static Logger log = LogManager.getLogger(RoleDAO.class);

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    static final String GET_ROLE_ID_BY_NAME = "SELECT id FROM role WHERE name = ?";
    static final String GET_ROLE_NAME_BY_ID = "SELECT name FROM role WHERE id = ?";

    public Role getRoleIdByName(String name){

        Role role = new Role();

        log.trace("Started searching role with name {} in database", name);
        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_ROLE_ID_BY_NAME);
            preparedStatement.setString(1, name);
            resultSet = preparedStatement.executeQuery();

            if (!resultSet.wasNull()) {
                while (resultSet.next()) {
                    role.setId(resultSet.getInt("id"));
                    role.setName(resultSet.getString("name"));
                }
            }
            return role;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return role;
    }

    public String getRoleNameById(int id){

        String roleName = "";

        log.trace("Started searching role with id {} in database", id);
        try {
            connection = DBConnectionUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_ROLE_NAME_BY_ID);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if (!resultSet.wasNull()) {
                while (resultSet.next()) {
                    roleName = resultSet.getString("name");
                }
            }
            return roleName;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roleName;
    }

}
