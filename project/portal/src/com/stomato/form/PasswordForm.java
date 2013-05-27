package com.stomato.form;

import javax.validation.constraints.Size;

public class PasswordForm {
	
	@Size (min=6, max=20)
	private String password;
	
	@Size (min=6, max=20)
	private String newpassword;
	
	@Size (min=6, max=20)
	private String cfmpassword;
	
	private String vcode;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getCfmpassword() {
		return cfmpassword;
	}

	public void setCfmpassword(String cfmpassword) {
		this.cfmpassword = cfmpassword;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}
}
