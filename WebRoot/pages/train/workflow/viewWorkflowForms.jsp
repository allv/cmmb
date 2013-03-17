<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作流选择单据</title>
<script type="text/javascript">
function chooseForms() {
	var obj = new Object();
	var formid = '';
	var formName = '';
	if($("#tbl_curForm tr input:checked[type='radio']").size()!=1) {
		alert('请选择一个单据！');
		return false;
	}
	$("#tbl_curForm tr input:checked[type='radio']").each(function(ind, obj_tr) {
		var val = $(obj_tr).val();
		var ind = val.indexOf("_") - 0;
		formid = val.substring(0,ind);
		formName  = val.substr(ind+1);
	});
	obj.formid = formid;
	obj.formName = formName;
	window.returnValue = obj;
	window.close();
}
</script>
<base target="_self">
</head>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		class="tableList">
		<tr>
			<td>
				<table id="tbl_curForm">
					<tr>
						<th nowrap>请选择一个单据</th>
					</tr>
					<c:forEach items="${unAssignedForms }" var="form">
						<tr>
							<td  nowrap bgcolor="#E4E4E4">
							<input type="radio" name="formid" value="${form.id }_${form.name }" >${form.name }</input></td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
	<br />
	<table width="100%" cellspacing="0" cellpadding="1">
		<tr>
			<td align="center"><button onclick="chooseForms();">确认</button><button onclick="window.close();">关闭</button>
			</td>
		</tr>
	</table>
</body>
</html>
