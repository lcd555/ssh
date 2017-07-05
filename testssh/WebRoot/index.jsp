<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>

    <!DOCTYPE HTML>
    <html>
      <head>
        <meta charset="UTF-8"> 
        <title>新闻---ssh-lcd</title>
        <link rel="icon" href="<%=basePath%>include/images/io.ico" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="<%=basePath%>include/css/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>include/css/themes/icon.css">
        <script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>include/js/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>include/js/easyui-lang-zh_CN.js"></script>
        <link href="<%=basePath%>include/css/news.css" rel='stylesheet' type='text/css' />
        <script>var base="<%=basePath%>";</script>
        <script src="<%=basePath%>include/js/ckobject.js"></script>
        
        <link href="<%=basePath%>include/css/login1.css" rel='stylesheet' type='text/css' />
        <style type=text/css>


</style>
</head>
    <body style=" background: url(include/images/dm2.jpg);">
<div class="easyui-layout" style="width:1000px;height:550px;background-color: rgba(204, 255, 0, 0.46);">
<div data-options="region:'north',border:false" style="height:130px;width:1000px;">
	<div id="bver" style="background-color: #FFEB3B;text-align: center;line-height: 30px;"></div>
	<div id="bg" style="position: relative;overflow:hidden;">  
	  <div style="position: absolute;overflow:hidde; align:left;">  
	    <img src="include/images/xxxy.png"/>  
	  </div>  
	  	<img src="include/images/k018.jpg" width="1000px"/> 
	  	 
	</div> 
	
</div>
    <div data-options="region:'west',border:false" style="width:680px;">
        <!-- 左边显示考试新闻的区域 -->
        <div class="f-left f-w710" style="width:650px;margin: 0px 10px;">
            <div class="div">
                <div class="l-news">
                    <div class="nheader">
                        <table class="winstyle44497" cellspacing="0" cellpadding="0">
                            <tbody>
                                <tr>
                                    <td nowrap=""><h3>新闻公告</h3></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="nlist">
                        <table id="newstable" width="100%" class="winstyle122389">
                            <tbody>
                                <!-- easyui 分页（pagination） -->
                                <tr id="trpp">
                                    <td colspan="3" align="left">
                                        <div id="pp" style="background:#efefef; margin: 2px 5px;">暂时无相关新闻</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div data-options="region:'center',border:false" style="width:320px;">          
        <!-- 右边登录的区域 -->
        <div class="f-right f-w280 div-red" style="width:305px;">
            <div class="div">
                <div class="l-news">
                    <div class="nheader">
                        <h3>用户登录</h3>
                    </div>
                    <div class="login-form" style="width:305px">
                        <div class="clear"></div>
                        <form id="login_form" method="post" onsubmit="return false">
                            <input type="text" class="text" id="uid" name="uid" placeholder="用户名" value=""> 
                            <input type="password" id="password" name="password" placeholder="密码" value=""> 
                            <input type="hidden" name="role" value="5">
                        </form>
                        <div class="signin">
                            <input type="submit" id="login_submit" value="登录">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    
    </div>
    <script>
    var bver,role="5";
var pageN=1,pageTotal=100;
$(function(){
    $.ajax({
        url:base+"getnewscount",
        type:"post",
        success: function(res){
            var c=parseInt(res.newscount);
            pageTotal=c;            
            listNews(1,10);loadPager();         
        },
        error:function(res){
            $.messager.alert('系统提示','系统错误!','error');
        }
    }); 
});
function listNews(pageNumber,pageSize){
    $.ajax({
        url:"listnews",
        data:{"s_name":"","page":pageNumber,"rows":pageSize},
        type:"post",
        success: function(res){
            $(".inews").remove();
            if(res.total<=0){
                var tr="<tr class='inews' height=\"25\"><td >";
                    tr+="<div class='t'>暂无相关新闻</div>";
                    tr+="</td><td width='1%' nowrap=''><span >&nbsp;</span></td></tr>";
                $("#trpp").before(tr);
            }
            else {
            pageN=pageNumber;
            pageTotal=res.total;
            var rows=res.rows;
                for(var i=0;i<rows.length;){ 
                    var row=rows[i];
                    var tr="<tr class='inews' height=\"25\"><td >";
                        tr+="<div class='t'><a href='"+base+"getanews?id="+row.id+"' target='_blank'>"+row.title+"</a></div>";
                        //日期格式的处理方法，在下文提供。
                        tr+="</td><td width='1%' nowrap=''><span >"+(new Date(row.tjdate).Format("yyyy-MM-dd"))+"&nbsp;</span></td></tr>";
                    $("#trpp").before(tr);
                    i++;
                    if(i%5==0){
                        tr="<tr class='inews' height='1'><td colspan='2' align='center'>";
                        tr+="<hr style='border-style:dashed;border-color:#999999;width:99%;height:1px;border-width:1px 0px 0px 0px;visibility:inherit'></td></tr>";
                        $("#trpp").before(tr);
                    }
                }
            }
        },
        error:function(res){
            $.messager.alert('系统提示','系统错误!','error');
        }
    })
}
function loadPager(){
    $('#pp').pagination({
        total:pageTotal,
        pageSize:10,
        pageNumber:pageN,
        layout:['list','sep','first','prev','links','next','last'],
        links:5,
        displayMsg:'{from}/{to} 共{total}条',
        onSelectPage:function(pageNumber, pageSize){
            listNews(pageNumber,pageSize);
        }
    });
}
$(document).ready(function () {
    $('#login_form input').keydown(function (e) {
        if (e.keyCode == 13)
        {
            checkUserName();//$('#login_submit').click();
        }
    }); 
    $("#login_submit").click(checkUserName); 
    bver=(CKobject.Platform()+' '+CKobject.browser()['B']+' v'+CKobject.browser()['V']);
    if(bver.indexOf("IE v7.0")>0) $("#bver").html("您现在使用的浏览器是IE v7.0内核，版本太低，建议切换到极速模式或更换浏览器。");
    else $("#bver").html("");

});
function checkUserName()//登录前，校验用户信息
{    
      var a=$('#uid').val();
      var b=$('#password').val();
      if(a==""){$.messager.alert('系统提示',"请输入用户名",'warning');return;      }
      var re=/^\d{4}$|^\d{8}$|^\d{11}$/;
      if(!re.test(a)){$.messager.alert('系统提示',"用户名格式错误",'warning');return;     }
      if(b==""||b==undefined){$.messager.alert('系统提示',"请输入登录密码",'warning');return;}

      $.ajax({
            url : base+"userlogin",
            data :{"uid":a,"password":b},
            type:"POST",
            success : function (res) {
              if (res.ok) {
                    window.location.href=base+res.msg;
              }else {             
                  $.messager.alert('系统提示',res.msg,'error');
              }
              return false;
            },
            error : function(res) {$.messager.alert('系统提示','系统错误!l','error');      }
      });
}
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

</script>
<div style="width:1000px;">
<img src="include/images/dm3.jpg"/></div>
    </body>
    </html>