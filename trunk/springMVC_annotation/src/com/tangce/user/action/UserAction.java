package com.tangce.user.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tangce.user.domain.User;
import com.tangce.user.services.UserService;
@Controller
@RequestMapping("/user/")
public class UserAction {
	protected static Logger logger = Logger.getLogger("useraction");  
	@Autowired
	private UserService userService;
	@RequestMapping(value="list")
	public String login(Model model){
		Map<String,Object> userMap = userService.getAllUser();
		List<User> list = (List<User>) userMap.get("ResultSet");
		
		model.addAttribute("list",list);
		logger.info("login..........");
		String target="";
		target="user/index";
		return target;
	}
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String login(@RequestParam(value="name",required=true)String name,User user,Model model){
		if(name.equals("test")&&user.getPassword().equals("test")){
			logger.info("login............"+name);
			Map<String,Object> userMap = userService.getAllUser();
			List<User> list = (List<User>) userMap.get("ResultSet");
			
			model.addAttribute("list",list);
			return "user/index";
		}else{
			logger.info("failed............");
			return "user/error";
		}
		
		//return null;
	}
	@RequestMapping(value="del")
	public ModelAndView del(@RequestParam(value="id",required=true)int id,
									Model model){
		User user = new User();
		user.setId(id);
		userService.delUserById(user);

		return new ModelAndView("redirect:list.action");
	}
	@RequestMapping(value="edit")
	public String edit(@RequestParam(value="id",required=true)int id,
															  Model model){
		User user = new User();
		user.setId(id);
		User u = userService.findUserById(user);
		model.addAttribute("user", u);
		logger.info("*******************"+u.toString());
		
		return "user/editsh";
	}
	@RequestMapping(value="editSave")
	public String editSave(@RequestParam(value="id",required=true)int id,
						   @RequestParam(value="name",required=true)String name,
						   @RequestParam(value="password",required=true)String password,
						   @RequestParam(value="state")int state,Model model){
		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setPassword(password);
		user.setState(state);
		userService.updateUser(user);
		
		Map<String,Object> userMap = userService.getAllUser();
		List<User> list = (List<User>) userMap.get("ResultSet");
		model.addAttribute("list",list);
		
		return "user/index";
	}
	/**
	 * ajax����
	* 
	 */

	@RequestMapping("ajax")
	@ResponseBody
	public Object ajax(HttpServletRequest request){
		List<String> list=new ArrayList<String>();
		list.add("����");
		list.add("ϴ�»�");
		list.add("����");
		list.add("����");
		list.add("��");
		list.add("�յ�");
		list.add("���г�");
		list.add("��ˮ��");
		list.add("��ˮ��");
		return list;
	}
	
}
