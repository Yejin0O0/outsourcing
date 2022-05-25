<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>


<%
    // 값 받아오기
    request.setCharacterEncoding("utf-8");

    String date = request.getParameter("add_date");
    String time = request.getParameter("add_time");
    String cont = request.getParameter("add_cont");
    String id = request.getParameter("id_value");
    String pw = request.getParameter("pw_value");


    // 데이터베이스 접속
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/final",
        "admin",
        "1234"
    );

    // Query 문 작성
    String sql = "INSERT INTO schedule (id, date, time, content) VALUE(?,?,?,?)";


    PreparedStatement query = conn.prepareStatement(sql);
    query.setString(1, id);
    query.setString(2, date);
    query.setString(3, time);
    query.setString(4, cont);
   
    query.executeUpdate();

        request.getSession().setAttribute("id", id);
        request.getSession().setAttribute("pw", pw);
        request.getRequestDispatcher("daily.jsp").forward(request, response);
        

    } else{ // 실패 안됨....
        
        
    }
   
    

%>
