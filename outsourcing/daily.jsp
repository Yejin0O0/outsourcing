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


    // 계정 인증 위한 Query 문 작성
    String sql = "SELECT * FROM member WHERE id=? and pw=?";
    PreparedStatement query = conn.prepareStatement(sql);
    query.setString(1, id);
    query.setString(2, pw);

    // 계정주의 스케줄 출력 위한 Query 문 작성
    String scheduleSql = "SELECT * FROM schedule WHERE id=? ORDER BY date ASC, time ASC";
    PreparedStatement scheduleQuery = conn.prepareStatement(scheduleSql);
    scheduleQuery.setString(1, id);

    // 회원리스트 위한 Query 문 작성
    String memberSql = "SELECT * FROM member ORDER BY role ASC";
    PreparedStatement memberQuery = conn.prepareStatement(memberSql);
    

    // Query 문 전송
    // select 문 전송시
    ResultSet res = query.executeQuery();
    ResultSet scheduleRes = scheduleQuery.executeQuery();
    ResultSet memberRes = memberQuery.executeQuery();
    

    // 데이터 정제
    Vector data = new Vector(); 
    Vector<String> schedule_data = new Vector<String> ();
    Vector member_data = new Vector();


    while (res.next()) {
        data.add(res.getString("id"));
        data.add(res.getString("pw"));
        data.add(res.getString("name"));

    }

    String string_data = data.toString();


    while (scheduleRes.next()) {
        
        schedule_data.add(scheduleRes.getString("date"));
        schedule_data.add(scheduleRes.getString("time"));
        schedule_data.add(scheduleRes.getString("content"));
        schedule_data.add(scheduleRes.getString("schedule_id"));
        schedule_data.add(scheduleRes.getString("id"));

    }

    String string_schedule_data = schedule_data.toString();

    while (memberRes.next()) {
        
        member_data.add(memberRes.getString("id"));
        member_data.add(memberRes.getString("name"));
        member_data.add(memberRes.getString("role"));

    }
    
    String string_member_data = member_data.toString();


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
            <h2 id="daily_name"></h2>
            <h3>님의 일정</h3>
            <img class="daily-logo-people" src="../src/people.svg" onclick="showList()">
        </div>
    </header>

    <nav class="flex-nav">
        <div class="flex-nav-div" onclick="monthSchedule('01')">01</div>
        <div class="flex-nav-div" onclick="monthSchedule('02')">02</div>
        <div class="flex-nav-div" onclick="monthSchedule('03')">03</div>
        <div class="flex-nav-div" onclick="monthSchedule('04')">04</div>
        <div class="flex-nav-div" onclick="monthSchedule('05')">05</div>
        <div class="flex-nav-div" onclick="monthSchedule('06')">06</div>
        <div class="flex-nav-div" onclick="monthSchedule('07')">07</div>
        <div class="flex-nav-div" onclick="monthSchedule('08')">08</div>
        <div class="flex-nav-div" onclick="monthSchedule('09')">09</div>
        <div class="flex-nav-div" onclick="monthSchedule('10')">10</div>
        <div class="flex-nav-div" onclick="monthSchedule('11')">11</div>
        <div class="flex-nav-div" onclick="monthSchedule('12')">12</div>

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

    <article id="schedule_article" class="daily-article">

        <!-- <form class="daily-article-form">
            <div id="schedule_div" class="daily-article-div">
                <div class="daily-article-schedule-div">
                    <p id="schedule_date" class="daily-article-date"></p>
                    <p id="schedule_time" class="daily-article-time daily-article-past"></p>
                    <p id="schedule_cont" class="daily-article-cont daily-article-past"></p>

                    <input id="schedule_date" class="daily-article-date" type="date">
                    <input id="schedule_time" class="daily-article-time daily-article-past" type="number">
                    <input id="schedule_cont" class="daily-article-cont daily-article-past" type="text">
                </div>
                <input id="schedule_change" class="daily-article-ru" onclick="changeSchedule()" value="수정" type="text">
                <button class="daily-article-ru" onclick="deleteSchedule()">삭제</button>
            </div>
        </form> -->

    </article>

    <aside id="daily_aside_list" class="daily-aside">
        <!-- <div class="daily-aside-div">
            <div class="flex-center">
                <p class="daily-aside-role">팀장</p>
                <p>홍길동</p>
            </div>
            <div class="flex-center">
                <p class="daily-aside-role">사원</p>
                <p>홍길동</p>
            </div>
        </div> -->
    </aside>

