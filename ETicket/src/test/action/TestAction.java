package test.action;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import test.po.Test;
import test.service.TestService;

import com.opensymphony.xwork2.ActionSupport;

public class TestAction extends ActionSupport{

	/**
	 * 
	 */
	private static final Log log = LogFactory.getLog(TestAction.class);
	private static final long serialVersionUID = -3403080135717179820L;
	private String id;
	private String name;
	private TestService testService;
	public TestService getTestService() {
		return testService;
	}
	public void setTestService(TestService testService) {
		this.testService = testService;
	}
	@Override
	public String execute() throws Exception {
		log.info("TestAction execute!");
		Test test = new Test();
		String message = "";
		
		//insert
		
		test.setId(id);
		test.setName(name);
		testService.save(test);
		message = this.getText("welcome")+name;
		
		
		/*
		//insert 测试事务
		Test test1 = new Test();
		test1.setId(String.valueOf(Integer.valueOf(id)+1));
		test1.setName(name);
		test.setId(id);
		test.setName(name);
		testService.saveTwo(test,test1);
		message = this.getText("welcome")+name;
		*/
		
		//select
		
		test = testService.findById(id);
		
		if(test == null)
			message = "无此记录";
		else
			message = "编号："+test.getId()+" 名字："+test.getName();
		log.info(message);
		
		
		//update
		/*
		test.setId(id);
		test.setName(name);
		testService.update(test);
		message = "编号："+test.getId()+" 名字："+test.getName();
		*/
		
		//delete
		/*
		testService.deleteById(id);
		*/
		
		
		this.addActionMessage(message);
		return SUCCESS;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
