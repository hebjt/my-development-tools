package airticket.po;


import java.util.Date;

import airticket.dao.UserinfoDAO;
import airticket.dao.UserscoreDAO;

//import java.util.Date;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO �Զ���ɷ������
		Userinfo user = new Userinfo();
		UserinfoDAO userDAO = new UserinfoDAO();
		
//		user.setUserid(1L);
//		user.setUsername("test");
//		System.out.println(user.getUserid());
//		userDAO.save(user);
//		System.out.println(user.getUserid()+" "+user.getUsername());
//		user = userDAO.findById(3L);
//		System.out.println(user.getUserid()+" "+user.getUsername());
//		userDAO.delete(user);
		
		
//		AirorderId airOrderId = new AirorderId();
//		Airorder airOrder = new Airorder();
//		AirorderDAO airDAO = new AirorderDAO();
		
//		user = userDAO.findById(1L);
//		System.out.println(user.getUsername());
		
//		airOrderId.setOrderid("1");
//		airOrderId.setName("test");
//		airOrder.setId(airOrderId);
//		airOrder.setUserinfo(user);
//		airDAO.save(airOrder);
		
		UserscoreDAO userScoreDAO = new UserscoreDAO();
		Userscore userScore = new Userscore();
		userScore.setScoreid("666");
		userScore.setUsername("scoretest666");
		userScore.setUpdscotime(new Date());
		userScore.setUserinfo(user);
		userScoreDAO.save(userScore);

		
//		Userinfo user = new Userinfo();
//		Userscore score = new Userscore();
//		UserinfoDAO userDAO = new UserinfoDAO();
//		user.setUserid(999L);
//		userDAO.save(user);
		
	}

}
