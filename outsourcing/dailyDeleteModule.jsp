<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Vector" %>

<%
    // 값 받아오기
    request.setCharacterEncoding("utf-8");

    String schedule_id = request.getParameter("schedule_id_value");

    String id = request.getParameter("id_value");
   
    // 데이터베이스 접속
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/final",
        "admin",
        "1234"
    );


    // Query 문 작성
    String scheduleSql = "DELETE FROM schedule WHERE schedule_id=?";
    PreparedStatement scheduleQuery = conn.prepareStatement(scheduleSql);
    scheduleQuery.setString(1, schedule_id);


    //create, update, delete 문 전송시
    scheduleQuery.executeUpdate();

    // 계정 인증 위한 Query 문 작성
    String sql = "SELECT * FROM member WHERE id=?";
    PreparedStatement query = conn.prepareStatement(sql);
    query.setString(1, id);
    
    // Query 문 전송
    // select 문 전송시
    ResultSet res = query.executeQuery();
    

    // 데이터 정제
    Vector data = new Vector(); 



    while (res.next()) {
        data.add(res.getString("id"));
        data.add(res.getString("pw"));

    }

    String string_data = data.toString();

   
%>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
    
    <form action="daily.jsp" method="post" style="display: none;">
        <input name="id_value" type="text" value=<%=id%>>
        <input id="pw" name="pw_value" type="text">
        <input id="submit" type="submit">
    </form>

</body>

<script type="text/javascript" src="public.js"></script>
<script>
    var jsp_data = "<%=string_data%>"
    var string_data = jsp_data.slice(1, (jsp_data.length - 1))
    var array_data = string_data.split(',')
    var data = []

    var pw = document.getElementById('pw')

    var submit = document.getElementById("submit")


    window.onload = function() {
        
        // 스케줄 일단위 출력: jsp에서 받아온 list에 공백 제거
        for (var i = 0; i < array_data.length; i += 1) {
            data.push(array_data[i].trim())
        }

        console.log(data)

        pw.value = data[1]

        submit.click()

    }

</script>