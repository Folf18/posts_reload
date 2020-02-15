package com.academy.service;

import com.academy.dao.UserDAO;
import com.academy.model.Role;
import com.academy.model.User;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

public class UserService implements Serializable {

    UserDAO userDAO = new UserDAO();


    public List<User> getAllUsers() {
        return userDAO.getAllUsersInfo();
    }


    public void createUser(User user) {
        Role role = new Role();
        role.setId(3);

        user.setIsBlocked(false);
        user.setIsActive(false);
        user.setRole(role);
        userDAO.insertUser(user);
    }


    public boolean isAbleToSignIn(String username, String password) throws IOException {
        User foundUser = userDAO.searchUserInDB(username, password);

        boolean result;
        result = foundUser.getId() == 0 ? false : true;

        return  result;
    }
}
