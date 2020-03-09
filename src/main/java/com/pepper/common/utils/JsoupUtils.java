package com.pepper.common.utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

/**
 *  @Description: Jsoup 工具类
 *  @author: HanJieTao
 *  @mail: hjtxyr@163.com
 *  @Date: 2020/3/9 11:31
 */
public class JsoupUtils {

    public static Logger logger = LoggerFactory.getLogger(JsoupUtils.class);

    /**
     *  @Description: 获取图文混排里面的图片url
     *  @author: HanJieTao
     *  @mail: hjtxyr@163.com
     *  @Date: 2020/3/9 11:21
     */
    public static String getAllImgSrcUrlFromContent(String content){
        logger.info("get all img src url from origin content= {}",content);
        StringBuffer stringBuffer = new StringBuffer();
        if(StringUtils.isEmpty(content)){
            return stringBuffer.toString();
        }

        Document doc = Jsoup.parse(content);
        Elements links = doc.select("img[src]");
        for (Element src:links) {
            String url = src.attr("src");
            logger.info("resolved img url= {}",url);
            stringBuffer.append(url).append(",");
        }
        if(stringBuffer.length() != 0){
            return stringBuffer.substring(0,stringBuffer.length()-1);
        }else{
            return stringBuffer.toString();
        }

    }

}
