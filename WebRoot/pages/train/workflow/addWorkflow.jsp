<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<base target="_self">
<title>工作流创建</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function selectWorkflowForm() {
	var obj = new Object();
	var date  =new Date();
	var url = 'viewWorkflowForms.do';
	url = url + '?time='+date.getTime() ;
	var retValue = window.showModalDialog(url,obj,"dialogWidth=250px;dialogHeight=400px"); 
	if(retValue != null ) {
		if($("#formid").val() != '') {
			if($("#formid").val() != retValue.formid) {
				if(confirm('当前单据即将改变，改变将会清空所有设定，您确定要改变单据吗？')){
					$("#formid").val(retValue.formid);
					$("#formName").val(retValue.formName);
					$("#workflowName").val(retValue.formName+"工作流");
					$("#workflowDescription").val(' ');
					resetWorkflowNodes();
				}
			}
		}else {
			$("#formid").val(retValue.formid);
			$("#formName").val(retValue.formName);
			$("#workflowName").val(retValue.formName+"工作流");
			$("#workflowDescription").val(' ');
		}
	}
}

function resetWorkflowNodes() {
	$("#tbl_nodes tr[id='real_tr']").each(function(ind, obj) {
		$(obj).remove();
	});
	$("#tbl_nodes tr[id='default_tr']").each(function(ind,obj){
		var newTr = $(obj).clone();
		newTr.attr("id","");
		newTr.attr("name","");
		newTr.css("display","");		
		$("#template_tr").before(newTr);
	});
}

function selectWorkflowHandleUser(textarea,nodeType) {
	if($("#formid").val() == '') {
		alert('请先选择单据！');
		return false;
	}
	var formid = ''+$("#formid").val();
	var obj = new Object();
	var date  =new Date();
	var arguments = 'formid='+formid + '&nodeType='+nodeType;
	var url = 'viewWorkflowHandleUsers.do';
	url = url + '?time='+date.getTime() +'&'+ arguments;
	var retValue = window.showModalDialog(url,obj,"dialogWidth=350px;dialogHeight=200px"); 
	if(retValue != null ) {
		$(textarea).text(retValue.usernames);
		$("input[name='hanleUsers']",$(textarea).parent().parent()).val(retValue.userids);
	}
}

function checkSubmitNode()  {
	var count = 0;
	$("#tbl_nodes tr[id='real_tr'] input[name='nodeType']").each(function(ind, obj) {
		if($(obj).val() == '1') {
			count++;
		}
	});
	return count > 1;
}

function deleteNode(btn) {
	var flag = checkSubmitNode();
	if(!flag) {
		alert('至少要有一个提交节点！');
		return ;
	}
	$(btn).parent().parent().remove();
	refreshSortNumber();
}

function addSubmitNode() {
	if($("#formid").val() == '') {
		alert('请先选择单据！');
		return false;
	}
	var newTr = $("#template_tr").clone(true);
	newTr.attr("id","real_tr");
	newTr.css("display","");
	$("#tbl_nodes tr[id='real_tr']").each(function(ind,obj){
		if("input[name='nodeType'][value='2']",obj) {
			$(obj).before(newTr);
		}
	});
	refreshSortNumber();
}

function refreshSortNumber() {
	$("#tbl_nodes tr[id='real_tr'] td[name='sortNumber']").each(function(ind, obj_td) {
		$(obj_td).text(ind);
	});
}

function validateNodes()  {
	var flag = true;
	$("#tbl_nodes tr[id='real_tr'] input[name='hanleUsers']").each(function(ind, obj) {
		if($(obj).val() == '') {
			alert('操作人不能为空！');
			$(obj).focus();
			flag = false;
			return false;
		}
	});
	return flag;
}

function validateCommonFields() {
	if($("#formid").val() == '') {
		alert('请选择单据！');
		$("#formName").focus();
		return false;
	}
	if($("#workflowName").val() == '') {
		alert('工作流名称不能为空！');
		$("#workflowName").focus();
		return false;
	}
	return true;
}

function submitWorkflow(){
	if(!validateCommonFields()) {
		return false;
	}
	if(!validateNodes()) {
		return false;
	}
	collectNodes();
	return true;
}

