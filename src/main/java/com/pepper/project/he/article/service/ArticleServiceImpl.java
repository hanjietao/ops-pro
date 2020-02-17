package com.pepper.project.he.article.service;

import com.pepper.common.utils.security.ShiroUtils;
import com.pepper.common.utils.text.Convert;
import com.pepper.framework.aspectj.lang.annotation.DataScope;
import com.pepper.project.csc.area.mapper.AreaMapper;
import com.pepper.project.he.article.mapper.ArticleMapper;
import com.pepper.project.he.article.domain.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements IArticleService {

    @Autowired
    private ArticleMapper articleDao;

    @Autowired
    private AreaMapper areaDao;

    /**
     *  @Description: 列表查询
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/2/6 0:23
     */
    @DataScope(areaAlias = "a", boardAlias = "b")
    public List<Article> selectArticleList(Article article) {

        List<Article> list = articleDao.selectArticleList(article);
        return list;
    }

    @Override
    public int insertArticle(Article article) {
        article.setCreateBy(ShiroUtils.getLoginName());
        article.setUpdateBy(ShiroUtils.getLoginName());
        return articleDao.insertArticle(article);
    }

    @Override
    public int deleteArticleByIds(String ids) {
        return articleDao.deleteArticleByIds(Convert.toStrArray(ids));
    }

    @Override
    public Article selectArticleById(Integer id) {
        return articleDao.selectArticleById(id);
    }

    @Override
    public int updateArticle(Article article) {
        article.setUpdateBy(ShiroUtils.getLoginName());
        return articleDao.updateArticle(article);
    }


}
