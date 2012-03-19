package com.tanghsk.mock.admin.user.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tanghsk.mock.admin.user.domain.ExamUser;
import com.tanghsk.mock.admin.user.service.ExamUserService;
import com.tanghsk.util.CommUtil;
import com.tanghsk.util.MyException;
import com.tanghsk.util.Page;

@Controller
@RequestMapping("/user/*")
public class ExamUserAction {
	protected static Logger logger = Logger.getLogger("ExamUserAction");
	@Autowired
	private ExamUserService UserService;

	@RequestMapping(value = "user", method = RequestMethod.GET)
	@SuppressWarnings("unchecked")
	public String getAllUser(Model model, Page page) {

		List<ExamUser> userlist = UserService.findAll(page);
		model.addAttribute("list", userlist);
		model.addAttribute("page", page);
		logger.info(page.getPageStr());

		return "user/user_list";
	}

	@RequestMapping(value = "add_user", method = RequestMethod.GET)
	public String addUser(Model model) {

		return "user/user_add";
	}
	
	@RequestMapping(value="user_del",method=RequestMethod.GET)
	public ModelAndView delUser(String user_id,Model model){
		ExamUser user = new ExamUser();
		user.setUser_id(user_id);
		//try {
			UserService.delUser(user);
		//} catch (MyException e) {
			// TODO Auto-generated catch block
		//	logger.info("1111111111");
		//	e.printStackTrace();
		//}
		return new ModelAndView("redirect:user.action");
	}

	@RequestMapping(value = "save_user", method = RequestMethod.POST)
	public ModelAndView saveUser(ExamUser User, Model model) {
		ExamUser eu = new ExamUser();
		eu.setUser_id(CommUtil.getNewID());
		eu.setUser_name(User.getUser_name());
		eu.setUser_type(User.getUser_type());
		eu.setUser_status_id(User.getUser_status_id());
		eu.setUser_realname(User.getUser_realname());
		eu.setUser_first_name(User.getUser_first_name());
		eu.setUser_last_name(User.getUser_last_name());
		eu.setUser_cn_name(User.getUser_cn_name());
		eu.setUser_sex(User.getUser_sex());
		eu.setUser_birthday(User.getUser_birthday());
		eu.setUser_phone(User.getUser_phone());
		eu.setUser_cellphone(User.getUser_cellphone());
		eu.setUser_email(User.getUser_email());
		eu.setUser_address(User.getUser_address());
		eu.setUser_address_detail(User.getUser_address_detail());
		eu.setUser_zip(User.getUser_zip());
		eu.setUser_regtime(new Date());
		UserService.addUser(eu);

		return new ModelAndView("redirect:user.action");
	}

	@RequestMapping(value = "update_user", method = RequestMethod.POST)
	public ModelAndView updateUser(ExamUser User, Model model) {
		ExamUser eu = new ExamUser();
		eu.setUser_id(User.getUser_id());
		eu.setUser_name(User.getUser_name());
		eu.setUser_realname(User.getUser_realname());
		eu.setUser_first_name(User.getUser_first_name());
		eu.setUser_last_name(User.getUser_last_name());
		eu.setUser_cn_name(User.getUser_cn_name());
		eu.setUser_sex(User.getUser_sex());
		eu.setUser_birthday(User.getUser_birthday());
		eu.setUser_phone(User.getUser_phone());
		eu.setUser_cellphone(User.getUser_cellphone());
		eu.setUser_email(User.getUser_email());
		eu.setUser_address(User.getUser_address());
		eu.setUser_address_detail(User.getUser_address_detail());
		eu.setUser_zip(User.getUser_zip());
		UserService.updateUser(eu);

		return new ModelAndView("redirect:user.action");
	}

	// @RequestMapping(value="update_user",method=RequestMethod.POST)
	// public ModelAndView updateUser(@RequestParam("user_id") String
	// user_id,@RequestParam("user_birthday") String user_birthday,Model model){
	// ExamUser eu = new ExamUser();
	// eu.setUser_id(user_id);
	// eu.setUser_birthday(new Date());
	// //eu.setUser_name(User.getUser_name());
	// //eu.setUser_realname(User.getUser_realname());
	// //eu.setUser_sex(User.getUser_sex());
	// //eu.setUser_birthday(user_birthday);
	// //eu.setUser_phone(User.getUser_phone());
	// //eu.setUser_email(User.getUser_email());
	// //eu.setUser_address(User.getUser_address());
	// //eu.setUser_address_detail(User.getUser_address_detail());
	// //eu.setUser_zip(User.getUser_zip());
	// UserService.updateUser(eu);

	// return new ModelAndView("redirect:user.action");
	// }

	@RequestMapping(value = "user_edit", method = RequestMethod.GET)
	public String editUser(String user_id, Model model) {
		ExamUser User = new ExamUser();
		User.setUser_id(user_id);
		ExamUser eu = UserService.findUserByModel(User);
		model.addAttribute("item", eu);
		return "user/user_edit";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
}
