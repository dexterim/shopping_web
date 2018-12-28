Written by Anonymous

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap 101 Template</title>
<link href="/cban/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Project name</a>
    </div>
<%
   String id ="";
   try{
     id = (String)session.getAttribute("id");
     if(id==null || id.equals("")){
%>
    <div id="navbar" class="navbar-collapse collapse">
      <form class="navbar-form navbar-right" method="post" action="sessionLoginPro3.jsp">
        <div class="form-group">
          <input type="text" name="id" maxlength="50" class="form-control" placeholder="아이디 입력" required="required" autofocus="autofocus">
        </div>
        <div class="form-group">
          <input type="password" name="passwd" maxlength="16" class="form-control" placeholder="비밀번호 입력" required="required">
        </div>
        <button type="submit" class="btn btn-success">로그인</button>
        <a href="insertMemberForm.jsp" class="btn btn-default">회원가입</a>
      </form>
    </div><!--/.navbar-collapse -->
<%
      } else {
%>
    <ul class="nav nav-pills pull-right">
      <li role="presentation" class="active"><a href="sessionLogout3.jsp"><%=id%> 님 안녕하세요</a></li>
    </ul>
<%
      }
  }catch(Exception e){
    e.printStackTrace();
  }
%>
  </div>
</nav>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/cban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</body>
</html>