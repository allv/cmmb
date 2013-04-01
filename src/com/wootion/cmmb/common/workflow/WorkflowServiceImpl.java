package com.wootion.cmmb.common.workflow;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.wootion.cmmb.persistenc.po.bean.Form;
import com.wootion.cmmb.persistenc.po.bean.Workflow;
import com.wootion.cmmb.persistenc.po.bean.WorkflowBills;
import com.wootion.cmmb.persistenc.po.bean.WorkflowNodes;
import com.wootion.cmmb.persistenc.po.bean.WorkflowRecords;
import com.wootion.idp.common.utils.DomainUtil;
import com.wootion.idp.common.utils.EntityIDFactory;
import com.wootion.idp.persistence.dao.CommonDao;
import com.wootion.idp.persistence.po.bean.Wtuser;

public class WorkflowServiceImpl implements WorkflowService {

	private CommonDao commonDao;
	private WorkflowDAO workflowDao;

	@Override
	public void submit(WorkflowHandle action, Long handleUserid, String remark) {
		Long formid = action.getFormid();
		String billid = action.getBillid();
		Form form = commonDao.getObject(Form.class, formid);
		Workflow workflow = form.getWorkflow();
		Set<WorkflowBills> bills = workflow.getBills();
		boolean existBill = false;
		WorkflowBills currentBill = null;
		for (WorkflowBills bill : bills) {
			if (bill.getBillid().equals(billid)) {
				existBill = true;
				currentBill = bill;
				break;
			}
		}
		if (!existBill) {
			WorkflowBills newBill = new WorkflowBills();
			newBill.setBillid(billid);
			newBill.setWorkflow(workflow);
			newBill.setId(EntityIDFactory.getBeanID());

			Set<WorkflowNodes> nodes = workflow.getNodes();
			for (WorkflowNodes node : nodes) {
				if (node.getLevel() == 2) {
					newBill.setCurrentLevel(node.getLevel());
					if (node.getNodeType().equals(
							WorkflowParameter.NODE_TYPE_SUBMIT)) {
						newBill.setBillStatus(WorkflowParameter.BILL_STATUS_SUBMIT);
						newBill.setHandleType(WorkflowParameter.HANDLE_TYPE_SUBMIT);
					} else if (node.getNodeType().equals(
							WorkflowParameter.NODE_TYPE_AUDIT)) {
						newBill.setBillStatus(WorkflowParameter.BILL_STATUS_AUDIT);
						newBill.setHandleType(WorkflowParameter.HANDLE_TYPE_AUDIT);
					} else {
						newBill.setBillStatus(WorkflowParameter.BILL_STATUS_AUDITED);
						newBill.setHandleType(null);
					}
					newBill.setCurrentHandleUsers(node.getHanleUsers());
					break;
				}
			}
			newBill.setHandleTime(new Date());
			commonDao.saveObject(newBill);

			WorkflowRecords record = new WorkflowRecords();
			record.setBillid(billid);
			record.setHandletime(new Date());
			record.setHandleType(WorkflowParameter.HANDLE_TYPE_SAVE);
			record.setHandleUser(commonDao
					.getObject(Wtuser.class, handleUserid));
			record.setId(EntityIDFactory.getBeanID());
			record.setLevel(0);
			record.setSort(1);
			record.setWorkflow(workflow);
			record.setRemark(remark);
			commonDao.saveObject(record);

			WorkflowRecords record1 = new WorkflowRecords();
			record1.setBillid(billid);
			record1.setHandletime(new Date());
			record1.setHandleType(WorkflowParameter.HANDLE_TYPE_SUBMIT);
			record1.setHandleUser(commonDao.getObject(Wtuser.class,
					handleUserid));
			record1.setId(EntityIDFactory.getBeanID());
			record1.setLevel(1);
			record1.setSort(2);
			record1.setWorkflow(workflow);
			record1.setRemark(remark);
			commonDao.saveObject(record1);

		} else {
			Set<WorkflowNodes> nodes = workflow.getNodes();
			int currentLevel = currentBill.getCurrentLevel();
			for (WorkflowNodes node : nodes) {
				if (node.getLevel().equals(currentBill.getCurrentLevel())) {
					currentBill.setCurrentHandleUsers(handleUserid.toString());
					if (node.getNextNodeType().equals(
							WorkflowParameter.NODE_TYPE_AUDIT)) {
						currentBill
								.setHandleType(WorkflowParameter.HANDLE_TYPE_AUDIT);
						currentBill
								.setBillStatus(WorkflowParameter.BILL_STATUS_AUDIT);
						currentBill.setCurrentLevel(node.getLevel() + 1);
					} else if (node.getNextNodeType().equals(
							WorkflowParameter.NODE_TYPE_SUBMIT)) {
						currentBill
								.setHandleType(WorkflowParameter.HANDLE_TYPE_SUBMIT);
						currentBill
								.setBillStatus(WorkflowParameter.BILL_STATUS_SUBMIT);
						currentBill.setCurrentLevel(node.getLevel() + 1);
					} else {
						currentBill
								.setBillStatus(WorkflowParameter.BILL_STATUS_AUDITED);
						currentBill.setHandleType(null);
					}
					break;
				}
			}
			currentBill.setHandleTime(new Date());
			commonDao.updateObject(currentBill);

			WorkflowRecords maxWorkflowRecords = workflowDao
					.getMaxWorkflowRecords(workflow.getId().toString(), billid);

			WorkflowRecords record = new WorkflowRecords();
			record.setBillid(billid);
			record.setHandletime(new Date());
			record.setHandleType(WorkflowParameter.HANDLE_TYPE_SUBMIT);
			record.setHandleUser(commonDao
					.getObject(Wtuser.class, handleUserid));
			record.setId(EntityIDFactory.getBeanID());
			record.setLevel(currentLevel);
			record.setSort(maxWorkflowRecords.getSort() + 1);
			record.setWorkflow(workflow);
			record.setRemark(remark);
			commonDao.saveObject(record);

		}

	}

