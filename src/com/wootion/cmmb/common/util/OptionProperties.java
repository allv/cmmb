package com.wootion.cmmb.common.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

public class OptionProperties {

	public static String getPath(String filePath) {
		String path = OptionProperties.class.getResource("").toString();
		path = path.replaceAll("com/wootion/cmmb/common/util/", "");
		path = path.replaceAll("file:/", "");
		return path + filePath;
	}

	public final static String PATH = getPath("configs/config.properties");

	public static Properties getProperties() {
		System.out.println("=================" + PATH);
		Properties properties = new Properties();
		InputStream fin = null;
		try {
			fin = new FileInputStream(PATH);
			properties.load(fin);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fin.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return properties;
	}

	public String getValue(String key) {
		if (getProperties().containsKey(key)) {
			String value = getProperties().getProperty(key);
			return value;
		} else {
			return null;
		}
	}

	public void setValue(String key, String value) {
		try {
			InputStream fin = new FileInputStream(PATH);
			Properties properties = new Properties();
			properties.load(fin);
			fin.close();
			OutputStream fos = new FileOutputStream(PATH);
			properties.setProperty(key, value);
			properties.store(fos, "Update '" + key + "' value");
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}