<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base target="_self"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path%>/css/woncore.css" type="text/css"></link>

  </head>
  
  <body>
       <TABLE cellSpacing=1 cellPadding=4 width="100%" border=0>
			<s:iterator value="#request.liuyanList" id="liuyan">
			    <TR>
				<TD>
					<TABLE class=tpt width="100%" border=0>
						<TBODY>
							<TR bgColor=#cccccc>
								<TD width="20%" align=middle>
									<STRONG>评论者：</STRONG>
								</TD>
								<TD width="20%">
									<FONT color=#000000>&nbsp;<s:property value="#liuyan.liuyanUser"/></FONT>
								</TD>
								<TD width="20%" align=middle>
									<STRONG>评论时间：</STRONG>
								</TD>
								<TD width="30%" >
									<FONT color=#000000>&nbsp;<s:property value="#liuyan.liuyanDate"/></FONT>
									<a href="<%=path %>/shipinPinlunDel.action?liuyanId=<s:property value="#liuyan.liuyanId"/>" style="color: red">删除</a>
								</TD>
							</TR>
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
  </body>
</html>
