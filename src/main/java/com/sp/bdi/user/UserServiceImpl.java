package com.sp.bdi.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("userService") // service 메모리 생성
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO udao;
	
	@Override
	public List<Map<String, String>> getUserList() {
		return udao.selectUserList();
	}
	@Override
	public List<UserVO> getUserVOList(UserVO user) {
		return udao.selectUserVOList(user);
	}
}
