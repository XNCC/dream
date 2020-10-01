package com.vbqncc.dream.dream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author ncc
 * @site ncc网站
 * @company 呵呵
 * @create 2020-10-01 23:53
 */
@Controller
public class back {

    @GetMapping("/backwrite")
    public String backindex(){
        return "back/backwrite";
    }
}
