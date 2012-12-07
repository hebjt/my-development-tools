package com.tanghsk.sync.service;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tanghsk.sync.domain.ElQuestionsOptions;
import com.tanghsk.sync.domain.EpExamPaper;
import com.tanghsk.sync.domain.EpExamPaperStrut;
import com.tanghsk.sync.domain.ViewPaperStruct;
import com.tanghsk.sync.domain.ViewQuestionList;
import com.tanghsk.sync.mapper.ElQuestionsOptionsMapper;
import com.tanghsk.sync.mapper.EpExamPaperMapper;
import com.tanghsk.sync.mapper.EpExamPaperStrutMapper;
import com.tanghsk.sync.mapper.ViewQuestionListMapper;

@Service("syncService")
public class SyncService {
	@Autowired
	private EpExamPaperStrutMapper epExamPaperStrutMapper;
	@Autowired
	private EpExamPaperMapper epExamPaperMapper;
	@Autowired
	private ViewQuestionListMapper viewQuestionMapper;
	@Autowired
	private ElQuestionsOptionsMapper optionMapper;

	public List<EpExamPaperStrut> getAllStrucByPaperId(EpExamPaperStrut struct) {
		return epExamPaperStrutMapper.getAllStrucByPaperId(struct);
	}

	public ViewPaperStruct getStructNode(List<EpExamPaperStrut> list) {

		return this.recursivePaperStruct(list);
	}

	/**
	 * 查找综合体子试题的选项
	 * 
	 * @param quesId
	 * @return
	 */
	public List<ElQuestionsOptions> getOptionByQuesId(String quesId) {
		return optionMapper.selectByQueId(quesId);
	}

	/**
	 * 
	 * @param paper_id
	 *            试卷id
	 * @param view
	 *            封装的科目结构对象。
	 * @param mapping
	 *            路径
	 * @throws Exception
	 */
	public void createDocument(String paper_id, ViewPaperStruct view, String mapping) throws Exception {
		EpExamPaper paper = epExamPaperMapper.selectByPrimaryKey(paper_id);
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("paper").addAttribute("id", paper_id);

		Element listen = null;
		Element read = null;
		Element write = null;

		Element paperName = root.addElement("name").addText(paper.getPaperName() + "");
		Element subject = root.addElement("subject").addText(paper.getSubjectId() + "");
		Element time = root.addElement("time").addText(paper.getExamTime() + "");
		Element count = root.addElement("count").addText(paper.getTestNum() + "");

		List<ViewPaperStruct> partList = view.getChildList();
		for (ViewPaperStruct vs : partList) {
			// 听力
			if (vs.getStrucName().indexOf("听力") > -1) {
				listen = root.addElement("listen").addAttribute("id", vs.getId());
				Element struct_name = listen.addElement("name").addText(vs.getStrucName() + "");
				for (ViewPaperStruct subvs : vs.getChildList()) {
					Element part = listen.addElement("part").addAttribute("id", subvs.getId());
					Element part_name = part.addElement("name").addText(subvs.getStrucName() + "");
					for (ViewPaperStruct leafvs : subvs.getChildList()) {
						Element subpart = part.addElement("subpart").addAttribute("id", leafvs.getId());
						Element sub_name = subpart.addElement("name").addText(leafvs.getStrucName() + "");
						Element questions = subpart.addElement("questions");
						ViewQuestionList o = new ViewQuestionList();
						o.setStructId(leafvs.getId());
						o.setPaperId(paper_id);
						// 加载某个试卷、某个科目结构下的所有试题
						this.subGenerate(o, questions);

					}
				}
			}
			// 阅读
			if (vs.getStrucName().indexOf("阅读") > -1) {
				read = root.addElement("read").addAttribute("id", vs.getId());
				Element struct_name = read.addElement("name").addText(vs.getStrucName() + "");
				for (ViewPaperStruct subvs : vs.getChildList()) {
					Element part = read.addElement("part").addAttribute("id", subvs.getId() + "");
					Element part_name = part.addElement("name").addText(subvs.getStrucName() + "");
					for (ViewPaperStruct leafvs : subvs.getChildList()) {
						Element subpart = part.addElement("subpart").addAttribute("id", leafvs.getId());
						Element sub_name = subpart.addElement("name").addText(leafvs.getStrucName() + "");
						Element questions = subpart.addElement("questions");
						ViewQuestionList o = new ViewQuestionList();
						o.setStructId(leafvs.getId());
						o.setPaperId(paper_id);
						this.subGenerate(o, questions);
					}
				}
			}
			// 书写
			if (vs.getStrucName().indexOf("书写") > -1) {
				write = root.addElement("write").addAttribute("id", vs.getId());
				Element struct_name = write.addElement("name").addText(vs.getStrucName() + "");
				for (ViewPaperStruct subvs : vs.getChildList()) {
					Element part = write.addElement("part").addAttribute("id", subvs.getId() + "");
					Element part_name = part.addElement("name").addText(subvs.getStrucName() + "");
					for (ViewPaperStruct leafvs : subvs.getChildList()) {
						Element subpart = part.addElement("subpart").addAttribute("id", leafvs.getId());
						Element sub_name = subpart.addElement("name").addText(leafvs.getStrucName() + "");
						Element questions = subpart.addElement("questions");
						ViewQuestionList o = new ViewQuestionList();
						o.setStructId(leafvs.getId());
						o.setPaperId(paper_id);
						this.subGenerate(o, questions);
					}
				}
			}
		}

		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setIndentSize(2);
		format.setNewlines(true);
		format.setTrimText(false);
		format.setPadText(true);
		// format.setEncoding("UTF-8");
		format.setEncoding("UTF-8");
		XMLWriter xmlwriter = new XMLWriter(new FileOutputStream(mapping + paper_id + ".xml"), format);
		xmlwriter.write(document);
		xmlwriter.close();

	}

