package com.example.graalvm_sck_app.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @Value("${my.config.key}")
    private String configValue;

    @Value("${db.password}")
    private String dbPassword;

    @Value("${api.key}")
    private String apiKey;

    @GetMapping
    public String hello() {
        return "Hello, World!\n";
    }

    @GetMapping("/config")
    public String getConfigValue() {
        return "Config Value: " + configValue + "\n";
    }

    @GetMapping("/db-password")
    public String getDbPassword() {
        return "DB Password: " + dbPassword + "\n";
    }

    @GetMapping("/api-key")
    public String getApiKey() {
        return "API Key: " + apiKey + "\n";
    }

}
