package com.pepper.project.he.article.mapper;

import com.pepper.project.he.article.domain.Article;

import java.util.List;

public interface ArticleMapper {

    Article selectArticleById(Long id);
    List<Article> selectArticleList(Article article);

    public int insertArticle(Article board);

    int deleteArticleByIds(String[] ids);

    int updateArticle(Article article);

    int updateWatchCount(Long id);
}