	@Override
	public void audit(WorkflowHandle action, Long handleUserid, String remark) {
		Long formid = action.getFormid();
		String billid = action.getBillid();
		Form form = commonDao.getObject(Form.class, formid);
		Workflow workflow = form.getWorkflow();
		Set<WorkflowBills> bills = workflow.getBills();
		boolean existBill = false;
		WorkflowBills currentBill = null;
		for (WorkflowBills bill : bills) {
			if (bill.getBillid().equals(billid)) {
				existBill = true;
				currentBill = bill;
				break;
			}
		}
		if (existBill) {
			int currentLevel = currentBill.getCurrentLevel();
			currentBill.setCurrentLevel(currentBill.getCurrentLevel() + 1);
			currentBill.setCurrentHandleUsers(null);
			currentBill.setBillStatus(WorkflowParameter.BILL_STATUS_AUDITED);
			currentBill.setHandleType(null);
			currentBill.setHandleTime(new Date());
			commonDao.updateObject(currentBill);

			WorkflowRecords maxWorkflowRecords = workflowDao
					.getMaxWorkflowRecords(workflow.getId().toString(), billid);

			WorkflowRecords record = new WorkflowRecords();
			record.setBillid(billid);
			record.setHandletime(new Date());
			record.setHandleType(WorkflowParameter.HANDLE_TYPE_AUDIT);
			record.setHandleUser(commonDao
					.getObject(Wtuser.class, handleUserid));
			record.setId(EntityIDFactory.getBeanID());
			record.setLevel(currentLevel);
			record.setSort(maxWorkflowRecords.getSort() + 1);
			record.setWorkflow(workflow);
			record.setRemark(remark);
			commonDao.saveObject(record);
		}
	}

	@Override
	public void reject(WorkflowHandle action, Long handleUserid,
			String rejectReason) {
		Long formid = action.getFormid();
		String billid = action.getBillid();
		Form form = commonDao.getObject(Form.class, formid);
		Workflow workflow = form.getWorkflow();
		Set<WorkflowBills> bills = workflow.getBills();
		WorkflowBills currentBill = null;
		for (WorkflowBills bill : bills) {
			if (bill.getBillid().equals(billid)) {
				currentBill = bill;
				break;
			}
		}

		currentBill.setCurrentLevel(0);
		Set<WorkflowNodes> nodes = workflow.getNodes();
		for (WorkflowNodes node : nodes) {
			if (node.getLevel() == 0) {
				currentBill.setCurrentHandleUsers(node.getHanleUsers());
				if (node.getNodeType().equals(
						WorkflowParameter.NODE_TYPE_SUBMIT)) {
					currentBill
							.setHandleType(WorkflowParameter.HANDLE_TYPE_SUBMIT);
					currentBill
							.setBillStatus(WorkflowParameter.BILL_STATUS_SUBMIT);
				} else if (node.getNodeType().equals(
						WorkflowParameter.NODE_TYPE_SAVE)) {
					currentBill
							.setHandleType(WorkflowParameter.HANDLE_TYPE_SUBMIT);
					currentBill
							.setBillStatus(WorkflowParameter.BILL_STATUS_SAVE);
				} else {
					currentBill
							.setBillStatus(WorkflowParameter.BILL_STATUS_AUDITED);
					currentBill.setHandleType(null);
				}
				break;
			}
		}
		currentBill.setRejectReason(rejectReason);
		currentBill.setHandleTime(new Date());
		commonDao.updateObject(currentBill);

		WorkflowRecords maxWorkflowRecords = workflowDao.getMaxWorkflowRecords(
				workflow.getId().toString(), billid);
		WorkflowRecords record = new WorkflowRecords();
		record.setBillid(billid);
		record.setHandletime(new Date());
		record.setHandleType(WorkflowParameter.HANDLE_TYPE_REJECT);
		record.setHandleUser(commonDao.getObject(Wtuser.class, handleUserid));
		record.setId(EntityIDFactory.getBeanID());
		record.setLevel(maxWorkflowRecords.getLevel() + 1);
		record.setSort(maxWorkflowRecords.getSort() + 1);
		record.setWorkflow(workflow);
		record.setRemark(rejectReason);
		commonDao.saveObject(record);

	}

