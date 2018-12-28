<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ch12.member.LogonDBBean"%>

<% request.setCharacterEncoding("utf-8");%>
<%
    String id = request.getParameter("id");

	LogonDBBean logon = LogonDBBean.getInstance();
    int check= logon.userExist(id);
	if(check==1){
%>
	<script>
	alert("아이디가 존재합니다");

	// 2초뒤에 main.jsp 로 넘어감
	setTimeout(function(){
		location.href = 'main.jsp'
	}, 2000);
	</script>

<%}else{%>
	<script>
		alert("아이디가 없습니다.");
		history.go(-1);
	</script>
<%}%>