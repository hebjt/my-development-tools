package com.tanghsk.mock.admin.exam.service;

import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tanghsk.mock.admin.exam.domain.ExamPaper;
import com.tanghsk.mock.admin.exam.domain.ExamQuestions;
import com.tanghsk.mock.admin.exam.domain.ExamQuestionsTreeNode;
import com.tanghsk.mock.admin.exam.domain.ExamSubject;
import com.tanghsk.mock.admin.exam.domain.ExamSubjectLevel;
import com.tanghsk.mock.admin.exam.domain.ExamSubjectStruct;
import com.tanghsk.mock.admin.exam.mapper.ExamQuestionsMapper;
import com.tanghsk.mock.admin.exam.mapper.ExamSubjectLevelMapper;
import com.tanghsk.mock.admin.exam.mapper.ExamSubjectMapper;
import com.tanghsk.mock.admin.exam.mapper.ExamSubjectStructMapper;
import com.tanghsk.util.MyException;
import com.tanghsk.util.Page;

@Service("subjectService")
public class ExamSubjectService {
	@Autowired
	private ExamSubjectMapper subjectMapper;
	@Autowired
	private ExamSubjectStructMapper subStruMapper;
	@Autowired
	private ExamQuestionsMapper questionMapper;
	@Autowired
	private ExamSubjectLevelMapper levelMapper;

	public List<ExamSubject> findAll(Page page) {
		List<ExamSubject> subList = subjectMapper.getListPageSubject(page);
		return subList;
	}
	
	public List<ExamSubjectLevel> getListPage(Page page){
		return levelMapper.getListPage(page);
	}
	/**
	 * 加载科目级别对象
	 * @param subjectLevelId
	 * @return
	 */
	public ExamSubjectLevel getLevleById(String subjectLevelId){
		return levelMapper.getLevleById(subjectLevelId);
	}

	public void addSubject(ExamSubject subject) throws MyException {
		subjectMapper.addSubject(subject);
	}

	public ExamSubject findSubjectById(ExamSubject subject) {
		return subjectMapper.findSubjectById(subject);
	}

	public void delSubject(ExamSubject subject) throws MyException {
		// ExamSubject s = new ExamSubject();
		subjectMapper.delSubject(subject);
	}

	public void updateSubject(ExamSubject subject) {
		subjectMapper.updateSubject(subject);
	}

	public void addSubStruct(ExamSubjectStruct struct) {
		subStruMapper.addSubStru(struct);
	}

	public List<ExamSubjectStruct> findStruBySubID(String subjectId) {
		return subStruMapper.getStruBySubID(subjectId);
	}

	public List<ExamSubjectStruct> getAllStructDataBySubject(String subject_id) {
		return subStruMapper.getAllStructDataBySubject(subject_id);
	}

	public ExamSubjectStruct getObjectById(String struct_id) {
		return subStruMapper.getObjectById(struct_id);
	}

	public void updateSubStru(ExamSubjectStruct struct) {
		subStruMapper.updateSubStru(struct);
	}

	public List<ExamSubjectStruct> getChildList(String struct_id) {
		return subStruMapper.getChildList(struct_id);
	}

	public void delStruct(String struct_id) {
		subStruMapper.delStruct(struct_id);
	}

	/**
	 * 获得根节点名
	 * 
	 * @param struct_id
	 * @return
	 */
	public ExamSubjectStruct getRootName(String struct_id) {
		return subStruMapper.getRootNameByid(struct_id);
	}

