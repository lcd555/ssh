package lcd.ssh.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import lcd.ssh.pojo.News;
import lcd.ssh.service.NewsService;
import lcd.ssh.utils.JsonUtils;
import lcd.ssh.utils.MyUtils;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller
public class NewsAct extends ActionSupport {

    @Resource 
    private NewsService newsService; 

    private News news;//一条新闻,来源于前端
    private int page,rows,id;//分页参数及新闻ID,来源于前端
    private String s_name; //查询的关键词：新闻标题,来源于前端
    private String jsonResult;
    private HashMap<String,Object> jsonobj=new HashMap<String,Object>();
///////////////////增/////////////////////////////////////////////////////////
    //请求跳转到添加新闻页面
    public String goAddNews(){
        return "goadd";
    }
    //保存添加的新闻
    public String saveAddNews(){ 
        jsonobj.clear();
        try { 
            news.setTjdate(new Date());//提交日期由后端生成
            newsService.addNews(news); 
            jsonobj.put("ok", true);
            jsonobj.put("msg", "goadmin");
        } catch (Exception e) { 
            e.printStackTrace(); 
            jsonobj.put("ok", false);
            jsonobj.put("msg", "系统错误2");
        }
        jsonResult = JsonUtils.toJson(jsonobj);
        HttpServletResponse response = ServletActionContext.getResponse();
        MyUtils.outPrint(response, jsonResult);
        return null; 
    } 
///////////////////删/////////////////////////////////////////////////////////
    //删除一条新闻
    public String deleteaNews(){
        jsonobj.clear();
        boolean delflag=false;
        try{
            newsService.deleteNews(id, News.class);
            delflag=true;
        }catch(Exception e){
            e.printStackTrace();
            delflag=false;
        }
        jsonobj.put("delflag", delflag);
        HttpServletResponse response = ServletActionContext.getResponse();
        MyUtils.outPrint(response, JsonUtils.toJson(jsonobj));
        return null;
    }
///////////////////改/////////////////////////////////////////////////////////
    //请求跳转到修改新闻页
    public String goEditNews(){
        news=newsService.getNews(News.class, id);
        return "goedit";
    }
    //保存修改后的新闻
    public String saveEditNews(){ 
        jsonobj.clear();
        try { 
            News news0=newsService.getNews(News.class, news.getId());
            news.setTjdate(news0.getTjdate());//保持提交日期不变
            newsService.updateNews(news); 
            jsonobj.put("ok", true);
            jsonobj.put("msg", "goadmin");
        } catch (Exception e) { 
            e.printStackTrace(); 
            jsonobj.put("ok", false);
            jsonobj.put("msg", "系统错误2");
        }
        jsonResult = JsonUtils.toJson(jsonobj);
        HttpServletResponse response = ServletActionContext.getResponse();
        MyUtils.outPrint(response, jsonResult);
        return null; 
    } 
///////////////////查/////////////////////////////////////////////////////////
    //统计新闻总数量
    public String getnewsCount(){
        int c=0;
        try{    
            c=newsService.getNewsCount();
        }catch(Exception e){
            e.printStackTrace();
            c=0;
        }
        jsonobj.clear();
        jsonobj.put("newscount", c);
        jsonResult = JsonUtils.toJson(jsonobj);
        HttpServletResponse response = ServletActionContext.getResponse();
        MyUtils.outPrint(response, jsonResult);
        return null;
    }
    //分页查询新闻
    public String listdgNews(){
        List<News> newslist=newsService.listDgNews(s_name,page,rows);
        jsonobj.clear();
        jsonobj.put("total", newslist.size());
        jsonobj.put("rows", newslist);
        jsonResult = JsonUtils.toJson(jsonobj);
        HttpServletResponse response = ServletActionContext.getResponse();
        MyUtils.outPrint(response, jsonResult);
        return null;
    }
    //阅读一条新闻
    public String getaNews(){
        news=newsService.getNews(News.class, id);
        return "goread";
    }    
///////////////////属性的get/set方法/////////////////////////////////////////////////////////
    public News getNews() { 
        return news; 
    } 

    public void setNews(News news) { 
        this.news = news; 
    } 

    public String getS_name() { 
        return s_name; 
    } 

    public void setS_name(String s_name) { 
        this.s_name = s_name; 
    }
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public int getRows() {
        return rows;
    }
    public void setRows(int rows) {
        this.rows = rows;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    } 
}
