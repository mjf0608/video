<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		<title>Video Share</title>
		<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
		<LINK href="<%=path%>/css/css.css" type=text/css rel=stylesheet>
		<STYLE type=text/css>
.ycbt {
	BORDER-RIGHT: #fff 1px solid;
	BORDER-TOP: #fff 1px solid;
	PADDING-LEFT: 1.8em;
	BACKGROUND-COLOR: #EAF2EF;
	BORDER-LEFT: #fff 1px solid;
	PADDING-TOP: 7px;
	BORDER-BOTTOM: #fff 1px solid;
	HEIGHT: 20px
}

.xsbt {
	BORDER-RIGHT: #fff 1px solid;
	BORDER-TOP: #fff 1px solid;
	PADDING-LEFT: 1.8em;
	BACKGROUND-IMAGE: url(<%=path%>/images/head1.gif);
	BORDER-LEFT: #fff 1px solid;
	PADDING-TOP: 7px;
	BORDER-BOTTOM: #fff 1px solid;
	HEIGHT: 20px
}

.xsnr {
	DISPLAY: block
}

.ycnr {
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
	margin-bottom: 20px;
	font-size: 20px;
	line-height: 1.8;
}
</STYLE>
		<script ype="text/javascript" src="<%=path%>/js/jquery-1.11.1.min.js">
</script>
		<script ype="text/javascript" src="<%=path%>/js/bootstrap.min.js">
</script>
		<script type="text/javascript" src="<%=path%>/js/public.js">
</script>
		<script type="text/javascript">
$(function() {
	$('#ad-carousel').carousel();
	$('#menu-nav .navbar-collapse a').click(function(e) {
		var href = $(this).attr('href');
		var tabId = $(this).attr('data-tab');
		if ('#' !== href) {
			e.preventDefault();
			$(document).scrollTop($(href).offset().top - 70);
			if (tabId) {
				$('#feature-tab a[href=#' + tabId + ']').tab('show');
			}
		}
	});
});
function toupiao() {
	var toupiaoName;
	var j = document.toupiaoForm.toupiaoName;
	for (i = 0; i < j.length; i++) {
		if (j[i].checked == true) {
			toupiaoName = j[i].value;
		}
	}
	var url = "<%=path%>/toupiaoAdd.action?toupiaoName=" + toupiaoName;
	//alert(url);
	var n = "dd";
	var w = "480px";
	var h = "500px";
	var s = "resizable:no;help:no;status:no;scroll:yes";
	openWin(url, n, w, h, s);
}

