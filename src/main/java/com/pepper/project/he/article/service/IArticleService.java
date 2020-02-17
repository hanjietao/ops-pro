package com.pepper.project.he.article.service;

import com.pepper.project.he.article.domain.Article;

import java.util.List;

public interface IArticleService {

    List<Article> selectArticleList(Article article);
    int insertArticle(Article article);

    int deleteArticleByIds(String ids);

    Article selectArticleById(Integer id);

    int updateArticle(Article article);

}
