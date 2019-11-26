package com.sp.bdi.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	@Override
	public List<Map<String, String>> selectUserList() {
		List<Map<String, String>> userList = new ArrayList<Map<String, String>>();
		for(int i=1; i<=5; i++) {
			Map<String, String> user = new HashMap<String, String>();
			user.put("name", "name : " + i);
			user.put("age", "age : " + i);
			user.put("addr", "addr : " + i);
			userList.add(user);
		}
		return userList;
	}
}
