package com.vbqncc.dream.dream.service.back;

import com.github.pagehelper.PageHelper;
import com.vbqncc.dream.dream.dao.back.backwrite;
import com.vbqncc.dream.dream.pojo.back.content;
import com.vbqncc.dream.dream.pojo.back.template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ncc
 * @site ncc网站
 * @company 呵呵
 * @create 2020-10-02 16:26
 */
@Service
public class backwriteImpl implements backwrite {
    @Autowired
    backwrite backwrite;

    @Override
    public void write(content content) {
        backwrite.write(content);
    }

    @Override
    public String selectTemplateById(int id) {
        return backwrite.selectTemplateById(id);
    }

    @Override
    public int updateTemplate(template template) {
        return backwrite.updateTemplate(template);
    }

    @Override
    public String selectFirstTemplate() {
        return backwrite.selectFirstTemplate();
    }

    @Override
    public List<content> selectPaging(String contenttype, int page, int pageSize) {
        return  backwrite.selectPaging(contenttype, page, pageSize);
    }

    public List<content> selectPaging(String contenttype, Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        return backwrite.selectPaging(contenttype, page, pageSize);
    }
}
