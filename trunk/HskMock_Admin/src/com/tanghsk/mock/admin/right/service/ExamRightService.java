package com.tanghsk.mock.admin.right.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.stereotype.Service;

import com.tanghsk.mock.admin.right.domain.ExamResource;
import com.tanghsk.mock.admin.right.domain.ExamRight;
import com.tanghsk.mock.admin.right.mapper.ExamResourceMapper;
import com.tanghsk.mock.admin.right.mapper.ExamRightMapper;
import com.tanghsk.mock.admin.user.domain.ExamUser;
import com.tanghsk.mock.admin.user.mapper.ExamUserMapper;
import com.tanghsk.util.Page;
@Service("rightService")
public class ExamRightService {
	protected static Logger logger = Logger.getLogger("ExamRightService");
	@Autowired
	private ExamRightMapper rightMapper;
	@Autowired
	private ExamResourceMapper resourceMapper;
	@Autowired
	private ExamUserMapper userMapper;
	/**
	 * 获得全部资源列表
	 * @param page
	 * @return
	 */
	public List<ExamResource> getListPageResource(Page page){
		return resourceMapper.getListPageResource(page);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*-----------------------------------分割线-----------------------------------------------*/
	/**
	 * 根据username加载客户对象
	 * @param username
	 * @return
	 */
	public ExamUser findUserById(String username){
		return userMapper.findUserById(username);
	}
	/**
	 * 加载所有权限数据
	 * @param page
	 * @return
	 *
	 */
	public List<ExamRight> getAllRight(){
		List<ExamRight> list = rightMapper.getAllRight();
		return list;
	}
	/**
	 * 获取某个权限下的所有资源
	 * @param rightId
	 * @return
	 *
	 */
	public List<ExamResource> getAllResource(String rightId){
		return resourceMapper.getAllResource(rightId);
	}
	
	/**
	 * 把用户权限封装成GrantedAuthority数组 ，交由UserDetailsService处理
	 * @param username
	 * @return
	 *
	 */
	@SuppressWarnings("deprecation")
	public List<GrantedAuthority> loadUserAuthoritiesByName(Map<String,String> map) {
		try {
			List<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
			List<ExamRight> authList = loadUserAuthorities(map);
			for (ExamRight roleName : authList) {
				//GrantedAuthorityImpl authority = new GrantedAuthorityImpl(roleName);
				auths.add(new GrantedAuthorityImpl(roleName.getRightId()));
			}

			return auths;

		} catch (RuntimeException re) {
			logger.error("find by authorities by username failed.", re);
			//re.printStackTrace();
			throw re;
		}
	}
	
	/**
	 * 加载一个用户的所有权限
	 * @param map
	 * @return
	 *
	 */
	public List<ExamRight> loadUserAuthorities(Map<String,String> map) {
		//ApplicationContext context = new ClassPathXmlApplicationContext("spring-application.xml");  
        //ExamRightService rightService0 = (ExamRightService)context.getBean("rightServiceCreat"); 
		return rightMapper.loadUserAuthorities(map);
	}

}
