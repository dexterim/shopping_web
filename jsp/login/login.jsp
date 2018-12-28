<!-- include 액션태그를 사용하는 폼 -->
<!-- include로 조각페이지를 삽입하기 때문에 html 구조는 하나만 있도록 신경쓰기! -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


