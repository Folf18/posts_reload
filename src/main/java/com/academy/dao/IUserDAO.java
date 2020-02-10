package com.academy.dao;

import com.academy.model.User;

import java.util.List;

public interface IUserDAO {

    List<User> getAllUsersInfo();
    void insertUser(User user);

}

