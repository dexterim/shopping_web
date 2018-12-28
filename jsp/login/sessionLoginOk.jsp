<!-- include 액션태그를 사용하는 폼 -->
<!-- include로 조각페이지를 삽입하기 때문에 html 구조는 하나만 있도록 신경쓰기! -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- request를 통해 전달되는 값이 한글일 경우의 처리를 위해 써주는 자바 코드 -->
<!-- 해당 코드가 없으면 서버에서 소스를 볼 때 주석의 한글조차 제대로 보이지 않는다. -->
<% request.setCharacterEncoding("UTF-8");%>

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>액션태그 include 연습</title>
	<!-- include로 가져온 content_about에 대한 font url입니다. -->
	<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
</style>
<!-- include로 가져온 page에 대한 bootstap css링크입니다. -->
<link href="/cban/_final_test/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="/cban/_final_test/css/login_cover.css" rel="stylesheet">
</head>
<body>
	<div class="cover-container">
	      <main role="main" class="inner cover">
	      <h1 class="cover-heading"><%=id%> 님 안녕하세요</h1>
	      <p class="lead">지금 마이페이지를 확인하시겠습니까?.</p>
	      <p class="lead">
	        <a href="../register/selectTest.jsp" class="btn btn-primary">마이페이지 보기</a>
	        <a href="../login/sessionLogout.jsp" class="btn btn-warning">로그아웃</a>
	      </p>
	    </main>
	</div>
</body>
</html>

