<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title><s:property value="news.title" /></title>
    <link rel="shortcut icon" href="<%=basePath%>include/img/ucte.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>include/css/news.css">
    <script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
    </head>
    <body>
        <div style="background:#B3DFDA;padding:0 10px 0 10px;vertical-align: middle;">
            <img src="<%=basePath%>include/images/io.ico" width="126" height="50" />
            <div style="float:right;line-height:50px;margin-right:10px;font-size: 9pt;">
                 <span>【</span><a style="color:blue;" href="javascript:window.opener=null;window.open('','_self');window.close();"><span>关闭窗口</span></a><span>】</span>
            </div>
        </div>
    <div class="ndetail">
        <div class="ntitle"><s:property value="news.title" /></div>
        <div class="nauthor">
            <div>来源: &nbsp;<strong><s:property value="news.cruser" /></strong> &nbsp;&nbsp;发布时间:&nbsp;  <strong><s:date name="news.tjdate" format="yyyy-MM-dd"/></strong>&nbsp;&nbsp;访问量:&nbsp; <strong>[<span><s:property value="news.hitnum" /></span>]</strong></div>
        </div>
        <div class="nbody">
            <div id="vsb_content"> <s:property value="news.content"  escape="false"/></div>
        </div>
    </div>
    </body>
    </html>