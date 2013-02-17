package com.wootion.cmmb.service.volunteer;

import java.text.ParseException;

import com.wootion.cmmb.persistenc.po.bean.Volunteerhistory;
import com.wootion.cmmb.persistenc.po.bean.Volunteerinfo;
import com.wootion.idp.common.utils.QueryResult;

public interface VolunteerService {
	public void saveVolunteer(Volunteerinfo vinfos);
	
	public QueryResult<Volunteerinfo> getQueryVolResult(Integer index,
            Integer maxresult, String vname, String vspecialty,
            String sessionID)
			throws ParseException;
	
	public boolean deleVolunteerinfo(String vnumber) throws Exception;
	
	public boolean delevolchoose(String vid) throws Exception;
	
	public Volunteerinfo lookVolunteer(String vid)throws Exception;
	
	public Volunteerhistory lookVolunteerhis(String vid)throws Exception;
	
	public String modifyvol(String vid, String vnumber, String vtime, String vname, String vage, 
			String vgender, String vphone, String vspecialty, String vcommunitywork, String vstudy,
			String vintention, String vtrain) throws ParseException;

	public QueryResult<Volunteerhistory> getQueryVolHistoryResult(Integer index,
            Integer maxresult, String vname, String vspecialty,
            String sessionID)
			throws ParseException;
}
