<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="pages/train/import.jsp"%>
<html>
<script type="text/javascript">
    window.onload = function(){
	    if(navigator.userAgent.indexOf("MSIE")==-1) {  
	        top.location.href =  "<%=basePath%>/pages/train/wrongbrowser.jsp";
	        //top.location.href =  "<%=basePath%>/index.do";
	        return;
	    }else{
	        top.location.href =  "<%=basePath%>/index.do";
	    }  
}
</script>
</html>
