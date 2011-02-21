package cuijingtao.grid.services;

import java.util.Map;

import com.ibatis.dao.client.DaoManager;

import cuijingtao.grid.dao.UserDaoConfig;
import cuijingtao.grid.dao.iface.UserDAO;
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
	
	@SuppressWarnings("rawtypes")
	public Map getAllUser(User user){
		return userDao.getAllUser(user);
	}
	public int getCount(){
		return userDao.getUserCount();
	}
	
	public void addUser(User user){
		userDao.addUser(user);
	}
	public void editUser(User user){
		userDao.editUser(user);
	}
	
}
