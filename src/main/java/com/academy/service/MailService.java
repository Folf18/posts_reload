package com.academy.service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class MailService implements Serializable {

    private static MailService mailService;

    public static String BASE_URL;

    private static Session session;

    private MailService() {}

    public static MailService getInstance() {
        if (mailService == null) {
            mailService = new MailService();
            init();
        }
        return mailService;
    }

    private void sendMimeMessage(String email, String topic, String message) throws MessagingException {

        MimeMessage mimeMessage = new MimeMessage(session);

        mimeMessage.setSubject(topic);

        mimeMessage.setFrom(new InternetAddress("any@mail.com"));
        mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));

        MimeBodyPart mimeBodyPart = new MimeBodyPart();
        mimeBodyPart.setContent(message, "text/html");

        MimeMultipart mimeMultipart = new MimeMultipart();
        mimeMultipart.addBodyPart(mimeBodyPart);

        mimeMessage.setContent(mimeMultipart);

        Transport.send(mimeMessage);

    }

    public void sendActivationToken(String email, String token) throws MessagingException {

        String link = BASE_URL + "/activateAccount?token=" + token;

        String message = "Hi there! To activate your account, please follow link:<br/><br/><a href='" + link + "' style='margin-left:30%;'>Activate account</a>";

        sendMimeMessage(email, "Account activation", message);

    }

    public void sendGreetings(String email) throws MessagingException {

        String link = BASE_URL + "/signin";

        String message = "Welcome to our advertising system! <br/>  Your account was successfully activated.<br/><br/><a href='" + link + "' style='margin-left:30%;'>LOGIN TO ACCOUNT</a>";

        sendMimeMessage(email, "Congratulations", message);

    }


    private static void init() {

        Map<String, String> connectionProperties = PropertiesService.getInstance().getMailProperties();

        BASE_URL = connectionProperties.get("base_url");

        Properties properties = new Properties();

        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.socketFactory.port", "465");
        properties.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "465");

        session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(connectionProperties.get("username"), connectionProperties.get("password"));
            }
        });
    }
}
