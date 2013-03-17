<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<base target="_self">
<title>工作流修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function selectWorkflowHandleUser(textarea,nodeType) {
	var formid = '${formid}';
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

function submitWorkflow(){
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
		<form action="modifyWorkflow.do" method="post" name="tblform" onsubmit="return submitWorkflow();">
			<input type="hidden" id="mid" value="${mid }" name="mid"/>
			<input type="hidden" id="jsonNodes" name="jsonNodes" />
			<tr>
				<td width="50%" valign="top">
					<table width="100%" border="0" cellpadding="3" cellspacing="1"
						class="tableList" id="tbl_nodes">
						<tr>
							<td colspan="5">表单名称：${formName}</td>
						</tr>
						<tr>
							<td colspan="5"><input type="button" value="添加提交节点" onclick="addSubmitNode();"/> </td>
						</tr>
						<tr>
							<th>序号</th>
							<th>操作方式</th>
							<th>操作人</th>
							<th>节点描述</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${nodes }" var="node">
							<tr id="real_tr">
								<input type="hidden" value="${node.id }" name="nodeId"/>
								<input type="hidden" value="${node.hanleUsers }" name="hanleUsers" />
								<input type="hidden" value="${node.nodeType }" name="nodeType" />
								<td align="center" nowrap bgcolor="#E4E4E4" name="sortNumber">${node.level }</td>
								<td align="center" nowrap bgcolor="#E4E4E4" name="">${node.nodeTypeDisplayValue }</td>
								<td align="center" nowrap bgcolor="#E4E4E4">
									<textarea rows="2" cols="20" readonly="true" onclick="selectWorkflowHandleUser(this,'${node.nodeType }')" name="hanleUsersWithName">${node.hanleUsersWithName}</textarea>
								</td>
								<td align="center" nowrap bgcolor="#E4E4E4" name="description">
									<textarea rows="2" cols="20" name="description" >${node.description }</textarea>
								</td>
								<td align="center" nowrap bgcolor="#E4E4E4">
									<c:if test="${node.nodeType == 1 }">
										<a href="javascript:void(0);" onclick="deleteNode(this);" >删除</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
						<tr id="template_tr" style="display:none" >
							<input type="hidden" name="nodeId"/>
							<input type="hidden" name="hanleUsers" />
							<input type="hidden" value="1" name="nodeType" />
							<td align="center" nowrap bgcolor="#E4E4E4" name="sortNumber"></td>
							<td align="center" nowrap bgcolor="#E4E4E4" name="">提交</td>
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
