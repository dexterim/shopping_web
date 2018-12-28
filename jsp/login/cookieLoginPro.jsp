<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="_final_test.member.LogonDBBean"%>
<% request.setCharacterEncoding("utf-8");%>
<%
    String id = request.getParameter("id");
	String pass  = request.getParameter("pass");
	
	LogonDBBean logon = LogonDBBean.getInstance();
    int check= logon.userCheck(id,pass);

	if(check==1){
		Cookie cookie = new Cookie("id", id);
		cookie.setMaxAge(20*60);//유효기간 설정 20분 동안 유지 시킴
		response.addCookie(cookie);
		response.sendRedirect("login_main.jsp");
	}else if(check==0){%>
	
	<div class="container"> 
	<div class="alert alert-info" role="alert">
		비밀번호가 맞지 않습니다.
		<!-- 1초 후 이동_script -->
	</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/cban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script>
	setTimeout(function(){
		location.href = 'ch11/selectTest.jsp';
		//location.href = '/cban/ch11/selectTest.jsp';
		
	},1000); 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<%	}else{ %>
	<script>
	  alert("아이디가 맞지 않습니다..");
	  history.go(-1);
	</script>
<%}	%>