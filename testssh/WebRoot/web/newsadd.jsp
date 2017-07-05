<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>新闻添加...</title>
        <link rel="icon" href="<%=basePath%>include/img/ucte.ico" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="<%=basePath%>include/css/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>include/css/themes/icon.css">
        <script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>include/js/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>include/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=basePath%>include/xheditor/xheditor-1.2.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>include/xheditor/xheditor_lang/zh-cn.js"></script>
    <script type="text/javascript">
    var xhebase="<%=path%>/",uploadurl="<%=basePath%>uploadfile";
    var base="<%=basePath%>";
    $(function(){
        $('#content').xheditor({
        //urlBase:"<%=basePath%>",
        tools:'simple',
        internalScript:true,
        upLinkUrl:uploadurl,upLinkExt:"zip,rar,txt",
        upImgUrl:uploadurl,upImgExt:"jpg,jpeg,gif,png",
        html5Upload : false//在struts2中必须关闭，why？
        });
    });
    </script>   
     </head> 
    <body style="margin: 0px auto; width: 1000px;"> 
    <div style="margin:20px 0;"></div>
        <div class="easyui-panel" style="width:580px;padding:30px 60px">
        <form id="addnews_form" method="post">
            <div style="margin-bottom:20px">
                <input name="news.classid" type="hidden" value="0" />
                <input name="news.bjs" type="hidden" value="" />
                <input name="news.pic" type="hidden" value="" />
                <input name="news.istop" type="hidden" value="0" />
                <input name="news.hitnum" type="hidden" value="0" />
                <input name="news.tjdate" type="hidden" value="" />
                <input id="title" name="news.title" class="easyui-textbox" data-options="prompt:'新闻标题',required:true" style="width:100%;height:32px">
            </div>
            <div style="margin-bottom:20px">
                <input name="news.cruser" class="easyui-textbox" value="${me.uname}" data-options="prompt:'发布人',required:true" style="width:100%;height:32px">
            </div>
            <div style="margin-bottom:20px">
                <div>新闻内容:</div>
            </div>
            <div style="margin-bottom:20px">
                <textarea id="content" name="news.content" rows="12" cols="80" style="width: 99%;background:url(<%=basePath%>include/xheditor/demobg.jpg) no-repeat right bottom fixed"></textarea>
            </div>
            </form>
            <div style="text-align:center;">
                <a id="savenews" href="#" class="easyui-linkbutton" iconCls="icon-ok" style="width:132px;height:32px">保存</a>
                <a id="back" href="#" class="easyui-linkbutton" iconCls="icon-back" style="width:132px;height:32px">返回</a>
            </div>
        </div>
        <script>
    $(function(){
        $('#savenews').click(function(){
            if($("#title").val().length<=0){alert("必须填写新闻标题");return;}
            if($("#content").val().length<=0){alert("必须填写新闻内容");return;}
            jQuery.ajax({
                type: 'POST',
                url : "<%=basePath%>saveaddnews",
                data : $("#addnews_form").serialize(),
                success : function (res) {  
                    if (res.ok) {
                        $.messager.alert('系统提示','添加成功！','info');
                        window.location.href=base+res.msg;
                    }else {             
                      $.messager.alert('系统提示',res.msg,'error');
                    }
                    return false;
                },
                error : function(res) {$.messager.alert('系统提示','系统错误!','error');}
            });
        });
        $('#back').click(function(){window.location.href=base+"goadmin";});
    })
        </script>
    </body> 
    </html> 