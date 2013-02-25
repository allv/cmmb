package com.wootion.idp.view.action.user;

import com.wootion.idp.persistence.po.bean.Wtrole;

public class WtroleVOForUpdate {

	private Wtrole role;
	private boolean checked;

	public Wtrole getRole() {
		return role;
	}

	public void setRole(Wtrole role) {
		this.role = role;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
}
