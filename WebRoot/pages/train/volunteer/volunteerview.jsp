<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>志愿者信息</title>
<script type="text/javascript">
var basePath = '<%=basePath%>';
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>志愿者管理  > 志愿者信息</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<table width="100%" border="0" cellpadding="3" cellspacing="1" id="tbody">
     <tr>
      <td align="right">志愿者编号</td>
      <td><input type="text" name="vcallno" id="vcallno" value="${result.vcallno}" disabled/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
    <input type="hidden" name="vid" value="${result.vid}" />
      <td align="right">姓名</td>
      <td><input type="text" name="vname" value="${result.vname}" disabled/></td>
    </tr>
    <tr>
      <td align="right">年龄</td>
      <td><input type="text" name="vage" value="${result.vage}" disabled/></td>
    </tr>
    <tr>
      <td align="right">生日</td>
      <td><input type="text" name="vbirthday" id="vbirthday" value="${result.vbirthday}" disabled/>
      </td>
    </tr>
     <tr>
      <td align="right">志愿者级别</td>
      <td>
        <select name="vpriority" id="vpriority" disabled>
	       <option value="1星" ${result.vpriority == '1星' ? "selected" : ""}>   1星  </option>
	       <option value="2星" ${result.vpriority == '2星' ? "selected" : ""}>   2星  </option>
		   <option value="3星" ${result.vpriority == '3星' ? "selected" : ""}>   3星  </option>
	    </select>
      </td>
    </tr>
     <tr>
      <td align="right">服务意向时间段</td>
      <td>
          <input type="text" id="vservewill" name="vservewill" value="${result.vservewill}" disabled/>
      </td>
    </tr>
    <tr>
      <td align="right">性别</td>
      <td><input type="text" name="vgender" value="${result.vgender}" disabled/></td>
    </tr>
    <tr>
      <td align="right">电话</td>
      <td><input name="vphone" type="text" value="${result.vphone}" disabled/></td>
    </tr>
    <tr>
      <td align="right">是否有学习新知识意愿</td>
      <td><input name="vstudy" type="text" value="${result.vstudy}" disabled/></td>
    </tr>
    <tr>
      <td align="right">加入志愿服务日期</td>
      <td><input type="text" size="" name="vtrain" value="${result.vtrain}" disabled/></td>
    </tr>
    <tr>
      <td align="right">个人特长</td>
       <td><textarea name="vspecialty" cols="58" rows="4" disabled>${result.vspecialty}</textarea></td>
    </tr>
    
    <tr>
      <td align="right">社区工作经历</td>
      <td><textarea name="vcommunitywork" cols="58" rows="4" disabled>${result.vcommunitywork}</textarea></td>
    </tr>
   <tr>
      <td align="right">志愿服务意向</td>
      <td><textarea name="vintention" cols="58" rows="4" disabled>${result.vintention}</textarea></td>
    </tr>
  </table>
 <table width="80%" cellspacing="0" cellpadding="0">
     <tr>
     <td align="center">
		<button onClick="forward('volunteerlist.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>
