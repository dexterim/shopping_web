<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String id ="";
   try{
     id = (String)session.getAttribute("id");
     if(id==null || id.equals("")){
%>
      <div class="container img_login">
      <div class="loginbox">
          <img src="../../assets/img/user.png" class="avatar">
          <h1>Login Here</h1>
          <form method="post" action="../login/sessionLoginPro.jsp">
              <p>Id</p>
              <input type="text" name="id" placeholder="Enter UserId">
              <p>Password</p>
              <input type="password" name="pass" placeholder="Enter UserPassword">
              <input type="submit" name="" value="Login">
              <a href="#">Lost your password?</a><br>
              <a href="#">Don't have an account?</a>
          </form>
      </div>
    </div>
<%
      } else {
%>
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

<%
      }
  }catch(Exception e){
    e.printStackTrace();
  }
%>