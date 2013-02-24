package com.wootion.cimp.vo.data;

import java.util.Date;

/**
 * TTemplate entity. @author MyEclipse Persistence Tools
 */

public class Memberhistory implements java.io.Serializable
{
    //会员主鍵
    private String meminfoid;
    //会员姓名
    private String memname;
    //会员编号
    private String memid;
    //性别
    private String memsex;
    //身份证号码
    private String  creditid;
    //出生年月
    private String birthday;
    //文化程度
    private String culture;
    //曾从事职业
    private String professor;
    //经济情况
    private String financial;
    //婚姻情况
    private String marry;
    //生育情况
    private String kids;
    //入会方式
    private String ways;
    //入会时间
    private String enterdate;
    //居住情况
    private String reside;
    //医疗付费
    private String fees;
    //备注
    private String beizhu;
    
    //本人联系方式
    //手机号
    private String mycellnumber;
    //家庭电话
    private String mylandlinenumber;
    //地址
    private String myaddress;
    //所属村/居委会
    private String mycounty;
    //街道/镇
    private String mystreet;
    //城市
    private String mycity;
    //邮箱
    private String myemail;
    //国家
    private String mynation;
    
    //紧急联系方式
    //姓名
    private String coname;
    //关系
    private String relationship;
    //手机
    private String concellnumber;
    //电话
    private String connumber;
    //地址
    private String conaddress;
    //城市	
    private String concity;
    //邮编
    private String conpost;
    //国家
    private String concountry;
    
    
    //性格特征
    //性格描述：1.稳重 2.开朗 3.易急躁 4.易怒   可多选 可不选
    private String charactor;
    //其他性格
    private String othercharactor;
    //兴趣爱好
    private String interest;
    
    //饮食习惯
    //食物烹饪要求
    private String apetite;
    //食物禁忌
    private String contraband;
    //饮酒史
    private String drunk;
    //吸烟史
    private String smoke;
    //睡眠情况 
    private String sleep;
    //锻炼情况
    private String execise;
    //就医方式
    private String medicalcare;
    //习惯就诊医院1
    private String hospital1;
    //习惯就诊医院2
    private String hospital2;
    //习惯就诊医院3
    private String hospital3;
    
    
    //个人史
    //血型
    private String blood;
    //过敏史
    private String allergic;
    //过敏史说明
    private String allergicdesc;
    //心率
    private String heartbeat;
    //脉搏
    private String pulse;
    //呼吸
    private String breath;
    //血压
    private String bloodpressure;
    //空腹血糖
    private String bloodsugar;
    //血脂
    private String bloodfat;
    //视力
    private String view;
    //听力
    private String hear;
    //骨密度检查
    private String bone;
    //心电图
    private String heartelec;
    //肝功能检查
    private String liver;
    //乙肝表杭检查
    private String yiliver;
    //肾功能检查
    private String kidney;
    //过去史 1.无 2.脑血管疾病 3.慢性疼痛病 4.高血压 5.心血管疾病 6.白内障 7.便秘 8.老年性脑萎缩(ADL) 9.弱视 10.糖尿病 11.帕金森症 12.弱听
    //13.心脏病 14.骨关节疾病 15.其他
    private String history;
    //过去史备注
    private String historybak;
    //手术史 1.有  2.无
    private String issugury;
    //评估人
    private String assessment;
    //评估日期
    private String asesdate;
    //修改人
    private String submitman;
    //修改日期
    private String submitdate;
    
    //时间戳
    private String timestamp;
    
    //参与 项目情况 
    private String procondition ;
    
    //康复情况 
    //康复次数
    private String kfestimatetimes;
    //康复评估时间
    private String kfestimatedate;
    //康复开始时间
    private String kfstartdate;
    //康复结束时间
    private String kfenddate;
    //康复次数
    private String kfservicetimes;
    //康复方式
    private String kfways;
    //康复效果
    private String kfeffect;
    //收费情况
    private String kffee;
    //康复治疗师
    private String kfcarer;
    //康复医生
    private String kfdoctor;
    //康复备注
    private String kfbeizhu;
    
