package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TGonggaoDAO;
import com.dao.TNewsDAO;
import com.dao.TShipinDAO;
import com.opensymphony.xwork2.ActionSupport;

public class indexAction extends ActionSupport
{
	private TNewsDAO newsDAO;
	private TShipinDAO shipinDAO;
	
	
	public String index()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		
		
		List newsList=newsDAO.findAll();
		if(newsList.size()>5)
		{
			newsList=newsList.subList(0, 5);
		}
		request.put("newsList", newsList);
		
		
		String sql="from TShipin where del='no' order by shipinCishu desc";
		List shipinList=shipinDAO.getHibernateTemplate().find(sql);
		
		request.put("shipinList", shipinList);
		
		return ActionSupport.SUCCESS;
	}

	

	public TNewsDAO getNewsDAO()
	{
		return newsDAO;
	}

	public void setNewsDAO(TNewsDAO newsDAO)
	{
		this.newsDAO = newsDAO;
	}
	public TShipinDAO getShipinDAO()
	{
		return shipinDAO;
	}
	public void setShipinDAO(TShipinDAO shipinDAO)
	{
		this.shipinDAO = shipinDAO;
	}
}
