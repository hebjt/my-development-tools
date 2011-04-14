package test.service;

import test.dao.TestDAO;
import test.po.Test;

public class TestService {
	private TestDAO testDAO;

	public TestDAO getTestDAO() {
		return testDAO;
	}

	public void setTestDAO(TestDAO testDAO) {
		this.testDAO = testDAO;
	}
	public void save(Test test){
		testDAO.save(test);
	}
	public void saveTwo(Test test,Test test1){
		testDAO.save(test1);
		testDAO.save(test);
	}

	public void update(Test test){
		testDAO.attachDirty(test);
	}
	public void deleteById(String id)
	{
		testDAO.delete(this.findById(id));
	}
	public Test findById(String id) {
		Test test = (Test)testDAO.findById(id);
		return test;
	}
	//测试事务
//	public void updateNames(String id1,String id2,String name) {
//		this.update(id1,name);
//		this.update(id2, name);
//	}
}
