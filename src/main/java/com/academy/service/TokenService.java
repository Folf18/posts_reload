package com.academy.service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class TokenService {
    private static TokenService tokenService;

    private Map<String, String> accessTokens = new HashMap<>();

    protected TokenService() {}

    public static TokenService getInstance() {
        if (tokenService == null) {
            tokenService = new TokenService();
        }
        return tokenService;
    }

    public String generate(String username) {

        String token = UUID.randomUUID().toString().replaceAll("-", "");

        accessTokens.put(username, token);

        return token;

    }


}
