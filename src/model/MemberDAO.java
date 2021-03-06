package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class MemberDAO {
	
	// 멤버변수(클래스 전체 멤버메소드에서 접근 가능)0
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;

	// 기본생성자
	public MemberDAO() {
		System.out.println("MemberDAO생성자 호출");
	}
	
	public MemberDAO(String driver, String url) {
		try {
			Class.forName(driver);
			String id = "suamil_user";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결성공");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 방법1 : 회원의 존재유무만 판단한다.
	public boolean isMember(String id, String pass) {
		
		String sql = "SELECT COUNT(*) FROM member "
				+ " WHERE id=? AND pass=?";
		int isMember = 0;
		boolean isFlag = false;
		
		try {
			// prepare 객체로 쿼리문 전송
			psmt = con.prepareStatement(sql);
			
			// 인파라미터 설정
			psmt.setString(1, id);
			psmt.setString(2, pass);
			
			// 쿼리실행
			rs = psmt.executeQuery();
			
			// 실행결과를 가져오기 위해 next() 호출
			rs.next();
			
			isMember = rs.getInt(1);
			System.out.println("affected:"+isMember);
			if(isMember==0)
				isFlag = false;
			else
				isFlag = true;
		}
		catch(Exception e) {
			isFlag = false;
			System.out.println("오류");
			e.printStackTrace();
		}
		return isFlag;
		
	}
	
	// 방법2 : 회원인증 후 MemberDTO객체로 회원정보를 반환한다.
	public MemberDTO getMemberDTO(String uid, String upass) {
		
		// DTO객체를 생성한다.
		MemberDTO dto = new MemberDTO();
		
		// 쿼리문을 작성한다. (테이블명은 안적어도 된다.)
		String query = "SELECT id, pass, name FROM "
				+ " member WHERE id=? AND pass=?";
		
		try{
			// prepared 객체 생성
			psmt = con.prepareStatement(query);
			
			// 쿼리문의 인파라미터 설정
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			
			// 오라클로 쿼리문 전송 및 결과셋(ResultSet) 반환받음
			rs = psmt.executeQuery();
			
			// 오라클이 반환해준 ResultSet이 있는지 확인
			if(rs.next()) {
				
				// true를 반환했다면 결과셋 있음.
				// DTO객체에 회원 레코드의 값을 저장한다.
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
			}
			else {
				
				// false를 반환했다면 결과셋 없음.
				System.out.println("결과셋이 없습니다.");
			}
		}
		catch(SQLException e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}
		
		// DTO객체를 반환한다.
		return dto;
	}
	
	// 방법3 : getMemberMap()메소드
	public Map<String, String> getMemberMap(String id, String pwd){
		
		Map<String, String> maps = new HashMap<String, String>();
		
		String query = "SELECT id, pass, name, grade FROM "
				+ " member WHERE id=? AND pass=?";
		
		try{
			psmt = con.prepareStatement(query);			
			psmt.setString(1, id);
			psmt.setString(2, pwd);			
			rs = psmt.executeQuery();
			
			if(rs.next()) {						
				maps.put("id", rs.getString(1));
				maps.put("pass", rs.getString("pass"));
				maps.put("name", rs.getString("name"));
				maps.put("grade", rs.getString("grade"));
			}
			else {
				System.out.println("결과셋이 없습니다.");
			}
		}
		catch(Exception e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}
		return maps;
	}

	public int getJoin(MemberDTO dto){
		
		String query = " INSERT into member(name, id, pass, pnum, hnum, email, addr) "
				 +" values ( ? , ?, ?, ?, ?, ?, ?) ";
		int affected =0;
		
		try{
			psmt = con.prepareStatement(query);			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPass());
			psmt.setString(4, dto.getPnum());
			psmt.setString(5, dto.getHnum());
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getAddr());
			affected  = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}
		return affected;
	}
	
		// 아이디찾기 
	    public Map<String, String> getIdMap(String name, String email) {

	    Map<String, String> maps = new HashMap<String, String>();

	    String query = "SELECT id FROM member WHERE name=? and email=?";
		    try {
		        psmt = con.prepareStatement(query);
		        psmt.setString(1, name); // 쿼리문의 1번쨰 ?에 들어갈 넘 (1은 첫번쨰임을, name은 db테일블의 컬럼명임.)
		        psmt.setString(2, email); // 쿼리문의 2번째 ?에 들어갈 넘
		        rs = psmt.executeQuery(); // rs: 위의 psmt의 실행결과값을 받을 넘
	
		        if (rs.next()) { // rs로 찾아낸 즉, select id의 모든값을 읽어냄.
		        	maps.put("id", rs.getString("id")); // select id의 값을 map의 임의변수(키값) id에 셋팅 
		        } 
		        else {
		        	System.out.println("결과셋이 없습니다.");
		        }
		    } 
		    catch (Exception e) {
		        System.out.println("getMemberDTO오류");
		        e.printStackTrace();
		    }
		    
		    return maps;
	    }
	    
	    // 비밀번호찾기
	    public Map<String, String> getPwMap(String id, String name, String email) {

	    Map<String, String> maps = new HashMap<String, String>();

	    String query = "SELECT pass FROM member WHERE id=? AND name=? AND email=?";
		    try {
		        psmt = con.prepareStatement(query);
		        psmt.setString(1, id);
		        psmt.setString(2, name); 
		        psmt.setString(3, email); 
		        rs = psmt.executeQuery(); 
	
		        if (rs.next()) { 
		        	maps.put("pw", rs.getString("pass"));  
		        } 
		        else {
		        	System.out.println("결과셋이 없습니다.");
		        }
		    } 
		    catch (Exception e) {
		        System.out.println("getMemberDTO오류");
		        e.printStackTrace();
		    }
	
		    return maps;
	    }
}