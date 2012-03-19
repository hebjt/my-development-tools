package com.tanghsk.mock.admin.exam.action;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tanghsk.mock.admin.exam.domain.ExamPaper;
import com.tanghsk.mock.admin.exam.domain.ExamQuestionParse;
import com.tanghsk.mock.admin.exam.domain.ExamQuestions;
import com.tanghsk.mock.admin.exam.domain.ExamSubjectStruct;
import com.tanghsk.mock.admin.exam.service.ExamPaperService;
import com.tanghsk.mock.admin.exam.service.ExamSubjectService;
import com.tanghsk.util.CommUtil;
import com.tanghsk.util.MyIntEditor;
import com.tanghsk.util.Page;
@Controller
@RequestMapping("/parse/*")
public class ExamParseAction {
	private static final String DEFAULT_DATE = "yyyyMMddHHmmss";
	@Autowired
	private ExamPaperService examPaperService;
	@Autowired
	private ExamSubjectService subjectService;

	@RequestMapping(value = "parseList", method = RequestMethod.GET)
	public String fingAllPaper(Model model, Page page) {
		List<ExamPaper> paper_list = examPaperService.fingAllPaper(page);
		model.addAttribute("page", page);
		model.addAttribute("paperList", paper_list);
		model.addAttribute("RowCount", paper_list.size());
		return "exam/parse/paper_list";
	}
	
	@RequestMapping(value = "parse_index", method = RequestMethod.GET)
	public String questionsIndex(String subject_id, String paper_id, Model model) {
		model.addAttribute("subjectId", subject_id);
		model.addAttribute("paperId", paper_id);
		return "exam/parse/parse_idx";
	}
	
	/**
	 * 试题列表左侧树
	 * 
	 * @param paper_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "parse_left", method = RequestMethod.GET)
	public String questionsLeft(String subject_id, String paper_id, Model model) {
		List<ExamSubjectStruct> treeNodes = subjectService
				.getAllStructDataBySubject(subject_id);
		model.addAttribute("treeNodes", treeNodes);
		model.addAttribute("paperId", paper_id);
		return "exam/parse/parse_left";
	}

	@RequestMapping(value = "parse_main", method = RequestMethod.GET)
	public String questionsMain(String id, String level, String paper_id,
			Model model) {
		String subjectStructId = id;
		ExamQuestions ques = new ExamQuestions();
		ques.setPaperId(paper_id);
		ques.setSubjectStructId(subjectStructId);
		List<ExamQuestions> parseList = examPaperService.getQuestionParse(ques);
		model.addAttribute("treeNode", parseList);
		model.addAttribute("structId", subjectStructId);
		model.addAttribute("level", level);
		model.addAttribute("paperId", paper_id);
		return "exam/parse/parse_list";
	}
	@RequestMapping(value="parse_add",method=RequestMethod.GET)
	public String parseAdd(ExamQuestionParse parse,Model model){
		
		model.addAttribute("parse", parse);
		return "exam/parse/add_parse";
	}
	/**
	 * 保存解析--视频解析
	 * @param parse
	 * @param model
	 * @return
	 */
	@RequestMapping(value="saveVideo_parse",method=RequestMethod.POST)
	public void saveParse(MultipartHttpServletRequest request,HttpServletResponse response,ExamQuestionParse parse,Model model) throws Exception{		
		//ExamQuestionParse examParse = new ExamQuestionParse();
		//MultipartHttpServletRequest request = (MultipartHttpServletRequest)res;
		String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/config/uploadFile.properties");
		String remoteHost = CommUtil.readValue(filePath, "remoteHost");
		String mappingDevice = CommUtil.readValue(filePath, "mappingDevice");
		String path = mappingDevice + parse.getPaperId()+"/parse/"+parse.getQuesId();
		//String c = request.getParameter("txt");
		try {
			File file = new File(path);
			if (!file.exists()) {
				file.mkdirs();
			}
			List<MultipartFile> files = request.getFiles("parseFile_muli");
			for (int i = 0; i < files.size(); i++) {
				if (!files.get(i).isEmpty()) {
					// System.out.println(files.get(i).getOriginalFilename());
					String autoName = buildFileBySysTime();
					byte[] bytes = files.get(i).getBytes();
					FileOutputStream fos = new FileOutputStream(path + "/"+ autoName+files.get(i).getOriginalFilename()); // 写入文件
					parse.setParseFile(remoteHost + parse.getPaperId() + "/parse/"+parse.getQuesId()+"/"+ autoName+files.get(i).getOriginalFilename());
					fos.write(bytes);
					fos.close();
				}
			}
			//examParse.setPaperId(parse.getPaperId());
			//examParse.setParseContent(parse.getParseContent());
			parse.setParseId(CommUtil.getNewID());
			examPaperService.saveParse(parse);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		PrintWriter write = response.getWriter();
		write.write("<script>window.close();opener.reQuery();</script>");

	}
	/**
	 * 保存解析--文字解析
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="saveTxt_parse",method=RequestMethod.POST)
	@ResponseBody
	public String saveTxtParse(HttpServletRequest request,Model model){
		//quesId_txt
		String quesId = request.getParameter("quesId_txt");
		String paperId = request.getParameter("paperId_txt");
		String structId = request.getParameter("structId_txt");
		String parseType = request.getParameter("parseType_txt");
		String parseContent = request.getParameter("parseContent_txt");
		String parseState = request.getParameter("parseState_txt");
		
		ExamQuestionParse parse = new ExamQuestionParse();
		parse.setPaperId(paperId);
		parse.setStructId(structId);
		parse.setParseContent(parseContent);
		parse.setParseState(parseState);
		parse.setParseType(parseType);
		parse.setQuesId(quesId);
		parse.setParseId(CommUtil.getNewID());
		examPaperService.saveParse(parse);
		return "success";
	}
	/**
	 * 查看解析详细内容--文字
	 */
	@RequestMapping(value="parse_detail",method=RequestMethod.GET)
	public String parseDetail(String parseId,Model model){
		ExamQuestionParse p = examPaperService.getParseById(parseId);
		model.addAttribute("parse", p);
		return "exam/parse/parse_detail";
	}
	/**
	 * 查看解析详细内容--视频
	 * @param parseId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="parse_video",method=RequestMethod.GET)
	public String parseVideo(HttpServletRequest request,String parseId,Model model){
		String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/config/uploadFile.properties");
		String remoteHost = CommUtil.readValue(filePath, "remoteHost");
		//String mappingDevice = CommUtil.readValue(filePath, "mappingDevice");
		
		ExamQuestionParse p = examPaperService.getParseById(parseId);
		String video = p.getParseFile().replace(remoteHost, "");
		String play = "/papers/"+video;
		model.addAttribute("play", play);
		return "exam/parse/parse_video";
	}
	/**
	 *  删除解析
	 * @param parseId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="del_parse",method=RequestMethod.POST)
	@ResponseBody
	public String deleteParse(String parseId,Model model){
		
		try {
			examPaperService.deleteParse(parseId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	/**
	 * 根据当前的时间建立文件夹，时间格式yyyyMMdd
	 * 
	 * @param path
	 * @return
	 */
	private String buildFileBySysTime() {
		DateFormat df = new SimpleDateFormat(DEFAULT_DATE);
		String fileName = df.format(new Date());
		return fileName;
	}
	/**
	 * int类型为null时的转换
	 * @param request
	 * @param binder
	 * @throws Exception
	 */
	@InitBinder
	protected void initBinder(HttpServletRequest request,ServletRequestDataBinder binder) throws Exception {
		 
		binder.registerCustomEditor(int.class,new MyIntEditor()); 
		
	}
}
