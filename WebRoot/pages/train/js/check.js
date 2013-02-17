function getLodop(oOBJECT,oEMBED){
        var strHtmInstall="<br><font color='#FF00FF'>still uninstall? click here<a href='install_lodop32.exe' target='_self'>install</a>,re-use it after refreshing</font>";
        var strHtmUpdate="<br><font color='#FF00FF'>update ? click here<a href='install_lodop32.exe' target='_self'>update</a>,after updating and re-enter the system</font>";
        var strHtm64_Install="<br><font color='#FF00FF'>still uninstall? click here<a href='install_lodop64.exe' target='_self'>install</a>,re-use it after refreshing</font>";
        var strHtm64_Update="<br><font color='#FF00FF'>update ? click here<a href='install_lodop64.exe' target='_self'>update</a>,after updating and re-enter the system</font>";
        var strHtmFireFox="<br><br><font color='#FF00FF'>attention:<br>please uninstall it beforehand</font>";
        var LODOP=oEMBED;	
	try{		     
	     if (navigator.appVersion.indexOf("MSIE")>=0){
	         LODOP=oOBJECT;
	     }
	     
		     if ((LODOP==null)||(typeof(LODOP.VERSION)=="undefined")) {
				 if (navigator.userAgent.indexOf('Firefox')>=0)
		  	         document.documentElement.innerHTML=strHtmFireFox+document.documentElement.innerHTML;
				 if (navigator.userAgent.indexOf('Win64')>=0){
				 	if (navigator.appVersion.indexOf("MSIE")>=0) 
				 	    document.write(strHtm64_Install); 
				 	else
				 	    document.documentElement.innerHTML=strHtm64_Install+document.documentElement.innerHTML;		 
				 } else {
				 	if (navigator.appVersion.indexOf("MSIE")>=0) 
				 	    document.write(strHtmInstall); 
				 	else
				 		document.documentElement.innerHTML=strHtmInstall+document.documentElement.innerHTML;
				 }
			 return LODOP; 
	     } else if (LODOP.VERSION<"6.1.4.1") {
		if (navigator.userAgent.indexOf('Win64')>=0){
	            if (navigator.appVersion.indexOf("MSIE")>=0) document.write(strHtm64_Update); else
		    document.documentElement.innerHTML=strHtm64_Update+document.documentElement.innerHTML; 
		} else {
	            if (navigator.appVersion.indexOf("MSIE")>=0) document.write(strHtmUpdate); else
		    document.documentElement.innerHTML=strHtmUpdate+document.documentElement.innerHTML; 
		}
		 return LODOP;
	     }
	     return LODOP; 
	}catch(err){
		if (navigator.userAgent.indexOf('Win64')>=0)	
			document.documentElement.innerHTML="Error:"+strHtm64_Install+document.documentElement.innerHTML;else
			document.documentElement.innerHTML="Error:"+strHtmInstall+document.documentElement.innerHTML;
	     return LODOP; 
	}
}


Date.prototype.format = function(format)
	{
	    var o =
	    {
	        "M+" : this.getMonth()+1, //month
	        "d+" : this.getDate(),    //day
	        "h+" : this.getHours(),   //hour
	        "m+" : this.getMinutes(), //minute
	        "s+" : this.getSeconds(), //second
	        "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
	        "S" : this.getMilliseconds() //millisecond
	    }
	    if(/(y+)/.test(format))
	    format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length));
	    for(var k in o)
	    if(new RegExp("("+ k +")").test(format))
	    format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
	    return format;
	}

function check(valueName,checkType,mess){
	//var obj = document.forms[formName];
	var obj = document.forms[0];
	var values = obj[valueName].value;
	var isok = false;
	
	if(checkType == "select"){
		if(values == "-1")
			isok = true;
	}
	
	if(checkType == "string"){
		if(values.length < 1 || values.value == "")
			isok = true;
	}
	
	if(checkType == "int"){
		var patrn = /^[0-9]{1,20}$/;
		if (!patrn.exec(values))
			isok = true;
	}
	
	if(checkType == "float"){
		if(values.length < 1 || values.value == "" || isNaN(values))
			isok = true;
	}
	
	if(checkType == "tel"){
		var patrn = /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
		if (!patrn.exec(values))
			isok = true;
	}
	
	if(checkType == "bank"){
		var patrn = /^\d{19}$/g;
		if (!patrn.exec(values))
			isok = true;
	}
	
	if(checkType == "mobile"){
		var patrn = /^1[358]\d{9}$/;
		if (!patrn.exec(values))
			isok = true;
	}
	
	if(checkType == "email"){
		var patrn = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if (!patrn.exec(values))
			isok = true;
	}
	
	if(checkType == "http"){
		var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
									+ "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" // ftp��user@
									+ "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP��ʽ��URL- 199.194.52.184
									+ "|" // ����IP��DOMAIN������
									+ "([0-9a-z_!~*'()-]+\.)*" // ����- www.
									+ "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // ��������
									+ "[a-z]{2,6})" // first level domain- .com or .museum
									+ "(:[0-9]{1,4})?" // �˿�- :80
									+ "((/?)|" // a slash isn't required if there is no file name
									+ "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
		var re = new RegExp(strRegex);
		if (!re.test(values))
			isok = true;
	}
	
	if(checkType == "code"){
		var patrn = /^\d{6}$/;
		if (!patrn.exec(values))
			isok = true;
	}
	
	if(isok){
		//document.getElementById("ERROR_MSG").innerHTML = mess;
		alert(mess);
		obj[valueName].className = "errorInput";
		obj[valueName].focus();
		return true;
	}else{
		obj[valueName].className = "";
		return false;
	}
}

/**********************************************************
var array = 
[
	{valueName:"username", type:"string", msg:"xxx"},
	{valueName:"password", type:"password", msg:"xx"}
];
alert(array[0].valueName);

var array2 = 
[
	["username","string","xx"],
	["password","password","xx"]
]
alert(array2[0][0]);
***********************************************************/