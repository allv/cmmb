
function check(array) {
	//var obj = document.forms[formName];
	var obj = document.forms[0];
	var isok = false;
	for (var i = 0; i < array.length; i++) {
		var valueName = array[i][0];
		var values = obj[valueName].value;
		var checkType = array[i][1];
		var msg = array[i][2];
		if (checkType == "password") {
			if (values.length < 1 || values.value == "") {
				isok = true;
				msg = "\u8bf7\u8f93\u5165\u5bc6\u7801\uff01";
			} else {
				obj[valueName].className = "";
				var values2 = obj["password2"].value;
				if (values2.length < 1 || values2.value == "") {
					isok = true;
					valueName = "password2";
					msg = "\u8bf7\u5728\u6b21\u786e\u8ba4\u5bc6\u7801\uff01";
				} else {
					if (values != values2) {
						isok = true;
						msg = "\u4e24\u6b21\u5bc6\u7801\u8f93\u5165\u4e0d\u4e00\u81f4\uff01";
					} else {
						obj["password2"].className = "";
					}
				}
			}
		}
		if (checkType == "select") {
			if (values == "-1") {
				isok = true;
			}
		}
		if (checkType == "string") {
			if (values.length < 1 || values.value == "") {
				isok = true;
			}
		}
		if (checkType == "int") {
			var patrn = /^[0-9]{1,20}$/;
			if (!patrn.exec(values)) {
				isok = true;
			}
		}
		if (checkType == "float") {
			if (values.length < 1 || values.value == "" || isNaN(values)) {
				isok = true;
			}
		}
		if (checkType == "tel") {
			var patrn = /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
			if (!patrn.exec(values)) {
				isok = true;
			}
		}
		if (checkType == "mobile") {
			var patrn = /^1[358]\d{9}$/;
			if (!patrn.exec(values)) {
				isok = true;
			}
		}
		if (checkType == "email") {
			var patrn = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			if (!patrn.exec(values)) {
				isok = true;
				if (msg == undefined) {
					msg = "E-mail\u683c\u5f0f\u9519\u8bef\uff01";
				}
			}
		}
		if (checkType == "http") {
			var strRegex = "^((https|http|ftp|rtsp|mms)?://)" + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" + "(([0-9]{1,3}.){3}[0-9]{1,3}" + "|" + "([0-9a-z_!~*'()-]+.)*" + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]." + "[a-z]{2,6})" + "(:[0-9]{1,4})?" + "((/?)|" + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
			var re = new RegExp(strRegex);
			if (!re.test(values)) {
				isok = true;
			}
		}
		if (checkType == "code") {
			var patrn = /^\d{6}$/;
			if (!patrn.exec(values)) {
				isok = true;
				if (msg == undefined) {
					msg = "\u90ae\u7f16\u683c\u5f0f\u9519\u8bef\uff01";
				}
			}
		}
		if (isok) {
			document.getElementById("ERROR_MSG").innerHTML = msg;
			obj[valueName].className = "errorInput";
			obj[valueName].focus();
			return false;
		} else {
			document.getElementById("ERROR_MSG").innerHTML = "";
			obj[valueName].className = "";
		}
	}
	return true;
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

