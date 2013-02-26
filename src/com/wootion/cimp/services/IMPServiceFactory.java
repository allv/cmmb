package com.wootion.cimp.services;


import com.wootion.idp.common.utils.SpringBeanFactory;
import com.wootion.cmmb.service.activity.*;
import com.wootion.cmmb.service.psychology.*;
import com.wootion.cmmb.service.careservices.*;
import com.wootion.cmmb.service.management.ManagementService;
import com.wootion.cmmb.service.volunteer.VolunteerService;


public class IMPServiceFactory {
	public static projectService getProjectService() {
		return (projectService) SpringBeanFactory
				.getSpringBean("projectService");
	}  
	  
	public static memberService getMemberService() {
		return (memberService) SpringBeanFactory
				.getSpringBean("memberService");
	}
	
	public static memberHealthService getMemberHealthService() {
		return (memberHealthService) SpringBeanFactory
				.getSpringBean("memberHealthService");
	}
	
	public static ActivityService getActivityService() {
		return (ActivityService) SpringBeanFactory
				.getSpringBean("ActivityService");
	}
	
	public static PsychologyService getPsychologyService() {
		return (PsychologyService) SpringBeanFactory
				.getSpringBean("PsychologyService");
	}
	
	public static SensoryService getSensoryService() {
		return (SensoryService) SpringBeanFactory
				.getSpringBean("SensoryService");
	}
	
	public static BathrecordService getBathrecordService() {
		return (BathrecordService) SpringBeanFactory
				.getSpringBean("BathrecordService");
	}
	
	public static BloodpressureService getBloodpressureService() {
		return (BloodpressureService) SpringBeanFactory
				.getSpringBean("BloodpressureService");
	}
	
	public static HelpcleanService getHelpcleanService() {
		return (HelpcleanService) SpringBeanFactory
				.getSpringBean("HelpcleanService");
	}
	
	public static OthercareservicesService getOthercareservicesService() {
		return (OthercareservicesService) SpringBeanFactory
				.getSpringBean("OthercareservicesService");
	}
	
	public static ServiceplanService getServiceplanService() {
		return (ServiceplanService) SpringBeanFactory
				.getSpringBean("ServiceplanService");
	}
	
	public static careService getCareService(){
		return (careService) SpringBeanFactory
		.getSpringBean("careService");
	}
	public static ManagementService getManagementService() {
		return (ManagementService) SpringBeanFactory
				.getSpringBean("ManagementService");
	}
	
	public static InstrumentService getInstrumentService() {
		return (InstrumentService) SpringBeanFactory
				.getSpringBean("InstrumentService");
	}
	
	public static VolunteerService getVolunteerService() {
		return (VolunteerService) SpringBeanFactory
				.getSpringBean("VolunteerService");
	}
}
