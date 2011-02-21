package cuijingtao.grid.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

import cuijingtao.grid.dao.iface.UserDAO;
import cuijingtao.grid.domain.User;


public class UserDAOImpl extends SqlMapDaoTemplate implements UserDAO {

	public UserDAOImpl(DaoManager daoManager) {
        super(daoManager);
    }

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Map getAllUser(User user) {
		
		Map map = new HashMap(2);
		List userList = queryForList("user.getAllUser", user);
		map.put("ResultSet", userList);
		int cnt = (Integer)queryForObject("user.getUserCount", user);
		map.put("RowCount", cnt);
		return map;
	}
	public int getUserCount(){
		return (Integer) queryForObject("user.getUserCount", null);
	}

	/* (non-Javadoc)
	 * @see cuijingtao.grid.dao.iface.UserDAO#addUser(cuijingtao.grid.domain.User)
	 */
	@Override
	public void addUser(User user) {
		insert("user.addUser", user);
		//return 
	}

	


	
	
	
	
	

}
