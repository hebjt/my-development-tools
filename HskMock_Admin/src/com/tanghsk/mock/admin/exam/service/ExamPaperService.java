package com.tanghsk.mock.admin.exam.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tanghsk.mock.admin.exam.domain.ExamOptions;
import com.tanghsk.mock.admin.exam.domain.ExamPaper;
import com.tanghsk.mock.admin.exam.domain.ExamPaperPublish;
import com.tanghsk.mock.admin.exam.domain.ExamQuestionParse;
import com.tanghsk.mock.admin.exam.domain.ExamQuestions;
import com.tanghsk.mock.admin.exam.domain.ExamQuestionsTreeNode;
import com.tanghsk.mock.admin.exam.mapper.ExamOptionsMapper;
import com.tanghsk.mock.admin.exam.mapper.ExamPaperMapper;
import com.tanghsk.mock.admin.exam.mapper.ExamPaperPublishMapper;
import com.tanghsk.mock.admin.exam.mapper.ExamQuestionParseMapper;
import com.tanghsk.mock.admin.exam.mapper.ExamQuestionsMapper;
import com.tanghsk.util.Page;
@Service("examPaperService")
public class ExamPaperService {
	@Autowired
	private ExamPaperMapper examPaperMapper;
	@Autowired
	private ExamQuestionsMapper questionMapper;
	@Autowired
	private ExamOptionsMapper optionsMapper;
	@Autowired
	private ExamPaperPublishMapper publishMapper;
	@Autowired
	private ExamQuestionParseMapper parseMapper;
	
	public List<ExamPaper> fingAllPaper(Page page){
		return examPaperMapper.findListPageAll(page);	
	}
	public void addExamPaper(ExamPaper paper){
		examPaperMapper.addExamPaper(paper);
	}
	public void saveQuestions(ExamQuestions questions){
		questionMapper.saveQuestions(questions);
	}
	public List<ExamQuestions> getListObjectByStructId(String subjectStructId){
		//return questionMapper.getListObjectByStructId(subjectStructId);
		return null;
	}
	/**
	 * 加载试卷对象
	 * @param paper_id
	 * @return
	 */
	public ExamPaper findEPById(String paper_id){
		return examPaperMapper.findEPById(paper_id);
	}
	/**
	 * 保存选项
	 * @param options
	 */
	public void saveOptions(ExamOptions options){
		optionsMapper.saveOptions(options);
	}
	/**
	 * 根据主键加载试题选项对象
	 * @param option
	 * @return
	 */
	public ExamOptions getOptionById(ExamOptions option){
		return optionsMapper.getOptionsById(option);
	}
	/**
	 * 修改选项
	 * @param option
	 */
	public void updateOption(ExamOptions option){
		optionsMapper.updateOption(option);
	}
	/**
	 * 根据主键加载试题对象
	 * @param quesId
	 * @return
	 */
	public ExamQuestions getQuestionById(String quesId){
		return questionMapper.getQuestionById(quesId);
	}
	/**
	 * 修改试题
	 * @param quesion
	 */
	public void updateQuestion(ExamQuestions quesion){
		questionMapper.updateQuestion(quesion);
	}
	/**
	 * 删除选项
	 * @param opt_id
	 */
	public void deleteOption(String opt_id){
		optionsMapper.deleteOption(opt_id);
	}
	/**
	 * 删除试题
	 * @param ques_id
	 */
	public void deleteByQuesId(String ques_id){
		questionMapper.deleteByQuesId(ques_id);
	}
	/**
	 * 根据试题id加载选项集合
	 * @param ques_id
	 * @return
	 */
	public List<ExamOptions> getOptionsByQuesId(String ques_id){
		return optionsMapper.getOptionsByQuesId(ques_id);
	}
	/**
	 * 根据试题ID加载子试题集合
	 * @param ques_id
	 * @return
	 */
	public List<ExamQuestions> getQuestionByParentId(String ques_id){
		return questionMapper.getQuestionByParentId(ques_id);
	}
	/**
	 * 发布试卷
	 * @param publish
	 */
	public void saveExamPublish(ExamPaperPublish publish){
		publishMapper.savePlublish(publish);
	}
	/**
	 * 修改试卷
	 * @param paper
	 */
	public void updatePaper(ExamPaper paper){
		examPaperMapper.updateExamPaper(paper);
	}
	/**
	 * 根据试卷id查询发布列表
	 * @param paper_id
	 * @return
	 */
	public List<ExamPaperPublish> getPaperListByPaperId(String paper_id){
		return publishMapper.getPaperListByPaperId(paper_id);
	}
	/**
	 * 删除试卷
	 * @param paper_id
	 */
	
