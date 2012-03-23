package com.tanghsk.mock.admin.right.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tanghsk.mock.admin.right.domain.ExamResource;
import com.tanghsk.mock.admin.right.service.ExamRightService;
import com.tanghsk.util.Page;

@Controller
@RequestMapping("/system/**")
public class SystemManageAction {
	@Autowired
	private ExamRightService rightService;
	/**
	 * 资源列表
	 * @return
	 */
	@RequestMapping(value="resource",method=RequestMethod.GET)
	public String resource(Model model){
		Page page = new Page();
		List<ExamResource> resList = rightService.getListPageResource(page);
		model.addAttribute("res", resList);
		model.addAttribute("RowCount", resList.size());
		return "system/resource_list";
	}

}
