package com.wootion.cmmb.common.formPermission;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;

import com.wootion.cimp.idao.BaseDao;
import com.wootion.cmmb.common.workflow.WorkflowHandle;
import com.wootion.cmmb.persistenc.po.bean.Form;
import com.wootion.cmmb.persistenc.po.bean.FormPermission;
import com.wootion.cmmb.persistenc.po.bean.Workflow;
import com.wootion.cmmb.persistenc.po.bean.WorkflowBills;
import com.wootion.idp.common.utils.DomainUtil;
import com.wootion.idp.common.utils.EntityIDFactory;
import com.wootion.idp.persistence.dao.CommonDao;

public class FormPermissionServiceImpl implements FormPermissionService {

	private CommonDao commonDao;
	private BaseDao baseDao;

	/* (non-Javadoc)
	 * @see com.wootion.cmmb.common.formPermission.FormPermissionService#saveOrUpdateFormPermission(java.lang.String, com.wootion.cmmb.common.workflow.WorkflowHandle, java.lang.Long)
	 */
	@Override
	public void saveOrUpdateFormPermission(String billid, WorkflowHandle action, Long handleUserid) {
		String currentHandleUsers = StringUtils.EMPTY;
		FormPermission permission = null;
		WorkflowBills workflowBill = getWorkflowBill(action.getFormid(), billid);
		if (workflowBill != null) {
			currentHandleUsers = workflowBill.getCurrentHandleUsers();
		}else{
			currentHandleUsers = handleUserid.toString();
		}
		List<FormPermission> result = baseDao.find("from FormPermission t where t.billid=?", billid);
		if(result!=null&&result.size()>0){
			permission = result.get(0);
			permission.setCurrentHandleUsers(currentHandleUsers);
			String historyHandleUsers = permission.getHistoryHandleUsers();
			if(historyHandleUsers == null) historyHandleUsers = StringUtils.EMPTY;
			permission.setHistoryHandleUsers(historyHandleUsers+","+currentHandleUsers);
			permission.setLastUpdTime(new Date());
			commonDao.updateObject(permission);
		}else{
			permission = new FormPermission();
			permission.setId(EntityIDFactory.getBeanID());
			permission.setCurrentHandleUsers(currentHandleUsers);
			permission.setHistoryHandleUsers(currentHandleUsers);
			permission.setLastUpdTime(new Date());
			permission.setBillid(billid);
			commonDao.saveObject(permission);
		}

	}
	
	/* (non-Javadoc)
	 * @see com.wootion.cmmb.common.formPermission.FormPermissionService#deleteFormPermission(java.lang.String)
	 */
	@Override
	public void deleteFormPermission(String billid) {
		@SuppressWarnings("unchecked")
		List<FormPermission> result = baseDao.find("from FormPermission where billid=?", billid);
		if(result != null && result.size()>0) {
			baseDao.delete(result.get(0));
		}
	}

	private WorkflowBills getWorkflowBill(Long formid, String billid) {
		Form form = commonDao.getObject(Form.class, formid);
		Workflow workflow = form.getWorkflow();
		WorkflowBills currentBill = null;
		if (workflow != null && DomainUtil.isWorkflowUseful(workflow)) {
			Set<WorkflowBills> bills = workflow.getBills();
			for (WorkflowBills bill : bills) {
				if (bill.getBillid().equals(billid)) {
					currentBill = bill;
					break;
				}
			}
		}
		return currentBill;
	}

	@Override
	public boolean checkPermission(String currentUserId, String billid) {
		List<FormPermission> result = baseDao.find("from FormPermission where billid=?", billid);
		if(result != null && result.size()>0) {
			FormPermission formPermission = result.get(0);
			if(formPermission.getCurrentHandleUsers().indexOf(currentUserId)<0) {
				return false;
			}
		}
		return true;
		
	}

	public CommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

}
