package com.wootion.cimp.services;

import java.text.ParseException;

import com.wootion.cimp.vo.data.healtheval;
import com.wootion.cimp.vo.data.healthpsyeval;
import com.wootion.idp.common.utils.QueryResult;

public interface memberHealthService {
	public QueryResult<healtheval> getQueryHealthResult(Integer index,
            Integer maxresult, String assesdate, String memname,
            String belongproname, String healthnumber,String sessionID)
			throws ParseException;
	
	public String saveHealthEval(healtheval heal);
	
	public String saveHealthPsyEval(healthpsyeval heal);
	
	public healtheval lookHealthEval(String healthid);
	
	public healthpsyeval lookHealthPsyEval(String healthid);
	
	public String modifyHealthEval(healtheval heal);
	
	public boolean deleHealth(String healthid);
	
	public String modifyHealthPsyEval(healthpsyeval heal);
}
