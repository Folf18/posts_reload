package com.academy.service.interfaces;



import com.academy.model.User;

import java.io.IOException;
import java.util.List;

public interface IUserService {

    List<User> getAllUsers();
    void createUser(User user);
    boolean isAbleToSignIn(String username, String password) throws IOException;

}
