package com.academy.service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class TokenService {
    private static TokenService tokenService;


    protected TokenService() {}

    public static TokenService getInstance() {
        if (tokenService == null) {
            tokenService = new TokenService();
        }
        return tokenService;
    }

    public String generateToken() {

        String token = UUID.randomUUID().toString().replaceAll("-", "");
        return token;

    }


}
