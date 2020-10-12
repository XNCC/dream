package com.vbqncc.dream.dream.dao.back;

import com.vbqncc.dream.dream.pojo.back.content;
import com.vbqncc.dream.dream.pojo.back.template;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author ncc
 * <p>
 * 写将数据内容写到数据库
 */
@Mapper
public interface backwrite {

    public void write(content content);

    public String selectTemplateById(int id);

    public int updateTemplate(template template);

    public String selectFirstTemplate();

    public List<content> selectPaging(String contenttype, int page, int pageSize);
}
