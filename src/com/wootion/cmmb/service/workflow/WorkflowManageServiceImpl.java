package com.wootion.cmmb.service.workflow;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

import org.apache.commons.lang.StringUtils;

import com.wootion.cmmb.common.workflow.WorkflowDAO;
import com.wootion.cmmb.persistenc.po.bean.Form;
import com.wootion.cmmb.persistenc.po.bean.Workflow;
import com.wootion.cmmb.persistenc.po.bean.WorkflowBills;
import com.wootion.cmmb.persistenc.po.bean.WorkflowNodes;
import com.wootion.idp.common.utils.EntityIDFactory;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.BaseServiceImpl;

public class WorkflowManageServiceImpl extends BaseServiceImpl implements
		WorkflowManageService {

	private WorkflowDAO workflowDao;

	@Override
	public QueryResult<Workflow> queryWorkflowsResult(Integer firstindex,
			Integer maxresult, String startDate, String endDate,
			String workflowName) {
		String whererjpql = " o.deleted=0 ";
		if (startDate != null && !startDate.trim().equals("")) {
			whererjpql = whererjpql + " and o.createtime >= '" + startDate
					+ "'";
		}
		if (endDate != null && !endDate.trim().equals("")) {
			whererjpql = whererjpql + " and o.createtime <= '" + endDate + "'";
		}
		if (workflowName != null && !workflowName.trim().equals("")) {
			whererjpql = whererjpql + " and o.name like '%" + workflowName
					+ "%'";
		}
		return this.commonDao.getScrollData(Workflow.class, "id", firstindex,
				maxresult, whererjpql, null, null);
	}

	@Override
	public boolean deleteWorkflow(long workflowId) {
		Workflow workflow = commonDao.getObject(Workflow.class, workflowId);
		if (checkAssociatedBills(workflow))
			return false;
		commonDao.deleteObject(workflow);
		return true;
	}

	private boolean checkAssociatedBills(Workflow workflow) {
		Set<WorkflowBills> bills = workflow.getBills();
		if (bills != null) {
			for (WorkflowBills bill : bills) {
				if (!bill.isEnded())
					return true;
			}
		}
		return false;
	}

	@Override
	public boolean modifyWorkflowStatus(long workflowId) {
		Workflow workflow = commonDao.getObject(Workflow.class, workflowId);
		if (workflow.isUsefulness()) {
			// 要禁用的话，得先判断是否有关联单据
			if (checkAssociatedBills(workflow))
				return false;
			workflow.setUseful(Workflow.WORKFLOW_UN_USEFUL);
		} else {
			workflow.setUseful(Workflow.WORKFLOW_USEFUL);
		}
		commonDao.updateObject(workflow);
		return true;
	}

	@Override
	public boolean modifyWorkflow(String workflowid, String jsonNodes) {
		Workflow workflow = commonDao.getObject(Workflow.class,
				Long.parseLong(workflowid));
		if (workflow.isUsefulness()) {
			// 要编辑的话，得先判断是否有关联单据
			if (checkAssociatedBills(workflow))
				return false;
		}
		if (workflow.getNodes() != null) {
			for (WorkflowNodes node : workflow.getNodes()) {
				commonDao.deleteObject(node);
			}
		}
		workflow.getNodes().clear();
		JSONArray jsonArray = (JSONArray) JSONSerializer.toJSON(jsonNodes);
		if (jsonArray != null) {
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				JsonConfig jsonConfig = new JsonConfig();
				jsonConfig.setRootClass(WorkflowNodes.class);
				WorkflowNodes node = (WorkflowNodes) JSONSerializer.toJava(
						jsonObject, jsonConfig);
				node.setCreatetime(new Date());
				node.setId(EntityIDFactory.getBeanID());
				node.setWorkflow(workflow);
				workflow.getNodes().add(node);
			}
		}
		workflow.generateNextNodeType();
		commonDao.updateObject(workflow);
		return true;
	}

	@Override
	public Workflow getWorkflow(String mid) {
		Workflow workflow = commonDao.getObject(Workflow.class,
				Long.parseLong(mid));
		Set<WorkflowNodes> nodes = workflow.getNodes();
		if (nodes != null) {
			for (WorkflowNodes node : nodes) {
				String hanleUsers = node.getHanleUsers();
				StringBuilder hanleUsersWithName = new StringBuilder();
				if (hanleUsers != null) {
					String[] users = hanleUsers.split(",");
					for (String userid : users) {
						if (StringUtils.isNotEmpty(userid)) {
							Wtuser wtuser = commonDao.getObject(Wtuser.class,
									Long.parseLong(userid));
							hanleUsersWithName.append(wtuser.getCorpName())
									.append(",");
						}
					}
				}
				node.setHanleUsersWithName(hanleUsersWithName.toString());
			}
		}
		return workflow;
	}

	@Override
	public boolean addWorkflow(String formid, String workflowName,
			String jsonNodes, String workflowDescription) {
		Form form = commonDao.getObject(Form.class, Long.parseLong(formid));
		Workflow workflow = new Workflow();
		workflow.setForm(form);
		workflow.setId(EntityIDFactory.getBeanID());
		workflow.setCreatetime(new Date());
		workflow.setDescription(workflowDescription);
		workflow.setName(workflowName);
		workflow.setUseful(Workflow.WORKFLOW_USEFUL);
		workflow.setDeleted(Workflow.WORKFLOW_UN_DELETED);
		JSONArray jsonArray = (JSONArray) JSONSerializer.toJSON(jsonNodes);
		if (jsonArray != null) {
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				JsonConfig jsonConfig = new JsonConfig();
				jsonConfig.setRootClass(WorkflowNodes.class);
				WorkflowNodes node = (WorkflowNodes) JSONSerializer.toJava(
						jsonObject, jsonConfig);
				node.setCreatetime(new Date());
				node.setId(EntityIDFactory.getBeanID());
				node.setWorkflow(workflow);
				workflow.getNodes().add(node);
			}
		}
		workflow.generateNextNodeType();
		commonDao.saveObject(workflow);
		return true;
	}

	@Override
	public List<Form> searchUnAssignedForms() {
		List<Form> forms =  commonDao.getObjects(Form.class);
		List<Form> result = new ArrayList<Form>();
		if (forms != null) {
			for (Form form : forms) {
				if (form.getWorkflow() == null) {
					result.add(form);
				}
			}
		}
		return result;
	}

	public WorkflowDAO getWorkflowDao() {
		return workflowDao;
	}

	public void setWorkflowDao(WorkflowDAO workflowDao) {
		this.workflowDao = workflowDao;
	}

}
