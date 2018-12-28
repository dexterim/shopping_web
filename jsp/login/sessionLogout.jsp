<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% session.invalidate(); %>
<!-- cookie는 set~를 0으로 만들어줌 -->

<script>
    alert("로그아웃 되었습니다.");
	location.href="/cban/_final_test/jsp/main/include.jsp";
</script>