	/**
	 * 根据试卷id和科目结构id加载所有的试题及选项（不包含综合子试题的选项）
	 * 
	 * @param o
	 * @param questions
	 */
	private void subGenerate(ViewQuestionList o, Element questions) {
		ViewQuestionList viewQuestionNode = this.getViewQuestionsList(o);
		for (ViewQuestionList quesView : viewQuestionNode.getChildList()) {
			Element ques = questions.addElement("ques").addAttribute("id", quesView.getId());
			Element quesName = ques.addElement("name").addText(quesView.getSeqNum());
			Element quesContent = ques.addElement("content").addText(quesView.getContent() + "");
			Element quesType = ques.addElement("type").addText(quesView.getTestType() + "");
			Element example = ques.addElement("examplesign").addText(quesView.getExampleSign() + "");
			Element options = ques.addElement("options");
			if (quesView.getTestType().trim().equals("01")) {
				for (ViewQuestionList quesView_1 : quesView.getChildList()) {
					Element subques = options.addElement("subques").addAttribute("id", quesView_1.getId());
					Element subName = subques.addElement("name").addText(quesView_1.getSeqNum() + "");
					Element subContent = subques.addElement("content").addText(quesView_1.getContent() + "");
					Element subExample = subques.addElement("examplesign").addText(quesView_1.getExampleSign() + "");
					List<ElQuestionsOptions> optionList = this.getOptionByQuesId(quesView_1.getId());
					for (ElQuestionsOptions el : optionList) {
						Element option = subques.addElement("option").addAttribute("id", el.getId());
						Element optionName = option.addElement("name").addText(el.getSeqNum() + "");
						Element optionContent = option.addElement("content").addText(el.getContent() + "");
					}

					/*
					 * for(ViewQuestionList quesView_2 :
					 * quesView_1.getChildList()){//综合体子试题的选项 Element option =
					 * subques.addElement("option").addAttribute("id",
					 * quesView_2.getId()); Element optionName =
					 * option.addElement
					 * ("name").addText(quesView_2.getSeqNum()+""); Element
					 * optionContent =
					 * option.addElement("content").addText(quesView_2
					 * .getContent()+""); }
					 */
				}
			} else {
				for (ViewQuestionList quesView_1 : quesView.getChildList()) {
					Element opt = options.addElement("opt").addAttribute("id", quesView_1.getId());
					Element optName = opt.addElement("name").addText(quesView_1.getSeqNum() + "");
					Element optContent = opt.addElement("content").addText(quesView_1.getContent() + "");
				}
			}
		}
	}

	/**
	 * 科目结构 递归
	 * 
	 * @param structList
	 * @return
	 */
	private ViewPaperStruct recursivePaperStruct(List<EpExamPaperStrut> structList) {
		ViewPaperStruct rootNode = new ViewPaperStruct();
		rootNode.setId("null");
		rootNode.setLevel(0);
		rootNode.setLeaf(false);
		rootNode = this.constructTree(rootNode, structList, 0);
		return rootNode;
	}

