package com.academy.service;

import com.academy.dao.ActivationDAO;
import com.academy.dao.UserDAO;
import com.academy.model.User;

import java.io.Serializable;

public class ActivationService extends TokenService implements Serializable {

    public static ActivationService activationService;

    public ActivationService() {
        super();
    }

    public static ActivationService getInstance() {
        if (activationService == null) {
            activationService = new ActivationService();
        }
        return activationService;
    }

    ActivationDAO activationDAO = new ActivationDAO();
    UserDAO userDAO = new UserDAO();

    public void saveAndSendMail(String email) {


        String token = super.generateToken();
        User user = new UserDAO().getUserByEmail(email);
        boolean isActivated = false;

        activationDAO.saveToken(user.getId(), token, isActivated);
        MailService mailService = MailService.getInstance();

        try {
            mailService.sendActivationToken(email, token);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public boolean activateAccountAndSendMail(String token) {
        int userId = activationDAO.getUserIdByToken(token);
        if (userId != 0) {
            if (userDAO.activateUserById(userId) == true) {
                activationDAO.markTokenAsActivated(token);
                MailService mailService = MailService.getInstance();

                try {
                    User userEmail = userDAO.getUserById(userId);
                    mailService.sendGreetings(userEmail.getEmail());

                } catch (Exception e) {
                    e.printStackTrace();
                }
                return true;
            }
        }

        return false;
    }


}
