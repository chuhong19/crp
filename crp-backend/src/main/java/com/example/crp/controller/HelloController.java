package com.example.crp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() {
        return "Hello World! Welcome to CRP Backend";
    }

    @GetMapping("/health")
    public String health() {
        return "OK";
    }
}