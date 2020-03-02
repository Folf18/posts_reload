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

    private static Session session;

    public static String APP_URL;

    //public static String APP_URL = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()

    public MailService() {}

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

        String message = "Hi there! To activate your account, please follow link <a href='" +  APP_URL + "/activateAccount?token=" + token + " " + "'>Activate account</a>";

        sendMimeMessage(email, "Account activation", message);

    }

    public void sendGreetings(String email) throws MessagingException {

        String message = "Welcome to our advertising system! <br/>  Your account was successfully activated.<br/><br/><a href='" + APP_URL + "/signin" + "' style='margin-left:30%;'>LOGIN TO ACCOUNT</a>";

        sendMimeMessage(email, "Congratulations", message);

    }

    public void sendAdsStatus(String username, String email, String summary, String status) throws MessagingException {
        String message = "Hi "+ username +"! <br/>  <br/>" +
                "Your ads <b> \""+ summary+"\"</b> was "+status.toLowerCase()+" by manager.";

        sendMimeMessage(email, "Ads status changed", message);
    }


    private static void init() {

        Map<String, String> connectionProperties = PropertiesService.getInstance().getMailProperties();

        APP_URL = connectionProperties.get("app_url");

        Properties properties = new Properties();

        properties.put("mail.smtp.host", connectionProperties.get("host"));
        properties.put("mail.smtp.socketFactory.port", connectionProperties.get("socketFactoryPort"));
        properties.put("mail.smtp.socketFactory.class", connectionProperties.get("socketFactoryClass"));
        properties.put("mail.smtp.auth", connectionProperties.get("auth"));
        properties.put("mail.smtp.port", connectionProperties.get("port"));

        session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(connectionProperties.get("username"), connectionProperties.get("password"));
            }
        });
    }
}
