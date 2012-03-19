package com.tanghsk.mock.admin.exam.action;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tanghsk.mock.admin.exam.domain.ExamOptions;
import com.tanghsk.mock.admin.exam.domain.ExamPaper;
import com.tanghsk.mock.admin.exam.domain.ExamPaperPublish;
import com.tanghsk.mock.admin.exam.domain.ExamQuestions;
import com.tanghsk.mock.admin.exam.domain.ExamQuestionsTreeNode;
import com.tanghsk.mock.admin.exam.domain.ExamSubject;
import com.tanghsk.mock.admin.exam.domain.ExamSubjectStruct;
import com.tanghsk.mock.admin.exam.service.ExamPaperService;
import com.tanghsk.mock.admin.exam.service.ExamSubjectService;
import com.tanghsk.util.CommUtil;
import com.tanghsk.util.Page;
import com.tanghsk.util.zip.ZipTools;

@Controller
@RequestMapping("/examPaper/*")
public class ExamPaperAction {
	@Autowired
	private ExamPaperService examPaperService;
	@Autowired
	private ExamSubjectService subjectService;

	@RequestMapping(value = "showList", method = RequestMethod.GET)
	public String fingAllPaper(Model model, Page page) {
		List<ExamPaper> paper_list = examPaperService.fingAllPaper(page);
		model.addAttribute("page", page);
		model.addAttribute("paperList", paper_list);
		model.addAttribute("RowCount", paper_list.size());
		return "exam/paper/paper_list";
	}

	@RequestMapping(value = "add_paper", method = RequestMethod.GET)
	public String addPaper(Model model) {
		return "exam/paper/add_paper";
	}

	@RequestMapping(value = "initSubContent", method = RequestMethod.POST)
	@ResponseBody
	public List<ExamSubject> getAllSub(Page page) {
		return subjectService.findAll(page);
	}

