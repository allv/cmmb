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