package com.tanghsk.mock.admin.right.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.stereotype.Service;

import com.tanghsk.mock.admin.right.domain.ExamResource;
import com.tanghsk.mock.admin.right.domain.ExamRight;
import com.tanghsk.mock.admin.right.mapper.ExamResourceMapper;
import com.tanghsk.mock.admin.right.mapper.ExamRightMapper;
import com.tanghsk.util.Page;
@Service("rightService")
public class ExamRightService {
	@Autowired
	private ExamRightMapper rightMapper;
	@Autowired
	private ExamResourceMapper resourceMapper;
	/**
	 * 加载所有权限数据
	 * @param page
	 * @return
	 *
	 */
	public List<ExamRight> loadListPageAll(Page page){
		List<ExamRight> list = rightMapper.loadListPageAll(page);
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
			List<String> authList = loadUserAuthorities(map);
			for (String roleName : authList) {
				//GrantedAuthorityImpl authority = new GrantedAuthorityImpl(roleName);
				auths.add(new GrantedAuthorityImpl(roleName));
			}

			return auths;

		} catch (RuntimeException re) {
			//log.error("find by authorities by username failed.", re);
			throw re;
		}
	}
	
	/**
	 * 加载一个用户的所有权限
	 * @param map
	 * @return
	 *
	 */
	public List<String> loadUserAuthorities(Map<String,String> map) {
		return rightMapper.loadUserAuthorities(map);
	}

}
