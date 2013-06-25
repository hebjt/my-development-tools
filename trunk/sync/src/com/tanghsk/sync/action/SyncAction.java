package com.tanghsk.sync.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tanghsk.sync.domain.EpExamPaperStrut;
import com.tanghsk.sync.domain.ViewPaperStruct;
import com.tanghsk.sync.service.SyncService;

@Controller
@RequestMapping("/generate/**")
public class SyncAction {
	@Autowired
	private SyncService syncService;

	@SuppressWarnings("unused")
	@RequestMapping(value="struct_list",method=RequestMethod.POST)
	@ResponseBody
	public String structList(String paper_id,Model model) throws Exception{
		EpExamPaperStrut struct = new EpExamPaperStrut();
		struct.setPaperId(paper_id);
		//加载一套试卷的所有科目结构
		List<EpExamPaperStrut> list = syncService.getAllStrucByPaperId(struct);
		//把EpExamPaperStrut封装成ViewPaperStruct
		ViewPaperStruct view = syncService.getStructNode(list);
		String mapping= System.getProperty("sync.root");
		//创建xml
		syncService.createDocument(paper_id, view, mapping);
		return "success";
		
		
	}
}
