package com.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TLiuyanDAO;
import com.dao.TShipinDAO;
import com.model.TLiuyan;
import com.model.TShipin;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagination;

public class shipinAction
{
	private int shipinId;
	private String shipinName;
	private String shipinJianjie;
	private String shipinZhuyan;
	private String shipinDaoyan;
	private String shipinLeixing;
	private String shipinBofangshijian;
	
	private String message;
	private String path;;
	
	private int liuyanId;
	private String liuyanContent;
	
	private TShipinDAO shipinDAO;
	private TLiuyanDAO liuyanDAO;
	
	private static final int BUFFER_SIZE = 16 * 1024;
	private File shipinPath;
	private String shipinPathFileName;
	private String shipinPathContentType;
	
	private String key="";
	private String mingcheng_daoyan_zhuyan;
	
	private int index=1;
	
	public String shipinAdd()
	{
		TShipin shipin=new TShipin();
		shipin.setShipinBofangshijian(shipinBofangshijian);
		shipin.setShipinName(shipinName);
		shipin.setShipinJianjie(shipinJianjie);
		shipin.setShipinZhuyan(shipinZhuyan);
		shipin.setShipinDaoyan(shipinDaoyan);
		shipin.setShipinLeixing(shipinLeixing);
		shipin.setShipinFabushijian(new Date().toLocaleString());
		System.out.println(shipinPathFileName+"&&");
		String newFile1Name=new Date().getTime()+shipinPathFileName.substring(shipinPathFileName.indexOf("."));
		String dstPath = ServletActionContext.getServletContext().getRealPath("uploadPath")+ "\\" + newFile1Name;
		File dstFile = new File(dstPath);
		copy(this.getShipinPath(),dstFile);
		shipin.setShipinPath("/uploadPath/"+newFile1Name);
		shipin.setShipinYuanshiming(shipinPathFileName);
		shipin.setShipinCishu(0);
		shipin.setDel("no");
		
		shipinDAO.save(shipin);
		this.setMessage("添加视频操作成功！");
		this.setPath("shipinMana.action");
		return "succeed";
	}
	
	
	public String shipinMana()
	{
		List shipinList=shipinDAO.findAll();
		int pageSize=5;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, shipinList.size());
		List shipinListFenye = shipinList.subList(fromIndex, toIndex);
		

        Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(pageSize);
        p.setTotle(shipinList.size());//设置总共的条数
        p.setData(shipinListFenye);//设置数据
        p.setPath("shipinMana.action?");//跳转的路径

		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
		
	}
	
	
	
	public String shipinDel()
	{
		TShipin shipin=shipinDAO.findById(shipinId);
		shipin.setDel("yes");
		shipinDAO.attachDirty(shipin);
		this.setMessage("删除视频操作成功！");
		this.setPath("shipinMana.action");
		return "succeed";
	}
	
	
	public String shipinEditPre()
	{
		TShipin shipin=shipinDAO.findById(shipinId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shipin", shipin);
		return ActionSupport.SUCCESS;
	}
	
	
	public String shipinEdit()
	{
		TShipin shipin=shipinDAO.findById(shipinId);
		shipin.setShipinBofangshijian(shipinBofangshijian);
		shipin.setShipinName(shipinName);
		shipin.setShipinJianjie(shipinJianjie);
		shipin.setShipinZhuyan(shipinZhuyan);
		shipin.setShipinDaoyan(shipinDaoyan);
		shipin.setShipinLeixing(shipinLeixing);
		shipin.setShipinFabushijian(new Date().toLocaleString());
		System.out.println(shipinPathFileName+"&&");
		String newFile1Name=new Date().getTime()+shipinPathFileName.substring(shipinPathFileName.indexOf("."));
		String dstPath = ServletActionContext.getServletContext().getRealPath("uploadPath")+ "\\" + newFile1Name;
		File dstFile = new File(dstPath);
		copy(this.getShipinPath(),dstFile);
		shipin.setShipinPath("/uploadPath/"+newFile1Name);
		shipin.setShipinYuanshiming(shipinPathFileName);
		shipin.setShipinCishu(0);
		shipin.setDel("no");
		
		shipinDAO.attachDirty(shipin);
		this.setMessage("操作成功！");
		this.setPath("shipinMana.action");
		return "succeed";
	}
	
	
	
	public String shipinPinglunMana()
	{
		String sql="from TLiuyan where shipinId="+shipinId;
		List liuyanList=liuyanDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("liuyanList", liuyanList);
		
		return ActionSupport.SUCCESS;
	}
	
	public String shipinPinlunDel()
	{
		TLiuyan liuyan=liuyanDAO.findById(liuyanId);
		liuyanDAO.delete(liuyan);
		return "successDel";
	}
	
	
	public String shipinAll()
	{
		String sql="from TShipin where del='no' order by shipinId desc";
		List shipinList=shipinDAO.getHibernateTemplate().find(sql);
		int pageSize=5;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, shipinList.size());
		List shipinListFenye = shipinList.subList(fromIndex, toIndex);
		

        Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(pageSize);
        p.setTotle(shipinList.size());//设置总共的条数
        p.setData(shipinListFenye);//设置数据
        p.setPath("shipinAll.action?");//跳转的路径

		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	public String shipinDetailQian()
	{
		TShipin shipin=shipinDAO.findById(shipinId);
		shipin.setShipinCishu(shipin.getShipinCishu()+1);
		shipinDAO.attachDirty(shipin);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shipin", shipin);
		
		String sql="from TLiuyan where shipinId="+shipinId;
		List liuyanList=liuyanDAO.getHibernateTemplate().find(sql);
		request.put("liuyanList", liuyanList);
		
		return ActionSupport.SUCCESS;
	}
	
	
	public String shipinSearch() throws UnsupportedEncodingException
	{
		key = new String(key.getBytes("iso8859-1"),"UTF-8");
		shipinLeixing = new String(shipinLeixing.getBytes("iso8859-1"),"UTF-8");
		mingcheng_daoyan_zhuyan = new String(mingcheng_daoyan_zhuyan.getBytes("iso8859-1"),"UTF-8");

		System.out.println(key+"**"+shipinLeixing+"**"+mingcheng_daoyan_zhuyan+"**");
		
		StringBuffer sql=new StringBuffer("from TShipin where del='no'");
		if(!shipinLeixing.equals("请选择"))
		{
			sql.append(" and shipinLeixing='"+shipinLeixing+"'"); 
		}
		if(mingcheng_daoyan_zhuyan.equals("名称"))
		{
			sql.append(" and shipinName like '%"+key.trim()+"%'"); 
		}
		if(mingcheng_daoyan_zhuyan.equals("主演"))
		{
			sql.append(" and shipinZhuyan like '%"+key.trim()+"%'"); 
		}
		if(mingcheng_daoyan_zhuyan.equals("导演"))
		{
			sql.append(" and shipinDaoyan like '%"+key.trim()+"%'"); 
		}
		if(mingcheng_daoyan_zhuyan.equals("请选择"))
		{
			sql.append(" and shipinName like '%"+key.trim()+"%'"); 
		}
		
		List shipinList=shipinDAO.getHibernateTemplate().find(sql.toString());
		
		
		
		int pageSize=5;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, shipinList.size());
		List shipinListFenye = shipinList.subList(fromIndex, toIndex);
		

        Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(pageSize);
        p.setTotle(shipinList.size());//设置总共的条数
        p.setData(shipinListFenye);//设置数据
        p.setPath("shipinSearch.action?key="+key+"&mingcheng_daoyan_zhuyan="+mingcheng_daoyan_zhuyan+"&shipinLeixing="+shipinLeixing+"&");//跳转的路径

		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	
	
	
	public String liuyanAdd()
	{
		TLiuyan liuyan=new TLiuyan();
		liuyan.setLiuyanContent(liuyanContent);
		liuyan.setLiuyanDate(new Date().toLocaleString());
		liuyan.setShipinId(shipinId);
		Map session=ActionContext.getContext().getSession();
		
		if(session.get("user")!=null)
		{
			TUser user=(TUser)session.get("user");
			liuyan.setLiuyanUser(user.getUserName());
		}
		
		
		liuyanDAO.save(liuyan);
		this.setMessage("留言添加成功！");
		this.setPath("shipinDetailQian.action?shipinId="+shipinId);
		return "succeed";
	}
	

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

	public int getShipinId()
	{
		return shipinId;
	}


	public void setShipinId(int shipinId)
	{
		this.shipinId = shipinId;
	}


	public int getLiuyanId()
	{
		return liuyanId;
	}


	public void setLiuyanId(int liuyanId)
	{
		this.liuyanId = liuyanId;
	}


	public String getPath()
	{
		return path;
	}

	public String getLiuyanContent()
	{
		return liuyanContent;
	}


	public void setLiuyanContent(String liuyanContent)
	{
		this.liuyanContent = liuyanContent;
	}


	public String getKey()
	{
		return key;
	}


	public int getIndex()
	{
		return index;
	}


	public void setIndex(int index)
	{
		this.index = index;
	}


	public void setKey(String key)
	{
		this.key = key;
	}


	public TLiuyanDAO getLiuyanDAO()
	{
		return liuyanDAO;
	}


	public void setLiuyanDAO(TLiuyanDAO liuyanDAO)
	{
		this.liuyanDAO = liuyanDAO;
	}


	public String getMingcheng_daoyan_zhuyan()
	{
		return mingcheng_daoyan_zhuyan;
	}


	public void setMingcheng_daoyan_zhuyan(String mingcheng_daoyan_zhuyan)
	{
		this.mingcheng_daoyan_zhuyan = mingcheng_daoyan_zhuyan;
	}


	public void setPath(String path)
	{
		this.path = path;
	}

	public String getShipinDaoyan()
	{
		return shipinDaoyan;
	}


	public void setShipinDaoyan(String shipinDaoyan)
	{
		this.shipinDaoyan = shipinDaoyan;
	}


	public String getShipinLeixing()
	{
		return shipinLeixing;
	}


	public void setShipinLeixing(String shipinLeixing)
	{
		this.shipinLeixing = shipinLeixing;
	}


	public String getShipinZhuyan()
	{
		return shipinZhuyan;
	}


	public void setShipinZhuyan(String shipinZhuyan)
	{
		this.shipinZhuyan = shipinZhuyan;
	}


	public String getShipinBofangshijian()
	{
		return shipinBofangshijian;
	}

	public void setShipinBofangshijian(String shipinBofangshijian)
	{
		this.shipinBofangshijian = shipinBofangshijian;
	}

	public TShipinDAO getShipinDAO()
	{
		return shipinDAO;
	}

	public void setShipinDAO(TShipinDAO shipinDAO)
	{
		this.shipinDAO = shipinDAO;
	}

	public String getShipinJianjie()
	{
		return shipinJianjie;
	}

	public void setShipinJianjie(String shipinJianjie)
	{
		this.shipinJianjie = shipinJianjie;
	}

	public String getShipinName()
	{
		return shipinName;
	}

	public void setShipinName(String shipinName)
	{
		this.shipinName = shipinName;
	}


	public File getShipinPath()
	{
		return shipinPath;
	}


	public void setShipinPath(File shipinPath)
	{
		this.shipinPath = shipinPath;
	}


	public String getShipinPathContentType()
	{
		return shipinPathContentType;
	}


	public void setShipinPathContentType(String shipinPathContentType)
	{
		this.shipinPathContentType = shipinPathContentType;
	}


	public String getShipinPathFileName()
	{
		return shipinPathFileName;
	}


	public void setShipinPathFileName(String shipinPathFileName)
	{
		this.shipinPathFileName = shipinPathFileName;
	}
	private static void copy(File src, File dst) 
    {
        InputStream in = null;
        OutputStream out = null;
        try 
        {
            in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
            out = new BufferedOutputStream(new FileOutputStream(dst),BUFFER_SIZE);
            byte[] buffer = new byte[BUFFER_SIZE];
            int len = 0;
            while ((len = in.read(buffer)) > 0) 
            {
                out.write(buffer, 0, len);
            }
        } 
        catch (Exception e)
        {
            e.printStackTrace();
        } 
        finally
        {
            if (null != in) 
            {
                try 
                {
                    in.close();
                } 
                catch (IOException e) 
                {
                    e.printStackTrace();
                }
            }
            if (null != out) 
            {
                try 
                {
                    out.close();
                } 
                catch (IOException e) 
                {
                    e.printStackTrace();
                }
            }
        }
    }
}