	/**
	 * 获得科目类别下的所有数据
	 * 
	 * @param subject_id
	 * @return
	 */
	public void getXmlPaper(List<ExamSubjectStruct> xmlList, String parentId,
			int level) {
		// xmlList=科目类别为parentId的数据
		ExamSubjectStruct struct = null;

		List<ExamSubjectStruct> structlist = null;
		try {
			if (level == 0) {
				ExamSubjectStruct bean = new ExamSubjectStruct();
				bean.setSubject_id(parentId);
				// bean.setSubject_struct_level(1);
				structlist = subStruMapper.getXmlPaper(bean);// 每次查询出上级为的分类
			} else {
				ExamSubjectStruct bean = new ExamSubjectStruct();
				bean.setSubject_struct_parent_id(parentId);
				structlist = subStruMapper.getXmlPaper(bean);// 每次查询出上级为的分类
			}

			// System.out.println("**************************"+structlist.size());
			if (structlist.size() > 0) {
				for (int i = 0; i < structlist.size(); i++) {
					// System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
					struct = (ExamSubjectStruct) structlist.get(i);
					struct.setSubject_struct_level(level + 1); // 添加等级字段
					xmlList.add(struct);
					getXmlPaper(xmlList, struct.getSubject_struct_id(),level + 1); // 递归查询
				}
			} else {
				// System.out.println("-----------------------------------");
				level--;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 创建xml
	 * 
	 * @param xmlList
	 * @return
	 */
	@SuppressWarnings("unused")
	public void createDocument(ExamPaper paper, List<ExamSubjectStruct> xmlList,String mapping)
			throws Exception {
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("paper").addAttribute("id",paper.getPaperId());
		Element totalcount = root.addElement("totalcount").addText(paper.getPaperQuestionNum() + "");
		Element totaltime = root.addElement("totaltime").addText(paper.getPaperExamTime() + "");
		// level 1
		String listenid = "";
		String readid = "";
		String writeid = "";

		Element listen = null;
		Element read = null;
		Element write = null;
		// level 2
		String part_listenid = "";
		String part_readid = "";
		String part_writeid = "";
		Element listen_part = null;
		Element read_part = null;
		Element write_part = null;
		// level 3
		String subpart_listenid = "";
		String subpart_readid = "";
		String subpart_writeid = "";
		Element listen_subpart = null;
		Element read_subpart = null;
		Element write_subpart = null;

		for (ExamSubjectStruct struct : xmlList) {
			// level 1
			if (struct.getSubject_struct_name().indexOf("听力") != -1&& struct.getSubject_struct_level() == 1) {
				listenid = struct.getSubject_struct_id();
				listen = root.addElement("listen").addAttribute("id",struct.getSubject_struct_id());
				// 部分
			} else if (struct.getSubject_struct_name().indexOf("阅读") != -1&& struct.getSubject_struct_level() == 1) {
				readid = struct.getSubject_struct_id();
				read = root.addElement("read").addAttribute("id",struct.getSubject_struct_id());
			} else if (struct.getSubject_struct_name().indexOf("书写") != -1&& struct.getSubject_struct_level() == 1) {
				writeid = struct.getSubject_struct_id();
				write = root.addElement("write").addAttribute("id",struct.getSubject_struct_id());
			}
			// level 2 听力
			if (struct.getSubject_struct_level() == 2&& listenid.equals(struct.getSubject_struct_parent_id())) {
				System.out.println("***********************LL");
				part_listenid = struct.getSubject_struct_id();
				listen_part = listen.addElement("part").addAttribute("id",struct.getSubject_struct_id());
				Element name = listen_part.addElement("name").addText(struct.getSubject_struct_name());
				Element partcount = listen_part.addElement("partcount").addText(struct.getSubject_struct_question_num() + "");

			}
			// leve 2 阅读
			if (struct.getSubject_struct_level() == 2&& readid.equals(struct.getSubject_struct_parent_id())) {
				System.out.println("***********************2RR");
				part_readid = struct.getSubject_struct_id();
				read_part = read.addElement("part").addAttribute("id",struct.getSubject_struct_id());
				Element name = read_part.addElement("name").addText(struct.getSubject_struct_name());
				Element partcount = read_part.addElement("partcount").addText(struct.getSubject_struct_name());

			}
			// level 2 书写
			if (struct.getSubject_struct_level() == 2&& writeid.equals(struct.getSubject_struct_parent_id())) {
				System.out.println("***********************2WW");
				part_writeid = struct.getSubject_struct_id();
				write_part = write.addElement("part").addAttribute("id",struct.getSubject_struct_id());
				Element name = write_part.addElement("name").addText(struct.getSubject_struct_name());
				Element partcount = write_part.addElement("partcount").addText(struct.getSubject_struct_name());

			}
			// level 3 听力

			if (struct.getSubject_struct_level() == 3 && part_listenid.equals(struct.getSubject_struct_parent_id())) {
				subpart_listenid = struct.getSubject_struct_id();
				listen_subpart = listen_part.addElement("subpart").addAttribute("id", struct.getSubject_struct_id());
				Element subname = listen_subpart.addElement("subname").addText(struct.getSubject_struct_name());
				Element questions = listen_subpart.addElement("questions");
				Map<String, String> map = new HashMap<String, String>(2);
				map.put("subjectStructId", subpart_listenid);
				map.put("struct_id", subpart_listenid);
				// ----------------------------------------------------------------------------------------------------------------
				ExamQuestionsTreeNode treeNode = getQuestionsList(map);
				List<ExamQuestionsTreeNode> list = treeNode.getChilds();
				if (list.size() > 0) {
					for (ExamQuestionsTreeNode node : list) {
						Element question = questions.addElement("question").addAttribute("id", node.getQuesId());
						Element title = question.addElement("title").addText(node.getQuesNum() == null ? "" : node.getQuesNum());
						Element content = question.addElement("content").addText(node.getQuesContent() == null ? "": node.getQuesContent());
						Element audioUrl = question.addElement("audiourl").addText(node.getQuesListenUrl() == null ? "": node.getQuesListenUrl());
						Element questype = question.addElement("questype").addText(node.getQuesTypeId() == null ? "": node.getQuesTypeId());
						//拖拽
						Element quesdragsign = question.addElement("quesdragsign").addText(node.getQuesDragSign() == null ? "00": node.getQuesDragSign());
						//例题
						Element quesexamplesign = question.addElement("quesexamplesign").addText(node.getQuesExampleSign() == null ? "0": node.getQuesExampleSign());
						
						Element options = question.addElement("options");
						// 是否综合题
						if (node.getQuesTypeId().equals("01")) {
							List<ExamQuestionsTreeNode> child = node.getChilds();
							Element subquestion=null;
							if (child.size() > 0) {
								for (ExamQuestionsTreeNode ch : child) {
									subquestion = options.addElement("subquestion").addAttribute("id",ch.getQuesId());
									Element subtitle = subquestion.addElement("subtitle").addText(ch.getQuesNum() == null ? "": ch.getQuesNum());
									Element subcontent = subquestion.addElement("subcontent").addText(ch.getQuesContent() == null ? "" : ch.getQuesContent());
									List<ExamQuestionsTreeNode> optionList = ch.getChilds();
									if(optionList.size()>0){
										for (ExamQuestionsTreeNode op : optionList) {
											Element option = subquestion.addElement("option").addAttribute("id",op.getQuesId() == null ? "" : op.getQuesId());
											Element optionid = option.addElement("optionid").addText(op.getQuesNum() == null ? "" : op.getQuesNum());
											Element optionname = option.addElement("optionname").addText(op.getQuesContent() == null ? "": op.getQuesContent());
										}
									}									
								}
							}
						} else {
							List<ExamQuestionsTreeNode> child = node.getChilds();
							for (ExamQuestionsTreeNode op2 : child) {
								Element option = options.addElement("option").addAttribute("id", op2.getQuesId()==null?"":op2.getQuesId());
								Element optionid = option.addElement("optionid").addText(op2.getQuesNum()==null?"":op2.getQuesNum());
								Element optionname = option.addElement("optionname").addText(op2.getQuesContent()==null?"":op2.getQuesContent());
							}
						}
					}
				}
			}

			// level 3 阅读

			if (struct.getSubject_struct_level() == 3 && part_readid.equals(struct.getSubject_struct_parent_id())) {
				subpart_readid = struct.getSubject_struct_id();
				read_subpart = read_part.addElement("subpart").addAttribute("id", struct.getSubject_struct_id());
				Element subname = read_subpart.addElement("subname").addText(struct.getSubject_struct_name());
				Element questions = read_subpart.addElement("questions");
				Map<String, String> map = new HashMap<String, String>(2);
				map.put("subjectStructId", subpart_readid);
				map.put("struct_id", subpart_readid);
				// ----------------------------------------------------------------------------------------------------------------
				ExamQuestionsTreeNode treeNode = getQuestionsList(map);
				List<ExamQuestionsTreeNode> list = treeNode.getChilds();
				if (list.size() > 0) {
					for (ExamQuestionsTreeNode node : list) {
						Element question = questions.addElement("question").addAttribute("id", node.getQuesId());
						Element title = question.addElement("title").addText(node.getQuesNum() == null ? "" : node.getQuesNum());
						Element content = question.addElement("content").addText(node.getQuesContent() == null ? "": node.getQuesContent());
						//Element audioUrl = question.addElement("audiourl").addText(node.getQuesListenUrl() == null ? "": node.getQuesListenUrl());
						Element questype = question.addElement("questype").addText(node.getQuesTypeId() == null ? "": node.getQuesTypeId());
						//拖拽
						Element quesdragsign = question.addElement("quesdragsign").addText(node.getQuesDragSign() == null ? "00": node.getQuesDragSign());
						//例题
						Element quesexamplesign = question.addElement("quesexamplesign").addText(node.getQuesExampleSign() == null ? "0": node.getQuesExampleSign());
						Element options = question.addElement("options");
						// 是否综合题
						if (node.getQuesTypeId().equals("01")) {
							List<ExamQuestionsTreeNode> child = node.getChilds();
							Element subquestion=null;
							if (child.size() > 0) {
								for (ExamQuestionsTreeNode ch : child) {
									subquestion = options.addElement("subquestion").addAttribute("id",ch.getQuesId());
									Element subtitle = subquestion.addElement("subtitle").addText(ch.getQuesNum() == null ? "": ch.getQuesNum());
									Element subcontent = subquestion.addElement("subcontent").addText(ch.getQuesContent() == null ? "" : ch.getQuesContent());
									List<ExamQuestionsTreeNode> optionList = ch.getChilds();
									if(optionList.size()>0){
										for (ExamQuestionsTreeNode op : optionList) {
											Element option = subquestion.addElement("option").addAttribute("id",op.getQuesId() == null ? "" : op.getQuesId());
											Element optionid = option.addElement("optionid").addText(op.getQuesNum() == null ? "" : op.getQuesNum());
											Element optionname = option.addElement("optionname").addText(op.getQuesContent() == null ? "": op.getQuesContent());
										}
									}									
								}
							}
						} else {
							List<ExamQuestionsTreeNode> child = node.getChilds();
							for (ExamQuestionsTreeNode op2 : child) {
								Element option = options.addElement("option").addAttribute("id", op2.getQuesId()==null?"":op2.getQuesId());
								Element optionid = option.addElement("optionid").addText(op2.getQuesNum()==null?"":op2.getQuesNum());
								Element optionname = option.addElement("optionname").addText(op2.getQuesContent()==null?"":op2.getQuesContent());
							}
						}
					}
				}
			}
			// level 3 书写
			if (struct.getSubject_struct_level() == 3 && part_writeid.equals(struct.getSubject_struct_parent_id())) {
				subpart_writeid = struct.getSubject_struct_id();
				write_subpart = write_part.addElement("subpart").addAttribute("id", struct.getSubject_struct_id());
				Element subname = write_subpart.addElement("subname").addText(struct.getSubject_struct_name());
				Element questions = write_subpart.addElement("questions");
				Map<String, String> map = new HashMap<String, String>(2);
				map.put("subjectStructId", subpart_writeid);
				map.put("struct_id", subpart_writeid);
				// ----------------------------------------------------------------------------------------------------------------
				ExamQuestionsTreeNode treeNode = getQuestionsList(map);
				List<ExamQuestionsTreeNode> list = treeNode.getChilds();
				if (list.size() > 0) {
					for (ExamQuestionsTreeNode node : list) {
						Element question = questions.addElement("question").addAttribute("id", node.getQuesId());
						Element title = question.addElement("title").addText(node.getQuesNum() == null ? "" : node.getQuesNum());
						Element content = question.addElement("content").addText(node.getQuesContent() == null ? "": node.getQuesContent());
						//Element audioUrl = question.addElement("audiourl").addText(node.getQuesListenUrl() == null ? "": node.getQuesListenUrl());
						Element questype = question.addElement("questype").addText(node.getQuesTypeId() == null ? "": node.getQuesTypeId());
						//拖拽
						Element quesdragsign = question.addElement("quesdragsign").addText(node.getQuesDragSign() == null ? "00": node.getQuesDragSign());
						//例题
						Element quesexamplesign = question.addElement("quesexamplesign").addText(node.getQuesExampleSign() == null ? "0": node.getQuesExampleSign());
						Element options = question.addElement("options");
						// 是否综合题
						if (node.getQuesTypeId().equals("01")) {
							List<ExamQuestionsTreeNode> child = node.getChilds();
							Element subquestion=null;
							if (child.size() > 0) {
								for (ExamQuestionsTreeNode ch : child) {
									subquestion = options.addElement("subquestion").addAttribute("id",ch.getQuesId());
									Element subtitle = subquestion.addElement("subtitle").addText(ch.getQuesNum() == null ? "": ch.getQuesNum());
									Element subcontent = subquestion.addElement("subcontent").addText(ch.getQuesContent() == null ? "" : ch.getQuesContent());
									List<ExamQuestionsTreeNode> optionList = ch.getChilds();
									if(optionList.size()>0){
										for (ExamQuestionsTreeNode op : optionList) {
											Element option = subquestion.addElement("option").addAttribute("id",op.getQuesId() == null ? "" : op.getQuesId());
											Element optionid = option.addElement("optionid").addText(op.getQuesNum() == null ? "" : op.getQuesNum());
											Element optionname = option.addElement("optionname").addText(op.getQuesContent() == null ? "": op.getQuesContent());
										}
									}									
								}
							}
						} else {
							List<ExamQuestionsTreeNode> child = node.getChilds();
							for (ExamQuestionsTreeNode op2 : child) {
								Element option = options.addElement("option").addAttribute("id", op2.getQuesId()==null?"":op2.getQuesId());
								Element optionid = option.addElement("optionid").addText(op2.getQuesNum()==null?"":op2.getQuesNum());
								Element optionname = option.addElement("optionname").addText(op2.getQuesContent()==null?"":op2.getQuesContent());
							}
						}
					}
				}
			}
		}
		// String filePath =
		// request.getSession().getServletContext().getRealPath("/WEB-INF/config/uploadFile.properties");
		// String remoteHost = CommUtil.readValue(filePath, "remoteHost");
		// StringWriter writer = new StringWriter();
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setIndentSize(2);
		format.setNewlines(true);
		
		format.setTrimText(false);
		format.setPadText(true);
		//format.setEncoding("UTF-8");
		format.setEncoding("GBK");
		//System.out.println("*****************************************************************"+mapping);
		XMLWriter xmlwriter = new XMLWriter(new FileWriter(mapping+ paper.getPaperId() + "/output.xml"), format);
		xmlwriter.write(document);
		xmlwriter.close();

	}

	/**
	 * 构造试题树形结构
	 * 
	 * @param quesId
	 * @return
	 */
	public ExamQuestionsTreeNode getQuestionsList(Map<String, String> map) {
		List<ExamQuestions> quesList = questionMapper
				.getListObjectByStructId(map);
		ExamQuestionsTreeNode rootNode = new ExamQuestionsTreeNode();
		rootNode.setQuesId("root");
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

	public ExamQuestionsTreeNode constructTree(ExamQuestionsTreeNode rootNode,
			List<ExamQuestions> quesList, int rootLevel) {
		List<ExamQuestionsTreeNode> childNodeList = new ArrayList<ExamQuestionsTreeNode>();
		// 构造根节点
		for (int i = 0; i < quesList.size(); i++) {
			ExamQuestions ques = quesList.get(i);
			if (ques.getQuesParentId().equals(rootNode.getQuesId())) {
				ExamQuestionsTreeNode childNode = new ExamQuestionsTreeNode();
				// copy Organization to OrganizationTreeNode
				// System.out.println(org.getId());
				childNode.setQuesId(ques.getQuesId());
				childNode.setQuesParentId(ques.getQuesParentId());
				childNode.setQuesType(ques.getQuesType());
				childNode.setQuesTypeId(ques.getQuesTypeId());
				childNode.setQuesNum(ques.getQuesNum());
				childNode.setQuesContent(ques.getQuesContent());
				childNode.setQuesDrySign(ques.getQuesDrySign());
				childNode.setQuesListenUrl(ques.getQuesListenUrl());
				childNode.setQuesExampleSign(ques.getQuesExampleSign());
				childNode.setQuesDragSign(ques.getQuesDragSign());
				childNode.setParent(rootNode);
				// 设置深度
				childNode.setLevel(rootLevel + 1);
				childNodeList.add(childNode);
			}
		}
		// 设置子节点
		rootNode.setChilds(childNodeList);
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
