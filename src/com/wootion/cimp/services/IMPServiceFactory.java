package com.wootion.cimp.services;


import com.wootion.cmmb.common.formPermission.FormPermissionService;
import com.wootion.cmmb.common.workflow.WorkflowService;
import com.wootion.cmmb.service.activity.ActivityService;
import com.wootion.cmmb.service.activity.BloodpressureService;
import com.wootion.cmmb.service.activity.InstrumentService;
import com.wootion.cmmb.service.activity.SensoryService;
import com.wootion.cmmb.service.careservices.BathrecordService;
import com.wootion.cmmb.service.careservices.HelpcleanService;
import com.wootion.cmmb.service.careservices.OthercareservicesService;
import com.wootion.cmmb.service.careservices.ServiceplanService;
import com.wootion.cmmb.service.careservices.careService;
import com.wootion.cmmb.service.management.ManagementService;
import com.wootion.cmmb.service.psychology.PsychologyService;
import com.wootion.cmmb.service.volunteer.VolunteerService;
import com.wootion.cmmb.service.workflow.WorkflowManageService;
import com.wootion.idp.common.utils.SpringBeanFactory;


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
	
	public static WorkflowManageService getWorkflowMgmService() {
		return (WorkflowManageService) SpringBeanFactory
				.getSpringBean("WorkflowMgmService");
	}
	
	public static WorkflowService getWorkflowService() {
		return (WorkflowService) SpringBeanFactory
				.getSpringBean("WorkflowService");
	}
	
	public static FormPermissionService getFormPermissionService() {
		return (FormPermissionService) SpringBeanFactory
				.getSpringBean("FormPermissionService");
	}
}
