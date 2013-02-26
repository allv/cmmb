<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../import.jsp"%>
<%
	StringBuffer uploadUrl = new StringBuffer("http://");
	uploadUrl.append(request.getHeader("Host"));
	uploadUrl.append(request.getContextPath());
	uploadUrl.append("/ImageUploadServlet.htm");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache"/> 
<meta http-equiv="Cache-Control" content="no-cache"/> 
<meta http-equiv="Expires" content="0"/>
<title>新增活动</title>
<link href="<%=basePath%>/css/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/css/button.css" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/swfupload/swfupload.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/swfupload/handlers.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/swfupload/ext-all.js"></script>
<script type="text/javascript">
  var basePath = '<%=basePath%>';
  var $2 = function(id){
        return document.getElementById(id);
    }
  function choosePro(){
    var pname = "mbelongpro";
    var wWidth = 1040;
    var wHeight = 510;
    var wTop = (window.screen.height - wHeight)/2;
    var wLeft = (window.screen.width - wWidth)/2;
    var obj = new Object();
    obj.name=pname;
    
    var url =  basePath + "/proquery.do";
    //window.open(url);
    str = window.showModalDialog(url,obj,"dialogWidth=500px;dialogHeight=400px"); 
    arr = str.split(",");
    if(typeof(str)=="undefined"){
        document.getElementById(pname).value="";
    }else if(str=="nochange"){
        //document.getElementById(cid).value
    }else{
    	document.getElementById(pname).value=arr[0];
    }
    	
  } 
  
//保存
    function Save() {
        var magname = document.getElementById("mimagename").value;
    	if(magname==""){
    	    alert('活动名称不能为空!');
    	    return;
    	}
    	
    	var magfee = document.getElementById("mimagefee").value;
    	if(magfee==""){
    	    alert('活动费用不能为空!');
    	    return;
    	}else if(!is_positiveInteger(magfee)){
                alert('活动费用必须为正数字');
                return;
        }
        
        var mstarttime = document.getElementById("mstarttime").value;
    	if(mstarttime==""){
    	    alert('活动时间不能为空!');
    	    return;
    	}
    	
    	var mnumber = document.getElementById("mnumber").value;
        if(mnumber==""){
    	    alert('活动人数不能为空!');
    	    return;
    	}else if(!is_positiveInteger(mnumber)){
            alert('活动人数必须为正数字');
            return;
        }
    	var mplace = document.getElementById("mplace").value;
    	var morganizer = document.getElementById("morganizer").value;
    	var mserialnum = document.getElementById("mserialnum").value;
        if(mserialnum==""){
   	    	alert('活动编号不能为空');
   	   	    return;
   	    }
    	var mbelongpro = document.getElementById("mbelongpro").value;
    	var minfo = document.getElementById("minfo").value;
    	var mimageurl = document.getElementById("mimageurl").value;
    	var mimagereflect = document.getElementById("mimagereflect").value;
    	var mimagevolunteer = document.getElementById("mimagevolunteer").value;
        var item = mstarttime + "|" + magname+"|"+ magfee +"|"+mimagereflect+"|"+mimagevolunteer+ "|" + mnumber + "|" + mplace + "|" + morganizer + "|" + mserialnum + "|" + mbelongpro + "|" + minfo + "|" + mimageurl;
        $2("detail").value = item;
        
        //if (mbelongpro == "")
        //{
            //alert("请选择一个项目!");
        //}
            $.ajax({
					type : "POST",
					url : basePath + "/managementsaveActivity.do?detail=" + encodeURI(item),
					success : function(msg) {
						var result = msg;
						if ('success' == result) {
							alert('新增活动记录成功');
							window.location.href = basePath + "/managementlist.do";
						} else {
							alert('新增活动记录失败');
						}
					},
					failure : function() {
						alert("未知错误！");
					}
				});
    }
    