</body>
<script type="text/javascript" src="daily.js"></script>
<script>
    // 이름 출력 위한 변수 선언
    var jsp_data = "<%=string_data%>"
    var string_data = jsp_data.slice(1, (jsp_data.length - 1))
    var array_data = string_data.split(',')
    var data = []
    var daily_name = document.getElementById('daily_name')

    // 스케줄 일 단위 출력 위한 변수 선언
    var jsp_schedule_data = "<%=string_schedule_data%>"
    var string_schedule_data = jsp_schedule_data.slice(1, (jsp_schedule_data.length - 1))
    var array_schedule_data = string_schedule_data.split(',')
    var schedule_data = []
    var schedule_div = document.getElementById('schedule_div');
    var schedule_article = document.getElementById('schedule_article')

    // 스케줄 월 단위 출력 위한 변수 선언
    var schedule_date_list = document.getElementsByClassName('daily-article-date') 
    var today_date = new Date()
    var year = today_date.getFullYear();
    var month = ("0" + (1 + today_date.getMonth())).slice(-2);

    // 회원 명단 출력 위한 변수 선언
    var jsp_member_data = "<%=string_member_data%>"
    var string_member_data = jsp_member_data.slice(1, (jsp_member_data.length - 1))
    var array_member_data = string_member_data.split(',')
    var member_data = []
    var daily_aside_list = document.getElementById('daily_aside_list')


    // 일정 추가
    var daily_add = document.getElementById('daily_add')




    window.onload = function() {

        // 이름 출력
        for (var n  = 0; n < array_data.length; n += 1) {
            data.push(array_data[n].trim())
        }
        
        daily_name.innerHTML = data[2]

        if(data[2] == undefined) {
            location.href = "login.jsp"
        }

        

        // 스케줄 일단위 출력: jsp에서 받아온 list에 공백 제거
        for (var i = 0; i < array_schedule_data.length; i += 1) {
        schedule_data.push(array_schedule_data[i].trim())
        }

        // 스케줄 일단위 출력: 스케줄이 있으면
        if (schedule_data.length > 1) {
            for (var num = 0; num < (schedule_data.length / 5 ); num += 1) {

                var new_input_date = document.createElement('input');
                new_input_date.id = 'schedule_date_'+ num
                new_input_date.type = 'date'
                new_input_date.name = 'schedule_date_value'
                new_input_date.style.display = 'none'
                new_input_date.className = 'daily-article-date'

                new_input_date.value = schedule_data[5 * num] 
               
                var new_input_time = document.createElement('input');
                new_input_time.id = 'schedule_time_'+ num
                new_input_time.type = 'number'
                new_input_time.name = 'schedule_time_value'
                new_input_time.style.display = 'none';
                new_input_time.className = 'daily-article-time'

                new_input_time.value = schedule_data[5 * num + 1] 

                var new_input_cont = document.createElement('input');
                new_input_cont.id = 'schedule_cont_'+ num
                new_input_cont.type = 'text'
                new_input_cont.name = 'schedule_cont_value'
                new_input_cont.style.display = 'none';
                new_input_cont.className = 'daily-article-cont'

                new_input_cont.value = schedule_data[5 * num + 2] 

                var new_input_sid = document.createElement('input');
                new_input_sid.id = 'schedule_id_'+ num
                new_input_sid.type = 'number'
                new_input_sid.name = 'schedule_id_value'
                new_input_sid.style.display = 'none';
                new_input_sid.value = schedule_data[5 * num + 3] 

                var new_input_id = document.createElement('input');
                new_input_id.type = 'hidden'
                new_input_id.name = 'id_value'
                new_input_id.value = schedule_data[5 * num + 4]


                var new_p_date = document.createElement('p');
                new_p_date.id = 'schedule_date_p_'+ num
                new_p_date.className = 'daily-article-date'
                new_p_date.style.display = 'block'
                new_p_date.innerHTML = schedule_data[5 * num] 
               
                var new_p_time = document.createElement('p');
                new_p_time.id = 'schedule_time_p_'+ num
                new_p_time.className = 'daily-article-time'
                new_p_time.style.display = 'block';
                new_p_time.innerHTML = schedule_data[5 * num + 1] + '시'

                var new_p_cont = document.createElement('p');
                new_p_cont.id = 'schedule_cont_p_'+ num
                new_p_cont.className = 'daily-article-cont'
                new_p_cont.style.display = 'block';
                new_p_cont.innerHTML = schedule_data[5 * num + 2] 

                var new_div_input = document.createElement('div');
                new_div_input.appendChild(new_input_date)
                new_div_input.appendChild(new_input_time)
                new_div_input.appendChild(new_input_cont)
                new_div_input.appendChild(new_input_sid)
                new_div_input.appendChild(new_input_id)
                new_div_input.appendChild(new_p_date)
                new_div_input.appendChild(new_p_time)
                new_div_input.appendChild(new_p_cont)
                new_div_input.setAttribute('class', 'daily-article-schedule-div')

                var new_input_update = document.createElement('input')
                new_input_update.setAttribute('id','schedule_change_'+ num)
                new_input_update.setAttribute('class','daily-article-ru')
                new_input_update.setAttribute('value','수정')
                new_input_update.setAttribute('readonly', 'true')
                new_input_update.setAttribute('type','button')        
                new_input_update.setAttribute('onclick','changeSchedule(' + num + ')')

                var new_input_delete = document.createElement('input')
                new_input_delete.setAttribute('id','schedule_delete_'+ num)
                new_input_delete.setAttribute('class','daily-article-ru')
                new_input_delete.setAttribute('value','삭제')
                new_input_delete.setAttribute('readonly', 'true')
                new_input_delete.setAttribute('type','button')        
                new_input_delete.setAttribute('onclick','deleteSchedule(' + num + ')')


                var new_div = document.createElement('div')
                new_div.appendChild(new_div_input)
                new_div.appendChild(new_input_update)
                new_div.appendChild(new_input_delete)
                new_div.setAttribute('class', 'daily-article-div')

                var new_form = document.createElement('form')
                new_form.appendChild(new_div)
                new_form.setAttribute('class', 'daily-article-form')
                new_form.setAttribute('method', 'post')
                new_form.setAttribute('id', 'daily_article_form_'+ num)


                

                schedule_article.appendChild(new_form)

            }           
        }
        // 스케줄 일단위 출력: 없으면
        else {
            var new_p = document.createElement('p')
            new_p.innerHTML = "일정을 추가해 주세요"

            schedule_article.appendChild(new_p)   
        }

        // 스케줄 월단위 출력: 페이지 로드 되었을 때 오늘 날짜에 해당하는 월 일정 출력
        for(var date = 0; date < schedule_date_list.length; date += 1 ) {
            
            if(schedule_date_list[date].innerHTML.includes(year+'-'+month) === false) {
                
                schedule_date_list[date].parentNode.parentNode.parentNode.style.display = 'none';
            }
            else{
                
                schedule_date_list[date].parentNode.parentNode.parentNode.style.display = 'block';
            }
            
        }
        // 오늘 날짜 기준으로 이번 달 출력
        for(var d = 0; d < 12; d += 1 ) {
            if(month === document.getElementsByClassName('flex-nav-div')[d].innerHTML) {
                    document.getElementsByClassName('flex-nav-div')[d].classList.add("flex-nav-div-selected")
                }
        }
        
        // 회원 명단 출력: jsp에서 받아온 list에 공백 제거
        for (var i = 0; i < array_member_data.length; i += 1) {
        member_data.push(array_member_data[i].trim())
        }

        console.log(member_data)

        // 회원 명단 출력
        for (var mem = 0; mem < (member_data.length / 3 ); mem += 1){
            var new_role_p = document.createElement('p')
            new_role_p.setAttribute("class", "daily-aside-role")
            new_role_p.innerHTML = member_data[3 * mem + 2]

            var new_name_p = document.createElement('p')
            new_name_p.innerHTML = member_data[3 * mem + 1]
            
            var new_mem_button = document.createElement('button')
            new_mem_button.appendChild(new_role_p)
            new_mem_button.appendChild(new_name_p)
            new_mem_button.setAttribute('class', 'daily-button')

            var new_id_input = document.createElement('input')
            new_id_input.value = member_data[3 * mem]
            console.log(new_id_input.value)
            new_id_input.type = 'hidden'
            new_id_input.name = 'id_value'

            var new_aside_form = document.createElement('form')
            new_aside_form.appendChild(new_mem_button)
            new_aside_form.appendChild(new_id_input)
            new_aside_form.style = "margin: 0"
            new_aside_form.setAttribute('action', 'showSelectedMemScheduleModule.jsp')



            daily_aside_list.appendChild(new_aside_form)


        }
        

    }
    
    function monthSchedule(mon) {
        
        for (var i = 0; i < 12; i ++) {
            document.getElementsByClassName("flex-nav-div")[i].classList.remove("flex-nav-div-selected")
        }

        event.target.classList.add("flex-nav-div-selected")

        // 페이지 로드 되었을 때 해당하는 월 일정 출력
        for(var clickDate = 0; clickDate < schedule_date_list.length; clickDate += 1 ) {

            if(schedule_date_list[clickDate].innerHTML.includes(year+'-'+mon) === false) {
                
                schedule_date_list[clickDate].parentNode.parentNode.parentNode.style.display = 'none';
            }
            else{
               
                schedule_date_list[clickDate].parentNode.parentNode.parentNode.style.display = 'block';
            }
            
        }

    }

    

    
</script>

