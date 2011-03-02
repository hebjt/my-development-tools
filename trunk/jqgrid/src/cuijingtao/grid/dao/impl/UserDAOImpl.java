package cuijingtao.grid.dao.impl;

import java.util.List;
import java.util.Map;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

import cuijingtao.grid.dao.iface.UserDAO;
import cuijingtao.grid.domain.Page;
import cuijingtao.grid.domain.User;

public class UserDAOImpl extends SqlMapDaoTemplate implements UserDAO {

	public UserDAOImpl(DaoManager daoManager) {
		super(daoManager);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getContractList(Map parameterMap) {
		// TODO Auto-generated method stub
		queryForList("user.getFuncData", parameterMap);
		List<User> dataList = null;
		try {
			dataList = (List) parameterMap.get("result");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("-------------error-------------");
			e.printStackTrace();
		}
		return dataList;
	}

	@Override
	public List<Page> getContractNum(Map parameterMap) {
		// TODO Auto-generated method stub
		queryForList("user.getFuncDataCount", parameterMap);
		List<Page> dataList = null;
		try {
			dataList = (List) parameterMap.get("result");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("-------------error-------------");
			e.printStackTrace();
		}
		return dataList;
	}

}
