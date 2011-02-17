package cuijingtao.grid.dao.iface;

import java.util.Map;



import cuijingtao.grid.domain.User;

public interface UserDAO {
	/**
	 * 获取所有用户信息
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	Map getAllUser(User user);
	
	
}
