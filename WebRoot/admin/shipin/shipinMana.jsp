<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script type="text/javascript" src="<%=path %>/js/public.js"></script>
		
        <script language="javascript">
           function shipinDel(shipinId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/shipinDel.action?shipinId="+shipinId;
               }
           }
           function shipinEditPre(shipinId)
           {
                   window.location.href="<%=path %>/shipinEditPre.action?shipinId="+shipinId;
           }
           
           
           function shipinPinglunMana(shipinId)
           {
                  var url="<%=path %>/shipinPinglunMana.action?shipinId="+shipinId;
                  var n="";
                  var w="500px";
                  var h="600px";
                  var s="resizable:no;help:no;status:no;scroll:yes";
				  openWin(url,n,w,h,s);
				 // window.location.href=url;
           }
           
           function shipinAdd()
           {
                 var url="<%=path %>/admin/shipin/shipinAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="7" background="<%=path %>/images/tbg.gif">&nbsp;视频维护&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="14%">视频名称</td>
					<td width="16%">视频简介</td>
					<td width="10%">主演</td>
					<td width="10%">导演</td>
					<td width="14%">类型</td>
					<td width="14%">播放时间</td>
					<td width="20%">操作</td>
		        </tr>	
				<s:iterator value="#request.page.data" id="shipin">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#shipin.shipinName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#shipin.shipinJianjie" escape="false"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#shipin.shipinZhuyan"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#shipin.shipinDaoyan"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#shipin.shipinLeixing"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#shipin.shipinBofangshijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="shipinDel(<s:property value="#shipin.shipinId"/>)" class="pn-loperator">删除</a>
					    <a href="#" onclick="shipinEditPre(<s:property value="#shipin.shipinId"/>)" class="pn-loperator">编辑</a>
					    <a href="#" onclick="shipinPinglunMana(<s:property value="#shipin.shipinId"/>)" class="pn-loperator">查看评论</a>
					</td>
				</tr>
				</s:iterator>
			</table>
			<s:property value="#request.page.pageDisplay" escape="false"/>
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="shipinAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
