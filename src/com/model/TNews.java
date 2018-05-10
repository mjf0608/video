package com.model;

import java.util.Date;

/**
 * TNews generated by MyEclipse Persistence Tools
 */

public class TNews implements java.io.Serializable
{

	// Fields

	private Integer newsId;

	private String newsTitle;

	private String newsContent;

	private String newsDate;

	private String newsOne1;

	private String newsOne2;

	private String newsOne3;

	private String newsOne4;

	private Integer newsOne5;

	private Integer newsOne6;

	private Date newsOne7;

	private Date newsOne8;

	// Constructors

	/** default constructor */
	public TNews()
	{
	}

	/** full constructor */
	public TNews(String newsTitle, String newsContent, String newsDate,
			String newsOne1, String newsOne2, String newsOne3, String newsOne4,
			Integer newsOne5, Integer newsOne6, Date newsOne7, Date newsOne8)
	{
		this.newsTitle = newsTitle;
		this.newsContent = newsContent;
		this.newsDate = newsDate;
		this.newsOne1 = newsOne1;
		this.newsOne2 = newsOne2;
		this.newsOne3 = newsOne3;
		this.newsOne4 = newsOne4;
		this.newsOne5 = newsOne5;
		this.newsOne6 = newsOne6;
		this.newsOne7 = newsOne7;
		this.newsOne8 = newsOne8;
	}

	// Property accessors

	public Integer getNewsId()
	{
		return this.newsId;
	}

	public void setNewsId(Integer newsId)
	{
		this.newsId = newsId;
	}

	public String getNewsTitle()
	{
		return this.newsTitle;
	}

	public void setNewsTitle(String newsTitle)
	{
		this.newsTitle = newsTitle;
	}

	public String getNewsContent()
	{
		return this.newsContent;
	}

	public void setNewsContent(String newsContent)
	{
		this.newsContent = newsContent;
	}

	public String getNewsDate()
	{
		return this.newsDate;
	}

	public void setNewsDate(String newsDate)
	{
		this.newsDate = newsDate;
	}

	public String getNewsOne1()
	{
		return this.newsOne1;
	}

	public void setNewsOne1(String newsOne1)
	{
		this.newsOne1 = newsOne1;
	}

	public String getNewsOne2()
	{
		return this.newsOne2;
	}

	public void setNewsOne2(String newsOne2)
	{
		this.newsOne2 = newsOne2;
	}

	public String getNewsOne3()
	{
		return this.newsOne3;
	}

	public void setNewsOne3(String newsOne3)
	{
		this.newsOne3 = newsOne3;
	}

	public String getNewsOne4()
	{
		return this.newsOne4;
	}

	public void setNewsOne4(String newsOne4)
	{
		this.newsOne4 = newsOne4;
	}

	public Integer getNewsOne5()
	{
		return this.newsOne5;
	}

	public void setNewsOne5(Integer newsOne5)
	{
		this.newsOne5 = newsOne5;
	}

	public Integer getNewsOne6()
	{
		return this.newsOne6;
	}

	public void setNewsOne6(Integer newsOne6)
	{
		this.newsOne6 = newsOne6;
	}

	public Date getNewsOne7()
	{
		return this.newsOne7;
	}

	public void setNewsOne7(Date newsOne7)
	{
		this.newsOne7 = newsOne7;
	}

	public Date getNewsOne8()
	{
		return this.newsOne8;
	}

	public void setNewsOne8(Date newsOne8)
	{
		this.newsOne8 = newsOne8;
	}

}