function collectNodes() {
	var ret = '';
	$("#tbl_nodes tr[id='real_tr']").each(function(ind, obj) {
		var trObj = $(obj);
		var node = '';
		node = node + "id:'"+$("input[name='nodeId']",trObj).val()+"',";
		node = node + "hanleUsers:'"+$("input[name='hanleUsers']",trObj).val()+"',";
		node = node + "nodeType:'"+$("input[name='nodeType']",trObj).val()+"',";
		node = node + "level:'"+$("td[name='sortNumber']",trObj).text()+"',";
		node = node + "description:'"+$("textarea[name='description']",trObj).val()+"'";
		ret = ret + '{' + node + '},';
	});
	$("#jsonNodes").val('['+ret+']');
}
</script>
</head>
<body>
	<table width="100%">
		<tr>
			<td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
		</tr>
	</table>
	<table>
		<form action="addWorkflow.do" method="post" name="tblform" onsubmit="return submitWorkflow();">
			<input type="hidden" id="formid"  name="formid"/>
			<input type="hidden" id="jsonNodes" name="jsonNodes" />
			<tr>
				<td width="50%" valign="top">
					<table width="100%" border="0" cellpadding="3" cellspacing="1"
						class="tableList" id="tbl_nodes">
						<tr>
							<td colspan="5">请选择你要为哪个单据创建工作流：<input type="text" readonly="true" name="formName" id="formName" onclick="selectWorkflowForm()" /></td>
						</tr>
						<tr>
							<td colspan="5">
								<table>
									<tr>
										<td>工作流名称 *</td>
										<td><input type="text" name="workflowName" id="workflowName" /></td>
									</tr>
									<tr>
										<td>工作流描述 </td>
										<td><textarea rows="3" cols="20" name="workflowDescription" id="workflowDescription"></textarea></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="5"><input type="button" value="添加提交节点" onclick="addSubmitNode();"/> </td>
						</tr>
						<tr id="th">
							<th>序号</th>
							<th>操作方式</th>
							<th>操作人</th>
							<th>节点描述</th>
							<th>操作</th>
						</tr>
						<tr id="real_tr">
							<input type="hidden" name="nodeId"/>
							<input type="hidden" name="hanleUsers" />
							<input type="hidden" value="0" name="nodeType" />
							<td align="center" nowrap bgcolor="#E4E4E4" name="sortNumber">0</td>
							<td align="center" nowrap bgcolor="#E4E4E4" >保存</td>
							<td align="center" nowrap bgcolor="#E4E4E4">
								<textarea rows="2" cols="20" readonly="true" onclick="selectWorkflowHandleUser(this,'0')" name="hanleUsersWithName"></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4" name="description">
								<textarea rows="2" cols="20" name="description" ></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4"></td>
						</tr>
						<tr id="real_tr">
							<input type="hidden" name="nodeId"/>
							<input type="hidden" name="hanleUsers" />
							<input type="hidden" value="1" name="nodeType" />
							<td align="center" nowrap bgcolor="#E4E4E4" name="sortNumber">1</td>
							<td align="center" nowrap bgcolor="#E4E4E4" >提交</td>
							<td align="center" nowrap bgcolor="#E4E4E4">
								<textarea rows="2" cols="20" readonly="true" onclick="selectWorkflowHandleUser(this,'1')" name="hanleUsersWithName"></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4" name="description">
								<textarea rows="2" cols="20" name="description" ></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:void(0);" onclick="deleteNode(this);">删除</a></td>
						</tr>
						<tr id="real_tr">
							<input type="hidden" name="nodeId"/>
							<input type="hidden" name="hanleUsers" />
							<input type="hidden" value="2" name="nodeType" />
							<td align="center" nowrap bgcolor="#E4E4E4" name="sortNumber">2</td>
							<td align="center" nowrap bgcolor="#E4E4E4" >审核</td>
							<td align="center" nowrap bgcolor="#E4E4E4">
								<textarea rows="2" cols="20" readonly="true" onclick="selectWorkflowHandleUser(this,'2')" name="hanleUsersWithName"></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4" name="description">
								<textarea rows="2" cols="20" name="description" ></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4"></td>
						</tr>
						<tr id="default_tr" style="display:none">
							<input type="hidden" name="nodeId"/>
							<input type="hidden" name="hanleUsers" />
							<input type="hidden" value="0" name="nodeType" />
							<td align="center" nowrap bgcolor="#E4E4E4" name="sortNumber">0</td>
							<td align="center" nowrap bgcolor="#E4E4E4" >保存</td>
							<td align="center" nowrap bgcolor="#E4E4E4">
								<textarea rows="2" cols="20" readonly="true" onclick="selectWorkflowHandleUser(this,'0')" name="hanleUsersWithName"></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4" name="description">
								<textarea rows="2" cols="20" name="description" ></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4"></td>
						</tr>
						<tr id="default_tr" style="display:none">
							<input type="hidden" name="nodeId"/>
							<input type="hidden" name="hanleUsers" />
							<input type="hidden" value="1" name="nodeType" />
							<td align="center" nowrap bgcolor="#E4E4E4" name="sortNumber">1</td>
							<td align="center" nowrap bgcolor="#E4E4E4" >提交</td>
							<td align="center" nowrap bgcolor="#E4E4E4">
								<textarea rows="2" cols="20" readonly="true" onclick="selectWorkflowHandleUser(this,'1')" name="hanleUsersWithName"></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4" name="description">
								<textarea rows="2" cols="20" name="description" ></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:void(0);" onclick="deleteNode(this);">删除</a></td>
						</tr>
						<tr id="default_tr" style="display:none">
							<input type="hidden" name="nodeId"/>
							<input type="hidden" name="hanleUsers" />
							<input type="hidden" value="2" name="nodeType" />
							<td align="center" nowrap bgcolor="#E4E4E4" name="sortNumber">2</td>
							<td align="center" nowrap bgcolor="#E4E4E4" >审核</td>
							<td align="center" nowrap bgcolor="#E4E4E4">
								<textarea rows="2" cols="20" readonly="true" onclick="selectWorkflowHandleUser(this,'2')" name="hanleUsersWithName"></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4" name="description">
								<textarea rows="2" cols="20" name="description" ></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4"></td>
						</tr>
						<tr id="template_tr" style="display:none" >
							<input type="hidden" name="nodeId"/>
							<input type="hidden" name="hanleUsers" />
							<input type="hidden" value="1" name="nodeType" />
							<td align="center" nowrap bgcolor="#E4E4E4" name="sortNumber"></td>
							<td align="center" nowrap bgcolor="#E4E4E4" >提交</td>
							<td align="center" nowrap bgcolor="#E4E4E4">
								<textarea rows="2" cols="20" readonly="true" onclick="selectWorkflowHandleUser(this,'1')" name="hanleUsersWithName"></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4" name="description">
								<textarea rows="2" cols="20" name="description" ></textarea>
							</td>
							<td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:void(0);" onclick="deleteNode(this);">删除</a></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center">
					<button type="submit">提交</button>
					<button onClick="window.close();" type="reset">返回</button>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>
