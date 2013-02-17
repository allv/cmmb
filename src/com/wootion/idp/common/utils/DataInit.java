package com.wootion.idp.common.utils;

import java.util.Date;

import com.wootion.idp.persistence.po.bean.WtUserRoleRelationship;
import com.wootion.idp.persistence.po.bean.Wtfunction;
import com.wootion.idp.persistence.po.bean.Wtpermission;
import com.wootion.idp.persistence.po.bean.Wtresource;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtrolefunrelationship;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.CommonService;
import com.wootion.idp.service.ServiceFactroy;

public class DataInit {
	public static void initData(String basePath) {
		CommonService commonService = ServiceFactroy.getCommonService();
		Long userID = 10001L;
		Wtuser user = commonService.getObject(Wtuser.class, userID);
		if (user != null) {// 用户对象不为空则表示已经进行了初始化了。
			return;
		}

		try {
			// 初始化管理员用户
			user = new Wtuser();
			
			//user.setWtuserName("管理员");
			user.setWtuserLoginname("admin");
			user.setWtuserPassword("21232f297a57a5a743894a0e4a801fc3");
			user.setWtuserId(userID);
			//user.setWtuserSex("1");
			Date date = new Date();
			user.setWtuserCreatetime(date);
			user.setWtuserLastlogintime(date);
			user.setWtuserLoginnumber(0);
			user.setWtuserIsuseable("1");
			user.setIsCheck(1);
			user.setWtuserIsuseable("1");
			user.setIsDelete(0);
			commonService.saveObject(user);
			
			
			// 初始化角色
			Wtrole role = new Wtrole();
			role.setWtroleId(10001L);
			role.setWtroleName("系统管理员");
			role.setParentRole("10001");
			role.setWtroleType("1");
			role.setWtroleCreatetime(date);
			role.setWtroleIsuseable("1");
			role.setIsDelete(0);
			commonService.saveObject(role);
			
			// 初始化角色
			Wtrole role2 = new Wtrole();
			role2.setWtroleId(10002L);
			role2.setWtroleName("行政人员");
			role2.setParentRole("10002");
			role2.setWtroleType("1");
			role2.setWtroleCreatetime(date);
			role2.setWtroleIsuseable("1");
			role2.setIsDelete(0);
			commonService.saveObject(role2);
			
//			// 初始化角色
//			Wtrole role3 = new Wtrole();
//			role3.setWtroleId(10003L);
//			role3.setWtroleName("护理人员");
//			role3.setParentRole("10003");
//			role3.setWtroleType("1");
//			role3.setWtroleCreatetime(date);
//			role3.setWtroleIsuseable("1");
//			role3.setIsDelete(0);
//			commonService.saveObject(role3);
//			
//			// 初始化角色
//			Wtrole role4 = new Wtrole();
//			role4.setWtroleId(10004L);
//			role4.setWtroleName("康复人员");
//			role4.setParentRole("10004");
//			role4.setWtroleType("1");
//			role4.setWtroleCreatetime(date);
//			role4.setWtroleIsuseable("1");
//			role4.setIsDelete(0);
//			commonService.saveObject(role4);
			
	
			{
				// 初始化功能 根路径
				Wtfunction funRoot = new Wtfunction();
				funRoot.setWtfunctionId(0L);
				funRoot.setWtfunIsleaf("0");
				funRoot.setWtfunCode("0");
				funRoot.setWtfunOrder("0");
				funRoot.setWtfunName("root");
				funRoot.setWtfunExcutepath("root");
				funRoot.setWtfunCreatetime(date);
				commonService.saveObject(funRoot);
				// 初始化功能 基本信息管理
				Wtfunction funBase = new Wtfunction();
				funBase.setWtfunctionId(100L);
				funBase.setWtfunParentid(0L);
				funBase.setWtfunIsleaf("0");
				funBase.setWtfunCode("01");
				funBase.setWtfunOrder("01");
				funBase.setWtfunName("基础信息管理");
				funBase.setWtfunExcutepath("baseinfo");
				funBase.setWtfunCreatetime(date);
				commonService.saveObject(funBase);

				// 初始化功能 用户管理
				Wtfunction funuser = new Wtfunction();
				funuser.setWtfunctionId(101L);
				funuser.setWtfunParentid(100L);
				funuser.setWtfunIsleaf("1");
				funuser.setWtfunCode("0101");
				funuser.setWtfunOrder("0101");
				funuser.setWtfunName("帐号管理");
				funuser.setWtfunExcutepath("queryuser.do");
				funuser.setWtfunCreatetime(date);
				commonService.saveObject(funuser);

				// 用户功能 添加
				Wtresource resUserAdd = new Wtresource();
				resUserAdd.setWtresourceId(10101L);
				resUserAdd.setWtfunction(funuser);
				resUserAdd.setWtresName("添加");
				resUserAdd.setWtresCode("01");
				resUserAdd.setWtresCreatetime(date);
				commonService.saveObject(resUserAdd);
				
				// 初始化功能 角色管理
				/*
				Wtfunction funrole = new Wtfunction();
				funrole.setWtfunctionId(102L);
				funrole.setWtfunParentid(100L);
				funrole.setWtfunIsleaf("1");
				funrole.setWtfunCode("0102");
				funrole.setWtfunOrder("0102");
				funrole.setWtfunName("角色管理");
				funrole.setWtfunExcutepath("queryrole.do");
				funrole.setWtfunCreatetime(date);
				commonService.saveObject(funrole);
                
				// 角色管理 添加
				Wtresource resRoleAdd = new Wtresource();
				resRoleAdd.setWtresourceId(10201L);
				resRoleAdd.setWtfunction(funrole);
				resRoleAdd.setWtresName("添加");
				resRoleAdd.setWtresCode("01");
				resRoleAdd.setWtresCreatetime(date);
				commonService.saveObject(resRoleAdd);
                */
				// 用户角色关系
				WtUserRoleRelationship ur = new WtUserRoleRelationship();
				ur.setWturId(10001L);
				ur.setWtrole(role);
				ur.setWtuser(user);
				commonService.saveObject(ur);
				// 角色功能关系
				Wtrolefunrelationship rf1 = new Wtrolefunrelationship();
				rf1.setWtrolefunId(10001L);
				rf1.setWtfunction(funBase);
				rf1.setWtrole(role);
				commonService.saveObject(rf1);
				
				Wtrolefunrelationship rf2 = new Wtrolefunrelationship();
				rf2.setWtrolefunId(10002L);
				rf2.setWtfunction(funuser);
				rf2.setWtrole(role);
				commonService.saveObject(rf2);
				
				// 许可表
				Wtpermission per1 = new Wtpermission();
				per1.setWtfrId(10001L);
				per1.setWtrole(role);
				per1.setWtresource(resUserAdd);
				commonService.saveObject(per1);
			}

		
			{// 王立文菜单
				Wtfunction funpd1 = new Wtfunction();
				funpd1.setWtfunctionId(130L);
				funpd1.setWtfunParentid(0L);
				funpd1.setWtfunIsleaf("0");
				funpd1.setWtfunCode("20");
				funpd1.setWtfunOrder("20");
				funpd1.setWtfunName("项目管理");
				funpd1.setWtfunExcutepath("c_serieslist.do");
				funpd1.setWtfunCreatetime(date);
				commonService.saveObject(funpd1);
                
				Wtrolefunrelationship rf1 = new Wtrolefunrelationship();
				rf1.setWtrolefunId(11023L);
				rf1.setWtfunction(funpd1);
				rf1.setWtrole(role);
			    commonService.saveObject(rf1);
				
				Wtfunction funMseries = new Wtfunction();
				funMseries.setWtfunctionId(142L);
				funMseries.setWtfunParentid(130L);
				funMseries.setWtfunIsleaf("1");
				funMseries.setWtfunCode("2001");
				funMseries.setWtfunOrder("2001");
				funMseries.setWtfunName("项目管理");
				funMseries.setWtfunExcutepath("c_serieslist.do");
				funMseries.setWtfunCreatetime(date);
				commonService.saveObject(funMseries);
                
				Wtrolefunrelationship rf21 = new Wtrolefunrelationship();
				rf21.setWtrolefunId(11035L);
				rf21.setWtfunction(funMseries);
				rf21.setWtrole(role);
			    commonService.saveObject(rf21);
				
				Wtresource funpdshAdd123 = new Wtresource();
				funpdshAdd123.setWtresourceId(13231L);
				funpdshAdd123.setWtfunction(funMseries);
				funpdshAdd123.setWtresName("添加");
				funpdshAdd123.setWtresCode("01");
				funpdshAdd123.setWtresCreatetime(date);
				commonService.saveObject(funpdshAdd123);
				
				
				Wtfunction funpd111 = new Wtfunction();
				funpd111.setWtfunctionId(167L);
				funpd111.setWtfunParentid(0L);
				funpd111.setWtfunIsleaf("0");
				funpd111.setWtfunCode("32");
				funpd111.setWtfunOrder("32");
				funpd111.setWtfunName("护理管理");
				funpd111.setWtfunExcutepath("caremanage.do");
				funpd111.setWtfunCreatetime(date);
				commonService.saveObject(funpd111);
                
				Wtrolefunrelationship rf111 = new Wtrolefunrelationship();
				rf111.setWtrolefunId(11222L);
				rf111.setWtfunction(funpd111);
				rf111.setWtrole(role);
			    commonService.saveObject(rf111);
				
			    Wtrolefunrelationship rf4568 = new Wtrolefunrelationship();
			    rf4568.setWtrolefunId(12287L);
			    rf4568.setWtfunction(funpd111);
			    rf4568.setWtrole(role2);
			    commonService.saveObject(rf4568);
			    
				Wtfunction funCare = new Wtfunction();
				funCare.setWtfunctionId(1422L);
				funCare.setWtfunParentid(167L);
				funCare.setWtfunIsleaf("1");
				funCare.setWtfunCode("2033");
				funCare.setWtfunOrder("2033");
				funCare.setWtfunName("护理评估");
				funCare.setWtfunExcutepath("caremanage.do");
				funCare.setWtfunCreatetime(date);
				commonService.saveObject(funCare);
                
				Wtrolefunrelationship rf221 = new Wtrolefunrelationship();
				rf221.setWtrolefunId(11335L);
				rf221.setWtfunction(funCare);
				rf221.setWtrole(role);
			    commonService.saveObject(rf221);
			    
			    Wtrolefunrelationship rf455 = new Wtrolefunrelationship();
			    rf455.setWtrolefunId(11955L);
			    rf455.setWtfunction(funCare);
			    rf455.setWtrole(role2);
			    commonService.saveObject(rf455);
				
				Wtresource funpdshAdd222 = new Wtresource();
				funpdshAdd222.setWtresourceId(13345L);
				funpdshAdd222.setWtfunction(funCare);
				funpdshAdd222.setWtresName("添加");
				funpdshAdd222.setWtresCode("01");
				funpdshAdd222.setWtresCreatetime(date);
				commonService.saveObject(funpdshAdd222);
				
				Wtfunction funCareservices = new Wtfunction();
				funCareservices.setWtfunctionId(1455L);
				funCareservices.setWtfunParentid(167L);
				funCareservices.setWtfunIsleaf("1");
				funCareservices.setWtfunCode("2035");
				funCareservices.setWtfunOrder("2035");
				funCareservices.setWtfunName("护理服务");
				funCareservices.setWtfunExcutepath("bathrecordlist.do");
				funCareservices.setWtfunCreatetime(date);
				commonService.saveObject(funCareservices);
                
				Wtrolefunrelationship rf521 = new Wtrolefunrelationship();
				rf521.setWtrolefunId(11556L);
				rf521.setWtfunction(funCareservices);
				rf521.setWtrole(role);
			    commonService.saveObject(rf521);
				
			    Wtrolefunrelationship rf488 = new Wtrolefunrelationship();
			    rf488.setWtrolefunId(11378L);
			    rf488.setWtfunction(funCareservices);
			    rf488.setWtrole(role2);
			    commonService.saveObject(rf488);
			    
				Wtresource funpdshAdd555 = new Wtresource();
				funpdshAdd555.setWtresourceId(16666L);
				funpdshAdd555.setWtfunction(funCareservices);
				funpdshAdd555.setWtresName("添加");
				funpdshAdd555.setWtresCode("01");
				funpdshAdd555.setWtresCreatetime(date);
				commonService.saveObject(funpdshAdd555);
				
				Wtfunction funpd222 = new Wtfunction();
				funpd222.setWtfunctionId(189L);
				funpd222.setWtfunParentid(0L);
				funpd222.setWtfunIsleaf("0");
				funpd222.setWtfunCode("43");
				funpd222.setWtfunOrder("43");
				funpd222.setWtfunName("康复管理");
				funpd222.setWtfunExcutepath("recoverylist.do");
				funpd222.setWtfunCreatetime(date);
				commonService.saveObject(funpd222);
                
				Wtfunction funRecoveryElva = new Wtfunction();
			    funRecoveryElva.setWtfunctionId(1499L);
			    funRecoveryElva.setWtfunParentid(189L);
			    funRecoveryElva.setWtfunIsleaf("1");
			    funRecoveryElva.setWtfunCode("2021");
			    funRecoveryElva.setWtfunOrder("2021");
			    funRecoveryElva.setWtfunName("康复评估");
			    funRecoveryElva.setWtfunExcutepath("revalelvalist.do");
			    funRecoveryElva.setWtfunCreatetime(date);
				commonService.saveObject(funRecoveryElva);
                
				Wtrolefunrelationship rf393 = new Wtrolefunrelationship();
				rf393.setWtrolefunId(11388L);
				rf393.setWtfunction(funRecoveryElva);
				rf393.setWtrole(role);
			    commonService.saveObject(rf393);
			    
			    Wtrolefunrelationship rf4554 = new Wtrolefunrelationship();
			    rf4554.setWtrolefunId(21212L);
			    rf4554.setWtfunction(funRecoveryElva);
			    rf4554.setWtrole(role2);
			    commonService.saveObject(rf4554);
				
			    Wtresource funpdshAdd388 = new Wtresource();
			    funpdshAdd388.setWtresourceId(15599L);
			    funpdshAdd388.setWtfunction(funRecoveryElva);
			    funpdshAdd388.setWtresName("添加");
			    funpdshAdd388.setWtresCode("01");
			    funpdshAdd388.setWtresCreatetime(date);
				commonService.saveObject(funpdshAdd388);
				
				Wtrolefunrelationship rf222 = new Wtrolefunrelationship();
				rf222.setWtrolefunId(11555L);
				rf222.setWtfunction(funpd222);
				rf222.setWtrole(role);
			    commonService.saveObject(rf222);
				
			    Wtrolefunrelationship rf4509 = new Wtrolefunrelationship();
			    rf4509.setWtrolefunId(11987L);
			    rf4509.setWtfunction(funpd222);
			    rf4509.setWtrole(role2);
			    commonService.saveObject(rf4509);
			    
				Wtfunction funRecovery = new Wtfunction();
				funRecovery.setWtfunctionId(1433L);
				funRecovery.setWtfunParentid(189L);
				funRecovery.setWtfunIsleaf("1");
				funRecovery.setWtfunCode("2034");
				funRecovery.setWtfunOrder("2034");
				funRecovery.setWtfunName("康复服务");
				funRecovery.setWtfunExcutepath("bloodpressurelist.do");
				funRecovery.setWtfunCreatetime(date);
				commonService.saveObject(funRecovery);
                
				Wtrolefunrelationship rf321 = new Wtrolefunrelationship();
				rf321.setWtrolefunId(11336L);
				rf321.setWtfunction(funRecovery);
				rf321.setWtrole(role);
			    commonService.saveObject(rf321);
			    
			    Wtrolefunrelationship rf7788 = new Wtrolefunrelationship();
			    rf7788.setWtrolefunId(11237L);
			    rf7788.setWtfunction(funRecovery);
			    rf7788.setWtrole(role2);
			    commonService.saveObject(rf7788);
			    
				Wtresource funpdshAdd333 = new Wtresource();
				funpdshAdd333.setWtresourceId(15555L);
				funpdshAdd333.setWtfunction(funRecovery);
				funpdshAdd333.setWtresName("添加");
				funpdshAdd333.setWtresCode("01");
				funpdshAdd333.setWtresCreatetime(date);
				commonService.saveObject(funpdshAdd333);
				
				Wtfunction funpd333 = new Wtfunction();
				funpd333.setWtfunctionId(221L);
				funpd333.setWtfunParentid(0L);
				funpd333.setWtfunIsleaf("0");
				funpd333.setWtfunCode("54");
				funpd333.setWtfunOrder("54");
				funpd333.setWtfunName("活动管理");
				funpd333.setWtfunExcutepath("managementlist.do");
				funpd333.setWtfunCreatetime(date);
				commonService.saveObject(funpd333);
                
				Wtrolefunrelationship rf333 = new Wtrolefunrelationship();
				rf333.setWtrolefunId(11666L);
				rf333.setWtfunction(funpd333);
				rf333.setWtrole(role);
			    commonService.saveObject(rf333);
			    
			    Wtrolefunrelationship rf776 = new Wtrolefunrelationship();
			    rf776.setWtrolefunId(11234L);
			    rf776.setWtfunction(funpd333);
			    rf776.setWtrole(role2);
			    commonService.saveObject(rf776);
			    
			    Wtfunction funManagement = new Wtfunction();
			    funManagement.setWtfunctionId(1466L);
			    funManagement.setWtfunParentid(221L);
			    funManagement.setWtfunIsleaf("1");
			    funManagement.setWtfunCode("2045");
			    funManagement.setWtfunOrder("2045");
			    funManagement.setWtfunName("活动管理");
			    funManagement.setWtfunExcutepath("managementlist.do");
			    funManagement.setWtfunCreatetime(date);
				commonService.saveObject(funManagement);
                
				Wtrolefunrelationship rf432 = new Wtrolefunrelationship();
				rf432.setWtrolefunId(11447L);
				rf432.setWtfunction(funManagement);
				rf432.setWtrole(role);
			    commonService.saveObject(rf432);
				
			    Wtrolefunrelationship rf700 = new Wtrolefunrelationship();
			    rf700.setWtrolefunId(119898L);
			    rf700.setWtfunction(funManagement);
			    rf700.setWtrole(role2);
			    commonService.saveObject(rf700);
			    
				Wtresource funpdshAdd666 = new Wtresource();
				funpdshAdd666.setWtresourceId(17777L);
				funpdshAdd666.setWtfunction(funManagement);
				funpdshAdd666.setWtresName("添加");
				funpdshAdd666.setWtresCode("01");
				funpdshAdd666.setWtresCreatetime(date);
				commonService.saveObject(funpdshAdd666);
				
				Wtfunction funpd777 = new Wtfunction();
				funpd777.setWtfunctionId(179L);
				funpd777.setWtfunParentid(0L);
				funpd777.setWtfunIsleaf("0");
				funpd777.setWtfunCode("57");
				funpd777.setWtfunOrder("57");
				funpd777.setWtfunName("志愿者管理");
				funpd777.setWtfunExcutepath("volunteerlist.do");
				funpd777.setWtfunCreatetime(date);
				commonService.saveObject(funpd777);
                
				Wtrolefunrelationship rf777 = new Wtrolefunrelationship();
				rf777.setWtrolefunId(11777L);
				rf777.setWtfunction(funpd777);
				rf777.setWtrole(role);
			    commonService.saveObject(rf777);
			    
			    Wtrolefunrelationship rf276 = new Wtrolefunrelationship();
			    rf276.setWtrolefunId(11228L);
			    rf276.setWtfunction(funpd777);
			    rf276.setWtrole(role2);
			    commonService.saveObject(rf276);
				
				Wtfunction funVolunteer = new Wtfunction();
				funVolunteer.setWtfunctionId(1477L);
				funVolunteer.setWtfunParentid(179L);
				funVolunteer.setWtfunIsleaf("1");
				funVolunteer.setWtfunCode("2037");
				funVolunteer.setWtfunOrder("2037");
				funVolunteer.setWtfunName("志愿者管理");
				funVolunteer.setWtfunExcutepath("volunteerlist.do");
				funVolunteer.setWtfunCreatetime(date);
				commonService.saveObject(funVolunteer);
                
				Wtrolefunrelationship rf721 = new Wtrolefunrelationship();
				rf721.setWtrolefunId(11337L);
				rf721.setWtfunction(funVolunteer);
				rf721.setWtrole(role);
			    commonService.saveObject(rf721);
				
			    Wtrolefunrelationship rf987 = new Wtrolefunrelationship();
			    rf987.setWtrolefunId(13222L);
			    rf987.setWtfunction(funVolunteer);
			    rf987.setWtrole(role2);
			    commonService.saveObject(rf987);
			    
				Wtresource funpdshAdd777 = new Wtresource();
				funpdshAdd777.setWtresourceId(18888L);
				funpdshAdd777.setWtfunction(funVolunteer);
				funpdshAdd777.setWtresName("添加");
				funpdshAdd777.setWtresCode("01");
				funpdshAdd777.setWtresCreatetime(date);
				
				Wtfunction funpd12 = new Wtfunction();
				funpd12.setWtfunctionId(131L);
				funpd12.setWtfunParentid(0L);
				funpd12.setWtfunIsleaf("0");
				funpd12.setWtfunCode("21");
				funpd12.setWtfunOrder("21");
				funpd12.setWtfunExcutepath("memberlist.do");
				funpd12.setWtfunName("会员管理");
				funpd12.setWtfunCreatetime(date);
				commonService.saveObject(funpd12);
				
				Wtfunction funmem = new Wtfunction();
				funmem.setWtfunctionId(145L);
				funmem.setWtfunParentid(131L);
				funmem.setWtfunIsleaf("1");
				funmem.setWtfunCode("2101");
				funmem.setWtfunOrder("2101");
				funmem.setWtfunName("信息登记");
				funmem.setWtfunExcutepath("memberlist.do");
				funmem.setWtfunCreatetime(date);
				commonService.saveObject(funmem);
				
				
				Wtrolefunrelationship rf23 = new Wtrolefunrelationship();
				rf23.setWtrolefunId(11135L);
				rf23.setWtfunction(funmem);
				rf23.setWtrole(role);
			    commonService.saveObject(rf23);
			    
			    Wtrolefunrelationship rf24 = new Wtrolefunrelationship();
			    rf24.setWtrolefunId(11136L);
			    rf24.setWtfunction(funmem);
			    rf24.setWtrole(role2);
			    commonService.saveObject(rf24);
			    
			    //会员管理
				Wtrolefunrelationship rf12 = new Wtrolefunrelationship();
				rf12.setWtrolefunId(11024L);
				rf12.setWtfunction(funpd12);
				rf12.setWtrole(role2);
			    commonService.saveObject(rf12);
			    
			    Wtrolefunrelationship rf13 = new Wtrolefunrelationship();
			    rf13.setWtrolefunId(11025L);
			    rf13.setWtfunction(funpd12);
			    rf13.setWtrole(role);
			    commonService.saveObject(rf13);
			    
				Wtfunction funmemHealth = new Wtfunction();
				funmemHealth.setWtfunctionId(137L);
				funmemHealth.setWtfunParentid(131L);
				funmemHealth.setWtfunIsleaf("1");
				funmemHealth.setWtfunCode("2102");
				funmemHealth.setWtfunOrder("2102");
				funmemHealth.setWtfunName("会员健康评估");
				funmemHealth.setWtfunExcutepath("healthEvallistH.do");
				funmemHealth.setWtfunCreatetime(date);
				commonService.saveObject(funmemHealth);
				
				Wtrolefunrelationship rf26 = new Wtrolefunrelationship();
				rf26.setWtrolefunId(11137L);
				rf26.setWtfunction(funmemHealth);
				rf26.setWtrole(role);
			    commonService.saveObject(rf26);
			    
			    Wtrolefunrelationship rf27 = new Wtrolefunrelationship();
			    rf27.setWtrolefunId(11138L);
			    rf27.setWtfunction(funmemHealth);
			    rf27.setWtrole(role2);
			    commonService.saveObject(rf27);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("System data init fail");
		}
		System.out.println("===============  System data init success  ===================");
	}

	public static void main(String[] args) {
	}
}
