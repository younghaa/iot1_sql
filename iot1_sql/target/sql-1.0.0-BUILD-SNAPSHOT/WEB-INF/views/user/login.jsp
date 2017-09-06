<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<title>LOGIN</title>

</head>
<link rel="stylesheet" href="${rootPath}/resources/ui/signin.css" />
<body>
	<div class="container">
		<form class="form-signin">
			<h2 class="form-signin-heading">Please login</h2>
			<label for="inputEmail" class="sr-only">ID</label> 
			<input type="text"id="userId" name="id" class="form-control" placeholder="ID" required value="${userId}"autofocus> 
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="userPwd" name="pwd" class="form-control" placeholder="Password" required> 
			<div class="checkbox">
				<label> <input type="checkbox" value="1" id="saveId">
					Remember me
				</label>
			</div>
			<button id="btn2" class="btn btn-lg btn-primary btn-block" type="button">Login</button>
		</form>

	</div>
	<!-- /container -->
<script>
	$("#btn2").click(function(){
		var paramIds = "userId,userPwd";
		var au = new AjaxUtil("/user/login",paramIds); 
		au.send();
	});
</script>
</body>
</html>