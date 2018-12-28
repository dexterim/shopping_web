<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="_final_test.member.LogonDBBean"%>

<% request.setCharacterEncoding("utf-8");%>

<%
   String id = request.getParameter("id");
	String pass  = request.getParameter("pass");

	LogonDBBean logon = LogonDBBean.getInstance();
	//디비빈 초기화_userCheck에서 가져옴
    int check= logon.userCheck(id,pass);

	if(check==1){
			session.setAttribute("id",id);
			response.sendRedirect("/cban/_final_test/jsp/main/include.jsp");

	}else if(check==0){%>
	<script>
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);//바로 직전페이지로 돌려줌
	</script>
<%}else{ %>
	<script>
	  alert("아이디가 맞지 않습니다..");
	  history.go(-1);
	</script>
<%}%>