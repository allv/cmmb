<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@page import="com.wootion.cimp.vo.data.Project"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目进度</title>
<style type="text/css">
<!--
body,div,p,ul,li,font,span,td,th{
font-size:10pt;
line-height:125%;
}
.EditCell_TextBox {
width: 40px;
border:1px solid #0099CC;
}
-->
</style>
</head>
<body>

<table width="100%" border="0">
  <tr>
    <td width="21%">项目等级: ${pro.proname}</td>
    <td width="45%">开始日期：<input type="text" value="${pro.prostartdate}" disabled/>
    结束日期:
    <input type="text" value="${pro.proenddate}" disabled/></td>
    <td id="curyear" width="15%">
    </td>
    <td width="15%">
     	<button onclick="resetPvalue()" id="previous" disabled>上二年</button>
     	<button onclick="resetValue()" id="next" disabled>下二年</button>
    </td>
    <td width="15%">
     	<button onclick="submitData()" id="submit">提 交</button>
     	<button onclick="cancel()" id="cancel">取 消</button>
    </td>
  </tr>
</table>
<table width="104%" border="1px" id="table1" class="tabcss">
  <tr id="tr1">
    <td width="9%" align="center">标的</td>
    <td width="7%" align="center">月份</td>
    <td width="4%" align="center">累计</td>
    <td width="5%" align="center">完成比例</td>
  </tr>
</table>


<script language="javascript">
var basePath = '<%=basePath%>';
<%
    String isView = (String)request.getAttribute("isview");
    String trackid = (String)request.getAttribute("trackid");
    String pagedataindb = (String)request.getAttribute("pagedataindb");
    String isAdmin = (String)request.getAttribute("isadmin");
    Project pro = (Project)request.getAttribute("pro");
    String proid = "";
	String proname = "";
    //Projecttrack pt = (Projecttrack)request.getAttribute("protrack");
	String startdate = "";
	String enddate = "";
	String trdata = "";
	String tddata = "";
    if(pro!=null){
	     proid = pro.getProid();
	     proname = pro.getProname();
	     //Projecttrack pt = (Projecttrack)request.getAttribute("protrack");
	     startdate = pro.getProstartdate();
	     enddate = pro.getProenddate();
	     trdata = pro.getTrdata();
	     tddata = pro.getTddata();
    }
    %>
    //是否管理员角色
    var isAdmin = '<%=isAdmin%>';
    var isView = '<%=isView%>';
    //year month
    //年份数组 每次constructd constructd1时，这二个函数按年份轮流着来
    //月份数组 1到12月，12 个数组存12个月的数据
var trackid='<%=trackid%>';
var trdata='<%=trdata%>';
var tddata='<%=tddata%>';
//从后台数据库取出页面数据
var pagedataindb='<%=pagedataindb%>';
var proid='<%=proid%>';
var proname = '<%=proname%>';
var startdate='<%=startdate%>';
var enddate='<%=enddate%>';
var syear=parseInt(startdate.substring(0,4));
var smonth=startdate.substring(5,7);
var eyear=parseInt(enddate.substring(0,4));
var emonth=enddate.substring(5,7);

var previous=document.getElementById("previous");
var next=document.getElementById("next");

if(smonth<10){
   smonth=parseInt(startdate.substring(6,7));
}else{
   smonth=parseInt(startdate.substring(5,7));
}
   
if(emonth<10){
   emonth=parseInt(enddate.substring(6,7));
}else{
   emonth=parseInt(enddate.substring(5,7));
}

//当前页
var nowpage=1;
//第一页数目
var firstnum=1;
//最后一页数目
var lastnum=1;
//总页数
var totalpages=Math.ceil((eyear-syear+1)/2);
//存储所有页面值 声明二维数组，一维是page长度，二维是每页的月份数
var rowData = new Array();
for(var findex=0;findex<totalpages;findex++){
    rowData[findex]=new Array();
}

if((eyear-syear)>1){
   firstnum=12+(13-smonth);
   if((eyear-syear)%2==0){
      lastnum=emonth;
   }else{
	  lastnum=12+emonth;
   }
}else{
   firstnum=emonth+(13-smonth);
   lastnum=firstnum;
   totalpages=1;
}
var showsyear=syear;
var showeyear=eyear;
if(syear==eyear){
   showeyear=syear;
}else{
   showeyear=syear+1;
}

