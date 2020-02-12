package com.academy.dao.interfaces;

import com.academy.model.User;

import java.util.List;

public interface IUserDAO {

    List<User> getAllUsersInfo();
    void insertUser(User user);
    User searchUserInDB(String username, String password);

}

