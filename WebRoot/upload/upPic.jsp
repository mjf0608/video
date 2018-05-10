<%@ page contentType="text/html;charset=utf-8" language="java" import="com.jspsmart.upload.*"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="java.util.*"%>
<%
String path = request.getContextPath();
%>
<%
	SmartUpload mySmartUpload = new SmartUpload();

	//初始化上传
	mySmartUpload.initialize(pageContext);

	//只允许上载此类文件
	try 
	{
		mySmartUpload.setAllowedFilesList("jpg,Jpg,JPG,GIF,gif,Gif,png");
		mySmartUpload.upload();
	} 
	catch (Exception e)
    {
		out.println("<script language=javascript>alert('上传格式错误！');   history.back(-1);</script>");
		return;
	}
	
	try 
	{
		   com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
		   if (myFile.isMissing())
		   {
			  out.println("<script language=javascript>alert('必须选择图片！');   history.back(-1);</script>");
			  return;

		   } 
		   else 
		   {
			   int file_size = myFile.getSize(); //取得文件的大小 (单位是b) 
			   String file_name=myFile.getFileName();
			   System.out.println("文件大小："+file_size+"文件名称："+file_name);
			   if (file_size > 10*1024*1024)
			   {
				  out.println("<script language=javascript>alert('上传图片大小应控制在10K~1M之间！');   history.back(-1);</script>");
				  return;
			   }
               else
               {
                   String newFile1Name=new Date().getTime()+file_name.substring(file_name.indexOf("."));
	               System.out.println("新文件名称："+newFile1Name);
				
				   String saveurl = request.getSession().getServletContext().getRealPath("uploadPath/pic");
				
				   saveurl = saveurl+"/"+newFile1Name;
				   myFile.saveAs(saveurl, mySmartUpload.SAVE_PHYSICAL);
	
				   out.print("<SCRIPT language=''javascript''>");
				   out.print("window.parent.document.getElementById('img').value='" + "/uploadPath/pic/"+newFile1Name + "';");//父窗口赋值
				   out.print("window.location.href='"+path+"/upload/uploadPic.jsp';");
				   out.print("window.parent.document.getElementById('upimg').style.display='none'");//
				   out.print("</script>");
               }
			} 
	  } 
	  catch (Exception e)
	  {
	    e.toString();
	  }
%>