var curyear=document.getElementById("curyear");
if(syear==eyear){
	curyear.innerText='年份：'+showsyear;
}else{
    curyear.innerText='年份：'+showsyear+"-"+showeyear;
}
var tab = document.getElementById("table1");
var arrayObjTr = new Array();
//总数
var arrayObjT = new Array();
//百分比
var arrayObjD = new Array();
//记录每项目有多少统计项
var arrayObjB = new Array();
//首次加载该页面
if(proid!=null&&proid!='')
	init();
//创建分隔空行
function newLine(tdno){
   // <td id="td12" colspan="30">&nbsp;</td>
   var tline = tab.insertRow();
   var emtd = tline.insertCell();
   emtd.colSpan=30;
   emtd.setAttribute("id",tdno);
   //emtd.setAttribute("colSpan","30");
   emtd.innerText=" ";
}

//创建标的 表格
function newTitle(tName,dName,trno,tno,dno,rowspans){
   var ttt=tab.insertRow();
   arrayObjTr.push(ttt);
   if(tName!='#'){
	   var tdt0 = ttt.insertCell();
	   tdt0.setAttribute("rowSpan",rowspans);
	   arrayObjB.push(rowspans);
	   tdt0.style.textAlign="center";
	   tdt0.innerText=tName;
   }
   
   var tdt1 = ttt.insertCell();
   tdt1.style.textAlign="center";
   tdt1.innerText=dName;
   
   var tdt2 = ttt.insertCell();
   arrayObjT.push(tdt2);
   tdt2.setAttribute("id",tno);  
   tdt2.innerText="";
    
   var tdt3 = ttt.insertCell();
   arrayObjD.push(tdt3);
   tdt3.setAttribute("id",dno);
   tdt3.innerText="";
}
//存入rowData
function generatePageDataInDB(){
   var everypagedata=pagedataindb.split('|');
   var everygrid=new Array();
   for(var dbindex=0;dbindex<totalpages;dbindex++){
       everygrid=everypagedata[dbindex].split(',');
       for(gridindex=0;gridindex<everygrid.length;gridindex++){
           rowData[dbindex][gridindex]=everygrid[gridindex];
       }
   }
}
function init(){
   if(pagedataindb!=''){
	   //格式化pagedataindb,存入rowData中
	   generatePageDataInDB();
   }
   var k=2;//用来拼凑id名
   //根据标的个数来确定循环次数
   //此处循环tr
   if(trdata!=null&&trdata!=''){
	   for(var i=0;i<trdata.split(',').length;i++){
	       newTitle(trdata.split(',')[i],tddata.split('|')[i].split(',')[0],'tr'+(k),'t'+(k),'d'+(k++),tddata.split('|')[i].split(',').length);
	       //存储标的名称和子标的名称，逗号分开.
	       for(var tdi=1;tdi<tddata.split('|')[i].split(',').length;tdi++){
			   newTitle('#',tddata.split('|')[i].split(',')[tdi],'tr'+(k),'t'+(k),'d'+(k++),tddata.split('|')[i].split(',').length);
			   
		   }
		   if(i!=(trdata.split(',').length-1)){
			   newLine('td'+(i));
		   }
	   }
	   var tr1=document.getElementById("tr1");
   
       //同一年内
       if(syear==eyear){  
   		   constructTd(smonth,emonth,1,emonth-smonth+1);
       }
       //相差一年 2年之内
       if((eyear-syear)==1){
           constructTd(smonth,12+emonth,13-smonth+emonth);
       }
       //相隔二年以上
       if(eyear-syear>1){
	       	//先表示二年24个月
	        constructTd(smonth,24,13-smonth+12);
	        //计算相差总共多少个月
	        previous.disabled=true;
	        next.disabled=false;
       }
       getTotal();
   }
}

