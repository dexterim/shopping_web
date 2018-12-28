<!-- include 액션태그를 사용하는 폼 -->
<!-- include로 조각페이지를 삽입하기 때문에 html 구조는 하나만 있도록 신경쓰기! -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- request를 통해 전달되는 값이 한글일 경우의 처리를 위해 써주는 자바 코드 -->
<!-- 해당 코드가 없으면 서버에서 소스를 볼 때 주석의 한글조차 제대로 보이지 않는다. -->
<% request.setCharacterEncoding("UTF-8");%>

<!-- include로 가져온 네비게이션바의 a태그 선택시 가변적으로 중앙 include가 변하도록 하는 자바 코드 -->
<%
	//리퀘스트로 위에 넘긴 Get방식의 파라미터명을 써서 내용을 받는다.
String pageName = request.getParameter("page");

	// page 변수로 전달되는 값이 없을 때 기본적으로 보여줄 페이지
if(pageName == null){
	pageName = "content_main";
}
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
<!-- include로 가져온 content_main에 대한 css링크입니다. -->
<link href="/cban/_final_test/css/parallex.css" rel="stylesheet">
<!-- include로 가져온 form.jsp와, to.jsp(=register)에 대한 css링크입니다. -->
<link href="/cban/_final_test/css/register.css" rel="stylesheet">
<!-- include로 가져온 login에 대한 css링크입니다. -->
<link href="/cban/_final_test/css/login.css" rel="stylesheet">
<link href="/cban/_final_test/css/login_cover.css" rel="stylesheet">
<!-- include로 가져온 내비게이션 바에 대한 css 링크입니다. -->
<link href="/cban/_final_test/css/nav.css" rel="stylesheet">
</head>
<body>
	<!-- 코드 조각조각내기 -->

	<!-- include로 가져온 내비게이션 바입니다. -->
	<jsp:include page="../menu/nav.jsp" flush="false"/>
	<!-- include로 가져온 메인 화면입니다. -->
	<jsp:include page='<%=pageName+".jsp"%>' flush="false"/>

	<!-- include로 가져온 폼에 대한 javascript 링크입니다. -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/cban/_final_test/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script>

// $(document).ready(function(){
// 	var chk = $('#isChk');
// 	$(':checkbox', chk).click(function(){
// 		if( $(this).is(':checked') ){
//         	$('#chk').val('1');
//         	console.log($('#chk').val());
//         }
//         else{
//         	$('#chk').val('0');
//         	console.log($('#chk').val());
//         }
// 	});
// });

function overlap() {
	alert( '중복확인이 되었습니다.');
}
function send() {
	alert( '인증번호를 보냈습니다.');
}
function checkForm(obj){
	// validation code
	//checkbox ,로 찍어 넘기기
	var nums = "";

	$("input:checkbox[name=hobby]").each(function(index) {
		if($(this).prop("checked")) {
			nums += nums == "" ? $(this).val() : ","+ $(this).val();
		};
	});

	$("input:text[name=chk]").val(nums);


	//multiselect ,로 찍어 넘기기
	var sel_nums="";
	sel_nums =	$("#subject").val();
	$("input:text[name=mul]").val(sel_nums);

	if(obj.id.value==''){
		alert('필수 입력입니다.');
		obj.id.focus();
		return false;
	}
	if($('#pass_chk1').val().length<6){
		alert('비밀번호는 6자리 이상 입력입니다.');
		$('pass_chk1').focus();
		return false;
	}
	if($('#pass_chk1').val()!= $('#pass_chk2').val()){
		alert('비밀번호가 일치하지 않습니다.');
		$('pass_chk1').focus();
		return false;
	}
	return true;

}
//수정
$('.btn-primary').click(function(){
  var id = $(this).parents('tr').find('td:nth-child(1)').text();
  location.href = 'updateTestForm.jsp?id='+id;
  //updateTestForm.jsp?id=hong으로 넘어감
});
//삭제
$('.btn-danger').click(function(){
  var id = $(this).parents('tr').find('td:nth-child(1)').text();
  if(confirm(id+' 를 정말로 삭제하시겠습니까?')){
    location.href = 'deleteTestForm.jsp?id='+id;//deleteTestForm.jsp?id=hong으로 넘어감
  };


});
</script>
</body>
</html>
