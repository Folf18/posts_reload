package com.academy.service;

import com.academy.dao.interfaces.IUserDAO;
import com.academy.dao.UserDAOImpl;
import com.academy.model.Role;
import com.academy.model.User;
import com.academy.service.interfaces.IUserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.List;

public class UserServiceImpl implements IUserService {

    IUserDAO userDAO = new UserDAOImpl();

    @Override
    public List<User> getAllUsers() {
        return userDAO.getAllUsersInfo();
    }

    @Override
    public void createUser(User user) {
        Role role = new Role();
        role.setId(3);

        user.setIsBlocked(false);
        user.setIsActive(false);
        user.setRole(role);
        userDAO.insertUser(user);
    }

    @Override
    public boolean isAbleToSignIn(String username, String password) throws IOException {
        User foundUser = userDAO.searchUserInDB(username, password);

        boolean result;
        result = foundUser.getId() == 0 ? false : true;

        return  result;
    }
}
