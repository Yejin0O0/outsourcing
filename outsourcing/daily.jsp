<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Vector" %>


<%
    // 값 받아오기
    request.setCharacterEncoding("utf-8");

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
    String sql = "SELECT * FROM member WHERE id=? and pw=?";
    PreparedStatement query = conn.prepareStatement(sql);
    query.setString(1, id);
    query.setString(2, pw);

    // Query 문 작성
    String scheduleSql = "SELECT * FROM schedule";
    PreparedStatement scheduleQuery = conn.prepareStatement(scheduleSql);

    // Query 문 전송
    // select 문 전송시
    ResultSet res = query.executeQuery();
    ResultSet scheduleRes = scheduleQuery.executeQuery();

    // 데이터 정제
    Vector data = new Vector(); 
    Vector schedule_data = new Vector();


    while (res.next()) {
        data.add(res.getString("id"));
        data.add(res.getString("pw"));
        data.add(res.getString("name"));

    }

    Object name = data.get(2);


    while (scheduleRes.next()) {
        schedule_data.add(scheduleRes.getString("date"));
        schedule_data.add(scheduleRes.getString("time"));
        schedule_data.add(scheduleRes.getString("content"));

    }


%>
<head>
    <meta charset="UTF-8">
    <title>일정</title>
    <link rel="stylesheet" type="text/css" href="daily.css">
    <link rel="stylesheet" type="text/css" href="signup.css">
    <link rel="stylesheet" type="text/css" href="public.css">
</head>
<body class="daily-body">
    <header class="daily-header">
        <img class="daily-logo" src="../src/logo.png">
        <div class="daily-header-div">
            <h2><%=name%></h2>
            <h3>님의 일정</h3>
            <img class="daily-logo" src="../src/people.svg" onclick="showList()">
        </div>
    </header>

    <nav class="flex-nav">
        <div class="flex-nav-div flex-nav-div-selected">1</div>
        <div class="flex-nav-div">2</div>
        <div class="flex-nav-div">3</div>
        <div class="flex-nav-div">4</div>
        <div class="flex-nav-div">5</div>
        <div class="flex-nav-div">6</div>
        <div class="flex-nav-div">7</div>
        <div class="flex-nav-div">8</div>
        <div class="flex-nav-div">9</div>
        <div class="flex-nav-div">10</div>
        <div class="flex-nav-div">11</div>
        <div class="flex-nav-div">12</div>
    </nav>

    <section class="daily-section daily-section-add">
        <p class="daily-section-p" onclick="addSchedule()">일정 추가</p>
        <form id="daily_add" action="dailyAddModule.jsp" method="post" class="daily-section-form">
            <div class="daily-section-form-div">
                <p>일정 추가</p>
                <input type="hidden" name="id_value" value=<%=id%>>
                <input type="hidden" name="pw_value" value=<%=pw%>>

                <div class="daily-section-add-div">
                    <div class="daily-explain-div">
                        <p class="signup-explain-font">날짜</p>
                    </div>
                    <input name="add_date" class="signup-border signup-input" type="date">

                </div>

                <div class="daily-section-add-div">
                    <div class="daily-explain-div">
                        <p class="signup-explain-font">시간</p>
                    </div>
                    <input name="add_time" class="signup-border signup-input" type="number" min="1" max="24" value="1">

                </div>

                <div class="daily-section-add-div">
                    <div class="daily-explain-div">
                        <p class="signup-explain-font">일정 내용</p>
                    </div>
                    <input name="add_cont" class="signup-border signup-input" type="text" placeholder="내용을 입력하세요">

                </div>

                <input class="daily-section-add-font" type="submit" value="추가하기">
            </div>
        </form>
    </section>

    <article class="daily-article">

        <form class="daily-article-form">
            <p>1월 3일</p>
            <div class="daily-article-div">
                <div class="daily-article-schedule-div">

                    <input id="schedule_date" class="daily-article-date daily-article-past" value="2022-01-03" type="hidden">
                    <input id="schedule_time" disabled class="daily-article-time daily-article-past" value="10:00" type="text">
                    <input id="schedule_cont" disabled class="daily-article-cont daily-article-past" value="모의외주 시작" type="text">
                </div>
                <p id="schedule_change" class="daily-article-ru" onclick="changeSchedule()">수정</p>
                <button class="daily-article-ru" onclick="deleteSchedule()">삭제</button>
            </div>
        </form>

    </article>

    <aside id="daily_aside_list" class="daily-aside">
        <div class="daily-aside-div">
            <div class="flex-column flex-center">
                <p class="daily-aside-role">팀장</p>
                <p>홍길동</p>
            </div>
            <div class="flex-column flex-center">
                <p class="daily-aside-role">사원</p>
                <p>홍길동</p>
            </div>
        </div>
    </aside>

</body>
<script type="text/javascript" src="daily.js"></script>
<script>
    var schedule_data = <%=schedule_data%>
    console.log(schedule_data)
</script>