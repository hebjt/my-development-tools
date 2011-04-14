package airticket.action;

import java.util.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import airticket.po.Userinfo;
import airticket.service.UserOprService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserOprAction extends ActionSupport {
	private UserOprService userOprService;
    private Long userid;
    private String username;
    private String pasword;
    private String phone;
//    private String tel;
//    private String fax;
    private String email;
    private static final Log log = LogFactory.getLog(UserOprAction.class);
	@Override
	public String execute() throws Exception {
		// TODO 自动生成方法存根
		return SUCCESS;
	}
	//用户注册
	public String registerUser(){
		Userinfo userinfo = new Userinfo();
		
		userinfo.setUserid(userOprService.findUserId());
		userinfo.setUsername(username);
		userinfo.setPasword(pasword);
		userinfo.setEmail(email);
		userinfo.setPhone(phone);
		userOprService.save(userinfo);
		Map session = ActionContext.getContext().getSession();
		session.put("userinfo", userinfo);
		return "userinfo";
	}
	//跳转登陆页面
	public String loginPage(){
		
		return "loginPage";
	}
	//登陆
	public String login(){
		Userinfo userinfo = new Userinfo();
		userinfo.setUsername(username);
		userinfo.setPasword(pasword);
//		log.info(userOprService.findUserinfo(userinfo));
		userinfo = userOprService.findUserinfo(userinfo);
		
//		System.out.println(list);
//		assert(list == null);
		if(userinfo == null)
			return loginPage();
		Map session = ActionContext.getContext().getSession();
		session.put("userinfo", userinfo);
		return "userinfo";
	}
	//退出登陆
	public String logout(){
		Map session = ActionContext.getContext().getSession();
		if(session.get("userinfo") != null)
			session.remove("userinfo");
		return loginPage();
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasword() {
		return pasword;
	}
	public void setPasword(String pasword) {
		this.pasword = pasword;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Long getUserid() {
		return userid;
	}
	public void setUserid(Long userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public UserOprService getUserOprService() {
		return userOprService;
	}
	public void setUserOprService(UserOprService userOprService) {
		this.userOprService = userOprService;
	}
	
}
