isAlpha = function(str) {
	return (str.replace(/\w/g, "").length == 0); 
}

isLetter= function(str) {
	var letterReg = /^[A-Za-z]+$/;
	return letterReg.test(str);
}

isLowerCase = function(str) {
	var lowerReg = /^[a-z]+$/;
	return lowerReg.test(str);
}

isUpperCase = function(str) {
	var upperReg = /^[A-Z]+$/;
	return upperReg.test(str);
}

isAlphanumeric = function(str) {
	var reg = /^[A-Za-z0-9]+$/;
	return reg.test(str);
}

strTrim = function(str) {
	str = str + " ";
	var first = 0;
	var last = str.length - 1;
	while (str.charAt(first) == " ") {
		first++;
	}
	while (str.charAt(last) == " ") {
		last--;
	}
	if (first > last) {
		return "";
	}
	return str.substring(first, last + 1);
}

is_empty = function(str) {
	if (str == null || str == "") {
		return true;
	}
	return false;
}

is_HexStr = function(str) {
	var nChar = '';
	
	for (var i = 0; i < str.length; ++i) {
		nChar = str.charAt(i);
		if (!is_Hex(nChar)) {
			return false;
		}
	}
	
	return true;
}

is_Hex = function(ch) {
	var reghex = new RegExp("(^0x[a-f0-9]{1,2}$)|(^0X[A-F0-9]{1,2}$)|(^[A-F0-9]{1,2}$)|(^[a-f0-9]{1,2}$)");
	return reghex.test(ch);
}

is_Integer = function(d) {
	var regInt = /^-?\d+$/;
	if(!regInt.test(d)) {
		return false;
	}
	if (d < -Math.round(Math.pow(2,31)) || d > Math.round(Math.pow(2,31)) - 1) {
		return false;
	}
	return true;
}

is_positiveInteger = function(d) {
	var regInt = /^[1-9]\d*$/;
	if (!regInt.test(d)) {
		return false;
	}
	if (d > Math.round(Math.pow(2,31)) - 1) {
		return false;
	}
	return true;
}

is_negativeInteger = function(d) {
	var regInt = /^-[1-9]\d*$/;
	if (!regInt.test(d)) {
		return false;
	}
	if (d < -Math.round(Math.pow(2,31))) {
		return false;
	}
	return true;
}

is_UnsignedInt = function(d) {
	var regInt = /^\d+$/;
	if (!regInt.test(d)) {
		return false;
	}
	if (d > Math.round(Math.pow(2,32)) - 1) {
		return false;
	}
	return true;
}

is_positiveUnsignedInt = function(d) {
	var regInt = /^[1-9]\d*$/;
	if (!regInt.test(d)) {
		return false;
	}
	if (d > Math.round(Math.pow(2,32)) - 1) {
		return false;
	}
	return true;
}

is_Number = function(d) {
	var regInt = /^-?\d+$/;
	return regInt.test(d);
}

is_positiveNumber = function(d) {
	var regInt = /^[1-9]\d*$/;
	return regInt.test(d);
}

is_negativeNumber = function(d) {
	var regInt = /^-[1-9]\d*$/;
	return regInt.test(d);
}

non_negativeNumber = function(d) {
	var regInt = /^\d+$/;
	return regInt.test(d);
}

non_positiveNumber = function(d) {
	var regInt = /^-\d+$/;
	return regInt.test(d);
}

is_numcode = function(num) {
	var regexp= /^\d+$/;
	return num.match(regexp);
}

is_Float = function(f) {
	var regFloat = /^-?([1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0)$/;
	return regFloat.test(f);
}

is_positiveFloat = function(f) {
	var regFloat = /^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$/;
	return regFloat.test(f);
}

is_negativeFloat = function(f) {
	var regFloat = /^-([1-9]\d*\.\d*|0\.\d*[1-9]\d*)$/;
	return regFloat.test(f);
}

non_negativeFloat = function(f) {
	var regFloat = /^[1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0$/;
	return regFloat.test(f);
}

non_positiveFloat = function(f) {
	var regFloat = /^(-([1-9]\d*\.\d*|0\.\d*[1-9]\d*))|0?\.0+|0$/;
	return regFloat.test(f);
}

is_Money = function(m) {
	var regMoney = /^((\d{1,3}(,\d{3})*)|(\d+))(\.\d{1,2})?$/ ;
	return regMoney.test(m);
}

is_mobile = function(str) {
	if (str == null || str == "") {
		return true;
	}
	if ((str.length < 6) || (str.length > 15)) {
		return false;
	}
	var mobileReg = /^\d+$/;
	return mobileReg.test(str);
}

is_phone = function(str) {
	if (str == null || str == "") {
		return true;
	}
	
	var phoneReg = /^\d{3}-\d{8}|\d{4}-\d{7}$/;
	return phoneReg.test(str);
}

is_EMail = function(str){ 
	res = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	var re = new RegExp(res);
	return !(str.match(re) == null);
}

is_IPAddr = function(str) {
	var arr;
	if (arr = str.match(/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/)) {
		for (var i = 1; i < arr.length; i++) {
			if (parseInt(arr[i]) > 255) {
				return false;
			}
		}
		return true;
	} else {
		return false;
	}
}

is_Port = function(d) {
	var regInt = /^[1-9]\d*$/;
	if (!regInt.test(d)) {
		return false;
	}
	if (parseInt(d) > 65535) {
		return false;
	}
	
	return true;
}

is_URI = function(url) {
	var strRegex = "^((https|http|ftp|rtsp|mms)?://)?" 
		+ "(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?"
		+ "(([0-9]{1,3}.){3}[0-9]{1,3}"  
		+ "|" 
		+ "([0-9a-z_!~*'()-]+.)*" 
		+ "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]." 
		+ "[a-z]{2,6})" 
		+ "(:[0-9]{1,4})?" 
		+ "((/?)|" 
		+ "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
    var re = new RegExp(strRegex); 
	if (re.test(url.toLowerCase())) {
		return true; 
	} else { 
		return false;
	}
}

is_Domain = function(domain) {
	var strRegex = /[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+\.?/;
	return strRegex.test(domain);
}

is_duplicated = function(arr, val) {
	if (arr.value == val) {
		return true;
	}
	var len = arr.length;
	for (var i = 0; i < len; i++) {
		if (arr[i].value == val) {
			return true;
		}
	}
	return false;
}

checkChar = function(val)
{
	var i = 0;
	var nChar = "";
	
	for(i = 0; i < val.length; ++i)
	{
		var sChar = val.charAt(i);
		if (((sChar < 'A') || (sChar > 'Z')) && ((sChar < 'a') || (sChar > 'z')) &&
			((sChar < '0') || (sChar > '9')) && (sChar != '_') && (sChar != '@') &&
			 (sChar != '-') && (sChar != '(') && (sChar != ')') && (sChar != '[') &&
			 (sChar != ']') && (sChar != '*') && (sChar != '$') && (sChar != '{') &&
			 (sChar != '}') && (sChar != '!') && (sChar != '#') && (sChar != '.') &&
			 (sChar != ' ') && (sChar != '=') && (sChar != ';') && (sChar != ':') &&
			 (sChar != ',') && (sChar != '/') && (sChar != '\n') && (sChar != '\r'))
		{
			alert("\u6B64\u5904\u4E0D\u53EF\u542B\u6709\u5B57\u7B26' " + sChar + " '!");
			nChar = sChar;
		}
	}
	return nChar;
}