    //护理情况
    //护理评估次数
    private String hlesttimes;
    //护理评估时间
    private String hlestdate;
    //护理开始时间
    private String hlstartdate;
    //护理结束时间
    private String hlenddate;
    //护理次数
    private String hltimes;
    //护理方式
    private String hlways;
    //护理效果
    private String hleffect;
    //收费情况
    private String hlfee;
    //护理人员
    private String hlemployee;
    //护理备注
    private String hlbeizhu;
    
    private String r2;
    
    private String r3;

    // Constructors
    /** default constructor */
    public Memberhistory()
    {
    }

    /** minimal constructor */
    public Memberhistory(String meminfoid, String memname, String memid,
            String memsex,String creditid,String birthday,String culture,String professor,String financial,String marry,String kids,String ways,String enterdate,String reside,String fees
            ,String mycellnumber,String mylandlinenumber,String myaddress,String mycounty,String mystreet,String mycity,String myemail,String mynation,String coname,
            String relationship,String concellnumber,String connumber,String conaddress,String concity,String conpost,String concountry,String charactor,String othercharactor,String interest,
            String apetite,String contraband,String drunk,String smoke,String sleep,String execise,String medicalcare,String hospital1,String hospital2,String hospital3,String blood,String allergic,
            String allergicdesc,String heartbeat,String pulse,String breath,String bloodpressure,String bloodsugar,String bloodfat,String view,String hear,String bone,String heartelec,String liver,
            String yiliver,String kidney,String history,String historybak,String issugury,String assessment,String asesdate,String submitman,String submitdate,String beizhu,String timestamp
            ,String procondition,String hlbeizhu,String hlemployee,String hlfee,String hleffect,String hlways,String hltimes,String hlenddate,String hlstartdate,String hlestdate,String hlesttimes,String kfbeizhu,String kfdoctor
            ,String kfcarer,String kffee,String kfeffect,String kfways,String kfservicetimes,String kfenddate,String kfstartdate,String kfestimatedate,String kfestimatetimes)
    {
    	this.procondition=procondition;
    	this.hlbeizhu=hlbeizhu;
    	this.hlemployee=hlemployee;
    	this.hlfee=hlfee;
    	this.hleffect=hleffect;
    	this.hlways=hlways;
    	this.hltimes=hltimes;
    	this.hlenddate=hlenddate;
    	this.hlstartdate=hlstartdate;
    	this.hlestdate=hlestdate;
    	this.hlesttimes=hlesttimes;
    	this.kfbeizhu=kfbeizhu;
    	this.kfdoctor=kfdoctor;
    	this.kfcarer=kfcarer;
    	this.kffee=kffee;
    	this.kfeffect=kfeffect;
    	this.kfways=kfways;
    	this.kfservicetimes=kfservicetimes;
    	this.kfenddate=kfenddate;
    	this.kfestimatedate=kfestimatedate;
    	this.kfestimatetimes=kfestimatetimes;
    	this.timestamp = timestamp;
        this.meminfoid = meminfoid;
        this.memid = memid;
        this.memname = memname;
        this.memsex = memsex;
        this.creditid = creditid;
        this.birthday = birthday;
        this.culture = culture;
        this.professor = professor;
        this.financial = financial;
        this.marry = marry;
        this.kids = kids;
        this.ways = ways;
        this.enterdate = enterdate;
        this.reside = reside;
        this.fees = fees;
        this.mycellnumber = mycellnumber;
        this.mylandlinenumber = mylandlinenumber;
        this.myaddress = myaddress;
        this.mycounty = mycounty;
        this.mystreet = mystreet;
        this.mycity = mycity;
        this.myemail = myemail;
        this.mynation = mynation;
        this.coname = coname;
        this.relationship = relationship;
        this.concellnumber = concellnumber;
        this.connumber = connumber;
        this.conaddress = conaddress;
        this.concity = concity;
        this.conpost = conpost;
        this.concountry = concountry;
        this.charactor = charactor;
        this.othercharactor = othercharactor;
        this.interest = interest;
        this.apetite = apetite;
        this.contraband = contraband;
        this.drunk = drunk;
        this.smoke = smoke;
        this.sleep = sleep;
        this.execise = execise;
        this.medicalcare = medicalcare;
        this.hospital1 = hospital1;
        this.hospital2 = hospital2;
        this.hospital3 = hospital3;
        this.blood = blood;
        this.allergic = allergic;
        this.allergicdesc = allergicdesc;
        this.heartbeat = heartbeat;
        this.pulse = pulse;
        this.breath = breath;
        this.bloodpressure = bloodpressure;
        this.bloodsugar = bloodsugar;
        this.bloodfat = bloodfat;
        this.view = view;
        this.hear = hear;
        this.bone = bone;
        this.heartelec = heartelec;
        this.liver = liver;
        this.yiliver = yiliver;
        this.kidney = kidney;
        this.history = history;
        this.historybak = historybak;
        this.issugury = issugury;
        this.assessment = assessment;
        this.asesdate = asesdate;
        this.submitman = submitman;
        this.submitdate = submitdate;
        this.beizhu = beizhu;
    }
    // Property accessors

