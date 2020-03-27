package com.pepper.project.he.article.controller;

import com.pepper.common.utils.JsoupUtils;
import com.pepper.framework.aspectj.lang.annotation.Log;
import com.pepper.framework.aspectj.lang.enums.BusinessType;
import com.pepper.framework.web.controller.BaseController;
import com.pepper.framework.web.domain.AjaxResult;
import com.pepper.framework.web.page.TableDataInfo;
import com.pepper.project.he.article.domain.Article;
import com.pepper.project.he.article.service.IArticleService;
import com.pepper.project.he.board.domain.Board;
import com.pepper.project.he.board.service.IBoardService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/he/article")
public class ArticleController extends BaseController {

    private String prefix = "he/article";

    @Autowired
    private IArticleService articleService;

    @Autowired
    private IBoardService boardService;

    @RequiresPermissions("he:article:view")
    @GetMapping()
    public String online(ModelMap mmap)
    {
        List<Board> boards = boardService.selectBoardList(new Board());
        mmap.put("boards",boards);
        return prefix + "/article";
    }

    @RequiresPermissions("he:article:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Article article)
    {
        startPage();
        List<Article> list = articleService.selectArticleList(article);
        return getDataTable(list);
    }

    /**
     * 新增宣教文章
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        List<Board> boards = boardService.selectBoardList(new Board());
        mmap.put("boards",boards);
        return prefix + "/add";
    }

    /**
     * 新增保存宣教文章
     */
    @Log(title = "宣教文章", businessType = BusinessType.INSERT)
    @RequiresPermissions("he:article:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Article article)
    {
        String content = article.getContent();
        String result = JsoupUtils.getAllImgSrcUrlFromContent(content);
        article.setImgUrls(result);
        return toAjax(articleService.insertArticle(article));
    }

    /**
     * 修改宣教文章
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        List<Board> boards = boardService.selectBoardList(new Board());
        mmap.put("boards",boards);
        mmap.put("article", articleService.selectArticleById(id));
        return prefix + "/edit";
    }

    /**
     * 修改保存宣教文章
     */
    @RequiresPermissions("he:article:edit")
    @Log(title = "宣教文章", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Article article)
    {
        String content = article.getContent();
        String result = JsoupUtils.getAllImgSrcUrlFromContent(content);
        article.setImgUrls(result);
        return toAjax(articleService.updateArticle(article));
    }

    /**
     * 删除宣教文章
     */
    @RequiresPermissions("he:article:remove")
    @Log(title = "宣教文章", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(articleService.deleteArticleByIds(ids));
    }

    @ApiOperation("宣教文章列表")
    @PostMapping("/getList")
    @ResponseBody
    public TableDataInfo getList(Integer boardId)
    {
        startPage();
        Article article = new Article();
        article.setBoardId(boardId);
        List<Article> list = articleService.selectArticleList(article);
        return getDataTable(list);
    }

    @ApiOperation("获取宣教文章详细")
    @PostMapping("/getDetail")
    @ResponseBody
    public Object getDetail(Long id)
    {
        if (id != 0L)
        {
            return articleService.selectArticleById(id);
        }
        else
        {
            return new HashMap<>();
        }
    }
}
