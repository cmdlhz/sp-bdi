package com.sp.bdi.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class UserDAOImpl implements UserDAO {

	@Autowired
	private BasicDataSource bds;
	
	@Override
	public List<Map<String, String>> selectUserList() {
//		log.info("bds: {}", bds);
		// try ~ catch 사용해서 Connection을 쉽게 가져올 수 있음
		
		Connection con = null;
		List<Map<String, String>> userList = new ArrayList<Map<String, String>>();
		
		try {
			con = bds.getConnection();
			String sql = "select * from user_info";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Map<String, String> user = new HashMap<String, String>();
				user.put("uiNum", rs.getString("ui_num"));
				user.put("uiName", rs.getString("ui_name"));
				user.put("uiId", rs.getString("ui_id"));
				user.put("credat", rs.getString("credat"));
				user.put("cretim", rs.getString("cretim"));
				userList.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(con != null) {
				try {
					con.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return userList;
	}
}