	public void deletePaper(String paper_id){
		examPaperMapper.delExamPaperById(paper_id);
	}
	/**
	 * 试卷发布初始化列表
	 * @return
	 */
	public List<ExamPaperPublish> findListPageAll(Page page){
		return publishMapper.findListPageAll(page);
	}
    /**
     * 获取批量添加的试题id号
     * @param map 封装的参数
     * @return
     */
    public List<ExamQuestions> getIdForBatData(Map<String,String> map){
    	return questionMapper.getIdForBatData(map);
    }
    /**
     * 获取解析列表
     * @param ques
     * @return
     */
    public List<ExamQuestions> getQuestionParse(ExamQuestions ques){
    	return questionMapper.getQuestionParse(ques);
    }
    /**
     * 保存解析
     * @param parse
     */
    public void saveParse(ExamQuestionParse parse){
    	parseMapper.saveParse(parse);
    }
    /**
     * 根据主键加载解析对象
     * @param parse
     * @return
     */
    public ExamQuestionParse getParseById(String parseId){
    	return parseMapper.getParseById(parseId);
    }
    /**
     * 删除解析
     * @param parseId
     */
    public void deleteParse(String parseId) throws Exception{
    	parseMapper.deleteParse(parseId);
    }
    /**
     * 根据主键加载试题发布内容
     * @param publishId
     * @return
     */
	public ExamPaperPublish loadPublishById(String publishId){
		return publishMapper.loadPublishById(publishId);
	}
	/**
	 * 保存发布
	 * @param publish
	 */
	public void updatePublish(ExamPaperPublish publish) throws Exception{
		publishMapper.updatePublishById(publish);
	}
	
	
	
	
	
	
	
	
	/**
	 * 构造试题树形结构
	 * @param quesId
	 * @return
	 */
	public ExamQuestionsTreeNode getQuestionsList(Map<String,String> map){
		List<ExamQuestions> quesList = questionMapper.getListObjectByStructId(map);
		ExamQuestionsTreeNode rootNode = new ExamQuestionsTreeNode();
		rootNode.setQuesId("root");
		rootNode.setLevel(0);
		rootNode.setLeaf(false);
		if(quesList.size()>0){
			rootNode = this.constructTree(rootNode, quesList, 0);
		}
		return rootNode;
	}
	/**
	 * 递归构造
	 * @param rootNode
	 * @param orgList
	 * @param rootLevel
	 * @return
	 */
	
	public ExamQuestionsTreeNode constructTree(ExamQuestionsTreeNode rootNode, List<ExamQuestions> quesList, int rootLevel){
		List<ExamQuestionsTreeNode> childNodeList = new ArrayList<ExamQuestionsTreeNode>();
		//构造根节点
		for(int i=0; i<quesList.size(); i++){
			ExamQuestions ques = quesList.get(i);
			if(ques.getQuesParentId().equals(rootNode.getQuesId())){
				ExamQuestionsTreeNode childNode = new ExamQuestionsTreeNode();
				//copy Organization to OrganizationTreeNode
//				System.out.println(org.getId());
				childNode.setQuesId(ques.getQuesId());
				childNode.setQuesParentId(ques.getQuesParentId());
				childNode.setQuesType(ques.getQuesType());
				childNode.setQuesTypeId(ques.getQuesTypeId());
				childNode.setQuesNum(ques.getQuesNum());
				childNode.setQuesContent(ques.getQuesContent());
				childNode.setQuesDrySign(ques.getQuesDrySign());
				childNode.setParent(rootNode);
				//设置深度
				childNode.setLevel(rootLevel+1);
				childNodeList.add(childNode);
			}
		}
		//设置子节点
		rootNode.setChilds(childNodeList);
		//设置是否叶子节点
		if(childNodeList.size()==0){
			rootNode.setLeaf(true);
		} else {
			rootNode.setLeaf(false);
		}
		//递归构造子节点
		for(int j=0; j<childNodeList.size();j++){
			//进入子节点构造时深度+1
			constructTree(childNodeList.get(j), quesList, ++rootLevel);
			//递归调用返回时，构造子节点的兄弟节点，深度要和该子节点深度一样，因为之前加1，所以要减1
			--rootLevel;
		}
		return rootNode;
	}


}