	private ViewPaperStruct constructTree(ViewPaperStruct rootNode, List<EpExamPaperStrut> structList, int level) {
		List<ViewPaperStruct> childNodeList = new ArrayList<ViewPaperStruct>();
		// 构造根节点
		for (int i = 0; i < structList.size(); i++) {
			EpExamPaperStrut stru = structList.get(i);
			if (stru.getParentId().equals(rootNode.getId()) || stru.getParentId().equals(rootNode.getStrucId())) {
				ViewPaperStruct childNode = new ViewPaperStruct();
				// copy Organization to OrganizationTreeNode
				// System.out.println(org.getId());
				childNode.setId(stru.getId());
				childNode.setSeqNum(stru.getSeqNum());
				childNode.setContent(stru.getContent());
				childNode.setPaperId(stru.getPaperId());
				childNode.setParentId(stru.getParentId());
				childNode.setStrucId(stru.getStrucId());
				childNode.setStrucName(stru.getStrucName());
				childNode.setParentNode(rootNode);

				// 设置深度
				childNode.setLevel(level + 1);
				childNodeList.add(childNode);
			}
		}
		// 设置子节点
		rootNode.setChildList(childNodeList);
		// 设置是否叶子节点
		if (childNodeList.size() == 0) {
			rootNode.setLeaf(true);
		} else {
			rootNode.setLeaf(false);
		}
		// 递归构造子节点
		for (int j = 0; j < childNodeList.size(); j++) {
			// 进入子节点构造时深度+1
			constructTree(childNodeList.get(j), structList, ++level);
			// 递归调用返回时，构造子节点的兄弟节点，深度要和该子节点深度一样，因为之前加1，所以要减1
			--level;
		}
		return rootNode;
	}

	/**
	 * 试题结构递归 构造试题树形结构
	 * 
	 * @param quesId
	 * @return
	 */
	private ViewQuestionList getViewQuestionsList(ViewQuestionList view) {
		List<ViewQuestionList> quesList = viewQuestionMapper.getAllQuestion(view);
		ViewQuestionList rootNode = new ViewQuestionList();
		rootNode.setId("null");
		rootNode.setLevel(0);
		rootNode.setLeaf(false);
		if (quesList.size() > 0) {
			rootNode = this.constructTree(rootNode, quesList, 0);
		}
		return rootNode;
	}

	/**
	 * 递归构造
	 * 
	 * @param rootNode
	 * @param orgList
	 * @param rootLevel
	 * @return
	 */

	private ViewQuestionList constructTree(ViewQuestionList rootNode, List<ViewQuestionList> quesList, int rootLevel) {
		List<ViewQuestionList> childNodeList = new ArrayList<ViewQuestionList>();
		// 构造根节点
		for (int i = 0; i < quesList.size(); i++) {
			ViewQuestionList ques = quesList.get(i);
			if (ques.getParentId().equals(rootNode.getId())) {
				ViewQuestionList childNode = new ViewQuestionList();
				// copy Organization to OrganizationTreeNode
				// System.out.println(org.getId());
				childNode.setId(ques.getId());
				childNode.setPaperId(ques.getPaperId());
				childNode.setContent(ques.getContent());
				childNode.setExampleSign(ques.getExampleSign());
				childNode.setParentId(ques.getParentId());
				childNode.setSeqNum(ques.getSeqNum());
				childNode.setStrucName(ques.getStrucName());
				childNode.setStructId(ques.getStructId());
				childNode.setSubjectId(ques.getSubjectId());
				childNode.setTestType(ques.getTestType());
				childNode.setParentNode(rootNode);

				// 设置深度
				childNode.setLevel(rootLevel + 1);
				childNodeList.add(childNode);
			}
		}
		// 设置子节点
		rootNode.setChildList(childNodeList);
		// 设置是否叶子节点
		if (childNodeList.size() == 0) {
			rootNode.setLeaf(true);
		} else {
			rootNode.setLeaf(false);
		}
		// 递归构造子节点
		for (int j = 0; j < childNodeList.size(); j++) {
			// 进入子节点构造时深度+1
			constructTree(childNodeList.get(j), quesList, ++rootLevel);
			// 递归调用返回时，构造子节点的兄弟节点，深度要和该子节点深度一样，因为之前加1，所以要减1
			--rootLevel;
		}
		return rootNode;
	}

}