	@Override
	public void back(WorkflowHandle action, Long handleUserid, String remark) {
		Long formid = action.getFormid();
		String billid = action.getBillid();
		Form form = commonDao.getObject(Form.class, formid);
		Workflow workflow = form.getWorkflow();
		Set<WorkflowBills> bills = workflow.getBills();
		WorkflowBills currentBill = null;
		for (WorkflowBills bill : bills) {
			if (bill.getBillid().equals(billid)) {
				currentBill = bill;
				break;
			}
		}

		currentBill.setCurrentLevel(currentBill.getCurrentLevel() - 1);
		Set<WorkflowNodes> nodes = workflow.getNodes();
		for (WorkflowNodes node : nodes) {
			if (node.getLevel().equals(currentBill.getCurrentLevel())) {
				currentBill.setCurrentHandleUsers(node.getHanleUsers());
				if (node.getNodeType().equals(
						WorkflowParameter.NODE_TYPE_SUBMIT)) {
					currentBill
							.setHandleType(WorkflowParameter.HANDLE_TYPE_SUBMIT);
					currentBill
							.setBillStatus(WorkflowParameter.BILL_STATUS_SUBMIT);
				} else if (node.getNodeType().equals(
						WorkflowParameter.NODE_TYPE_SAVE)) {
					currentBill
							.setHandleType(WorkflowParameter.HANDLE_TYPE_SUBMIT);
					currentBill
							.setBillStatus(WorkflowParameter.BILL_STATUS_SAVE);
				} else {
					currentBill
							.setBillStatus(WorkflowParameter.BILL_STATUS_AUDITED);
					currentBill.setHandleType(null);
				}
				break;
			}
		}
		currentBill.setHandleTime(new Date());
		commonDao.updateObject(currentBill);

		WorkflowRecords maxWorkflowRecords = workflowDao.getMaxWorkflowRecords(
				workflow.getId().toString(), billid);
		WorkflowRecords record = new WorkflowRecords();
		record.setBillid(billid);
		record.setHandletime(new Date());
		record.setHandleType(WorkflowParameter.HANDLE_TYPE_BACK);
		record.setHandleUser(commonDao.getObject(Wtuser.class, handleUserid));
		record.setId(EntityIDFactory.getBeanID());
		record.setLevel(maxWorkflowRecords.getLevel() - 1);
		record.setSort(maxWorkflowRecords.getSort() + 1);
		record.setWorkflow(workflow);
		record.setRemark(remark);
		commonDao.saveObject(record);
	}

	private WorkflowBills findWorkflowBill(String billid, Long formid) {
		List<WorkflowBills> bills = workflowDao
				.findWorkflowBill(billid, formid);
		if (bills != null && bills.size() > 0) {
			return bills.get(0);
		}
		return null;
	}

