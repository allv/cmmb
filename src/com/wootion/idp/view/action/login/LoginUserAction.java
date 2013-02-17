package com.wootion.idp.view.action.login;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.common.collections.PermissionCollection;
import com.wootion.idp.common.utils.FordGlobal;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.user.UserManagerService;
import com.wootion.idp.view.action.BaseAction;

public class LoginUserAction extends BaseAction {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {

		//String validCode = (String) request.getSession().getAttribute(
		//		"validCode");
		//if (validCode != null && !validCode.equals(vCode)) {
		//	request.setAttribute("msg", "验证码错误！");
		//	return FAILURE;
		//}
		UserManagerService userSerivce = ServiceFactroy.getUserService();
		switch (userSerivce.userLogin(username, password, request.getSession()
				.getId())) {
		case FordGlobal.ERRORPASSWORD:
			request.setAttribute("msg", "用户名密码不匹配，请重新输入！");
			return FAILURE;
		//case FordGlobal.USERLOGINED:
		//	request.setAttribute("msg", "当前用户已经登陆，若问题，请联系管理员！");
		//	return FAILURE;
		case FordGlobal.USERUNUSEABLE:
			request.setAttribute("msg", "账号未审核！");
			return FAILURE;
		case FordGlobal.USERUNCHECK:
			String html = "如果您想重新提交申请，请<a href=\"unregister.do?mid="
					+ ServiceFactroy.getUserService().getUserID(username)
					+ "\">点击这里</a>";
			request.setAttribute("msg", "账号审核未通过！<br>" + html);
			return FAILURE;
		case FordGlobal.USERUNACTIVE:
			request.setAttribute("msg", "账号未激活或被停用！");
			return FAILURE;
		case FordGlobal.PUSERUNACTIVE:
			request.setAttribute("msg", "您所属的经销商被停用！");
			return FAILURE;
		}

		// request.setAttribute("nowDate", DateUtil
		// .getFormatDate("yyyy年MM月dd日 EEE"));

		Date date = new Date();
		Calendar cal = new GregorianCalendar();
		cal.setTime(date);
		int xq = cal.get(Calendar.DAY_OF_WEEK);
		String sxq = "星期天";
		switch (xq) {
		case 2:
			sxq = "星期一";break;
		case 3:
			sxq = "星期二";break;
		case 4:
			sxq = "星期三";break;
		case 5:
			sxq = "星期四";break;
		case 6:
			sxq = "星期五";break;
		case 7:
			sxq = "星期六";break;
		default:
			sxq = "星期天";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		String nda = sdf.format(date)+" "+sxq;
		request.setAttribute("nowDate", nda);
		return SUCESS;
	}

	private String username;

	private String password;

	private String vCode;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getVCode() {
		return vCode;
	}

	public void setVCode(String code) {
		vCode = code;
	}

	public static void main(String[] args) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		Date date = new Date();
		String tmp = sdf.format(date);
		//System.out.println(tmp);

		Calendar cal = new GregorianCalendar();
		cal.setTime(date);
		int xq = cal.get(Calendar.DAY_OF_WEEK);
		//System.out.println(xq);

	}

}
