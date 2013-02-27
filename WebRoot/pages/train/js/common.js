Date.prototype.format = function(format){
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

function getCurDate(){
    var dateTime = new Date();
    var thisdate = dateTime.format('yyyy-MM-dd');
    return thisdate;
}

function defDefaultDate(inputObj){
   //current date
   inputObj.value = getCurDate();
}

function forward(url) {
	window.location.href = url;
}
function onOption(url) {
	var mid = "";
	var obj = document.getElementsByTagName("input");
	for (i = 0; i < obj.length; i++) {
		if (obj[i].type == "radio"||obj[i].type == "checkbox") {
			if (obj[i].checked == true) {
				if (mid == "") {
					mid = obj[i].id;
				} else {
					alert("\u8bf7\u9009\u62e9\u4e00\u6761\u8bb0\u5f55\u8fdb\u884c\u64cd\u4f5c\uff01");
					return false;
				}
			}
		}
	}
	if (mid == "") {
	    //alert(mid);
		alert("\u8bf7\u9009\u62e9\u4e00\u6761\u8bb0\u5f55\u8fdb\u884c\u64cd\u4f5c\uff01");
		return false;
	}
	forward(url + "?mid=" + mid);
}
function onDelete(url) {
	var mid = "";
	var obj = document.getElementsByTagName("input");
	for (i = 0; i < obj.length; i++) {
		if (obj[i].type == "radio"||obj[i].type == "checkbox") {
			if (obj[i].checked == true) {
				if (mid == "") {
				    
					mid = obj[i].id;
				} else {
					alert("\u8bf7\u9009\u62e9\u4e00\u6761\u8bb0\u5f55\u8fdb\u884c\u64cd\u4f5c\uff01");
					return false;
				}
			}
		}
	}
	if (mid == "") {
		alert("\u8bf7\u9009\u62e9\u4e00\u6761\u8bb0\u5f55\u8fdb\u884c\u64cd\u4f5c\uff01");
		return false;
	}
	if (!confirm("\u786e\u5b9a\u8981\u5220\u9664\u6240\u9009\u8bb0\u5f55\u5417\uff1f")) {
		return false;
	}
	forward(url + "?mid=" + mid);
}
function pages(formName, npage) {
	if (npage != "-1") {
		$("#nowpage").val(npage);
	}
	if (formName != "") {
		document.forms[formName].submit();
	} else {
		document.forms[0].submit();
	}
}

