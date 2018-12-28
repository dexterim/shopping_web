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
<style>
.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
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
  <ul class="nav nav-pills pull-right">
    <li role="presentation"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">로그인</button></li>
    <li role="presentation"><button type="button" id="modal_login" class="btn btn-warning">로그인 2</button></li>
    <li role="presentation"><a href="insertMemberForm.jsp" class="btn btn-success">회원가입</a></li>
  </ul>
<%
      } else {
%>
    <ul class="nav nav-pills pull-right">
      <li role="presentation" class="active"><a href="sessionLogout4.jsp"><%=id%> 님 안녕하세요</a></li>
    </ul>
<%
      }
  }catch(Exception e){
    e.printStackTrace();
  }
%>
  </div>
</nav>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">로그인폼</h4>
      </div>
      <div class="modal-body">
        <form class="form-signin" method="post" action="sessionLoginPro4.jsp">
          <input type="text" name="id" maxlength="50" class="form-control" placeholder="아이디 입력" required="required" autofocus="autofocus">
          <input type="password" name="passwd" maxlength="16" class="form-control" placeholder="비밀번호 입력" required="required">
          <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
        </form>
      </div>
    </div>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/cban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script>
//선택자만 잘 쓰셔도 50점 먹고 들어가요
// $('.nav li:eq(1) button').click(function(){
//   alert('눌렀엉?');
// });
$('#modal_login').click(function(){
  $('#myModal').modal('show');
});
</script>
</body>
</html>