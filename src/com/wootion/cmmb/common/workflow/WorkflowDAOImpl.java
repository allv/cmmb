package com.wootion.cmmb.common.workflow;

import java.util.List;
import java.util.Set;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.wootion.cmmb.persistenc.po.bean.Form;
import com.wootion.cmmb.persistenc.po.bean.WorkflowBills;
import com.wootion.cmmb.persistenc.po.bean.WorkflowNodes;
import com.wootion.cmmb.persistenc.po.bean.WorkflowRecords;

public class WorkflowDAOImpl extends HibernateDaoSupport implements WorkflowDAO {

	@Override
	public WorkflowRecords getMaxWorkflowRecords(String workflowid,
			String billid) {
		String hql = "from WorkflowRecords t ";
		String where = " where t.workflow.id = '"+ workflowid + "' and t.billid = '" + billid+"' ";
		String sort = " order by t.sort desc ";
		
		List<WorkflowRecords> result = this.getHibernateTemplate().find(hql+where+sort);
		return result.get(0);
	}

	@Override
	public List<WorkflowBills> findWorkflowBill(String billid, Long formid) {
		Form form = (Form)getHibernateTemplate().load(Form.class, formid);
		DetachedCriteria criteria=DetachedCriteria.forClass(WorkflowBills.class);
		criteria.add(Restrictions.eq("billid", billid));
		criteria.add(Restrictions.eq("workflow", form.getWorkflow()));
		return getHibernateTemplate().findByCriteria(criteria);
	}

	@Override
	public Set<WorkflowNodes> findWorkflowNode(Long formid) {
		Form form = (Form)getHibernateTemplate().load(Form.class, formid);
		return form.getWorkflow().getNodes();
	}

	@Override
	public List<Form> getAllForms() {
		String hql = "from Form t";
		return getHibernateTemplate().find(hql);
	}

	@Override
	public List<WorkflowRecords> findWorkflowRecords(String billid, Long formid) {
		Form form = (Form)getHibernateTemplate().load(Form.class, formid);
		DetachedCriteria criteria=DetachedCriteria.forClass(WorkflowRecords.class);
		criteria.add(Restrictions.eq("billid", billid));
		criteria.add(Restrictions.eq("workflow", form.getWorkflow()));
		return getHibernateTemplate().findByCriteria(criteria);
	}
	
}
