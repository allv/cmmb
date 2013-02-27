package com.wootion.idp.view.vo;

import com.wootion.cmmb.persistenc.po.bean.Form;

public class FormVO {
	private Form form;
	private boolean checked;

	public Form getForm() {
		return form;
	}

	public void setForm(Form form) {
		this.form = form;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
}
