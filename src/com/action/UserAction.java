package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TUserDAO;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport
{
    private int userId;
	private String userName;
	private String userPw;
	private String userRealname;
	private String userAddress;
	private String userSex;
	private String userTel;
	private String userEmail;
	private String userQq;
	private String userOne1;
	private String userOne2;
	
	private String newUserPw;
   
	
	
	
	private String message;
	private String path;
	
	private TUserDAO userDAO;
	
	public String userLogin()
	{
		String sql="from TUser where userName=? and userPw=?";
		Object[] con={userName,userPw};
		List userList=userDAO.getHibernateTemplate().find(sql,con);
		if(userList.size()==0)
		{
			Map request=(Map)ServletActionContext.getContext().get("request");
			this.setMessage("用户名或密码错误！");
			this.setPath("qiantai/default.jsp");
		}
		else
		{
			 Map session= ServletActionContext.getContext().getSession();
			 TUser user=(TUser)userList.get(0);
			 session.put("user", user);
			 this.setMessage("登陆成功！");
		     this.setPath("qiantai/default.jsp");
		}
		return "succeed";
	}
	
	
	public String userLogout()
	{
		Map session= ServletActionContext.getContext().getSession();
		session.remove("user");
		return ActionSupport.SUCCESS;
	}
	
	
	public String userReg()
	{
		TUser user=new TUser();
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		user.setUserRealname(userRealname);
		user.setUserEmail(userEmail);
		user.setUserSex(userSex);
		user.setUserQq(userQq);
		user.setUserOne1(userOne1);
		user.setUserOne2(userOne2);
		user.setUserType(0);//0:zhengchang,1dongjie,2shanchu
		userDAO.save(user);
		
		this.setMessage("注册成功！");
		this.setPath("/qiantai/default.jsp");
		return "succeed";
	}
	
	
	public String userEdit()
	{
		Map session= ServletActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		user.setUserRealname(userRealname);
		user.setUserEmail(userEmail);
		user.setUserSex(userSex);
		user.setUserQq(userQq);
		user.setUserOne1(userOne1);
		user.setUserOne2(userOne2);
		userDAO.getHibernateTemplate().update(user);
		
		session.put("user", user);
		this.setMessage("修改成功！");
		this.setPath("/qiantai/userinfo/userinfo.jsp");
		return "succeed";
	}
	
	
	
    public String userPwZhao()
    {
    	String sql="from TUser where userName=?";
		Object[] con={userName};
		List userList=userDAO.getHibernateTemplate().find(sql,con);
		if(userList.size()==0)
		{
			this.setMessage("用户名不存在！");
			this.setPath("qiantai/userinfo/userPwZhao.jsp");
			return "succeed";
			
		}
		else
		{
			sql="from TUser where userName=? and userOne1=?";
			Object[] con1={userName,userOne1};
			userList=userDAO.getHibernateTemplate().find(sql,con1);
			if(userList.size()==0)
			{
				this.setMessage("密码找回问题不正确！");
				this.setPath("qiantai/userinfo/userPwZhao.jsp");
				return "succeed";
				
			}
			else
			{
				//Map request=(Map)ServletActionContext.getContext().get("request");
				//TUser user=(TUser)userList.get(0);
				//request.put("user", user);
				sql="from TUser where userName=? and userOne1=? and userOne2=?";
				Object[] con2={userName,userOne1,userOne2};
				userList=userDAO.getHibernateTemplate().find(sql,con2);
				if(userList.size()==0)
				{
					this.setMessage("答案不正确！");
					this.setPath("qiantai/userinfo/userPwZhao.jsp");
					return "succeed";
					
				}
				else
				{
					Map request=(Map)ServletActionContext.getContext().get("request");
					TUser user=(TUser)userList.get(0);
					this.setMessage("您的密码为："+user.getUserPw()+" 请登录！");
					this.setPath("qiantai/default.jsp");
					return "succeed";
				}
			}
		}
    }
	
	
	public String userDel()
	{
		TUser user=userDAO.findById(userId);
		user.setUserType(2);//0:zhengchang,1dongjie,2shanchu
		userDAO.attachDirty(user);
		this.setMessage("成功删除！");
		this.setPath("userMana.action");
		return "succeed";
	}
	
	
	public String userDongjie()
	{
		TUser user=userDAO.findById(userId);
		user.setUserType(1);//0:zhengchang,1dongjie,2shanchu
		userDAO.attachDirty(user);
		this.setMessage("用户冻结操作成功！");
		this.setPath("userMana.action");
		return "succeed";
	}
	
	public String userJiedong()
	{
		TUser user=userDAO.findById(userId);
		user.setUserType(0);//0:zhengchang,1dongjie,2shanchu
		userDAO.attachDirty(user);
		this.setMessage("用户解冻操作成功！");
		this.setPath("userMana.action");
		return "succeed";
	}
	
	
	public String userMana()
	{
		List userList=userDAO.findAll();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String getUserAddress()
	{
		return userAddress;
	}

	public void setUserAddress(String userAddress)
	{
		this.userAddress = userAddress;
	}

	public String getUserEmail()
	{
		return userEmail;
	}

	public void setUserEmail(String userEmail)
	{
		this.userEmail = userEmail;
	}

	public String getUserOne1()
	{
		return userOne1;
	}


	public void setUserOne1(String userOne1)
	{
		this.userOne1 = userOne1;
	}


	public String getUserOne2()
	{
		return userOne2;
	}


	public void setUserOne2(String userOne2)
	{
		this.userOne2 = userOne2;
	}


	public String getUserQq()
	{
		return userQq;
	}

	public void setUserQq(String userQq)
	{
		this.userQq = userQq;
	}

	public String getUserRealname()
	{
		return userRealname;
	}

	public void setUserRealname(String userRealname)
	{
		this.userRealname = userRealname;
	}

	public String getUserSex()
	{
		return userSex;
	}

	public void setUserSex(String userSex)
	{
		this.userSex = userSex;
	}

	public String getUserTel()
	{
		return userTel;
	}

	public void setUserTel(String userTel)
	{
		this.userTel = userTel;
	}

	public int getUserId()
	{
		return userId;
	}


	public void setUserId(int userId)
	{
		this.userId = userId;
	}


	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public TUserDAO getUserDAO()
	{
		return userDAO;
	}


	public String getMessage()
	{
		return message;
	}


	public String getNewUserPw()
	{
		return newUserPw;
	}

	public void setNewUserPw(String newUserPw)
	{
		this.newUserPw = newUserPw;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}


	public String getPath()
	{
		return path;
	}


	public void setPath(String path)
	{
		this.path = path;
	}


	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}


	public String getUserPw()
	{
		return userPw;
	}

	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}

	
}