function resetPvalue(){
   //刷新rowData数据
   getTableData(nowpage);
   
   nowpage=nowpage-1;
   showsyear=showsyear-2;
   showeyear=showeyear-2;
   curyear.innerText='年份：'+showsyear+"-"+showeyear;
   removeTab();
   if(nowpage==1){
      if(firstnum>12){
          constructTd(smonth,24,12+(13-smonth));
      }else{
          constructTd(smonth,12,13-smonth);
      }
      
      next.disabled=false;
      previous.disabled=true;
   }
   
   if(nowpage>1){
      constructTd(1,24,24);
      next.disabled=false;
      previous.disabled=false;
   }
   getTotal();
   return;
}
//做一个翻页的功能 ，每页24条数据 ，第一页，最后一页。
function resetValue(){
   //刷新rowData数据
   getTableData(nowpage);
   
   nowpage=nowpage+1;
   showsyear=showsyear+2;
   showeyear=showeyear+2;
   if(showeyear>eyear){
      curyear.innerText='年份：'+showsyear;
   }else{
   	  curyear.innerText='年份：'+showsyear+"-"+showeyear;
   }
   removeTab();
  
   if(nowpage==totalpages){
      if(lastnum>12){
      	//如果小于24个月大于12个月
      	constructTd(1,emonth+12,12+emonth);
      }else{
        constructTd(1,emonth,emonth);
      }
      next.disabled=true;
      previous.disabled=false;
   }
   
   if(nowpage<totalpages){
      constructTd(1,24,24);
      next.disabled=false;
      previous.disabled=false;
   }
   getTotal();
   return ;
}

function removeTab(){
    var maxlength=tr1.cells.length-2;
    //alert(maxlength);
    for(i=2;i<maxlength;i++){
       //alert(i);
       //alert(maxlength);
       tr1.deleteCell(2);
       var jj=0;//用来区别删除cell 2或cell 1  此处jj要根据具体情况来 如有的标的只有二个子标的，那么jj跨度为2，如果有四个,jj=4
       for(ii=0;ii<arrayObjTr.length;ii++){
          //此处为3 不一定，演示用
          if(jj%4==0){
          	 arrayObjTr[ii].deleteCell(2);
          }else{
             arrayObjTr[ii].deleteCell(1);
          }
          jj++;
       }
    }
}

function constructTd(smonth,emonth,pagetotalnum){
    for(i=smonth;i<=emonth;i++){
   		   //月份显示
   		   //超过12个月时，前面加'-'
   		   var showmonth=i;
   		   if(i>12){
   		      showmonth=12-i;
   		   }
   		   var td11=tr1.insertCell(2+i-smonth);
   		   td11.style.textAlign="center";
   		   td11.setAttribute("width","0.16%");
   		   td11.innerText=showmonth+"月";
   		   for(iii=0;iii<arrayObjTr.length;iii++){
   		       if(iii==0||isOddCell(iii,arrayObjB)){
   		       	    temptd=arrayObjTr[iii].insertCell(2+i-smonth);
   		       }else{
   		            temptd=arrayObjTr[iii].insertCell(1+i-smonth);
   		       }
   		       temptd.style.textAlign="center";
   		       temptd.setAttribute("width","0.16%");
   		       //这里把翻页后的值保存下来 getTableData
   		       
   		       var myDate = new Date();
   		       var curmonth = myDate.getMonth();    //获取当前月份(0-11,0代表1月)
   		       var thisyear = myDate.getYear();
   		       if(isView=='true'){
   		       		//如果是查看页面则不设置可编辑状态
   		       }
   		       else{
   		         if(isAdmin=='false'){
   		       		//如果不是管理员角色
   		       		//只能修改当月,对于普通帐号 管理员可以修改任意月份的
   		           if((Math.abs(parseInt(curmonth)+1)==Math.abs(parseInt(showmonth)))&&showeyear==''&&parseInt(showsyear)==parseInt(thisyear))
   		           {
		   		       temptd.onclick = function (){
						   EditCell(this);
					   }
				   }
				   if((parseInt(showsyear)==parseInt(thisyear)&&parseInt(curmonth)+1==parseInt(showmonth))){
				       temptd.onclick = function (){
						   EditCell(this);
					   }
				   }else if(parseInt(showmonth)<0&&parseInt(showeyear)==parseInt(thisyear)&&Math.abs(parseInt(curmonth)+1)==Math.abs(parseInt(showmonth)))
				   {
				       temptd.onclick = function (){
						   EditCell(this);
					   }
				   }
   		       	 }else{
   		       	 	 //如果管理员
   		       	     temptd.onclick = function (){
						   EditCell(this);
					 }
   		       	 }
			   }
			   //如果是第一次加载该页面,那么从后台传值
		       //如果不是第一次，只是上二年，下二年的按钮点击,那么根据 格子 坐标来确定值,tr横坐标,td纵坐标
	     	   //iii是横坐标  (2+i-smonth)是纵坐标 根据该坐标来确定值
			   var valuePos = getValueByPos(iii,(1+i-smonth),pagetotalnum);
			   temptd.innerText=valuePos;
   		    }
   	  }
}

