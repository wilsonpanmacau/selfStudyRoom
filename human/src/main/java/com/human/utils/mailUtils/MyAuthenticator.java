package com.human.utils.mailUtils;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator{
	
	private String userName;

	private String password;
	
	public MyAuthenticator(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
	     return new PasswordAuthentication(userName, password);  
	}

}
