<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="_final_test.member.LogonDBBean" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="dataBean" class="_final_test.member.LogonDataBean">
	<jsp:setProperty name="dataBean" property="*"/>
</jsp:useBean>
<!-- String id = request.~~를 줄인것 -->

<%
	dataBean.setReg_date(new Timestamp(System.currentTimeMillis()) );
	LogonDBBean logon = LogonDBBean.getInstance();//try의 내용이 함축되어 있지 않을까?
	logon.insertMember(dataBean);

%>



<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>레코드  표시</title>
	<link href="/cban/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<div class="container">
		<div class="alert alert-info" role="alert">
			<jsp:getProperty name="dataBean" property="id" />님 회원가입을 축하합니다.
			<!-- 1초 후 이동_script -->
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/cban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script>
		setTimeout(function(){
			location.href = 'selectTest.jsp';
	//location.href = '/cban/ch11/selectTest.jsp';

},1000);
</script>

</body>
</html>