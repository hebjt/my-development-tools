package test.action;

import com.opensymphony.xwork2.ActionContext;

import java.util.*;
import test.bo.AuctionManager;
import test.exception.AuctionException;
import test.action.base.BaseAction;
/**
 * @author  yeeku.H.lee kongyeeku@163.com
 * @version  1.0
 * <br>Copyright (C), 2005-2008, yeeku.H.Lee
 * <br>This program is protected by copyright laws.
 * <br>Program Name:
 * <br>Date: 
 */

public class LoginAction extends BaseAction
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7521871217157010284L;
	private String username;
	private String password;
	private String vercode;

	@Override
	public String execute() throws Exception
	{
		Map session = ActionContext.getContext().getSession();
        String ver2 = (String )session.get("rand");
		//清空用户Session的随机验证码字符串。
		session.put("rand" , null);
        if (vercode.equals(ver2))
        {
            Integer userId = mgr.validLogin(username,password);
           // System.out.println("*****************"+mgr.getClass().getName());
            if (userId != null)
            {
                session.put("userId" , userId);
                return SUCCESS;
            }
            else
            {
                addActionError("用户名/密码不匹配");
                return "failure";
            }
        }
        else
        {

			addActionError("验证码不匹配,请重新输入");
			return "failure";
        }
	}

	public void setUsername(String username)
	{
		this.username = username;
	}
	public String getUsername()
	{
		 return this.username;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getPassword()
	{
		 return this.password;
	}

	public void setVercode(String vercode)
	{
		this.vercode = vercode;
	}
	public String getVercode()
	{
		 return this.vercode;
	}

}