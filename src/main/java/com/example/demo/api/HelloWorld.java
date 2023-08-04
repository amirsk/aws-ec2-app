package com.example.demo.api;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.Bucket;
import lombok.extern.java.Log;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Log
class HelloWorld {

    @GetMapping("/hello")
    String sayHello() throws InterruptedException {
        log.info("Hello GET is triggered.");

        AmazonS3 s3Client = AmazonS3ClientBuilder.defaultClient();
        List<Bucket> buckets = s3Client.listBuckets();
        log.info("Found " + buckets.size() + " buckets.");

        Thread.sleep(30000);
        log.info("Slept for 30seconds");

        return "Found " + buckets.size() + " buckets.";
    }

}
