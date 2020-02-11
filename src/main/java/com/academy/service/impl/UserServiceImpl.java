package com.academy.service.impl;

import com.academy.dao.IUserDAO;
import com.academy.dao.impl.UserDAOImpl;
import com.academy.model.User;
import com.academy.service.IUserService;

import java.util.List;

public class UserServiceImpl implements IUserService {

    IUserDAO userDAO = new UserDAOImpl();

    @Override
    public List<User> getAllUsers() {
        return userDAO.getAllUsersInfo();
    }

    @Override
    public void createUser(User user) {
        userDAO.insertUser(user);
    }

}
