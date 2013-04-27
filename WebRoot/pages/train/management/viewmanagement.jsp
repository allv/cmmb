<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动明细</title>
<script type="text/javascript">
function shows()
{
    var imgurl = "${result.mimageurl}";
    arr = imgurl.split("^");
    var showimages = document.getElementById("showimages");
	for(var i=0; i<arr.length - 1; i++)
	{
	    if(arr[i]==''||arr[i]=='^'){showimages.innerHTML='';return ;}
	    showimages.innerHTML += "<img src='<%=basePath%>/upload/"+arr[i]+"' style='width:300px;height:400px' border='0' hspace='1'>";
	}
}

var Marquee=function(){this.ID=document.getElementById(arguments[0]);this.Direction=arguments[1];this.Step=arguments[2];this.BakStep=arguments[2];this.Width=arguments[3];this.HalfWidth=Math.round(arguments[3]/2);this.Height=arguments[4];this.Timer=arguments[5];this.DelayTime=arguments[6];this.WaitTime=arguments[7];if(arguments[8] || arguments[8]==0){this.ScrollStep=arguments[8];}else{this.ScrollStep=this.Direction>1?this.Width:this.Height;}this.Correct=0;this.CTL=0;this.StartID=0;this.Stop=0;this.MouseOver=0;this.ID.style.overflow="hidden";this.ID.style.overflowX="hidden";this.ID.style.overflowY="hidden";this.ID.noWrap=true;this.ID.style.width=this.Width+"px";this.ID.style.height=this.Height+"px";this.ClientScroll=this.Direction>1?parseInt(this.ID.scrollWidth):parseInt(this.ID.scrollHeight);this.ID.innerHTML+=this.ID.innerHTML;this.IsNotOpera=(navigator.userAgent.toLowerCase().indexOf("opera")==-1);if(arguments.length>=8){this.Start(this,this.Timer,this.DelayTime,this.WaitTime);}}
Marquee.prototype.Start=function(msobj,timer,delaytime,waittime){
msobj.StartID=function(){msobj.Scroll();};
msobj.Continue=function(){if(msobj.MouseOver==1){setTimeout(msobj.Continue,delaytime);}else{clearInterval(msobj.TimerID);msobj.CTL=0;msobj.Stop=0;msobj.TimerID=setInterval(msobj.StartID,timer);}};
msobj.Pause=function(){msobj.Stop=1;clearInterval(msobj.TimerID);setTimeout(msobj.Continue,delaytime);};
msobj.Begin=function(){
msobj.ID.onmousemove=function(evt){if(msobj.ScrollStep==0 && msobj.Direction>1){var event=null;if(window.event){event=window.event;if(msobj.IsNotOpera){msobj.EventLeft=event.srcElement.id==msobj.ID.id?parseInt(event.offsetX)-parseInt(msobj.ID.scrollLeft):parseInt(event.srcElement.offsetLeft)-parseInt(msobj.ID.scrollLeft)+parseInt(event.offsetX);}else{msobj.ScrollStep=null;return;}}else{event=evt;msobj.EventLeft=parseInt(event.layerX)-parseInt(msobj.ID.scrollLeft);}msobj.Direction=msobj.EventLeft>msobj.HalfWidth?3:2;msobj.AbsCenter=Math.abs(msobj.HalfWidth-msobj.EventLeft);msobj.Step=Math.round(msobj.AbsCenter*(msobj.BakStep*2)/msobj.HalfWidth);}};
msobj.ID.onmouseover=function(){if(msobj.ScrollStep==0){return;}msobj.MouseOver=1;clearInterval(msobj.TimerID);};
msobj.ID.onmouseout=function(){if(msobj.ScrollStep==0){if(msobj.Step==0){msobj.Step=1;}return;}msobj.MouseOver=0;if(msobj.Stop==0){clearInterval(msobj.TimerID);msobj.TimerID=setInterval(msobj.StartID,timer);}};msobj.TimerID=setInterval(msobj.StartID,timer);};setTimeout(msobj.Begin,waittime);}
Marquee.prototype.Scroll=function(){if(this.Correct==0 && this.CTL>this.ClientScroll){this.ClientScroll=(this.Direction>1)?Math.round(parseInt(this.ID.scrollWidth)/2):Math.round(parseInt(this.ID.scrollHeight)/2);this.Correct=1;}switch(this.Direction){case 0:{this.CTL+=this.Step;if(this.CTL>=this.ScrollStep && this.DelayTime>0){this.ID.scrollTop+=(this.ScrollStep+this.Step-this.CTL);this.Pause();return;}else{if(this.ID.scrollTop>=this.ClientScroll){this.ID.scrollTop-=this.ClientScroll;}this.ID.scrollTop+=this.Step;}break;}case 1:{this.CTL+=this.Step;if(this.CTL>=this.ScrollStep && this.DelayTime>0){this.ID.scrollTop-=(this.ScrollStep+this.Step-this.CTL);this.Pause();return;}else{if(this.ID.scrollTop<=0){this.ID.scrollTop+=this.ClientScroll;}this.ID.scrollTop-=this.Step;}break;}case 2:{this.CTL+=this.Step;if(this.CTL>=this.ScrollStep && this.DelayTime>0){this.ID.scrollLeft+=(this.ScrollStep+this.Step-this.CTL);this.Pause();return;}else{if(this.ID.scrollLeft>=this.ClientScroll){this.ID.scrollLeft-=this.ClientScroll;}this.ID.scrollLeft+=this.Step;}break;}case 3:{this.CTL+=this.Step;if(this.CTL>=this.ScrollStep && this.DelayTime>0){this.ID.scrollLeft-=(this.ScrollStep+this.Step-this.CTL);this.Pause();return;}else{if(this.ID.scrollLeft<=0){this.ID.scrollLeft+=this.ClientScroll;}this.ID.scrollLeft-=this.Step;}break;}this.ID.scrollTop+="px";this.ID.scrollLeft+="px";}}
</script>
</head>
<body onload="shows()">
<div class="topLanBar"><b>当前位置：</b>活动管理> 活动明细</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<div style="text-align:center">
<table style="margin:auto" width="50%" border="0" cellspacing="0" cellpadding="5">
     <tr>
      <td align="right">活动编号</td>
      <td><input name="mserialnum" type="text" value="${result.mserialnum}" size="20" disabled/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    
    <tr>
      <td align="right">活动名称</td>
      <td><input name=mimagename type="text" value="${result.mimagename}" size="20" disabled/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    
       
    <tr>
      <td align="right">活动费用</td>
      <td><input name=mimagefee type="text" value="${result.mimagefee}" size="20" disabled/>元<span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <!-- 
    <tr>
      <td align="right">所属项目</td>
      <td><input type="text" id="mbelongpro" name="mbelongpro" size="20" value="${result.mbelongpro }" disabled></td>
    </tr>
     -->
    <tr>
      <td align="right">活动时间</td>
      <td><input type="text" size="" name="mstarttime" value="${result.mstarttime}" disabled/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">参与人数</td>
      <td><input type="text" name="mnumber" value="${result.mnumber}" disabled/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">地点</td>
      <td><input name="mplace" type="text" value="${result.mplace}" size="20" disabled/></td>
    </tr>
    
    <tr>
      <td align="right">活动满意度</td>
      <td>
        很满意: <input disabled type="text" name="mimagereflect" id="mimagereflect" size="2" value="${result.mimagereflect}"/>%
        满意: <input disabled type="text" name="mimagereflect2" id="mimagereflect2" size="2" value="${result.mimagereflect2}"/>%
        一般: <input disabled type="text" name="mimagereflect3" id="mimagereflect3" size="2" value="${result.mimagereflect3}"/>%
        不满意: <input disabled type="text" name="mimagereflect4" id="mimagereflect4" size="2" value="${result.mimagereflect4}"/>%
      </td>
    </tr>
    
    <tr>
      <td align="right">活动负责人</td>
       <td>
      <input name="morganizer" type="text" value="${result.morganizer}" disabled/></td>
    </tr>
    
      <tr>
      <td align="right">活动志愿者</td>
      <td><textarea name="mimagevolunteer" cols="58" rows="4" disabled>${result.mimagevolunteer}</textarea></td>
    </tr>
   
    <tr>
      <td align="right">备注</td>
      <td><textarea name="minfo" cols="58" rows="4" disabled>${result.minfo}</textarea></td>
    </tr>
</table>
<center>
活动图片
<div id="showimages" style="width:1000px;overflow:auto;"></div>
</center>

<table width="100%">
    <tr>
      <td width="60%" align="center"><button onClick="forward('managementlist.do')">返回</button></td>
    </tr>
</table>
</div>
</form>
<script type="text/javascript">
try{
new Marquee("showimages",2,4,1000,400,20,0,3000,0);
}catch(e){alert(e.message);}
</script>
</body>
</html>
