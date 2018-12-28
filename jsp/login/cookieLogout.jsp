<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				cookies[i].setMaxAge(0);//유효기간을 0으로 만들기
				response.addCookie(cookies[i]);
			}
		}
	}
%>
<script>
  alert("로그아웃 되었습니다.");
  location.href="login_main.jsp";
</script>