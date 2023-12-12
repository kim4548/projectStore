package com.projectStore.store.Controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@Controller
public class ProductController {
private static final Logger logger =LoggerFactory.getLogger(ProductController.class);

    @RequestMapping(value = "/ceramics",method = RequestMethod.GET)
    public void mainPageGet(){
        logger.info("메인페이지 진입");

    }

    @GetMapping("/display")
    public ResponseEntity<byte[]> getImage(String fileName){

    File file = new File("c:\\upload\\"+ fileName);
        ResponseEntity<byte[]> result = null;

        try {

            HttpHeaders header = new HttpHeaders();

            header.add("Content-type", Files.probeContentType(file.toPath()));

            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

        }catch (IOException e) {
            e.printStackTrace();
        }

        return result;
    }







}
