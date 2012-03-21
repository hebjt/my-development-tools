package com.tanghsk.mock.admin.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailsService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		Collection<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
		//GrantedAuthorityImpl auth2 = new GrantedAuthorityImpl("ROLE_ADMIN");
		// auths.add(auth2);
		if (username.equals("user")) {
			auths = new ArrayList<GrantedAuthority>();
			//GrantedAuthorityImpl auth1 = new GrantedAuthorityImpl("ROLE_USER");
			auths.add(new GrantedAuthorityImpl("ROLE_USER"));
			auths.add(new GrantedAuthorityImpl("ROLE_ADMIN"));
		}

		// User(String username, String password, boolean enabled,
		// booleanaccountNonExpired,
		// booleancredentialsNonExpired, booleanaccountNonLocked,
		// Collection<GrantedAuthority> authorities) {
		User user = new User(username, "user", true, true, true, true, auths);
		return user;

	}

}
