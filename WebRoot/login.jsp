<%@ page language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
	<title>login.jsp</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

    <script src="lib/jquery-1.7.2.min.js" type="text/javascript"></script>

    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>
    
 <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
 <link rel="shortcut icon" href="../images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/ico/apple-touch-icon-57-precomposed.png">

 <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>

 <script src="lib/bootstrap/js/bootstrap.js"></script>
<script language="javascript">
 function check1()
 {                                                                                         
     if(document.ThisForm.userName.value=="")
	 {
	 	alert("请输入用户名");
		document.ThisForm.userName.focus();
		return false;
	 }
	 if(document.ThisForm.userPw.value=="")
	 {
	 	alert("请输入密码");
		document.ThisForm.userPw.focus();
		return false;
	 }
	 document.getElementById("indicator").style.display="block";
	 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,0,callback);
 }

 function callback(data)
 {
    document.getElementById("indicator").style.display="none";
    if(data=="no")
    {
        alert("用户名或密码错误");
    }
    if(data=="yes")
    {
        alert("通过验证,系统登录成功");
        window.location.href="<%=path %>/loginSuccess.jsp";
    }
 }
 
   $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
 </script>
</head>


 <body class=""> 
  <!--<![endif]-->
    
    <div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    
                </ul>
                <a class="brand"  href="<%=path %>/qiantai/default.jsp" target="_blank"><span class="first"></span> <span class="second">前台页面</span></a>
                <!--<a class="brand" href="index.html"><span class="first"></span> <span class="second">BlackAdmin</span></a>
        --></div>
    </div>
    


    


<div class="row-fluid" align="center">
    <div class="dialog" >
        <div class="block" >
            <p class="block-heading" >登录</p>
            <div class="block-body">
                <form name="ThisForm" method="POST" action="">
                    <label style="margin-right: 320px">用户名</label>
                   <input type="text" name="userName" class="span12" onMouseOver="this.style.background='#F0DAF3';" onMouseOut="this.style.background='#FFFFFF'">
                    <label style="margin-right: 330 px">密码</label>
                    <input type="password" name="userPw" class="span12" onMouseOver="this.style.background='#F0DAF3';" onMouseOut="this.style.background='#FFFFFF'">
                    <a href="javascript:" class="btn btn-primary pull-right" onclick="check1()">登录</a>
                    <img style="margin-right: 330 px" id="indicator" src="<%=path %>/images/loading.gif" style="display:none"/>
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
    </div>
</div>
   
</body>
