<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="wt" uri="http://www.wootion.com/wt" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<link href="<%=basePath%>/pages/train/skins/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/md5.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/pages/train/js/check.js"></script>
<script type="text/javascript" src="<%=basePath%>/pages/train/js/LodopFuncs.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>/pages/train/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/communication.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
