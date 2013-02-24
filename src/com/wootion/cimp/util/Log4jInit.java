package com.wootion.cimp.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public class Log4jInit extends HttpServlet {

	public Log4jInit() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	public void init() throws ServletException {
		String prefix = getServletContext().getRealPath("/");
		String file = getServletConfig().getInitParameter("log4j-config-file");
		if (file != null) {
			//System.out.println("----------log4j准备初始化... ...");
			// PropertyConfigurator.configure(prefix + file);
			InputStream is = getServletContext()
					.getResourceAsStream("/" + file);
			Properties props = new Properties();
			try {
				props.load(is);
			} catch (IOException e) {
				System.out.println("----------log4j初始化失败！");
				e.printStackTrace();
			}
			PropertyConfigurator.configure(props);
		}
		Logger log = Logger.getLogger(Log4jInit.class.getName());
		log.info("log4j初始化成功!");
	}

}