	public String getMeminfoid() {
		return meminfoid;
	}

	public void setMeminfoid(String meminfoid) {
		this.meminfoid = meminfoid;
	}

	public String getMemname() {
		return memname;
	}

	public void setMemname(String memname) {
		this.memname = memname;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public String getMemsex() {
		return memsex;
	}

	public void setMemsex(String memsex) {
		this.memsex = memsex;
	}

	public String getCreditid() {
		return creditid;
	}

	public void setCreditid(String creditid) {
		this.creditid = creditid;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getCulture() {
		return culture;
	}

	public void setCulture(String culture) {
		this.culture = culture;
	}

	public String getProfessor() {
		return professor;
	}

	public void setProfessor(String professor) {
		this.professor = professor;
	}

	public String getFinancial() {
		return financial;
	}

	public void setFinancial(String financial) {
		this.financial = financial;
	}

	public String getMarry() {
		return marry;
	}

	public void setMarry(String marry) {
		this.marry = marry;
	}

	public String getKids() {
		return kids;
	}

	public void setKids(String kids) {
		this.kids = kids;
	}

	public String getWays() {
		return ways;
	}

	public void setWays(String ways) {
		this.ways = ways;
	}

	public String getEnterdate() {
		return enterdate;
	}

	public void setEnterdate(String enterdate) {
		this.enterdate = enterdate;
	}

	public String getReside() {
		return reside;
	}

	public void setReside(String reside) {
		this.reside = reside;
	}

	public String getFees() {
		return fees;
	}

	public void setFees(String fees) {
		this.fees = fees;
	}

	public String getR2() {
		return r2;
	}

	public void setR2(String r2) {
		this.r2 = r2;
	}

	public String getR3() {
		return r3;
	}

	public void setR3(String r3) {
		this.r3 = r3;
	}

	public String getMycellnumber() {
		return mycellnumber;
	}

	public void setMycellnumber(String mycellnumber) {
		this.mycellnumber = mycellnumber;
	}

	public String getMylandlinenumber() {
		return mylandlinenumber;
	}

	public void setMylandlinenumber(String mylandlinenumber) {
		this.mylandlinenumber = mylandlinenumber;
	}

	public String getMyaddress() {
		return myaddress;
	}

	public void setMyaddress(String myaddress) {
		this.myaddress = myaddress;
	}

	public String getMycounty() {
		return mycounty;
	}

	public void setMycounty(String mycounty) {
		this.mycounty = mycounty;
	}

	public String getMystreet() {
		return mystreet;
	}

	public void setMystreet(String mystreet) {
		this.mystreet = mystreet;
	}

	public String getMycity() {
		return mycity;
	}

	public void setMycity(String mycity) {
		this.mycity = mycity;
	}

	public String getMyemail() {
		return myemail;
	}

	public void setMyemail(String myemail) {
		this.myemail = myemail;
	}

	public String getMynation() {
		return mynation;
	}

	public void setMynation(String mynation) {
		this.mynation = mynation;
	}

	public String getConame() {
		return coname;
	}

	public void setConame(String coname) {
		this.coname = coname;
	}

	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public String getConcellnumber() {
		return concellnumber;
	}

	public void setConcellnumber(String concellnumber) {
		this.concellnumber = concellnumber;
	}

	public String getConnumber() {
		return connumber;
	}

	public void setConnumber(String connumber) {
		this.connumber = connumber;
	}

	public String getConaddress() {
		return conaddress;
	}

	public void setConaddress(String conaddress) {
		this.conaddress = conaddress;
	}

	public String getConcity() {
		return concity;
	}

	public void setConcity(String concity) {
		this.concity = concity;
	}

	public String getConpost() {
		return conpost;
	}

	public void setConpost(String conpost) {
		this.conpost = conpost;
	}

	public String getConcountry() {
		return concountry;
	}

	public void setConcountry(String concountry) {
		this.concountry = concountry;
	}

	public String getCharactor() {
		return charactor;
	}

	public void setCharactor(String charactor) {
		this.charactor = charactor;
	}

	public String getOthercharactor() {
		return othercharactor;
	}

	public void setOthercharactor(String othercharactor) {
		this.othercharactor = othercharactor;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getApetite() {
		return apetite;
	}

	public void setApetite(String apetite) {
		this.apetite = apetite;
	}

	public String getContraband() {
		return contraband;
	}

	public void setContraband(String contraband) {
		this.contraband = contraband;
	}

	public String getDrunk() {
		return drunk;
	}

	public void setDrunk(String drunk) {
		this.drunk = drunk;
	}

	public String getSmoke() {
		return smoke;
	}

	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}

	public String getSleep() {
		return sleep;
	}

	public void setSleep(String sleep) {
		this.sleep = sleep;
	}

	public String getExecise() {
		return execise;
	}

	public void setExecise(String execise) {
		this.execise = execise;
	}

	public String getMedicalcare() {
		return medicalcare;
	}

	public void setMedicalcare(String medicalcare) {
		this.medicalcare = medicalcare;
	}

	public String getHospital1() {
		return hospital1;
	}

	public void setHospital1(String hospital1) {
		this.hospital1 = hospital1;
	}

	public String getHospital2() {
		return hospital2;
	}

	public void setHospital2(String hospital2) {
		this.hospital2 = hospital2;
	}

	public String getHospital3() {
		return hospital3;
	}

	public void setHospital3(String hospital3) {
		this.hospital3 = hospital3;
	}

	public String getBlood() {
		return blood;
	}

	public void setBlood(String blood) {
		this.blood = blood;
	}

	public String getAllergic() {
		return allergic;
	}

	public void setAllergic(String allergic) {
		this.allergic = allergic;
	}

	public String getAllergicdesc() {
		return allergicdesc;
	}

	public void setAllergicdesc(String allergicdesc) {
		this.allergicdesc = allergicdesc;
	}

	public String getHeartbeat() {
		return heartbeat;
	}

	public void setHeartbeat(String heartbeat) {
		this.heartbeat = heartbeat;
	}

	public String getPulse() {
		return pulse;
	}

	public void setPulse(String pulse) {
		this.pulse = pulse;
	}

	public String getBreath() {
		return breath;
	}

	public void setBreath(String breath) {
		this.breath = breath;
	}

	public String getBloodpressure() {
		return bloodpressure;
	}

	public void setBloodpressure(String bloodpressure) {
		this.bloodpressure = bloodpressure;
	}

	public String getBloodsugar() {
		return bloodsugar;
	}

	public void setBloodsugar(String bloodsugar) {
		this.bloodsugar = bloodsugar;
	}

	public String getBloodfat() {
		return bloodfat;
	}

	public void setBloodfat(String bloodfat) {
		this.bloodfat = bloodfat;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public String getHear() {
		return hear;
	}

	public void setHear(String hear) {
		this.hear = hear;
	}

	public String getBone() {
		return bone;
	}

	public void setBone(String bone) {
		this.bone = bone;
	}

	public String getHeartelec() {
		return heartelec;
	}

	public void setHeartelec(String heartelec) {
		this.heartelec = heartelec;
	}

	public String getLiver() {
		return liver;
	}

	public void setLiver(String liver) {
		this.liver = liver;
	}

	public String getYiliver() {
		return yiliver;
	}

	public void setYiliver(String yiliver) {
		this.yiliver = yiliver;
	}

	public String getKidney() {
		return kidney;
	}

	public void setKidney(String kidney) {
		this.kidney = kidney;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
	}

	public String getHistorybak() {
		return historybak;
	}

	public void setHistorybak(String historybak) {
		this.historybak = historybak;
	}

	public String getIssugury() {
		return issugury;
	}

	public void setIssugury(String issugury) {
		this.issugury = issugury;
	}

	public String getAssessment() {
		return assessment;
	}

	public void setAssessment(String assessment) {
		this.assessment = assessment;
	}

	public String getAsesdate() {
		return asesdate;
	}

	public void setAsesdate(String asesdate) {
		this.asesdate = asesdate;
	}

	public String getSubmitman() {
		return submitman;
	}

	public void setSubmitman(String submitman) {
		this.submitman = submitman;
	}

	public String getSubmitdate() {
		return submitdate;
	}

	public void setSubmitdate(String submitdate) {
		this.submitdate = submitdate;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getProcondition() {
		return procondition;
	}

	public void setProcondition(String procondition) {
		this.procondition = procondition;
	}

	public String getKfestimatetimes() {
		return kfestimatetimes;
	}

	public void setKfestimatetimes(String kfestimatetimes) {
		this.kfestimatetimes = kfestimatetimes;
	}

	public String getKfestimatedate() {
		return kfestimatedate;
	}

	public void setKfestimatedate(String kfestimatedate) {
		this.kfestimatedate = kfestimatedate;
	}

	public String getKfstartdate() {
		return kfstartdate;
	}

	public void setKfstartdate(String kfstartdate) {
		this.kfstartdate = kfstartdate;
	}

	public String getKfenddate() {
		return kfenddate;
	}

	public void setKfenddate(String kfenddate) {
		this.kfenddate = kfenddate;
	}

	public String getKfservicetimes() {
		return kfservicetimes;
	}

	public void setKfservicetimes(String kfservicetimes) {
		this.kfservicetimes = kfservicetimes;
	}

	public String getKfways() {
		return kfways;
	}

	public void setKfways(String kfways) {
		this.kfways = kfways;
	}

	public String getKfeffect() {
		return kfeffect;
	}

	public void setKfeffect(String kfeffect) {
		this.kfeffect = kfeffect;
	}

	public String getKffee() {
		return kffee;
	}

	public void setKffee(String kffee) {
		this.kffee = kffee;
	}

	public String getKfcarer() {
		return kfcarer;
	}

	public void setKfcarer(String kfcarer) {
		this.kfcarer = kfcarer;
	}

	public String getKfdoctor() {
		return kfdoctor;
	}

	public void setKfdoctor(String kfdoctor) {
		this.kfdoctor = kfdoctor;
	}

	public String getKfbeizhu() {
		return kfbeizhu;
	}

	public void setKfbeizhu(String kfbeizhu) {
		this.kfbeizhu = kfbeizhu;
	}

	public String getHlesttimes() {
		return hlesttimes;
	}

	public void setHlesttimes(String hlesttimes) {
		this.hlesttimes = hlesttimes;
	}

	public String getHlestdate() {
		return hlestdate;
	}

	public void setHlestdate(String hlestdate) {
		this.hlestdate = hlestdate;
	}

	public String getHlstartdate() {
		return hlstartdate;
	}

	public void setHlstartdate(String hlstartdate) {
		this.hlstartdate = hlstartdate;
	}

	public String getHlenddate() {
		return hlenddate;
	}

	public void setHlenddate(String hlenddate) {
		this.hlenddate = hlenddate;
	}

	public String getHltimes() {
		return hltimes;
	}

	public void setHltimes(String hltimes) {
		this.hltimes = hltimes;
	}

	public String getHlways() {
		return hlways;
	}

	public void setHlways(String hlways) {
		this.hlways = hlways;
	}

	public String getHleffect() {
		return hleffect;
	}

	public void setHleffect(String hleffect) {
		this.hleffect = hleffect;
	}

	public String getHlfee() {
		return hlfee;
	}

	public void setHlfee(String hlfee) {
		this.hlfee = hlfee;
	}

	public String getHlemployee() {
		return hlemployee;
	}

	public void setHlemployee(String hlemployee) {
		this.hlemployee = hlemployee;
	}

	public String getHlbeizhu() {
		return hlbeizhu;
	}

	public void setHlbeizhu(String hlbeizhu) {
		this.hlbeizhu = hlbeizhu;
	}
   
}