var previousRows=0;    
var swfu;
window.onload = function () {
	swfu = new SWFUpload({
		upload_url: "<%=uploadUrl.toString()%>",
		//post_params: {"name" : "huliang"},
		
		// File Upload Settings
		file_size_limit : "10 MB",	// 1000MB
		file_types : "*.*",
		file_types_description : "所有文件",
		file_upload_limit : "0",
						
		file_queue_error_handler : fileQueueError,
		file_dialog_complete_handler : fileDialogComplete,//选择好文件后提交
		file_queued_handler : fileQueued,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccess,
		upload_complete_handler : uploadComplete,

		// Button Settings
		button_image_url : "images/SmallSpyGlassWithTransperancy_17x18.png",
		button_placeholder_id : "spanButtonPlaceholder",
		button_width: 180,
		button_height: 18,
		button_text : '<span class="button">选择图片 <span class="buttonSmall">(10 MB Max)</span></span>',
		button_text_style : '.button { font-family: Helvetica, Arial, sans-serif; font-size: 12pt; } .buttonSmall { font-size: 10pt; }',
		button_text_top_padding: 0,
		button_text_left_padding: 18,
		button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
		button_cursor: SWFUpload.CURSOR.HAND,
		
		// Flash Settings
		flash_url : "js/swfupload/swfupload.swf",

		custom_settings : {
			upload_target : "divFileProgressContainer"
		},
		// Debug Settings
		debug: false  //是否显示调试窗口
	});
};
function startUploadFile(){
	swfu.startUpload();
}
var win = new Ext.Window({
	title : 'SwfUpload',
	closeAction : 'hide',
	width : 750,
	height : 360,
	resizable : false,
	modal : true,
	html : '<iframe src="index.jsp" width="100%" height="100%"></iframe>'
});
function showExtShow(){
	win.show();
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>活动管理> 活动管理> 新增活动</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form name="myform"  method="post" action="managementsaveActivity.do">
<input type="hidden" id="detail" name="detail" />
<div style="text-align:center">
<table style="margin:auto" width="40%"  border="0" cellspacing="3" cellpadding="1">
    <tr>
      <td align="right">活动编号</td>
      <td><input name="mserialnum" type="text" value="${mserialnum}" size="20"/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    
    <tr>
      <td align="right">活动名称</td>
      <td><input name="mimagename" type="text" value="${mimagename}" size="20"/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    
       
    <tr>
      <td align="right">活动费用</td>
      <td><input name="mimagefee" type="text" value="0" size="20"/>元<span style='color:red;'>&nbsp;*</span></td>
    </tr>
    
    <tr>
      <td align="right">所属项目</td>
      <td><input type="text" id="mbelongpro" name="mbelongpro" size="20"><button onclick="choosePro()" >选择项目</button></td>
    </tr>
    
    <tr>
      <td align="right">活动时间</td>
      <td><input type="text" size="" name="mstarttime" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">参与人数</td>
      <td><input type="text" name="mnumber" value="${mnumber}"/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">地点</td>
      <td><input name="mplace" type="text" value="${mplace}" size="20"/></td>
    </tr>
    
    <tr>
      <td align="right">活动满意度</td>
      <td>
        <select name="mimagereflect" id="mimagereflect">
	       <option value="很满意" selected>   很满意  </option>
	       <option value="一般满意">   一般满意  </option>
		   <option value="不满意">   不满意  </option>
	    </select>
      </td>
    </tr>
    
    <tr>
      <td align="right">活动负责人</td>
       <td>
      <input name="morganizer" type="text" value="${morganizer}"/></td>
    </tr>
    
      <tr>
      <td align="right">活动志愿者</td>
      <td><textarea name="mimagevolunteer" cols="58" rows="4">${mimagevolunteer}</textarea></td>
    </tr>
   
    <tr>
      <td align="right">备注</td>
      <td><textarea name="minfo" cols="58" rows="4">${minfo}</textarea></td>
    </tr>
</table>
<div id="content">
	<div
		style="display: inline; border: solid 1px #7FAAFF; background-color: #C5D9FF; padding: 2px;left:800px">
		<span id="spanButtonPlaceholder"></span>
		<input id="btnUpload" type="button" value="上  传"
			onclick="startUploadFile();" class="btn3_mouseout" onMouseUp="this.className='btn3_mouseup'"
			onmousedown="this.className='btn3_mousedown'"
			onMouseOver="this.className='btn3_mouseover'"
			onmouseout="this.className='btn3_mouseout'"/>
		<input id="btnCancel" type="button" value="取消所有上传"
			onclick="cancelUpload();" disabled="disabled" class="btn3_mouseout" onMouseUp="this.className='btn3_mouseup'"
			onmousedown="this.className='btn3_mousedown'"
			onMouseOver="this.className='btn3_mouseover'"
			onmouseout="this.className='btn3_mouseout'"/>
	</div>
	<div id="divFileProgressContainer"></div>
	<div id="thumbnails">
		<table id="infoTable" border="0" width="600" style="display: inline; border: solid 1px #7FAAFF; background-color: #C5D9FF; padding: 2px;margin-top:8px;">
		</table>
	</div>
</div>
<input type="hidden" id="mimageurl" name="mimageurl" value="${mimageurl}"/>
 <table width="80%" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center"><button onclick="Save()">提交</button> 
	  <button onClick="forward('managementlist.do')">返回</button></td>
    </tr>
</table>
</div>
</form>
</body>
</html>