function isOddCell(iii,arrayObjB){
    if(arrayObjB.length!=0&&arrayObjB[0]!=''){
        var sum=0;
        var sumArray = new Array();
        for(var id=0;id<arrayObjB.length;id++){
            sum+=arrayObjB[id];
            sumArray.push(sum);
        }
        
       for(var isum=0;isum<sumArray.length;isum++){
          if(iii==sumArray[isum]){
             return true;
          }
       }
    }
    
    return false;
}

function getValueByPos(x,y,pagetotalnum){
     var returnValue=0;
     //pagetotalnum  该页一行有多少个月 从而计算出数组下标
     var arrayindex = pagetotalnum*x+(y-1);
     //alert(x+'   '+y);
     returnValue = rowData[nowpage-1][arrayindex];
     //alert(returnValue);
     if(returnValue=="undefined"||returnValue==""||returnValue==null){
        returnValue=0; 
     }else{
     	returnValue = rowData[nowpage-1][arrayindex];
     }
     return returnValue;
}

function getTotal(){
	 var rowlen = tab.rows.length;
	 //计算总数 所有子标的数量之和
	 var plansum = new Array(120);
	 var praticalsum = new Array(120);
	 //初始化数组
	 for(var ik=0;ik<120;ik++){
	     plansum[ik]=0;
	     praticalsum[ik]=0;
	 }
	 var sumindex = 0;
	 var plansumindex = 0;
	 //计划和实际轮流着来
	 var transfer=true;
	 for(var kk=1;kk<rowlen;kk++){
		   var columlen = tab.rows[kk].cells.length;
		   //小于3行，那么不是有数字的行，直接跳过
		   if(columlen<3)
		      continue;
		   for(var jj=1;jj<columlen-2;jj++){
		       //轮流给值
		       if(transfer==false){
		           //判断是否数字if(!isNaN(val)){
		           if(!isNaN(parseInt(tab.rows[kk].cells[jj].innerText)))
			       	   praticalsum[sumindex]+=parseInt(tab.rows[kk].cells[jj].innerText);
			   }else{
			       if(!isNaN(parseInt(tab.rows[kk].cells[jj].innerText)))
			       	   plansum[plansumindex]+=parseInt(tab.rows[kk].cells[jj].innerText);
			   }
		   }
		   if(transfer==false){
		      sumindex++;
		   	  transfer = true;
		   }else{
		      plansumindex++;
			  transfer = false;
		   }
	 }
	 var pindex=0;
	 var prindex=0;
	 //统计每个月的值(百分比)
	 for(pp=0;pp<arrayObjT.length;pp++){
	     if(pp%2==0){
	     	arrayObjT[pp].style.textAlign="center";
	    	arrayObjT[pp].innerText=plansum[pindex];
	    	pindex++;
	     }else{
	        arrayObjT[pp].style.textAlign="center";
	        arrayObjT[pp].innerText=praticalsum[prindex];
	        prindex++;
	        arrayObjD[pp].style.textAlign="center";
		   	if(plansum[pindex-1]==0||plansum[pindex-1]==null||plansum[pindex-1]==""){
		   	   arrayObjD[pp].innerText="0%"
		   	}else{
		       arrayObjD[pp].innerText=formatFloat(praticalsum[prindex-1]/plansum[pindex-1]*100,2)+'%';
		    }
	     }
	 }
}

//截取小数点后二位
function formatFloat(src, pos)
{
    return Math.round(src*Math.pow(10, pos))/Math.pow(10, pos);
}

//设置指定单元格可编辑
function EditCell(element){
   CreateTextBox(element, element.innerHTML);
}

//为单元格创建可编辑输入框
function CreateTextBox(element, value){
		//检查编辑状态，如果已经是编辑状态，跳过
		var editState = element.getAttribute("EditState");
		if(editState != "true"){
		   //创建文本框
		   var textBox = document.createElement("INPUT");
		   textBox.type = "text";
		   textBox.size="10"
		   textBox.style.textAlign="center";
		   textBox.className="EditCell_TextBox";
		   //设置文本框当前值
		   if(!value){
		       value = element.getAttribute("Value");
		   }
		   var prevalue=value;  
		   //设置文本框的失去焦点事件
		   textBox.onblur = function (){
			    CancelEditCell(this.parentNode, this.value , prevalue);
		   }
		   textBox.value = value;
		   //向当前单元格添加文本框
		   ClearChild(element);
		   element.appendChild(textBox);
		   textBox.focus();
		   textBox.select();
		  
		   //改变状态变量
		   element.setAttribute("EditState", "true");
		   element.parentNode.parentNode.setAttribute("CurrentRow", element.parentNode.rowIndex);
	 }
}

