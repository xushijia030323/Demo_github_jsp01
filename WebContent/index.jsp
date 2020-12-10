<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id="app">
		<label>用户名：</label>
		<input type="text" v-model="uname"/><br/>
		<label>密码：</label>
		<input type="text" v-model="upwd" v-on:keydown.enter="handleSubmit"/><br/>
		<button @click="handleSubmit">测试fetch</button>
	</div>
	<div id="mydiv" style="color:red;font-size:20px;"></div>
	<script src="<%=path %>/js/vue.js" type="text/javascript"></script>
	<script>
		var vm=new Vue({
			el:'#app',
			data:{
				uname:'',
				upwd:''
			},
			methods:{
				handleSubmit:function(){
					//alert('用户名：'+this.uname+' 密码：'+this.upwd);
					var person={"name":this.uname,"pwd":this.upwd};
					fetch('ajax',{
						method:'post',
						body:JSON.stringify(person),
						headers:{
							'Content-Type': 'application/json'
						}
					}).then(function(data){
						return data.text();
					}).then(function(data){
						//alert(data);
						var dta=eval("("+data+")");
						document.getElementById("mydiv").innerHTML=dta.name;
					});
				}
			}
		});
	</script>
</body>
</html>