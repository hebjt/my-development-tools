package cuijingtao.grid.dao.iface;

import java.util.List;
import java.util.Map;

import cuijingtao.grid.domain.Page;
import cuijingtao.grid.domain.User;

public interface UserDAO {
	
	
	/**
	 * 数据列表，分页形式
	 * @param parameterMap
	 * @return
	 */
	List<User> getContractList(Map parameterMap);
	/**
	 * 分页的记录
	 * @param parameterMap封装一页的记录数，总页数
	 * @return
	 */
	List<Page> getContractNum(Map parameterMap);

}
