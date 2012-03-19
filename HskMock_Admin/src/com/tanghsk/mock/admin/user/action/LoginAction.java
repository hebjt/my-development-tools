package com.tanghsk.mock.admin.user.action;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.tanghsk.mock.admin.user.domain.ExamUser;
import com.tanghsk.mock.admin.user.service.LoginService;
@Controller
@RequestMapping("/examUser/*")
@SessionAttributes("sessionKeyValue")
public class LoginAction {
	protected static Logger logger = Logger.getLogger("LoginAction");
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public ModelAndView findUserById(String user_name,
							 String pass,Model model){
		
		ExamUser obj = loginService.findUserById(user_name);
		if(obj!=null){
			if(obj.getUser_pass().equals(pass)){
				logger.info("登录成功！");
				model.addAttribute("sessionKeyValue",obj);
				return new ModelAndView("redirect:index.action");
			}else{
				logger.info("用户名或者密码错误！");
				return null;
				
			}
		}else{
			logger.info("没有此用户！");
			return null;
			
		}
		
	}
	@RequestMapping(value="index",method=RequestMethod.GET)
	public String goMenu(Model mode,HttpSession session){
		//ExamUser user = (ExamUser)session.getAttribute("sessionKeyValue");
		//logger.info(user.getUser_name());
		return "index";
	}
	@RequestMapping(value="top",method=RequestMethod.GET)
	public String goTop(Model model){
		return "top";
	}
	
	@RequestMapping(value="welcome",method=RequestMethod.GET)
	public String goHome(Model model){
		return "welcome";
	}
	@RequestMapping(value="left",method=RequestMethod.GET)
	public String goLeft(Model model){
		return "left";
	}
	@RequestMapping(value="bottom",method=RequestMethod.GET)
	public String goBottom(Model model){
		return "bottom";
	}

	

}
