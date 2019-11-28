package com.sp.bdi.user;

import java.util.List;
import java.util.Map;

public interface UserService {
	public List<Map<String, String>> getUserList();
	public List<UserVO> getUserVOList(UserVO user);
//	public List<UserVO> getUserInfo(UserVO user);
	public Map<String, String> insertUserInfo(UserVO user);
	public Map<String, String> updateUserInfo(UserVO user);
	public Map<String, String> deleteUserInfo(UserVO user);
}
