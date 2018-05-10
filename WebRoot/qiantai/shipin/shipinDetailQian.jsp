<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@ page isELIgnored="false" %> 
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
    <link rel="stylesheet" href="<%=path%>/css/woncore.css" type="text/css"></link>
		 <STYLE type=text/css>
			.ycbt
			 {
				BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-COLOR: #EAF2EF; BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px
			 }
			.xsbt 
			 {
				BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-IMAGE: url(<%=path %>/images/head1.gif); BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px
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
         <script type="text/javascript" src="<%=path %>/js/public.js"></script>
         <script type="text/javascript">
            function toupiao()
	        {
                 var toupiaoName;
				 var j=document.toupiaoForm.toupiaoName;
       			 for(i=0;i<j.length;i++)
                 {
    				if(j[i].checked==true)
   				    {
                      toupiaoName=j[i].value;
                    }
                 }
	             var url="<%=path %>/toupiaoAdd.action?toupiaoName="+toupiaoName;
	             //alert(url);
                 var n="dd";
                 var w="480px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
	        }
	        
	        function dianbo(shipinPath)
	        {
	             <s:if test="#session.user==null">
                     alert("请先登录");
                 </s:if>
                 
                 <s:else>
				     var targetWinUrl="<%=path %>/qiantai/shipin/shipindianbo.jsp?shipinPath="+shipinPath;
					 var targetWinName="newWin";
					 var features="width="+500+" ,height="+400+" ,toolbar=no, top=200, left=220, menubar=no, scrollbars=no, resizable=no,location=no, status=no"
					 var new_win=window.open(targetWinUrl,targetWinName,features);
                 </s:else>
	        }
	        
	        function down1(fujianPath,fujianYuashiMing)
	        {
	             <s:if test="#session.user==null">
                     alert("请先登录");
                 </s:if>
                 <s:else>
				     var url="<%=path %>/common/updown.jsp?fujianPath="+fujianPath+"&fujianYuashiMing="+fujianYuashiMing;
			         url=encodeURI(url); 
	                 url=encodeURI(url); 
	                 window.open(url,"_self");
                 </s:else>
	        }
         </script>
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

		<TABLE class=MainTable style="MARGIN-TOP: 0px" cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
				<TR>
					<TD class=Main  height=111>
						<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TR>
									<TD class=head>
										<SPAN class=TAG>视频详情</SPAN>
									</TD>
								</TR>
								<TR align="left">
									<TD>
									    <table border="0" cellspacing="18" cellpadding="18" >
									        <tr height="20">
									            <td width="100">视频名称:</td>
									            <td><s:property value="#request.shipin.shipinName"/></td>
									        </tr>
									        <tr height="20">
									            <td width="100">主演：</td>
									            <td><s:property value="#request.shipin.shipinZhuyan"/></td>
									        </tr>
									        <tr height="20">
									            <td width="100">导演：</td>
									            <td><s:property value="#request.shipin.shipinDaoyan"/></td>
									        </tr>
									        <tr height="20">
									            <td width="100">类型：</td>
									            <td><s:property value="#request.shipin.shipinLeixing"/></td>
									        </tr>
									        <tr height="20">
									            <td width="100">播放时间长度：</td>
									            <td><s:property value="#request.shipin.shipinBofangshijian"/></td>
									        </tr>
									        <tr height="20">
									            <td width="100">视频简介：</td>
									            <td><s:property value="#request.shipin.shipinJianjie" escape="false"/></td>
									        </tr>
									        <tr height="20">
									            <td  align="center">
									                <a href="#" onclick="dianbo('<s:property value="#request.shipin.shipinPath"/>')">点播</a>
							                        
							                    </td>
							                    <td align ="left">
							                        <a href="#" onclick='down1("<s:property value="#request.shipin.shipinPath"/>","<s:property value="#shipin.shipinYuanshiming"/>")'>下载</a>
							                    </td>
									        </tr>
									    </table>
									</TD>
								</TR>
						</TABLE>
					</TD>
				</TR>
		</TABLE>
		<br>
		<TABLE cellSpacing=1 cellPadding=4 width="100%" border=0>
			<s:iterator value="#request.liuyanList" id="liuyan">
			    <TR>
				<TD>
					<TABLE class=tpt width="100%" border=0>
						<TBODY>
							<TR bgColor=#cccccc>
								<TD align=middle width="10%">
									<STRONG>评论者：</STRONG>
								</TD>
								<TD width="47%">
									<FONT color=#000000>&nbsp;<s:property value="#liuyan.liuyanUser"/></FONT>
								</TD>
								<TD align=middle width="14%">
									<STRONG>评论时间：</STRONG>
								</TD>
								<TD width="29%">
									<FONT color=#000000>&nbsp;<s:property value="#liuyan.liuyanDate"/></FONT>
								</TD>
							</TR>
							<tr height="10"></tr>
							<TR>
								<TD colSpan=4>
									<s:property value="#liuyan.liuyanContent" escape="false"/>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			</s:iterator>
		</TABLE>
		<BR>
		<form action="<%=path %>/liuyanAdd.action" method="post">
		<table border="0">
		     <tr>
		         <td>
		              <FCK:editor instanceName="liuyanContent"  basePath="/fckeditor" width="330" height="120" value="请输入内容" toolbarSet="Basic">
                      </FCK:editor>
                 </td>
		     </tr>
		     <tr>
		         <td style="font-size: 11px;">&nbsp;</td>
		         <td>
		             <input type="hidden" name="shipinId" value="<s:property value="#request.shipin.shipinId"/>">
		             <input type="submit" name="" value="提交评论">
                 </td>
		     </tr>
		</table>
		</form>
        
        <!-- foot -->
        <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
        <!-- foot -->
    </div>
  </BODY>
</html>
