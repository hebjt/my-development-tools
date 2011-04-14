package airticket.service;

import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import airticket.dao.UserinfoDAO;
import airticket.po.Userinfo;

public class UserOprService {
	private static final Log log = LogFactory.getLog(AirTicketOprService.class);

	
	private UserinfoDAO userinfoDAO;
	//注册新用户
	public void save(Userinfo transientInstance) {
		log.debug("saving Userscore instance");
		userinfoDAO.save(transientInstance);
	}
	//获得用户ID
	public Long findUserId(){
		
		return userinfoDAO.findUserId();
	}
	//用户登陆
	public Userinfo findUserinfo(Userinfo userinfo){
		List list = userinfoDAO.findByExample(userinfo);
		Iterator iterator = list.iterator();
		//理论上只有用户名不能重复，故只有一个userinfo对象，但暂时为做限制。
		if(iterator.hasNext()){
			userinfo = (Userinfo)iterator.next();
		}
		else
			userinfo = null;
		return userinfo;
	}

	public UserinfoDAO getUserinfoDAO() {
		return userinfoDAO;
	}


	public void setUserinfoDAO(UserinfoDAO userinfoDAO) {
		this.userinfoDAO = userinfoDAO;
	}
	
	
}