function dianbo(shipinPath) {
<s:if test="#session.user==null">
                     alert("请先登录");
                 </s:if>
                 
                 <s:else>
				     var targetWinUrl="<%=path%>/qiantai/shipin/shipindianbo.jsp?shipinPath="+shipinPath;
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
				     var url="<%=path%>/common/updown.jsp?fujianPath="+fujianPath+"&fujianYuashiMing="+fujianYuashiMing;
			         url=encodeURI(url); 
	                 //url=encodeURI(url); 
	                 window.open(url,"_self");
                 </s:else>
	        }
         </script>
	</head>

	<BODY leftMargin=0 topMargin=0 style="overflow-x: hidden">
		<div class="wrap">
			<TABLE id=toplogin cellSpacing=0 cellPadding=0 width="100%"
				align=center border=0>
				<TR>
					<TD align=left>
						<DIV class=jstime style="FLOAT: left; WIDTH: 25%">
							<%--【<a href="userLogin.jsp">会员登录</a>】
							【<a href="userReg.jsp">免费注册</a>】--%>
						</DIV>
						<DIV class=jstime
							style="FLOAT: right; WIDTH: 45%; TEXT-ALIGN: right">
							<SCRIPT>setInterval("clock.innerHTML=new Date().toLocaleString()+'&nbsp;&nbsp;星期'+'日一二三四五六'.charAt(new Date().getDay());",1000)</SCRIPT>
							<SPAN id=clock></SPAN>&nbsp;&nbsp;
							<A
								href="javascript:javascript:window.external.AddFavorite('http://localhost:8080',' ');">加入收藏</A>
							<A
								onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://localhost:8080/');"
								href="http://localhost/">设为首页</A>
						</DIV>
					</TD>
				</TR>
			</TABLE>


			<TABLE id=header cellSpacing=0 cellPadding=0 width="100%"
				align=center border=0>
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
								data-slide="prev"> <!--<span
								class="glyphicon glyphicon-chevron-left"></span> --> </a>
							<a class="right carousel-control" href="#ad-carousel"
								data-slide="next"> <!--<span
								class="glyphicon glyphicon-chevron-right"></span> --> </a>
						</div>
					</TD>
				</TR>
			</TABLE>

			<TABLE id=guide cellSpacing=0 cellPadding=0 width="100%" align=center
				border=0>
				<TR>
					<TD align="center">
						<jsp:include flush="true" page="/qiantai/inc/inc.jsp"></jsp:include>
					</TD>
				</TR>
			</TABLE>

			<TABLE class=MainTable cellSpacing=0 cellPadding=0 width="100%"
				align=center border=0>
				<TR>
					<TD class=Side vAlign=top align=left width="30%" height=150>
						<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%"
							align=center border=0>
							<TR>
								<TD class=head id=tb1_bt1 width="100%" height="30">
									<SPAN class=TAG>最新热点资讯</SPAN>
								</TD>
							</TR>
							<TR>
								<TD class="middle" align="left" width="100% colspan="2">
									<TABLE class=xsnr id=tb1_nr1 cellSpacing=0 cellPadding=0
										width="100%" border=0>
										<s:iterator value="#request.newsList" id="news">
											<TR>
												<TD align="left" width="70%">
													<a
														href="<%=path%>/newsDetailQian.action?newsId=<s:property value="#news.newsId"/>"><s:property
															value="#news.newsTitle" /> </a>
												</TD>
												<TD align="left" width="30%">
													<s:property value="#news.newsDate" />
												</TD>
											</TR>
										</s:iterator>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</TD>
					<TD class=Side vAlign=top align=right width="1%"></TD>
					<TD class=Side vAlign=top align=center width="35%" height=150>
						<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%"
							align=center border=0>
							<TR>
								<TD class=head id=tb1_bt1 width="100%" height="30">
									<SPAN class=TAG>网友投票</SPAN>
								</TD>
							</TR>
							<TR>
								<TD class="middle" align="lift" colspan="2">
									<form name="toupiaoForm" action="<%=path%>/toupiaoAdd.Action"
										method="post">
										<TABLE class=xsnr id=tb1_nr1 cellSpacing=0 cellPadding=0
											width="100%" border=0>
											<TR>
												<TD>
													你是从哪儿得知本站的？
												</TD>
											</TR>
											<TR>
												<TD width="33%">
													<input type="radio" name="toupiaoName" value="pengyou"
														checked="checked" />
													&nbsp;&nbsp;&nbsp;朋友推荐
												</TD>

												<TD width="33%">
													<input type="radio" name="toupiaoName" value="menhu" />
													&nbsp;&nbsp;&nbsp;门户网站搜索
												</TD>

												<TD width="34%">
													<input type="radio" name="toupiaoName" value="googlebaidu" />
													&nbsp;&nbsp;&nbsp;百度链接
												</TD>
											</TR>
											<TR>
												<TD>
													<input type="radio" name="toupiaoName" value="qitazhan" />
													&nbsp;&nbsp;&nbsp;别的网站链接
												</TD>
												<TD>
													<input type="radio" name="toupiaoName" value="qita" />
													&nbsp;&nbsp;&nbsp;其他
												</TD>
											</TR>
											<TR height="8"></TR>
											<TR>
												<TD align="center">
													<a href="#" onclick="toupiao()">投票</a>
												</TD>
											</TR>
											<TR height="7"></TR>
										</TABLE>
									</form>
								</TD>
							</TR>
						</TABLE>
					</TD>
					<TD class=Side vAlign=top align=right width="1%"></TD>
					<TD class=Side vAlign=top align=right width="25%" height="150">
						<TABLE width="100%" border=0 cellPadding=0 cellSpacing=0
							class=dragTable>
							<TR>
								<TD class=head>
									<SPAN class=TAG>站内公告</SPAN>
								</TD>
							</TR>
							<TR>
								<TD class=middle align="center">

									<!--<MARQUEE onmouseover=if(document.all!=null){this.stop()} onmouseout=if(document.all!=null){this.start()} scrollAmount=1 scrollDelay=1 direction=up height=150>-->
									<s:action name="gonggaoQian5" executeResult="true" flush="true"></s:action>
									<!--</MARQUEE>-->
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>

			<TABLE class=MainTable style="MARGIN-TOP: 0px" cellSpacing=0
				cellPadding=0 width="100%" align=center border=0>
				<TR>
					<TD class=Main vAlign=top height=60>
						<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%"
							border=0>
							<TR>
								<TD class=head>
									<SPAN class=TAG>视频搜索</SPAN>
								</TD>
							</TR>
							<TR align="left">
								<TD height="5"></TD>
							</TR>
							<TR align="left">
								<TD>
									<form action="<%=path%>/shipinSearch.action" method="get">
										&nbsp;&nbsp;&nbsp; 关键字：
										<input type="text" name="key">
										&nbsp;&nbsp;
										<SELECT name="mingcheng_daoyan_zhuyan">
											<option value="请选择">
												--请选择--
											</option>
											<option value="名称">
												名称
											</option>
											<option value="主演">
												主演
											</option>
											<option value="导演">
												导演
											</option>
										</SELECT>
										<SELECT name="shipinLeixing">
											<option value="请选择">
												--请选择--
											</option>
											<option value="动作片">
												动作片
											</option>
											<option value="爱情片">
												爱情片
											</option>
											<option value="恐怖片">
												恐怖片
											</option>
											<option value="其他">
												其他
											</option>
										</SELECT>
										<input type="submit" value="搜索">
										<br>
									</form>
								</TD>
							</TR>
							<TR align="left">
								<TD height="5"></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>

			<TABLE class=MainTable style="MARGIN-TOP: 0px" cellSpacing=0
				cellPadding=0 width="100%" align=center border=0>
				<TR>
					<TD class=Main vAlign=top height=100>
						<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%"
							border=0>
							<TR>
								<TD class=head>
									<SPAN class=TAG>视频排行榜</SPAN>
								</TD>
							</TR>
							<TR align="left">
								<TD class=middle>
									<table border="0">
										<tr align="center" bgcolor="#FAFAF1" height="25">
											<td width="150">
												<b>视频排行榜</b>
											</td>
											<td width="150">
												<b>主演</b>
											</td>
											<td width="150">
												<b>导演</b>
											</td>
											<td width="150">
												<b>类型</b>
											</td>
											<td width="150">
												<b>播放时间</b>
											</td>
											<td width="150">
												<b>浏览次数</b>
											</td>
											<td width="150">
												<b>发布时间</b>
											</td>
											<td width="150">
												<b>操作</b>
											</td>
										</tr>
										<s:iterator value="#request.shipinList" id="shipin">
											<tr height="25">
												<td align="center">
													<a
														href="<%=path%>/shipinDetailQian.action?shipinId=<s:property value="#shipin.shipinId"/>"><s:property
															value="#shipin.shipinName" /> </a>
												</td>
												<td align="center">
													<s:property value="#shipin.shipinZhuyan" />
												</td>
												<td align="center">
													<s:property value="#shipin.shipinDaoyan" />
												</td>
												<td align="center">
													<s:property value="#shipin.shipinLeixing" />
												</td>
												<td align="center">
													<s:property value="#shipin.shipinBofangshijian" />
												</td>
												<td align="center">
													<s:property value="#shipin.shipinCishu" />
												</td>
												<td align="center">
													<s:property value="#shipin.shipinFabushijian" />
												</td>
												<td align="center">
													<a href="#"
														onclick="dianbo('<s:property value="#shipin.shipinPath"/>')">点播</a>
													<a href="#"
														onclick='down1("<s:property value="#shipin.shipinPath" />","<s:property value="#shipin.shipinYuanshiming" />")'>下载</a>

												</td>
											</tr>
										</s:iterator>
									</table>
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
