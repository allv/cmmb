package com.wootion.cmmb.common.exception;

public class SameObjectException extends Exception {

	private static final long serialVersionUID = -1834505673585312916L;
	private String key = "sameid";

	public String getKey() {
		return key;
	}
}
