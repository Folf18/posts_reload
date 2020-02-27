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


    public User getUserInfoById(int id){
      return userDAO.getUserById(id);
    }

    public void createUser(User user) {
        Role role = new Role();

        //Hardcoded and should be replaced to search by Role.name
        role.setId(3);

        user.setIsBlocked(false);
        user.setIsActive(false);
        user.setRole(role);
        userDAO.insertUser(user);
    }


    public int getUserIdByCredentials(String username, String password) throws IOException {
        return  userDAO.getUserIdByCredentials(username, password);
    }

    public String blockUserById(int id, boolean currentStatus){

        if (currentStatus == true) {
            currentStatus = false;
        }
        else if (currentStatus == false) {
            currentStatus = true;
        }

        if (userDAO.blockUserById(id, currentStatus) == true){
            return "User blocking changed successfully";
        }
        else return "User blocking wasn't changed";
    }

    public String changeUserRole(int id, int role_id){

        if (role_id == 3) {
            role_id = 2;
        }
        else if (role_id == 2) {
            role_id = 3;
        }

        if (userDAO.changeUserRole(id, role_id) == true){
            return "Role changed successfully";
        }
        else return "User role wasn't changed";
    }

    public boolean checkIfEmailExists(String email){
        return userDAO.emailExists(email) == 0 ? false : true;
    }

    public boolean checkIfEUsernameExists(String username){
        return userDAO.usernameExists(username) == 0 ? false : true;
    }
}
