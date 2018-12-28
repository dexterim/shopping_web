<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>레코드  표시</title>
<link href="/cban/assets/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<style>
  th {
    background-color: #D8D8D8;
    text-align: center;
  }
</style>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
<div class="container">
    <div class="page-header">
      <h1>회원 레코드 표시<small>manager</small></h1>
    </div>
    <a href="../login/sessionLoginPro.jsp" class="btn btn-success col-md-6">홈으로</a>
    <a href="../login/sessionLogout.jsp" class="btn btn-danger col-md-6">로그아웃</a>
    <table class="table table-bordered table-striped">
      <colgroup>
        <col span="11">
      </colgroup>
      <thead>
        <tr>
          <th>이름</th>
          <th>아이디</th>
          <th>패스워드</th>
          <th>주민번호1</th>
          <th>주민번호2</th>
          <th>성별</th>
          <th>전화번호1</th>
          <th>전화번호2</th>
          <th>다중항목</th>
          <th>다중항목값</th>
          <th>가입일자</th>
          <th>관리</th>
        </tr>
      </thead>
      <tbody>
        <%
        Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        try{
        String jdbcUrl = "jdbc:mysql://localhost:3306/cban";
        String dbId = "cban";
        String dbPass = "1234";

        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);

        String sql = "select name, id, pass, security1, security2, gender, phone1, phone2, group_concat(m_name separator ',') as list, GROUP_CONCAT(multi SEPARATOR ',') as multi_list, reg_date from (select name, c_member.id, pass, security1, security2, gender, phone1, phone2, m_name, group_concat(m_value separator ',') as multi, reg_date from c_member left join c_multi on c_multi.id = c_member.id group by id, m_name) as table_concat group by id";
        pstmt=conn.prepareStatement(sql);

        rs=pstmt.executeQuery();

        while(rs.next()){
          String name = rs.getString("name");
          String id = rs.getString("id");
          String pass = rs.getString("pass");
          String security1 = rs.getString("security1");
          String security2 = rs.getString("security2");
          String gender = rs.getString("gender");
          String phone1 = rs.getString("phone1");
          String phone2 = rs.getString("phone2");
          String list = rs.getString("list");
          String multi_list = rs.getString("multi_list");
          Timestamp register = rs.getTimestamp("reg_date");
        %>
        <tr>
          <td><%=name%></td>
          <td><%=id%></td>
          <td><%=pass%></td>
          <td><%=security1%></td>
          <td><%=security2%></td>
          <td><%=gender%></td>
          <td><%=phone1%></td>
          <td><%=phone2%></td>
          <td><%=list%></td>
          <td><%=multi_list%></td>
          <td><%=register.toString()%></td>
          <td class="text-center">
            <button type="button" class="btn btn-primary btn-xs">수정</button>
            <button type="button" class="btn btn-danger btn-xs">삭제</button>
          </td>
        </tr>
        <%  }
      }catch(Exception e){
      e.printStackTrace();
    }finally{
    if(rs != null)
    try{rs.close();}catch(SQLException sqle){}
    if(pstmt != null)
    try{pstmt.close();}catch(SQLException sqle){}
    if(conn != null)
    try{conn.close();}catch(SQLException sqle){}
  }
  %>
</tbody>
</table>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/cban/assets/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script>
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