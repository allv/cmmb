<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="<%=basePath%>/js/jquery.boxy.js"></script>
<link href="<%=basePath%>/css/boxy.css" rel="stylesheet" type="text/css" />
<c:if test="${showWorkflow }">
<div class="foreverTop">
<table>
<tr>
<td align="center" colspan="3"><b>工作流管理</b></td>
</tr>
<tr>
<c:if test="${showWorkflowQuery}">
<td><img src="<%=basePath%>/images/wf-query.png" width="25px" alt="查看工作流" onclick="viewWorkflowStatus()"/></td>
</c:if>
<c:if test="${showWorkflowBack}">
<td><img src="<%=basePath%>/images/wf-back.png" width="25px" alt="返回上一级" onclick="backWorkflow()" />
</td>
</c:if>
<c:if test="${showWorkflowSubmit}">
<td><img src="<%=basePath%>/images/wf-submit.png" width="25px" alt="提交" onclick="submitWorkflow()" />
</td>
</c:if>
<c:if test="${showWorkflowReject}">
<td><img src="<%=basePath%>/images/wf-reject.png" width="25px" alt="驳回" onclick="rejectWorkflow()" />
</td>
</c:if>
<c:if test="${showWorkflowAudit}">
<td><img src="<%=basePath%>/images/wf-audit.png" width="25px" alt="审核" onclick="auditWorkflow()" />
</td>
</c:if>
</tr>
</table>
<inpu type="hidden" id="workflowRemark" />
</div>
<script type="text/javascript">

function viewWorkflowStatus() {
	var obj = new Object();
	var date  =new Date();
	var billid = getWorkflowBillid();
	var formid = getWorkflowFormid();
	var arguments = 'billid='+billid+'&formid='+formid;
	var url = 'viewWorkflowBillStatus.do' + '?time='+date.getTime() +'&'+ arguments;
	window.showModalDialog(url,obj,"dialogWidth=1000px;dialogHeight=500px");
}

function submitWorkflow() {
	var url = generateWorkflowURL();
	url = url + '&workflowflag=1'
	showWorkflowDialog(url,'单据提交成功','提交单据');
}

function auditWorkflow() {
	var url = generateWorkflowURL();
	url = url + '&workflowflag=2'
	showWorkflowDialog(url,'单据审核成功','审核单据');
}

function rejectWorkflow() {
	var url = generateWorkflowURL();
	url = url + '&workflowflag=4'
	showWorkflowDialog(url,'单据驳回成功','驳回单据');
}

function backWorkflow() {
	var url = generateWorkflowURL();
	url = url + '&workflowflag=3'
	showWorkflowDialog(url,'单据返回上一级成功','返回上一级');
}

function showWorkflowDialog(wf_url,msg,msgTitle) {
	Boxy.confirm("<div>备注:&nbsp;&nbsp;<input type='text' onblur='$('#workflowRemark').val(this.value);' /></div>",function(){
		showWorkflowDialog1(wf_url,msg);
	},{title:msgTitle});
}

function showWorkflowDialog1(wf_url,msg) {
	var date  =new Date();
	var billid = getWorkflowBillid();
	var formid = getWorkflowFormid();
	var remark = $("#workflowRemark").val();
	var arguments = 'billid='+billid+'&formid='+formid+'&remark='+remark;
	
	wf_url = wf_url + '&time='+date.getTime() +'&'+ arguments;
	var dialog = new Boxy("div><p>处理中……请稍候！</p></div>", {modal:true});
	$.ajax({
	   type: "POST",
	   url: wf_url,
	   complete:function(XMLHttpRequest, textStatus) {
		   dialog.hide();
		   var result = XMLHttpRequest.responseText;
	   		if('success'==result){
	   		 	alert(msg);
	   		 	afterWorkflowSuccess();
	   		}else{
	   			alert('工作流处理失败');
	   		}
	   },
	   beforeSend: function (XMLHttpRequest) {
		   
	   }
	});
}


</script>
</c:if>