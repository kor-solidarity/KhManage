package com.kh.manage.common;

import java.util.UUID;

public class CommonsUtils {

	public static String getRandomString() {
		
		//32비트의 랜덤 문자열을 생성해주는 클래스
		return UUID.randomUUID().toString().replace("-", "").replace("\\", ""); 
		//랜덤한 32비트의 문자열을 생성해주고나서 문자열로 변경 경로조작가능한 것들(-,\\)은 아무것도 아닌값으로 넣는다.replace은 그냥 기억만
	}
	

}