//清空指定对象的所有字节点
function ClearChild(element){
   element.innerHTML = "";
}

//取消单元格编辑状态
function CancelEditCell(element, value, prevalue){
        //失去焦点时，如果不是数字，则不允许修改
		if(isNaN(value)){
		   alert('必须为数字,请重新输入');
		   element.setAttribute("Value", prevalue);
		   element.innerHTML = prevalue;
		   element.setAttribute("EditState", "false");
		   return;
		}
		if(trim(value)==""){
		   value="0";
		}
		element.setAttribute("Value", value);
		element.innerHTML = value;
		element.setAttribute("EditState", "false");
		//检查是否有公式计算
		getTotal();
}

//取到每个格子中的数据 所有数据存入一个数组中,逗号隔开.
//假设2010.09---2013.10 rowData[1][20] 代表第二页的第二行第2个月的数据 2012.02
//假设2010.01---2010.12 rowData[0][1] 代表第一页的第一行第2个月的数据 2010.02
function getTableData(ipage){
   cleanData(ipage);
   for(irow=1;irow<tab.rows.length;irow++){
	   //跳过空行
	   if(tab.rows[irow].cells.length<2){
	       continue;
	   }
	   for(icol=1;icol<tab.rows[irow].cells.length-2;icol++){
		   //开始循环取值
		   //是数字才记录下来
		   if(!isNaN(tab.rows[irow].cells[icol].innerText)){
		        rowData[ipage-1].push(tab.rows[irow].cells[icol].innerText);
		   }
       }
    }
}
	
function cleanData(ipage){
	   //从第二行开始
	   for(irow=1;irow<tab.rows.length;irow++){
	        //跳过空行
	        if(tab.rows[irow].cells.length<2){
	           continue;
	        }
	        for(icol=1;icol<tab.rows[irow].cells.length-2;icol++){
	           //开始循环取值
	           //是数字才记录下来
	           if(!isNaN(tab.rows[irow].cells[icol].innerText)){
	               rowData[ipage-1].pop();
	           }
	        }
	    }
}

//去掉空格
function trim(szStr){
  //去掉字符串头部的空格
  while(szStr.length > 0){
	    if( szStr.substring(0, 1) != ' '){
	      break;
	    }else{
	      szStr = szStr.substring(1);
	    }
  }

  //去掉字符串尾部的空格
  while(szStr.length > 0){
	    if( szStr.substring(szStr.length - 1, szStr.length) != ' '){
	      break;
	    }else{
	      szStr = szStr.substring(0,szStr.length - 1);
	    }
  }
  return szStr;
}

function cancel(){
   history.go(-1);
}

function organizeData(){
    //保存所有格子里的值 除了total(百分比，总数)
    var allgridsvalue = '';
    //获取当前页的值
    getTableData(nowpage);
    for(pageindex=0;pageindex<totalpages;pageindex++){
        for(arrayindex=0;arrayindex<rowData[pageindex].length;arrayindex++){
            if(arrayindex!=rowData[pageindex].length-1){
          	   allgridsvalue+=rowData[pageindex][arrayindex]+',';
            }else{
               allgridsvalue+=rowData[pageindex][arrayindex];
            }
        }
        if(pageindex!=totalpages-1){
           allgridsvalue+='|';
        }
    }    
    
    return allgridsvalue;
}

function submitData(){
   //所有格子里的值
   var pageData = organizeData();
   $.ajax({
       type: "POST",
       url: basePath + "/projectaddprotrack.do?billid="+proid+'&proname='+proname+'&pagedata='+pageData+'&trackid='+trackid,
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   		 	alert('编辑项目进度成功');
			   			window.location.href=basePath+"/c_serieslist.do";
			   		}
			   		else{
			   			alert('编辑项目进度失败');
			   		}
			   },
			   failure:function (){
			   		alert("未知错误！");
			   }	   
   });
}



//是否查看页面
if(isView=='true'){
    disableSubmitButton();
}

function disableSubmitButton(){
    //当为view页面时，禁止提交按钮
    document.getElementById('submit').disabled=true;
}
</script>
</body>
</html>