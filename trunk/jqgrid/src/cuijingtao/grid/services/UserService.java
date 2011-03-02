package cuijingtao.grid.services;

import java.util.List;
import java.util.Map;

import com.ibatis.dao.client.DaoManager;

import cuijingtao.grid.dao.UserDaoConfig;
import cuijingtao.grid.dao.iface.UserDAO;
import cuijingtao.grid.domain.Page;
import cuijingtao.grid.domain.User;

public class UserService {
	private DaoManager daoMgr;
	private UserDAO userDao;
	
	public UserService() {
		daoMgr = UserDaoConfig.getDaoManager();
		this.userDao = (UserDAO) daoMgr.getDao(UserDAO.class);
	}
	public UserService(UserDAO userDao){
		this.userDao=userDao;
	}
	
	public List<User> getUserList(Map map){
		return userDao.getContractList(map);
	}
	public List<Page> getUserCount(Map map){
		return userDao.getContractNum(map);
	}
	
}
