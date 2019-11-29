package com.sp.bdi.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Repository
//@Slf4j
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSessionFactory ssf; // root-context.xml
	
	@Override
	public List<Map<String, String>> selectUserList() {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectList("com.sp.bdi.dao.UserInfoMapper.selectUserInfoList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return null;
	}
	
	@Override
	public List<UserVO> selectUserVOList(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectList("com.sp.bdi.dao.UserInfoMapper.selectUserInfoList", user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return null;
	}
	

	@Override
	public UserVO selectUserInfo(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectOne("com.sp.bdi.dao.UserInfoMapper.selectUserInfo", user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return null;
	}

	@Override
	public int insertUserInfo(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			int cnt = ss.insert("com.sp.bdi.dao.UserInfoMapper.insertUserInfo", user);
			ss.commit();
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return 0;
	}
	
	@Override
	public int updateUserInfo(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			int cnt = ss.update("com.sp.bdi.dao.UserInfoMapper.updateUserInfo", user);
			ss.commit();
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return 0;
	}
	
	@Override
	public int deleteUserInfo(UserVO user) {
		SqlSession ss = ssf.openSession();
//		// 아니면 여기서 for문 돌려도 됨
//		int[] uiNums = user.getUiNums();
//		int cnt = 0;
//		for(int uiNum: uiNums) {
//			cnt += ...
//		}
		
		try{
			int cnt = ss.delete("com.sp.bdi.dao.UserInfoMapper.deleteUserInfo", user);
			ss.commit();
			if(cnt != user.getUiNums().length) {
				ss.rollback();
				return 0;
			}
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return 0;
	}

	@Override
	public UserVO selectLoginInfo(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectOne("com.sp.bdi.dao.UserInfoMapper.selectLoginInfo", user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return null;
	}
}
