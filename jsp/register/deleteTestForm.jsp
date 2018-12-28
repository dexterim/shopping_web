<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");

	id = (id ==null) ? "": id;
	// if(id == null){
	// 	id = "";
	// }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>레코드 삭제</title>
<link href="/cban/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
<div class="container">
	<div class="page-header">
	  <h1>member테이블에 레코드 삭제 <small>2cban</small></h1>
	</div>
	<form class="form-horizontal" method="post" action="deleteTestPro.jsp">
		<div class="form-group">
			<label class="col-sm-2 control-label">아이디</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="id" placeholder="아이디입력" maxlength="20" value="<%=id%>">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">패스워드</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" name="pass" placeholder="비밀번호 입력" maxlength="16">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10 col-sm-offset-2">
				<input type="submit" class="btn btn-warning btn-block" value="정보 삭제 완료">
			</div>
		</div>
	</form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/cban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</body>
</html>