package cuijingtao.grid.dao.iface;

import java.util.Map;



import cuijingtao.grid.domain.User;

public interface UserDAO {
	/**
	 * ��ȡ�����û���Ϣ
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	Map getAllUser(User user);
	
	
}
