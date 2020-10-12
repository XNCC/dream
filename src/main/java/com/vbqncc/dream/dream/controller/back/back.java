package com.vbqncc.dream.dream.controller.back;

import com.github.pagehelper.PageInfo;
import com.vbqncc.dream.dream.dao.back.backwrite;
import com.vbqncc.dream.dream.pojo.back.content;
import com.vbqncc.dream.dream.pojo.back.template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author ncc
 * @site ncc网站
 * @company 呵呵
 * @create 2020-10-01 23:53
 */
@Controller
public class back {

    /**
     * 跳转到后台编写文章页面
     *
     * @return
     */
    @GetMapping("/backwrite")
    public String backindex() {
        return "back/backwrite";
    }

    @Autowired
    backwrite backwrite;

    /**
     * @param content
     * @param softwaretitle
     * @param contenttype
     * @param tag
     * @return
     * @des 点击发布触发
     */
    @PostMapping("/write")
    @ResponseBody
    public Map write(String content, String softwaretitle, String contenttype, String tag) {
        Map map = new HashMap();
        try {
            content contents = new content();
//            contents.setComment(content);
            contents.setContent(content);
            contents.setContenttype(contenttype);
            contents.setTag(tag);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            contents.setStarttime(df.format(new Date()));
            contents.setState("1");
            backwrite.write(contents);
            map.put("status", 0);
            map.put("msg", "插入成功");
        } catch (Exception e) {
            map.put("status", 0);
            map.put("msg", "插入失败");
        }
        return map;
    }

    /**
     * @param content
     * @param softwaretitle
     * @param contenttype
     * @param tag
     * @return
     * @dec 保存为草稿触发
     */
    @PostMapping("/saveDraft")
    @ResponseBody
    public Map saveDraft(String content, String softwaretitle, String contenttype, String tag) {
        Map map = new HashMap();
        try {
            content contents = new content();
//            contents.setComment(content);
            contents.setContent(content);
            contents.setContenttype(contenttype);
            contents.setTag(tag);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            contents.setStarttime(df.format(new Date()));
            contents.setState("0");//为零保存为草稿
            backwrite.write(contents);
            map.put("status", 0);
            map.put("msg", "插入成功");
        } catch (Exception e) {
            map.put("status", 0);
            map.put("msg", "插入失败");
        }
        return map;
    }

    /////////////////////////////////////模板相关的////////////////////////
    /**
     * @param id
     * @return
     * @dec 编辑模板选择
     */
    @PostMapping("/selectTemplateById")
    @ResponseBody
    public String selectTemplateById(int id) {
        return backwrite.selectTemplateById(id);
    }

    @GetMapping("/templateEdite")
    public String templateEdite(){
        return "back/templateEdite";
    }
    /**
     * 更新模板
     *
     * @param content
     * @param id
     * @return
     */
    @PostMapping("/updateTemplate")
    @ResponseBody
    public String updateTemplate(String content, int id) {
        template template = new template();
        template.setId(id);
        template.setTemplate(content);
        int i = backwrite.updateTemplate(template);
        return String.valueOf(i);
    }
    @PostMapping("/selectFirstTemplate")
    @ResponseBody
    public String selectFirstTemplate(){
        return  backwrite.selectFirstTemplate();
    }
    /////////////////////////////////////模板相关的////////////////////////

    /////////////////////////////////////博客管理////////////////////////
   @GetMapping("/blogManage")
    public String blogManage(Model model,
                             @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize){
       String contenttype="1";
       List<content> contents = backwrite.selectPaging(contenttype, page, pageSize);
       PageInfo<content> pageInfo = new PageInfo<content>(contents);
       long total = pageInfo.getTotal();
       List<content> blogList = pageInfo.getList();
       model.addAttribute("total", pageInfo.getTotal());
       model.addAttribute("page", pageInfo.getPageNum());
       model.addAttribute("pagesize", pageSize);
       model.addAttribute("rows", blogList);     //当前页数据
        return "back/blogManage";
   }


}
