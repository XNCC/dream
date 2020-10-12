package com.vbqncc.dream.dream.controller.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ncc
 * @site ncc网站
 * @company 呵呵
 * @create 2020-09-28 18:44
 */
@Controller
public class index {
    @GetMapping("/index")
    public String index(){
        return "index/index";
    }

    @GetMapping("/download")
    public String download(){
        return "index/indexdowload";
    }
}