	@Override
	public void viewWorkflowBill(WorkflowHandle action,
			HttpServletRequest request) {
		Long formid = action.getFormid();
		String billid = action.getBillid();
		Form form = commonDao.getObject(Form.class, formid);
		if (form.getWorkflow() != null
				&& DomainUtil.isWorkflowUseful(form.getWorkflow())) {
			WorkflowBills bill = this.findWorkflowBill(billid, formid);
			if (bill != null) {
				request.setAttribute(WorkflowParameter.SHOWWORKFLOW_FLAG, true);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWQUERY_FLAG, true);
			}else{
				request.setAttribute(WorkflowParameter.SHOWWORKFLOW_FLAG, false);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWQUERY_FLAG, false);
			}
			request.setAttribute(WorkflowParameter.SHOWWORKFLOWAUDIT_FLAG, false);
			request.setAttribute(WorkflowParameter.SHOWWORKFLOWREJECT_FLAG, false);
			request.setAttribute(WorkflowParameter.SHOWWORKFLOWSUBMIT_FLAG, false);
		} else {
			request.setAttribute(WorkflowParameter.SHOWWORKFLOW_FLAG, false);
		}
	}

	@Override
	public void checkWorkflowBill(WorkflowHandle action,
			HttpServletRequest request) {
		Long formid = action.getFormid();
		String billid = action.getBillid();
		Form form = commonDao.getObject(Form.class, formid);
		if (form.getWorkflow() != null
				&& DomainUtil.isWorkflowUseful(form.getWorkflow())) {
			request.setAttribute(WorkflowParameter.SHOWWORKFLOW_FLAG, true);
		} else {
			request.setAttribute(WorkflowParameter.SHOWWORKFLOW_FLAG, false);
		}
		WorkflowBills bill = this.findWorkflowBill(billid, formid);
		if (bill != null) {
			request.setAttribute(WorkflowParameter.SHOWWORKFLOWQUERY_FLAG, true);
			if (bill.getBillStatus().equals(
					WorkflowParameter.BILL_STATUS_AUDITED)) {
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWAUDIT_FLAG,
						false);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWREJECT_FLAG,
						false);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWSUBMIT_FLAG,
						false);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWBACK_FLAG,
						false);
			} else if (bill.getBillStatus().equals(
					WorkflowParameter.BILL_STATUS_AUDIT)) {
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWAUDIT_FLAG,
						true);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWREJECT_FLAG,
						true);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWSUBMIT_FLAG,
						false);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWBACK_FLAG,
						false);
			} else if (bill.getBillStatus().equals(
					WorkflowParameter.BILL_STATUS_SUBMIT)) {
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWAUDIT_FLAG,
						false);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWREJECT_FLAG,
						false);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWSUBMIT_FLAG,
						true);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWBACK_FLAG,
						true);
			} else if (bill.getBillStatus().equals(
					WorkflowParameter.BILL_STATUS_SAVE)) {
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWAUDIT_FLAG,
						false);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWREJECT_FLAG,
						false);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWSUBMIT_FLAG,
						true);
				request.setAttribute(WorkflowParameter.SHOWWORKFLOWBACK_FLAG,
						false);
			}
		} else {
			request.setAttribute(WorkflowParameter.SHOWWORKFLOWQUERY_FLAG,
					false);
			request.setAttribute(WorkflowParameter.SHOWWORKFLOWAUDIT_FLAG,
					false);
			request.setAttribute(WorkflowParameter.SHOWWORKFLOWREJECT_FLAG,
					false);
			request.setAttribute(WorkflowParameter.SHOWWORKFLOWSUBMIT_FLAG,
					true);
		}
	}

	@Override
	public Workflow getWorkflow(Long formid) {
		Form form = commonDao.getObject(Form.class, formid);
		return form.getWorkflow();
	}

	@Override
	public WorkflowBills getWorkflowBill(Long formid, String billid) {
		Form form = commonDao.getObject(Form.class, formid);
		Workflow workflow = form.getWorkflow();
		WorkflowBills currentBill = null;
		if(workflow != null && DomainUtil.isWorkflowUseful(workflow)) {
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
	public List<WorkflowRecords> getWorkflowRecords(Long formid, String billid) {
		List<WorkflowRecords> findWorkflowRecords = workflowDao.findWorkflowRecords(billid, formid);
		Collections.sort(findWorkflowRecords, new Comparator<WorkflowRecords>() {

			@Override
			public int compare(WorkflowRecords o1, WorkflowRecords o2) {
				return o1.getSort() - o2.getSort();
			}
		});
		return findWorkflowRecords;
	}

	@Override
	public String getUsersName(String currentHandleUserIds) {
		if (currentHandleUserIds != null) {
			StringBuilder result = new StringBuilder();
			String[] ids = currentHandleUserIds.split(",");
			for (String userid : ids) {
				if (StringUtils.isNotEmpty(userid)) {
					Wtuser user = commonDao.getObject(Wtuser.class,
							Long.parseLong(userid));
					result.append(user.getCorpName()).append(",");
				}
			}
			return result.toString();
		}
		return StringUtils.EMPTY;
	}

	@Override
	public void deleteWorkflowBill(WorkflowHandle action) {
		Long formid = action.getFormid();
		String billid = action.getBillid();
		List<WorkflowBills> bills = workflowDao.findWorkflowBill(billid, formid);
		WorkflowBills currentBill = null;
		if(bills != null && bills.size() > 0 ){
			currentBill = bills.get(0);
		}
		if(currentBill != null ) {
			currentBill.setBillStatus(WorkflowParameter.BILL_STATUS_DELETED);
			currentBill.setHandleTime(new Date());
			commonDao.updateObject(currentBill);
		}
	}

	public CommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public WorkflowDAO getWorkflowDao() {
		return workflowDao;
	}

	public void setWorkflowDao(WorkflowDAO workflowDao) {
		this.workflowDao = workflowDao;
	}

}
