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
<meta http-equiv="pragma" content="no-cache" />
<title>修改活动记录</title>
<link href="<%=basePath%>/css/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/css/button.css" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/swfupload/swfupload.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/swfupload/handlers.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/swfupload/ext-all.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
  var basePath = '<%=basePath%>';
  function choosePro(){
    var pname = "mbelongpro";
    var wWidth = 1040;
    var wHeight = 510;
    var wTop = (window.screen.height - wHeight)/2;
    var wLeft = (window.screen.width - wWidth)/2;
    var obj = new Object();
    obj.name=pname;
    
    var url =  basePath + "/proquery.do";
    //window.open(url,"","Height=400px,Width=500px");
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
  

//获取所有图片名称
function getimageurl(){
    var infotab = document.getElementById('infoTable');
    var imageurl='';
    for(var itab=0;itab<infotab.rows.length;itab++){
         if(itab!=0){
         	imageurl+='^'+infotab.rows[itab].cells[1].innerHTML;
         }else{
            imageurl+=infotab.rows[itab].cells[1].innerHTML;
         }
    }
    //明细显示图片要求最后加一个'^'
    return imageurl+'^';
}

function onSubmit()
{
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
    var mid = document.getElementById("mid").value;
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
   	var mimagereflect = document.getElementById("mimagereflect").value;
    var mimagevolunteer = document.getElementById("mimagevolunteer").value;
   	if(mserialnum==""){
   	    alert('活动编号不能为空');
   	    return;
   	}
   	
   	var mimagereflect2 = document.getElementById("mimagereflect2").value;
   	var mimagereflect3 = document.getElementById("mimagereflect3").value;
   	var mimagereflect4 = document.getElementById("mimagereflect4").value;
   	
   	var mbelongpro = '';
   	var minfo = document.getElementById("minfo").value;
   	//var mimageurl = document.getElementById("mimageurl").value;
   	var mimageurl = getimageurl();
    var item = mid + "|" + mstarttime + "|" + magname+"|"+ magfee +"|"+mimagereflect+"|"+mimagevolunteer+ "|" + mnumber + "|" + mplace + "|" + morganizer + "|" + mserialnum + "|" + mbelongpro + "|" + minfo + "|" + mimageurl;
     
        //if (mbelongpro == "")
        //{
             //alert('请选择一个项目!');
        //}
        //else
        {
	             $.ajax({
					type : "POST",
					url : basePath + "/managementmodifyman.do?detail=" + encodeURI(item)+"&mimagereflect2="+mimagereflect2
					+"&mimagereflect3="+mimagereflect3+"&mimagereflect4="+mimagereflect4,
					success : function(msg) {
						var result = msg;
						if ('success' == result) {
							alert('修改活动记录成功');
							window.location.href = basePath + "/managementlist.do";
						} else {
							alert('修改活动记录失败');
						}
					},
					failure : function() {
						alert("未知错误！");
					}
				});
        }
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
	
	var mimageurl = document.getElementById("mimageurl").value;
	if(mimageurl!=null&&mimageurl!=''&&mimageurl!='^'){
		var mimageurl = document.getElementById("mimageurl").value;
		document.getElementById('btnCancel').disabled = "";
		var message='成功加载到上传队列';
		var status='文件上传完成';
		previousRows=mimageurl.split('^').length-1;
		for(var iurl=0;iurl<mimageurl.split('^').length;iurl++){
		    var fileid='SWFUpload_0_'+iurl;
		    var fileName=mimageurl.split('^')[iurl];
		    if(fileName!='')
		    	addReadyFileInfo1(fileid,fileName,message,status);
		}
	}
	
};

function addReadyFileInfo1(fileid,fileName,message,status){
	var infoTable = document.getElementById("infoTable");
	
	var row = infoTable.insertRow();
	row.id = fileid;
	var col1 = row.insertCell();
	var col2 = row.insertCell();
	var col3 = row.insertCell();
	var col4 = row.insertCell();
	col4.align = "left";
	col1.innerHTML = message+" : ";
	col2.innerHTML = fileName;
	if(status!=null&&status!=""){
		col3.innerHTML="<font color='red'>"+status+"</font>";
	}else{
		col3.innerHTML="";
	}
	col4.innerHTML = "<a href='javascript:deleteFile(\""+fileid+"\")'>删除</a>";
	col1.style.width="150";
	col2.style.width="250";
	col3.style.width="80";
	col4.style.width="50";
}


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
<div class="topLanBar"><b>当前位置：</b>活动管理>  修改活动记录</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<input type="hidden" name="mid" value="${result.mid}" />
<form method="post">
<div style="text-align:center">
<table style="margin:auto" width="50%" border="0" cellspacing="0" cellpadding="5">
      <tr>
      <td align="right">活动编号</td>
      <td><input name="mserialnum" type="text" value="${result.mserialnum}" size="20"/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    
    <tr>
      <td align="right">活动名称</td>
      <td><input name="mimagename" type="text" value="${result.mimagename}" size="20"/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    
       
    <tr>
      <td align="right">活动费用</td>
      <td><input name="mimagefee" type="text" value="${result.mimagefee}" size="20"/>元<span style='color:red;'>&nbsp;*</span></td>
    </tr>
     <!-- 
    <tr>
      <td align="right">所属项目</td>
      <td><input type="text" id="mbelongpro" name="mbelongpro" size="20" value="${result.mbelongpro }"><button onclick="choosePro()">选择项目</button></td>
    </tr>
    -->
    <tr>
      <td align="right">活动时间</td>
      <td><input type="text" size="" name="mstarttime" value="${result.mstarttime}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">参与人数</td>
      <td><input type="text" name="mnumber" value="${result.mnumber}"/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">地点</td>
      <td><input name="mplace" type="text" value="${result.mplace}" size="20"/></td>
    </tr>
    
    <tr>
      <td align="right">活动满意度</td>
      <td>
        很满意: <input type="text" name="mimagereflect" id="mimagereflect" size="2" value="${result.mimagereflect}"/>%
        满意: <input type="text" name="mimagereflect2" id="mimagereflect2" size="2" value="${result.mimagereflect2}"/>%
        一般: <input type="text" name="mimagereflect3" id="mimagereflect3" size="2" value="${result.mimagereflect3}"/>%
        不满意: <input type="text" name="mimagereflect4" id="mimagereflect4" size="2" value="${result.mimagereflect4}"/>%
      </td>
    </tr>
    
    <tr>
      <td align="right">活动负责人</td>
       <td>
      <input name="morganizer" type="text" value="${result.morganizer}"/></td>
    </tr>
    
      <tr>
      <td align="right">活动志愿者</td>
      <td><textarea name="mimagevolunteer" cols="58" rows="4">${result.mimagevolunteer}</textarea></td>
    </tr>
   
    <tr>
      <td align="right">备注</td>
      <td><textarea name="minfo" cols="58" rows="4">${result.minfo}</textarea></td>
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
<input type="hidden" id="mimageurl" name="mimageurl" value="${result.mimageurl}"/>
<table width="80%" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center"><button onclick="onSubmit()">提交</button> 
	  <button onClick="forward('managementlist.do')">返回</button></td>
    </tr>
</table>
</div>
</form>
</body>
</html>
