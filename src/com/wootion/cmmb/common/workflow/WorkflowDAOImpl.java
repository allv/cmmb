package com.wootion.cmmb.common.workflow;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.wootion.cmmb.persistenc.po.bean.WorkflowRecords;

public class WorkflowDAOImpl extends HibernateDaoSupport implements WorkflowDAO {


	@Override
	public WorkflowRecords getMaxWorkflowRecords(String workflowid,
			String billid) {
		String hql = "from WorkflowRecords t ";
		String where = " where t.workflow.id = "+ workflowid + " and t.billid = " + billid;
		String sort = " order by t.sort desc ";
		
		List<WorkflowRecords> result = this.getHibernateTemplate().find(hql+where+sort);
		return result.get(0);
	}
}
