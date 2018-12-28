<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");%>

<%
  String id= request.getParameter("id");
  String pass= request.getParameter("pass");

  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;
  String str="";

  try{
	String jdbcUrl="jdbc:mysql://localhost:3306/cban";
    String dbId="cban";
    String dbPass="1234";
	 
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	
	String sql= "select id, pass from c_member where id= ?";
	pstmt=conn.prepareStatement(sql);
    pstmt.setString(1,id);
	rs=pstmt.executeQuery();
    
	if(rs.next()){ 
	  String rId=rs.getString("id");
	  String rPasswd=rs.getString("pass");
      if(id.equals(rId) && pass.equals(rPasswd)){
	    sql= "delete from c_member where id= ? ";
	    pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1,id);
	    pstmt.executeUpdate();
	    str ="성공";
	  }else
		//out.println("패스워드가 틀렸습니다.");
		str ="실패_패스워드 오류";
	}else
		 //out.println("아이디가 틀렸습니다.");
		 str ="실패_아이디 오류";
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
   if(str.equals("성공")){//select페이지로 이동
    response.sendRedirect("selectTest.jsp");
  }else{//insertTestForm.jsp로 이동
    response.sendRedirect("deleteTestForm.jsp?id="+id);
  }
%>