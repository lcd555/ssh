 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>新闻修改...</title>
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
        <form id="editnews_form" method="post">
            <div style="margin-bottom:20px">
                <input name="news.id" type="hidden" value="${news.id}" />
                <input name="news.classid" type="hidden" value="${news.classid}" />
                <input name="news.bjs" type="hidden" value="${news.bjs}" />
                <input name="news.pic" type="hidden" value="${news.pic}" />
                <input name="news.istop" type="hidden" value="${news.istop}" />
                <input name="news.hitnum" type="hidden" value="${news.hitnum}" />
                <input name="news.tjdate" type="hidden" value="" />
                <input id="title" name="news.title" value="${news.title}" class="easyui-textbox" data-options="prompt:'新闻标题',required:true" style="width:100%;height:32px">
            </div>
            <div style="margin-bottom:20px">
                <input id="cruser" name="news.cruser" class="easyui-textbox" value="${news.cruser}" data-options="prompt:'发布人',required:true" style="width:100%;height:32px">
            </div>
            <div style="margin-bottom:20px">
                <div>新闻内容:</div>
            </div>
            <div style="margin-bottom:20px">
                <textarea id="content" name="news.content" rows="12" cols="80" style="width: 99%;background:url(<%=basePath%>include/xheditor/demobg.jpg) no-repeat right bottom fixed">${news.content}</textarea>
            </div>
            </form>
            <div style="text-align:center;">
                <a id="savenews" href="#" class="easyui-linkbutton" iconCls="icon-ok" style="width:132px;height:32px">保存</a>
                <a id="back" href="#" class="easyui-linkbutton" iconCls="icon-back" style="width:132px;height:32px">返回</a>
            </div>
        </div>
    <script>
        var uid;
        var opened_node=null;
    $(function(){
        $('#savenews').click(function(){///校验
            if($("#title").val().length<=0){alert("必须填写新闻标题");return;}
            if($("#content").val().length<=0){alert("必须填写新闻内容");return;}
            if($("#cruser").val().length<=0){alert("必须填写发布人姓名");return;}
            $.ajax({
                type: 'POST',
                url : "<%=basePath%>/saveeditnews",
                data : $("#editnews_form").serialize(),
                success : function (res) { 
                    if (res.ok) {
                        $.messager.alert('系统提示','修改成功！','info');
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