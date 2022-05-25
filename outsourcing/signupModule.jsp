<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>


<%
    // 값 받아오기
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id_value");
    String pw = request.getParameter("pw_value");
    String name = request.getParameter("name_value");
    String role = request.getParameter("role_value");


    // 데이터베이스 접속
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/final",
        "admin",
        "1234"
    );

    // Query 문 작성
    String sql = "INSERT INTO member (id, pw, name, role) VALUE(?,?,?,?)";


    PreparedStatement query = conn.prepareStatement(sql);
    query.setString(1, id);
    query.setString(2, pw);
    query.setString(3, name);
    query.setString(4, role);
   
    int result = query.executeUpdate();

    if(result == 1){ 
        out.print("<script>alert('환영합니다!');  document.location.href = 'login.jsp'</script>");
        

    } else{ // 실패 안됨....
        out.print("<script>alert('회원가입을 다시 시도해주세요'); document.location.href = 'signup.jsp'</script>");
        
    }
   
    

%>
