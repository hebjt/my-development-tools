package com.tanghsk.mock.admin.exam.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tanghsk.mock.admin.exam.domain.ExamSubType;
import com.tanghsk.mock.admin.exam.service.ExamSubTypeService;

/**
 * 科目类型
 * @author pig
 * 2012-1-13
 */

@Controller
@RequestMapping("/subject/*")
public class ExamSubTypeAction {
	protected static Logger logger = Logger.getLogger("ExamSubjectAction"); 
	@Autowired
	private ExamSubTypeService subTypeService;
	
	/**
	 * 列表显示所有科目类型
	 * @param model
	 * @return
	 */
	@RequestMapping(value="subType",method=RequestMethod.GET)
	public String getAddSubType(Model model){
		List<ExamSubType> subType_list = subTypeService.getAllSubType();
		model.addAttribute("type_list",subType_list);
		model.addAttribute("list_number",subType_list.size());
		return "exam/subject/subType_list";
	}
	
	/**
	 * 配合AJAX查重处理
	 * @param checkPara
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="findDupSubType",method=RequestMethod.POST)
	public void findDupSubType(ExamSubType subType,String findType,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		
		if(subTypeService.findDupSubType(subType,findType).size()!=0){
			out.println("yes");
		}else{
			out.println("no");
		}
	}
	
	/**
	 * 显示添加科目类型的页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="add_subType",method=RequestMethod.GET)
	public String addSubType(Model model){
		return "exam/subject/add_subType";
	}
	
	/**
	 * 保存添加科目
	 * @param subType
	 * @param model
	 * @return
	 */
	@RequestMapping(value="save_subType",method=RequestMethod.POST)
	public ModelAndView saveSubType(ExamSubType subType,Model model){
		subTypeService.addSubType(subType);
		return new ModelAndView("redirect:subType.action");
	}
	
	/**
	 * 显示修改科目类型的页面
	 * @param subType_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="showEdit_subType",method=RequestMethod.GET)
	public String showEditSubType(String subType_id,Model model){
		ExamSubType subType = subTypeService.findSubTypeById(subType_id);
		model.addAttribute("subType",subType);
		return "exam/subject/edit_subType";
	}
	
	/**
	 * 修改科目类型并返回科目列表
	 * @param subType
	 * @param model
	 * @return
	 */
	@RequestMapping(value="edit_subType",method=RequestMethod.POST)
	public ModelAndView editSubType(ExamSubType subType,Model model){
		subTypeService.editSubType(subType);
		return new ModelAndView("redirect:subType.action");
	}
	
	/**
	 * 删除科目类型并返回科目列表
	 * @param subType
	 * @param model
	 * @return
	 */
	@RequestMapping(value="del_subType",method=RequestMethod.GET)
	public ModelAndView delSubType(ExamSubType subType,Model model){
		subTypeService.delSubType(subType);
		return new ModelAndView("redirect:subType.action");
	}
	
	/**
	 * 检查是否可以删除
	 * @param subType
	 * @param model
	 * @throws IOException 
	 */
	@RequestMapping(value="findSubjectByType",method=RequestMethod.POST)
	public void findSubjectByType(ExamSubType subType,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		
		if(subTypeService.findSubjectByType(subType).size()!=0){
			out.println("yes");
		}else{
			out.println("no");
		}
	}
}
