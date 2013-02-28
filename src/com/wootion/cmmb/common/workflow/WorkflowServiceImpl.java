package com.wootion.cmmb.common.workflow;

import java.util.Date;
import java.util.Set;

import com.wootion.cmmb.persistenc.po.bean.Form;
import com.wootion.cmmb.persistenc.po.bean.Workflow;
import com.wootion.cmmb.persistenc.po.bean.WorkflowBills;
import com.wootion.cmmb.persistenc.po.bean.WorkflowNodes;
import com.wootion.cmmb.persistenc.po.bean.WorkflowRecords;
import com.wootion.idp.common.utils.EntityIDFactory;
import com.wootion.idp.persistence.dao.CommonDao;
import com.wootion.idp.persistence.po.bean.Wtuser;

public class WorkflowServiceImpl implements WorkflowService {

	private CommonDao commonDao;
	private WorkflowDAO workflowDao;

	@Override
	public void submit(Long formid, Long handleUserid, String billid,
			String remark) {
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
			newBill.setBillStatus(WorkflowParameter.BILL_STATUS_SUBMIT);
			newBill.addCurrentHandleUsers(handleUserid.toString());
			newBill.setCurrentLevel(1);
			newBill.setWorkflow(workflow);
			newBill.setId(EntityIDFactory.getBeanID());

			Set<WorkflowNodes> nodes = workflow.getNodes();
			for (WorkflowNodes node : nodes) {
				if (node.getLevel() == 1) {
					if (node.getNextNodeType() == WorkflowParameter.NODE_TYPE_AUDIT) {
						newBill.setNextHandleType(WorkflowParameter.HANDLE_TYPE_AUDIT);
					} else if (node.getNextNodeType() == WorkflowParameter.NODE_TYPE_SUBMIT) {
						newBill.setNextHandleType(WorkflowParameter.HANDLE_TYPE_SUBMIT);
					} else {
						newBill.setNextHandleType(null);
					}
				}
			}
			commonDao.saveObject(newBill);

			WorkflowRecords record = new WorkflowRecords();
			record.setBillid(billid);
			record.setHandletime(new Date());
			record.setHandleType(WorkflowParameter.HANDLE_TYPE_SUBMIT);
			record.setHandleUser(commonDao
					.getObject(Wtuser.class, handleUserid));
			record.setId(EntityIDFactory.getBeanID());
			record.setLevel(1);
			record.setSort(1);
			record.setWorkflow(workflow);
			record.setRemark(remark);
			commonDao.saveObject(record);

		} else {

			currentBill.setCurrentLevel(currentBill.getCurrentLevel() + 1);
			currentBill.addCurrentHandleUsers(handleUserid.toString());
			currentBill.setBillStatus(WorkflowParameter.BILL_STATUS_SUBMIT);
			Set<WorkflowNodes> nodes = workflow.getNodes();
			for (WorkflowNodes node : nodes) {
				if (node.getLevel() == (currentBill.getCurrentLevel() + 1)) {
					if (node.getNextNodeType() == WorkflowParameter.NODE_TYPE_AUDIT) {
						currentBill
								.setNextHandleType(WorkflowParameter.HANDLE_TYPE_AUDIT);
					} else if (node.getNextNodeType() == WorkflowParameter.NODE_TYPE_SUBMIT) {
						currentBill
								.setNextHandleType(WorkflowParameter.HANDLE_TYPE_SUBMIT);
					} else {
						currentBill.setNextHandleType(null);
					}
				}
			}
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
			record.setLevel(maxWorkflowRecords.getLevel() + 1);
			record.setSort(maxWorkflowRecords.getSort() + 1);
			record.setWorkflow(workflow);
			record.setRemark(remark);
			commonDao.saveObject(record);

		}

	}

	@Override
	public void audit(Long formid, Long handleUserid, String billid,
			String remark) {

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
			newBill.setBillStatus(WorkflowParameter.BILL_STATUS_AUDIT);
			newBill.addCurrentHandleUsers(handleUserid.toString());
			newBill.setCurrentLevel(1);
			newBill.setWorkflow(workflow);
			newBill.setId(EntityIDFactory.getBeanID());
			newBill.setNextHandleType(null);
			commonDao.saveObject(newBill);

			WorkflowRecords record = new WorkflowRecords();
			record.setBillid(billid);
			record.setHandletime(new Date());
			record.setHandleType(WorkflowParameter.BILL_STATUS_AUDIT);
			record.setHandleUser(commonDao
					.getObject(Wtuser.class, handleUserid));
			record.setId(EntityIDFactory.getBeanID());
			record.setLevel(1);
			record.setSort(1);
			record.setWorkflow(workflow);
			record.setRemark(remark);
			commonDao.saveObject(record);

		} else {

			currentBill.setCurrentLevel(currentBill.getCurrentLevel() + 1);
			currentBill.addCurrentHandleUsers(handleUserid.toString());
			currentBill.setBillStatus(WorkflowParameter.BILL_STATUS_AUDIT);
			currentBill.setNextHandleType(null);
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
			record.setLevel(maxWorkflowRecords.getLevel() + 1);
			record.setSort(maxWorkflowRecords.getSort() + 1);
			record.setWorkflow(workflow);
			record.setRemark(remark);
			commonDao.saveObject(record);

		}
	}

	public void reject(Long formid, Long handleUserid, String billid,
			String rejectReason) {

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
		currentBill.addCurrentHandleUsers(handleUserid.toString());
		currentBill.setBillStatus(WorkflowParameter.BILL_STATUS_SAVE);
		Set<WorkflowNodes> nodes = workflow.getNodes();
		for (WorkflowNodes node : nodes) {
			if (node.getLevel() == (currentBill.getCurrentLevel() + 1)) {
				if (node.getNextNodeType() == WorkflowParameter.NODE_TYPE_AUDIT) {
					currentBill
							.setNextHandleType(WorkflowParameter.HANDLE_TYPE_AUDIT);
				} else if (node.getNextNodeType() == WorkflowParameter.NODE_TYPE_SUBMIT) {
					currentBill
							.setNextHandleType(WorkflowParameter.HANDLE_TYPE_SUBMIT);
				} else {
					currentBill.setNextHandleType(null);
				}
			}
		}
		currentBill.setRejectReason(rejectReason);
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
	public void back(Long formid, Long handleUserid, String billid,
			String remark) {
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
		currentBill.addCurrentHandleUsers(handleUserid.toString());
		currentBill.setBillStatus(WorkflowParameter.BILL_STATUS_SUBMIT);
		currentBill.setNextHandleType(WorkflowParameter.HANDLE_TYPE_SUBMIT);
		commonDao.updateObject(currentBill);

		WorkflowRecords maxWorkflowRecords = workflowDao.getMaxWorkflowRecords(
				workflow.getId().toString(), billid);
		WorkflowRecords record = new WorkflowRecords();
		record.setBillid(billid);
		record.setHandletime(new Date());
		record.setHandleType(WorkflowParameter.HANDLE_TYPE_BACK);
		record.setHandleUser(commonDao.getObject(Wtuser.class, handleUserid));
		record.setId(EntityIDFactory.getBeanID());
		record.setLevel(maxWorkflowRecords.getLevel() + 1);
		record.setSort(maxWorkflowRecords.getSort() + 1);
		record.setWorkflow(workflow);
		record.setRemark(remark);
		commonDao.saveObject(record);
	}

}
