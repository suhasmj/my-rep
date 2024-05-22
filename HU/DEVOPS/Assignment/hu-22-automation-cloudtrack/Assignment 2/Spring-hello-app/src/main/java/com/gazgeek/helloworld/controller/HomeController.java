package com.gazgeek.helloworld.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;  

import java.time.Instant;
@RestController
public class HomeController {

    @RequestMapping("/")
    String home() {
        Timestamp instant= Timestamp.from(Instant.now());

        String res = "HU-22-MAR-tejasmas " + instant ;

        return res;
        // return "Hello from GazGeek!";
    }

}
