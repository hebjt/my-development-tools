package com.tanghsk.mock.admin.exam.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tanghsk.mock.admin.exam.domain.ExamSubType;
import com.tanghsk.mock.admin.exam.domain.ExamSubject;
import com.tanghsk.mock.admin.exam.domain.ExamSubjectLevel;
import com.tanghsk.mock.admin.exam.domain.ExamSubjectStruct;
import com.tanghsk.mock.admin.exam.service.ExamSubTypeService;
import com.tanghsk.mock.admin.exam.service.ExamSubjectService;
import com.tanghsk.util.CommUtil;
import com.tanghsk.util.MyException;
import com.tanghsk.util.Page;

@Controller
@RequestMapping("/subject/*")
public class ExamSubjectAction {
	protected static Logger logger = Logger.getLogger("ExamSubjectAction"); 
	@Autowired
	private ExamSubjectService subjectService;
	@Autowired
	private ExamSubTypeService subTypeService;
	
	@RequestMapping(value="sub",method=RequestMethod.GET)
	public String getAllSubject(Model model,Page page){
		List<ExamSubject> sublist = subjectService.findAll(page);
		model.addAttribute("list",sublist);
		model.addAttribute("page", page);
		model.addAttribute("RowCount", sublist.size());
		//logger.info(page.getPageStr());
		
		return "exam/subject/sub_list";
	}
	
	@RequestMapping(value="add_sub",method=RequestMethod.GET)
	public String addSub(Model model){
		return "exam/subject/add_sub";
	}
	
	@RequestMapping(value="save_sub",method=RequestMethod.POST)
	public ModelAndView saveSub(String subject_type,String subject_level,ExamSubject subject,Model model){
		ExamSubType type = subTypeService.findSubTypeById(subject_type);
		ExamSubjectLevel subjectLevel = subjectService.getLevleById(subject_level);
		subject.setSubjectType(type);
		subject.setSubjectLevel(subjectLevel);
		subject.setSubject_id(CommUtil.getNewID());
		try {
			subjectService.addSubject(subject);
		} catch (MyException e) {
			e.printStackTrace();
		}
		return new ModelAndView("redirect:sub.action");
	}
	
	public ModelAndView updateSub(ExamSubject subject,Model model){
		try {
			subjectService.addSubject(subject);
		} catch (MyException e) {
			e.printStackTrace();
		}
		return new ModelAndView("redirect:sub.action");
	}
	
	@RequestMapping(value="edit_sub",method=RequestMethod.GET)
	public String editSub(String subject_id,Model model){
		ExamSubject subject = new ExamSubject();
		subject.setSubject_id(subject_id);
		ExamSubject es = subjectService.findSubjectById(subject);
		model.addAttribute("subject", es);
		return "exam/subject/edit_sub";
	}
	
	@RequestMapping(value="del_sub",method=RequestMethod.GET)
	public ModelAndView delSubject(String subject_id,Model model){
		ExamSubject subject = new ExamSubject();
		subject.setSubject_id(subject_id);
		try {
			subjectService.delSubject(subject);
		} catch (MyException e) {
			logger.info("1111111111");
			e.printStackTrace();
		}
		return new ModelAndView("redirect:sub.action");
	}
	
	@RequestMapping(value="initSubject",method=RequestMethod.POST)
	@ResponseBody
	public List<ExamSubType> initSubject(HttpServletResponse response,Model model) throws Exception{
		List<ExamSubType> type_list = subTypeService.getAllSubType();
		return type_list;
	}
	//初始化科目级别
	@RequestMapping(value="initLevel",method=RequestMethod.POST)
	@ResponseBody
	public List<ExamSubjectLevel> initLevel(Page page,Model model){
	
		return subjectService.getListPage(page);
	}
	
	@RequestMapping(value="update_sub",method=RequestMethod.POST)
	public ModelAndView updateSubject(ExamSubject subject,Model model){
		subjectService.updateSubject(subject);
		return new ModelAndView("redirect:sub.action");
	}
	
	/**
	 * 科目结构数据列表（ ）
	 * @param subject_id 科目编码
	 * @param model
	 * @return
	 */
	@RequestMapping(value="struct_create",method=RequestMethod.GET)
	public String structCreate(ExamSubject subject,Model model){
		//List<ExamSubjectStruct> struList = new ArrayList<ExamSubjectStruct>();
		List<ExamSubjectStruct> struList = subjectService.findStruBySubID(subject.getSubject_id());
		ExamSubject sub = subjectService.findSubjectById(subject);				
		model.addAttribute("subject", sub);
		model.addAttribute("struList", struList);
		
		return "exam/subject/substruct_list_bak";
	}
	
	
	/**
	 * 保存科目结构数据（第一层级）
	 * @param subject_id 科目编码
	 * @param struct 科目结构数据对象
	 * @param model
	 * @return
	 */
	
	@RequestMapping(value="save_substrut",method=RequestMethod.POST)
	public String saveSubStruct(String flag,String primarykey_id,ExamSubjectStruct struct,Model model) throws Exception{
		if(flag.equals("0")){
			String primaryId = CommUtil.getNewID();
			struct.setSubject_struct_id(primaryId);
			struct.setSubject_struct_parent_id(primaryId);
			struct.setSubject_struct_root_id(primaryId);
			subjectService.addSubStruct(struct);
		    return "success";
		}else{
			struct.setSubject_struct_id(primarykey_id);
			subjectService.updateSubStru(struct);
			return "success";
		}

	}
	/**
	 * 保存科目结构第二 ,三 层级
	 * @param struct
	 * @param model
	 * @return
	 */
	@RequestMapping(value="save_subpart",method=RequestMethod.POST)
	public String saveSubPart(HttpServletRequest request,ExamSubjectStruct struct,Model model){
		String sub_flag = request.getParameter("sub_flag")==null?"":request.getParameter("sub_flag");
		String part_flag = request.getParameter("part_flag")==null?"":request.getParameter("part_flag");
		String sub_primarykey_id = request.getParameter("sub_primarykey_id")==null?"":request.getParameter("sub_primarykey_id");
		String part_primarykey_id = request.getParameter("part_primarykey_id")==null?"":request.getParameter("part_primarykey_id");
		if(sub_flag.equals("0")||part_flag.equals("0")){
			struct.setSubject_struct_id(CommUtil.getNewID());
			subjectService.addSubStruct(struct);
			return "success";
		}else{
			if(sub_primarykey_id!=""){
				struct.setSubject_struct_id(sub_primarykey_id);
			}
			if(part_primarykey_id!=""){
				struct.setSubject_struct_id(part_primarykey_id);
			}
			subjectService.updateSubStru(struct);
			return "success";
		}
	}
	/**
	 * 根据主键加载对象
	 * @param struct_id
	 * @return
	 */
	@RequestMapping(value="load_object",method=RequestMethod.POST)
	@ResponseBody
	public ExamSubjectStruct getObjectById(String struct_id){
		ExamSubjectStruct struct = subjectService.getObjectById(struct_id);
		return struct;
	}

	/**
	 * 删除数据
	 * @param struct_id
	 * @return
	 */
	@RequestMapping(value="del_data",method=RequestMethod.POST)
	@ResponseBody
	public String delData(String struct_id){
		List<ExamSubjectStruct> childList = subjectService.getChildList(struct_id);
		if(childList.size()>0){
			return "error";
		}else{
			subjectService.delStruct(struct_id);
			return "success";
		}
	}
	
}