	/**
	 * 试卷发布
	 * 
	 * @param paper_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "paper_publish", method = RequestMethod.GET)
	public String paperPublish(String paper_id, Model model) {
		ExamPaper paper = examPaperService.findEPById(paper_id);
		model.addAttribute("paper", paper);
		return "exam/paper/add_paper_publish";
	}

	/**
	 * 保存试卷
	 * 
	 * @param subject_name
	 * @param paper
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unused" })
	@RequestMapping(value = "save_paper", method = RequestMethod.POST)
	public ModelAndView savePaper(
			@RequestParam("subject_name") String subject_name, ExamPaper paper,
			MultipartHttpServletRequest request) throws Exception {
		List fileList = new ArrayList();
		String filePath = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/config/uploadFile.properties");
		String remoteHost = CommUtil.readValue(filePath, "remoteHost");
		String mappingDevice = CommUtil.readValue(filePath, "mappingDevice");

		ExamSubject subject = new ExamSubject();
		subject.setSubject_id(subject_name);
		ExamSubject exam_sub = subjectService.findSubjectById(subject);
		String paper_id = CommUtil.getNewID();
		paper.setPaperId(paper_id);
		paper.setSubject(exam_sub);
		paper.setPaperCreateTime(new Date());
		// String separator= File.separator;

		// String root = RequestContext.class.getResource("/").getFile();
		// String f = new
		// File(root).getParentFile().getParentFile().getParentFile().getCanonicalPath();
		// String path
		// =f+separator+upload_file+separator+resource_path+separator+filesAndImg+separator+paper_id;

		String path = mappingDevice + paper_id;
		// String path =
		// request.getSession().getServletContext().getRealPath(upload_file +
		// resource_path+ filesAndImg + "/" + paper_id+ "/");
		// String
		// path=ExamPaperAction.class.getResource("/").toURI().getPath().split("WEB-INF")[0]+"upload/images/"+paper_id+"/";

		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
		List<MultipartFile> files = request.getFiles("ListeningFile");
		for (int i = 0; i < files.size(); i++) {
			if (!files.get(i).isEmpty()) {
				// System.out.println(files.get(i).getOriginalFilename());
				byte[] bytes = files.get(i).getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/"
						+ files.get(i).getOriginalFilename()); // 写入文件
				paper.setPaperListeningFile(remoteHost + paper_id + "/"
						+ files.get(i).getOriginalFilename());
				fos.write(bytes);
				fos.close();
			}
			examPaperService.addExamPaper(paper);
			fileList = ZipTools.Ectract(path + "/"+ files.get(i).getOriginalFilename(), path + "/");
			//fileList = CommUtil.Ectract(path + "/"+ files.get(i).getOriginalFilename(), path + "/");
		    System.out.println("Ok*****************"+fileList.size());
		}
		return new ModelAndView("redirect:showList.action");
	}

	/**
	 * 修改试卷--
	 * 
	 * @param paper
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "edit_paper", method = RequestMethod.GET)
	public String editPaper(String paper_id, Model model) {
		ExamPaper paper = examPaperService.findEPById(paper_id);
		model.addAttribute("paper", paper);
		return "exam/paper/edit_paper";
	}

	/**
	 * 修改试卷--保存
	 * 
	 * @param paper
	 * @return
	 */
	@RequestMapping(value = "update_paper", method = RequestMethod.POST)
	public ModelAndView updatePaper(MultipartHttpServletRequest request,
			ExamPaper paper, String subject_name) throws Exception {
		List<String> fileList = new ArrayList<String>();
		String filePath = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/config/uploadFile.properties");
		String remoteHost = CommUtil.readValue(filePath, "remoteHost");
		String mappingDevice = CommUtil.readValue(filePath, "mappingDevice");

		String paper_id = paper.getPaperId();
		ExamSubject subject = new ExamSubject();
		subject.setSubject_id(subject_name);
		ExamSubject exam_sub = subjectService.findSubjectById(subject);

		// String separator= File.separator;

		String path = mappingDevice + paper_id;
		// String path =
		// request.getSession().getServletContext().getRealPath(upload_file +
		// resource_path+ filesAndImg + "/" + paper_id+ "/");
		// String
		// path=ExamPaperAction.class.getResource("/").toURI().getPath().split("WEB-INF")[0]+"upload/images/"+paper_id+"/";

		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
		List<MultipartFile> files = request.getFiles("ListeningFile");
		for (int i = 0; i < files.size(); i++) {
			if (!files.get(i).isEmpty()) {
				// System.out.println(files.get(i).getOriginalFilename());
				byte[] bytes = files.get(i).getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/"
						+ files.get(i).getOriginalFilename()); // 写入文件
				paper.setPaperListeningFile(remoteHost + paper_id + "/"
						+ files.get(i).getOriginalFilename());
				fos.write(bytes);
				fos.close();
			}
			// System.out.println("Ok");
			//fileList = CommUtil.Ectract(path + "/"+ files.get(i).getOriginalFilename(), path + "/");
			fileList = ZipTools.Ectract(path + "/"+ files.get(i).getOriginalFilename(), path + "/");
			System.out.println("Ok*****************" + fileList.size());
		}
		paper.setSubject(exam_sub);
		examPaperService.updatePaper(paper);
		return new ModelAndView("redirect:showList.action");
	}

	/**
	 * 试卷试题
	 * 
	 * @param paper_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "questions_index", method = RequestMethod.GET)
	public String questionsIndex(String subject_id, String paper_id, Model model) {
		model.addAttribute("subjectId", subject_id);
		model.addAttribute("paperId", paper_id);
		return "exam/paper/paper_idx";
	}

	/**
	 * 试题列表左侧树
	 * 
	 * @param paper_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "questions_left", method = RequestMethod.GET)
	public String questionsLeft(String subject_id, String paper_id, Model model) {
		List<ExamSubjectStruct> treeNodes = subjectService
				.getAllStructDataBySubject(subject_id);
		model.addAttribute("treeNodes", treeNodes);
		model.addAttribute("paperId", paper_id);
		return "exam/paper/questions_left";
	}

	@RequestMapping(value = "questions_main", method = RequestMethod.GET)
	public String questionsMain(String id, String level, String paper_id,
			Model model) {
		String subjectStructId = id;
		Map<String,String> map = new HashMap<String,String>(2);
		map.put("subjectStructId", subjectStructId);
		map.put("struct_id", subjectStructId);
		ExamQuestionsTreeNode treeNode = examPaperService.getQuestionsList(map);
		model.addAttribute("treeNode", treeNode);
		model.addAttribute("structId", subjectStructId);
		model.addAttribute("level", level);
		model.addAttribute("paperId", paper_id);
		return "exam/paper/questions_list";
	}

	/**
	 * 添加综合题
	 * 
	 * @param paper_id
	 * @param type
	 * @param structId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "paper_addsynthesis", method = RequestMethod.GET)
	public String paperAddSynthesis(HttpServletRequest request,
			String paper_id, String type, String structId, String quesDrySign,
			Model model) {
		String filePath = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/config/uploadFile.properties");
		String remoteHost = CommUtil.readValue(filePath, "remoteHost");
		// String mappingDevice = CommUtil.readValue(filePath, "mappingDevice");
		// 加载根节点名称---------------------------start
		ExamSubjectStruct struct = subjectService.getRootName(structId);
		if (struct != null) {
			if (struct.getSubject_struct_name().indexOf("书写") != -1) {
				model.addAttribute("listenstyle", "none");
				model.addAttribute("readstyle", "none");
				model.addAttribute("writestyle", "block");
			} else if (struct.getSubject_struct_name().indexOf("阅读") != -1) {
				model.addAttribute("listenstyle", "none");
				model.addAttribute("readstyle", "none");
				model.addAttribute("writestyle", "none");
			} else {
				model.addAttribute("listenstyle", "block");
				model.addAttribute("readstyle", "none");
				model.addAttribute("writestyle", "none");
			}
		}
		// ----------------------------------------end
		model.addAttribute("paperId", paper_id);
		model.addAttribute("type_id", type);
		model.addAttribute("struct_id", structId);
		model.addAttribute("quesDrySign", quesDrySign);
		model.addAttribute("ques_id", "root");
		model.addAttribute("listenUrl", remoteHost + paper_id + "/");
		return "exam/paper/paper_addsynthesis";
	}

	/**
	 * 保存综合题子选项
	 * 
	 * @param paper_id
	 * @param type
	 * @param ques_id
	 * @param strutct
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "paper_synthesis_create", method = RequestMethod.GET)
	public String paperSynthesisCreate(HttpServletRequest request, Model model) {
		String paper_id = request.getParameter("paper_id");
		String type = request.getParameter("type");
		String ques_id = request.getParameter("ques_id");
		String struct_id = request.getParameter("struct_id");
		String quesDrySign = request.getParameter("quesDrySign");
		// 加载根节点名称--------------start
		ExamSubjectStruct struct = subjectService.getRootName(struct_id);
		if (struct != null) {
			if (struct.getSubject_struct_name().indexOf("书写") != -1) {
				model.addAttribute("listenstyle", "none");
				model.addAttribute("readstyle", "none");
				model.addAttribute("writestyle", "block");
			} else if (struct.getSubject_struct_name().indexOf("阅读") != -1) {
				model.addAttribute("listenstyle", "none");
				model.addAttribute("readstyle", "none");
				model.addAttribute("writestyle", "none");
			} else {
				model.addAttribute("listenstyle", "block");
				model.addAttribute("readstyle", "none");
				model.addAttribute("writestyle", "none");
			}
		}
		// ---------------------end
		ExamQuestions question = examPaperService.getQuestionById(ques_id);
		model.addAttribute("paperId", paper_id);
		model.addAttribute("type_id", type);
		model.addAttribute("ques_id", ques_id);
		model.addAttribute("struct_id", struct_id);
		model.addAttribute("quesDrySign", quesDrySign);
		if (question.getQuesListenUrl() != null) {
			String quesListenUrl_1 = question.getQuesListenUrl().substring(0,
					question.getQuesListenUrl().lastIndexOf("/") + 1);
			String quesListenUrl_2 = question.getQuesListenUrl().substring(
					question.getQuesListenUrl().lastIndexOf("/") + 1,
					question.getQuesListenUrl().length());
			model.addAttribute("listenUrl", quesListenUrl_1);
			model.addAttribute("listenName", quesListenUrl_2);
		} else {
			String filePath = request.getSession().getServletContext()
					.getRealPath("/WEB-INF/config/uploadFile.properties");
			String remoteHost = CommUtil.readValue(filePath, "remoteHost");
			model.addAttribute("listenUrl", remoteHost + paper_id + "/");
		}
		model.addAttribute("question", question);
		return "exam/paper/paper_addsynthesis";
	}

	/**
	 * 保存试题
	 * 
	 * @param questions
	 * @param model
	 */
	@RequestMapping(value = "save_questions", method = RequestMethod.POST)
	public void saveQuestions(HttpServletRequest request,
			ExamQuestions questions, Model model) {
		String quesListenUrl = request.getParameter("quesListenUrl_1")
				+ request.getParameter("quesListenUrl_2");
		questions.setQuesId(CommUtil.getNewID());
		questions.setQuesListenUrl(quesListenUrl);
		examPaperService.saveQuestions(questions);
		// return null;
	}

	/**
	 * 添加试题选项
	 * 
	 * @param ques_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "paper_opt_create", method = RequestMethod.GET)
	public String paperOptCreate(String ques_id, String paper_id,
			String struct_id, Model model) {
		ExamQuestions question = examPaperService.getQuestionById(ques_id);
		model.addAttribute("question", question);
		// model.addAttribute("ques_id", ques_id);
		// model.addAttribute("paper_id", paper_id);
		// model.addAttribute("struct_id", struct_id);
		// String root = RequestContext.class.getResource("/").getFile();
		// String f = new
		// File(root).getParentFile().getParentFile().getCanonicalPath();
		return "exam/paper/paper_addoptions";
	}//

	/**
	 * 修改试题选项
	 * 
	 * @param options
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "paper_opt_edit", method = RequestMethod.GET)
	public String paperOptEdit(ExamOptions option, Model model) {
		// model.addAttribute("opt_id", options.getOptId());
		// model.addAttribute("ques_id", options.getQuesId());
		// model.addAttribute("paper_id", options.getOptPaperId());
		// model.addAttribute("struct_id", options.getOptStructId());
		// String root = RequestContext.class.getResource("/").getFile();
		// String f = new
		// File(root).getParentFile().getParentFile().getCanonicalPath();
		ExamOptions eo = examPaperService.getOptionById(option);
		model.addAttribute("options", eo);
		return "exam/paper/paper_editoptions";
	}

	/**
	 * 修改试题选项----保存
	 * 
	 * @param option
	 * @param model
	 */
	@RequestMapping(value = "update_option", method = RequestMethod.POST)
	public void UpdateOption(ExamOptions option, Model model) {
		examPaperService.updateOption(option);
	}

	/**
	 * 修改综合题
	 * 
	 * @param question
	 * @return
	 */
	@RequestMapping(value = "paper_synthesis_edit", method = RequestMethod.GET)
	public String paperSynthesisEdit(HttpServletRequest request, String quesId,
			Model model) {
		ExamQuestions question = examPaperService.getQuestionById(quesId);
		// 加载根节点名称------------------------------start
		ExamSubjectStruct struct = subjectService.getRootName(question.getSubjectStructId());
		if (struct != null) {
			if (struct.getSubject_struct_name().indexOf("书写") != -1) {
				model.addAttribute("listenstyle", "none");
				model.addAttribute("readstyle", "none");
				model.addAttribute("writestyle", "block");
			} else if (struct.getSubject_struct_name().indexOf("阅读") != -1) {
				model.addAttribute("listenstyle", "none");
				model.addAttribute("readstyle", "none");
				model.addAttribute("writestyle", "none");
			} else {
				model.addAttribute("listenstyle", "block");
				model.addAttribute("readstyle", "none");
				model.addAttribute("writestyle", "none");
			}
		}
		// -------------------------------------------end
		if (question.getQuesListenUrl() != null) {
			String quesListenUrl_1 = question.getQuesListenUrl().substring(0,
					question.getQuesListenUrl().lastIndexOf("/") + 1);
			String quesListenUrl_2 = question.getQuesListenUrl().substring(
					question.getQuesListenUrl().lastIndexOf("/") + 1,
					question.getQuesListenUrl().length());
			model.addAttribute("listenUrl", quesListenUrl_1);
			model.addAttribute("listenName", quesListenUrl_2);
		} else {
			String filePath = request.getSession().getServletContext()
					.getRealPath("/WEB-INF/config/uploadFile.properties");
			String remoteHost = CommUtil.readValue(filePath, "remoteHost");
			// String mappingDevice = CommUtil.readValue(filePath,
			// "mappingDevice");
			model.addAttribute("listenUrl", remoteHost + question.getPaperId()
					+ "/");
			model.addAttribute("listenName", "");
		}
		
		model.addAttribute("ques", question);
		return "exam/paper/paper_editsynthesis";
	}

	/**
	 * 修改综合题---保存
	 * 
	 * @param ques
	 * @param model
	 */
	@RequestMapping(value = "update_questions", method = RequestMethod.POST)
	public void updateQuestions(HttpServletRequest request,
			ExamQuestions quesion, Model model) {
		String quesListenUrl = request.getParameter("quesListenUrl_1")
				+ request.getParameter("quesListenUrl_2");
		quesion.setQuesListenUrl(quesListenUrl);
		examPaperService.updateQuestion(quesion);
	}

	/**
	 * 保存试题选项
	 * 
	 * @param options
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "save_options", method = RequestMethod.POST)
	public void saveOptions(ExamOptions options, Model model) {
		options.setOptId(CommUtil.getNewID());
		examPaperService.saveOptions(options);
	}

	/**
	 * 删除试题选项
	 * 
	 * @param opt_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "del_option", method = RequestMethod.POST)
	@ResponseBody
	public String deleteOption(String opt_id, Model model) {
		examPaperService.deleteOption(opt_id);
		return "success";
	}

	/**
	 * 删除试题
	 * 
	 * @param ques_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "del_question", method = RequestMethod.POST)
	@ResponseBody
	public String deleteQuestion(String ques_id, Model model) {
		List<ExamQuestions> quesList = examPaperService
				.getQuestionByParentId(ques_id);
		List<ExamOptions> optionList = examPaperService
				.getOptionsByQuesId(ques_id);
		if (quesList.size() > 0 || optionList.size() > 0) {
			return "error";
		} else {
			examPaperService.deleteByQuesId(ques_id);
			return "success";
		}

	}

	/**
	 * 发布试卷
	 * 
	 * @param publish
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "save_paper_publish", method = RequestMethod.POST)
	public ModelAndView savePaperPublish(ExamPaperPublish publish, Model model) {
		String id = CommUtil.getNewID();
		publish.setPublishId(id);
		publish.setPublishTime(new Date());
		publish.setPublishType("01");
		examPaperService.saveExamPublish(publish);
		return new ModelAndView("redirect:show_publish.action");
	}

	/**
	 * 删除试卷
	 * 
	 * @param paper_id
	 * @return
	 */
	@RequestMapping(value = "del_paper", method = RequestMethod.POST)
	@ResponseBody
	public String deletePaper(String paper_id) {
		List<ExamPaperPublish> publishList = examPaperService
				.getPaperListByPaperId(paper_id);
		if (publishList.size() > 0) {
			return "error";
		} else {
			examPaperService.deletePaper(paper_id);
			return "success";
		}

	}

	/**
	 * 试卷发布初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "show_publish", method = RequestMethod.GET)
	public String publishShow(Model model, Page page) {
		List<ExamPaperPublish> publishList = examPaperService
				.findListPageAll(page);
		model.addAttribute("publish", publishList);
		model.addAttribute("page", page);
		model.addAttribute("RowCount", publishList.size());
		return "exam/paper/paperpublish_list";
	}
	/**
	 * 修改发布
	 * @return
	 */
	@RequestMapping(value="publish_edit",method=RequestMethod.GET)
	public String publishEdit(String publishId,Model model){
		ExamPaperPublish publish = examPaperService.loadPublishById(publishId);
		model.addAttribute("publishId", publishId);
		model.addAttribute("publish", publish);
		return "exam/paper/edit_paper_publish";
	}
	@RequestMapping(value="update_paper_publish",method=RequestMethod.POST)
	@ResponseBody
	public String updatePaperPublish(HttpServletRequest request,ExamPaperPublish publish,Model model){
		try {
			String publishHaveParse = request.getParameter("publishHaveParse_u");
			String publishHaveRead = request.getParameter("publishHaveRead_u");
			publish.setPublishHaveParse(publishHaveParse);
			publish.setPublishHaveRead(publishHaveRead);
			
			examPaperService.updatePublish(publish);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}

	/**
	 * 批量添加选项
	 */
	@RequestMapping(value = "save_OptBat", method = RequestMethod.POST)
	@ResponseBody
	public String saveOptBat(String op, String paper_id, String struct_id) {
		Map<String, String> map = new HashMap<String, String>();
		String optvalues = op.substring(0, op.lastIndexOf(","));
		System.out.println(optvalues);
		map.put("paperId", paper_id);
		map.put("structId", struct_id);
		map.put("quesType1", "02");
		map.put("quesType2", "03");
		map.put("drySign", "01");
		List<ExamQuestions> list = examPaperService.getIdForBatData(map);
		for (ExamQuestions questions : list) {
			System.out.println(op + "----" + questions.getQuesId());
			String[] title = op.substring(0, op.length()-1).split(",");
			for(int i=0;i<title.length;i++){
				ExamOptions options = new ExamOptions();
				options.setOptId(CommUtil.getNewID());
				options.setOptPaperId(paper_id);
				options.setOptSeqNum(title[i]);
				options.setOptStructId(struct_id);
				options.setQuesId(questions.getQuesId());
				examPaperService.saveOptions(options);
			}
		}
		//String url="id="+struct_id+"&level=3&paper_id="+paper_id;
		return "success";
	}
	/**
	 * 生成xml
	 * @param paper_id
	 * @param modle
	 * @return
	 */
	@RequestMapping(value="paper_xml",method=RequestMethod.POST)
	@ResponseBody
	public String paperXml(HttpServletRequest request,String paper_id,Model modle){
		try {
			 String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/config/uploadFile.properties");
			 String remoteHost = CommUtil.readValue(filePath, "remoteHost");
			 String mappingDevice = CommUtil.readValue(filePath, "mappingDevice");
			 
			
			ExamPaper paper = examPaperService.findEPById(paper_id);
			List<ExamSubjectStruct> xmlList = new ArrayList<ExamSubjectStruct>();
			subjectService.getXmlPaper(xmlList, paper.getSubject().getSubject_id(), 0);
			//生成xml
			subjectService.createDocument(paper, xmlList,mappingDevice);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
		
		return "success";
		
	}
}
