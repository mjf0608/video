<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Video</title>
		<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
		
    <LINK href="<%=path %>/css/css.css" type=text/css rel=stylesheet>
    <link rel="stylesheet" href="<%=path%>/css/oa.css" type="text/css"></link>
		 <STYLE type=text/css>
			.ycbt
			 {
				BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-COLOR: #EAF2EF; BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px
			 }
			.xsbt 
			 {
				BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-IMAGE: url(images/head1.gif); BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px
			 }
			.xsnr 
			 {
				DISPLAY: block
			 }
			.ycnr 
			 {
				DISPLAY: none
			 }
 /* 轮播广告 */
.carousel {
	height: 500px;
	margin-bottom: 0px;
}

.carousel .item {
	height: 500px;
	background-color: #000;
}

.carousel .item img {
	width: 100%;
}

.carousel-caption {
	z-index: 10;
}

.carousel-caption p {
	margin-bottom: 10px;
	font-size: 10px;
	line-height: 1.8;
}

         </STYLE>
         <script ype="text/javascript" src="<%=path%>/js/jquery-1.11.1.min.js"></script>
		<script ype="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
  </head>
  
  <BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
	<div class="wrap"> 
		<TABLE id=toplogin cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
				<TR>
					<TD align=left>
						<DIV class=jstime style="FLOAT: left; WIDTH: 25%">
							<%--【<a href="userLogin.jsp">会员登录</a>】
							【<a href="userReg.jsp">免费注册</a>】--%>
						</DIV>
						<DIV class=jstime style="FLOAT: right; WIDTH: 45%; TEXT-ALIGN: right">
							<SCRIPT>setInterval("clock.innerHTML=new Date().toLocaleString()+'&nbsp;&nbsp;星期'+'日一二三四五六'.charAt(new Date().getDay());",1000)</SCRIPT>
							<SPAN id=clock></SPAN>&nbsp;&nbsp;
							<A href="javascript:javascript:window.external.AddFavorite('http://localhost:8080',' ');">加入收藏</A>
							<A onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://localhost:8080/');" href="http://localhost/">设为首页</A>
						</DIV>
					</TD>
				</TR>
		</TABLE>
		
		<TABLE id=header cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
				<TR>
					<TD>
						<!-- 广告轮播 -->
						<div id="ad-carousel" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
								<li data-target="#ad-carousel" data-slide-to="1"></li>
								<li data-target="#ad-carousel" data-slide-to="2"></li>
								<li data-target="#ad-carousel" data-slide-to="3"></li>
								<li data-target="#ad-carousel" data-slide-to="4"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img src="<%=path%>/images/chrome-big.jpg" alt="1 slide">

									<div class="container">
										<div class="carousel-caption">
											<h1>
												神奇四侠
											</h1>
				
										</div>
									</div>
								</div>
								<div class="item">
									<img src="<%=path%>/images/firefox-big.jpg" alt="2 slide">

									<div class="container">
										<div class="carousel-caption">
											<h1>
												X战警
											</h1>
										</div>
									</div>
								</div>
								<div class="item">
									<img src="<%=path%>/images/safari-big.jpg" alt="3 slide">

									<div class="container">
										<div class="carousel-caption">
											<h1>
												生活大爆炸
											</h1>
										</div>
									</div>
								</div>
								<div class="item">
									<img src="<%=path%>/images/opera-big.jpg" alt="4 slide">

									<div class="container">
										<div class="carousel-caption">
											<h1>
												机器人总动员
											</h1>
										</div>
									</div>
								</div>
								<div class="item">
									<img src="<%=path%>/images/ie-big.jpg" alt="5 slide">

									<div class="container">
										<div class="carousel-caption">
											<h1>
												速度与激情7
											</h1>
										</div>
									</div>
								</div>
							</div>
							<a class="left carousel-control" href="#ad-carousel"
								data-slide="prev"><!--<span
								class="glyphicon glyphicon-chevron-left"></span> --></a>
							<a class="right carousel-control" href="#ad-carousel"
								data-slide="next"><!--<span
								class="glyphicon glyphicon-chevron-right"></span> --></a>
						</div>
					</TD>
				</TR>
		</TABLE>
		
		
		<TABLE id=guide cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
				<TR>
					<TD align="center">
						<jsp:include flush="true" page="/qiantai/inc/inc.jsp"></jsp:include>
					</TD>
				</TR>
		</TABLE>


		<TABLE class=MainTable cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
				<TR>
					<TD class=Side vAlign=top align=left width="100%" height=200>
						<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
								<TR>
									<TD class=head id=tb1_bt1  width="100%" height="35">
										<SPAN class=TAG>用户信息</SPAN>
										<SPAN class=more style="FLOAT: right"><A href="">&nbsp;</A></SPAN>
									</TD>
								</TR>
								<TR>
									<TD class=middle align="left" colspan="2">
										<form action="<%=path %>/userEdit.action" name="form1" method="post">
										    <table align="left" border="0">
										        <tr height="25">
										             <td align="center">用户名:</td>
										             <td><input type="text" name="userName" id="userName" value="<s:property value="#session.user.userName"/>" readonly="readonly"/></td>
										        </tr>
										        <tr height="25">
										             <td align="center">密码:</td>
										             <td><input type="password" name="userPw" value="<s:property value="#session.user.userPw"/>"/></td>
										        </tr>
										        <tr height="25">
										             <td align="center">真实姓名:</td>
										             <td><input type="text" name="userRealname" value="<s:property value="#session.user.userRealname"/>"/></td>
										        </tr>
										        <tr height="25">
										             <td align="center">住址:</td>
										             <td><input type="text" name="userAddress" value="<s:property value="#session.user.userAddress"/>"/></td>
										        </tr>
										        <tr height="25">
										             <td align="center">性别:</td>
										             <td><input type="text" name="userSex" value="<s:property value="#session.user.userSex"/>"/></td>
										        </tr>
										        <tr height="25">
										             <td align="center">联系方式:</td>
										             <td><input type="text" name="userTel" value="<s:property value="#session.user.userTel"/>"/></td>
										        </tr>
										        <tr height="25">
										             <td align="center">email:</td>
										             <td><input type="text" name="userEmail" value="<s:property value="#session.user.userEmail"/>"/></td>
										        </tr>
										        <tr height="25">
										             <td align="center">QQ:</td>
										             <td><input type="text" name="userQq" value="<s:property value="#session.user.userQq"/>"/></td>
										        </tr>
										        <tr height="25">
										             <td align="center">密码找回问题:</td>
										             <td><input type="text" name="userOne1" value="<s:property value="#session.user.userOne1"/>"/></td>
										        </tr>
										        <tr height="25">
										             <td align="center">密码找回答案:</td>
										             <td><input type="text" name="userOne2" value="<s:property value="#session.user.userOne2"/>"/></td>
										        </tr>
										        <tr height="40">
										             <td colspan="2">
										                 <input type="submit" value="修改"/>
										                 <input  type="reset" value="取消"/>
										                 <font color="red"></font>
										             </td>
										        </tr>
										        <tr height="20">
										        </tr>
										    </table>
								         </form>
									</TD>
								</TR>
						</TABLE>
					</TD>
				</TR>
		</TABLE>
		
        
        <!-- foot -->
        <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
        <!-- foot -->
    </div>
  </BODY>
</html>
