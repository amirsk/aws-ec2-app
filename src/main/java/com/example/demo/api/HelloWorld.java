package com.example.demo.api;

import lombok.extern.java.Log;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Log
class HelloWorld {

    @GetMapping("/hello")
    String sayHello() {
        log.info("Hello GET is triggered.");
        return "Hello World";
    }

}
