package _final_test.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.lang.*;

public class LogonDBBean {

    private static LogonDBBean instance = new LogonDBBean();
    //객체 생성시 마다 instance는 바뀌기 때문에 전에 생성한 객체를 유지 시키기 위해
    //다음과 같은 행동을 해줘야 한다.
    public static LogonDBBean getInstance() {
        return instance;
    }
    //static 자바 파일 생성만 된다면 객체 생성 없이 접근 가능

    private LogonDBBean() { }

	private Connection getConnection() throws Exception {
	    Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/cban");
	    return ds.getConnection();
	}

	//------------------------------ c_member에 insert ----------------------------------

	public void insertMember(LogonDataBean dataBean)
		              throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int m_num = 0;
		String hobby[] = dataBean.getHobby();
		String subject[] = dataBean.getSubject();

	try{
			conn = getConnection();

			pstmt = conn.prepareStatement(
			    "insert into C_MEMBER values (?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, dataBean.getId());
			pstmt.setString(2, dataBean.getPass());
			pstmt.setString(3, dataBean.getName());
			pstmt.setString(4, dataBean.getAgree());
			pstmt.setString(5, dataBean.getSecurity1());
			pstmt.setString(6, dataBean.getSecurity2());
			pstmt.setString(7, dataBean.getGender());
			pstmt.setString(8, dataBean.getPhone1());
			pstmt.setString(9, dataBean.getPhone2());
			pstmt.setTimestamp(10, dataBean.getReg_date());

			pstmt.executeUpdate();

			for(int i=0; i<hobby.length; i++){
				// 인덱스 번호 부여
				pstmt=conn.prepareStatement("select max(m_num) from C_MULTI");
				rs= pstmt.executeQuery();

				if(rs.next()){
					m_num = rs.getInt(1) + 1;
				}
				else{
					m_num = 1;
				}

	         // 체크박스 값 입력 쿼리를 작성
				sql = "insert into C_MULTI values(?,?,?,?)";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1,m_num);
				pstmt.setString(2, dataBean.getId());
				pstmt.setString(3, "hobby");
				pstmt.setString(4, hobby[i]);
				pstmt.executeUpdate();
				pstmt.clearParameters();
			}
			for(int i=0; i<subject.length; i++){
				// 인덱스 번호를 부여
				pstmt=conn.prepareStatement("select max(m_num) from C_MULTI");
				rs= pstmt.executeQuery();

				if(rs.next()){
					m_num = rs.getInt(1) + 1;
				}
				else{
					m_num = 1;
				}

	         // 셀렉트 값 입력 쿼리를 작성
				sql = "insert into C_MULTI values(?,?,?,?)";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1,m_num);
				pstmt.setString(2, dataBean.getId());
				pstmt.setString(3, "subject");
				pstmt.setString(4, subject[i]);
				pstmt.executeUpdate();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (pstmt != null)
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null)
				try { conn.close(); } catch(SQLException ex) {}
		}
	}

	public int userCheck(String id, String pass)
				throws Exception {
				//사용자의 입력을 받아서 아이디와 비밀번호가 있는 지 여부를 체크, 같다면 회원 인증!
				//아이디, 패스워드가 없고, 있음을 확인하여 회원가입, 비밀번호 틀림 등을 체크
				//int check값으로 판별
				//회원이라면 세션을 만들어서 그것을 유지시킨다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;

		try{
			conn = getConnection();

			pstmt = conn.prepareStatement(
			    "select pass from C_MEMBER where id = ?");
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();

			if(rs.next()){
				dbpasswd= rs.getString("pass");
				if(dbpasswd.equals(pass))
					x = 1; //인증 성공
				else
					x = 0; //비밀번호 틀림
			}else
				x = -1;//해당 아이디 없음

		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if (rs != null)
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null)
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null)
				try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
}