package com.sp.bdi.user;

import lombok.Data;

@Data
public class UserVO {
	private Integer uiNum;
	private Integer[] uiNums;
	private String uiName;
	private String active;
	private String uiId;
	private String uiPwd;
	private String moddat;
	private String modtim;
	private String credat;
	private String cretim;
	private String[] search;
	private String searchStr;
}
