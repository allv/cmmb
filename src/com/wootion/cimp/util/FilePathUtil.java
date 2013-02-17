package com.wootion.cimp.util;

/**
 * @see: FilePathUtil.java
 * @date: 2010-9-27
 * @note:
 * @corpright: wootion(C)2001-2010
 * @version: 1.0
 * @author Deng Honghong
 */
public class FilePathUtil {
	public static String getPath(String filePath) {
		String path = FilePathUtil.class.getResource("").toString();
		path = path.replaceAll("com/wootion/cimp/util/", "");
		path = path.replaceAll("file:/", "");
		return path + filePath;
	}
}
