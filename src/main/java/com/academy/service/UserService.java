package com.academy.service;

import com.academy.dao.UserDAO;
import com.academy.model.Role;
import com.academy.model.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

public class UserService implements Serializable {
    final static Logger log = LogManager.getLogger(UserService.class);

    private static UserService userService;

    public UserService() {}

    public static UserService getInstance() {
        if (userService == null) {
            userService = new UserService();
        }
        return userService;
    }

    UserDAO userDAO = new UserDAO();


    public List<User> getAllUsers() {
        return userDAO.getAllUsersInfo();
    }


    public void createUser(User user) {
        Role role = new Role();

        //Hardcoded and should be replaced to Role.name
        role.setId(3);

        user.setIsBlocked(false);
        user.setIsActive(false);
        user.setRole(role);
        userDAO.insertUser(user);
    }


    public boolean isAbleToSignIn(String username, String password) throws IOException {
        User foundUser = userDAO.searchUserInDBbyCredentials(username, password);

        boolean result;
        result = foundUser.getId() == 0 ? false : true;

        return  result;
    }
}
