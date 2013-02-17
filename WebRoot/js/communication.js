function  Connection() {
}

Connection.prototype.init  =   function  (value) {
  	this.jurl = value;
};
Connection.prototype.send  =   function  (packagem,callbackfun) {  
	var tmp = "json="+packagem; 
	$.ajax({
	   type: "POST",
	   url: this.jurl,
	   data: tmp,
	   success: function(msg){
	   		if(callbackfun){
	   			//该方式解析json字符串效率更高，更通用
	   			var obj = new Function("return "+msg)(); 
	   			callbackfun(obj);
	   		}
	   }
	});
};

// var conn = new Connection();
// conn.init("${pageContext.request.contextPath}/test.do");
// conn.send("{pid:'123'}",showMessage);
// function showMessage(myObject){
// var kkID = myObject.kkID;
// }
