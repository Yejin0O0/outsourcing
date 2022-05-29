<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="signup.css">
</head>
<body class="flex-column flex-center signup-body">
    <article class="flex-column signup">
        <header class="flex-column flex-center">
            <img class="signup-logo" src="../src/logo.png">
            <h1 class="signup-header">회원가입</h1>
        </header>
        <section class="signup-section">
            <form id="signup_form" method="post" action="signupModule.jsp" class="flex-column signup-form">

                <div class="flex-column signup-form-div">
                    <div class="signup-explain-div">
                        <p class="signup-explain-font">아이디 입력</p>
                    </div>
                    <!-- <form action="signupCheckDuplicatedIdModule.jsp" method="post"> -->
                        <div class="signup-border signup-id-div">
                            <input id="id_value" name="id_value" class="signup-input signup-id-input" type="text">
                            <div class="signup-check-button">
                                <img class="signup-check-img" src="../src/circle-check-regular.svg">
                                <img class="signup-check-img" src="../src/check.svg" style="display: none;">
                
                            </div>
                            
                        </div>
                    <!-- </form> -->
                    <div class="signup-warning-div">
                        <p class="signup-warning-font">아이디가 이미 존재합니다</p>
                    </div>
                </div>

                <div class="flex-column signup-form-div">
                    <div class="signup-explain-div">
                        <p class="signup-explain-font">비밀번호 입력</p>
                    </div>
                    <input id="pw_value" name="pw_value" class="signup-border signup-input" type="password">
                </div>

                <div class="flex-column signup-form-div">
                    <div class="signup-explain-div">
                        <p class="signup-explain-font">비밀번호 재입력</p>
                    </div>
                    <input id="pw_check_value" class="signup-border signup-input" type="password">
                    <div id="password_warning" class="signup-warning-div">
                        <p class="signup-warning-font">비밀번호를 다시 한번 확인해주세요</p>
                    </div>
                </div>

                <div class="flex-column signup-form-div">
                    <div class="signup-explain-div">
                        <p class="signup-explain-font">이름</p>
                    </div>
                    <input id="name_value" name="name_value" class="signup-border signup-input" type="text">

                </div>

                <div class="flex-column signup-form-div">
                    <div class="signup-explain-div">
                        <p class="signup-explain-font">직책</p>
                    </div>
                    <select id="role_value" name="role_value" class="signup-border signup-select">
                        <option selected disabled>선택하세요</option>
                        <option value="관리자">관리자</option>
                        <option value="팀장">팀장</option>
                        <option value="평사원">평사원</option>
                    </select>
                </div>

                <input class="signup-submit-btn" type="button" value="회원가입하기" onclick="signup()">


            </form>
        </section>
    </article>
</body>
<script>
    


    



    function signup() {
        var form = document.getElementById('signup_form');
        var id_value = document.getElementById('id_value').value;
        var pw_value = document.getElementById('pw_value').value;
        var pw_check_value = document.getElementById('pw_check_value').value;
        var name_value = document.getElementById('name_value').value;
        var role_value = document.getElementById('role_value')
        var selected_value = role_value.options[role_value.selectedIndex].value

        var password_warning = document.getElementById('password_warning');

        if(!id_value || !pw_value || !pw_check_value || !name_value || !selected_value) {
            alert("빈칸을 모두 입력해주세요.")
        }
        else if (pw_value !== pw_check_value) {
            password_warning.style.display = 'flex';
        }
        else{
            form.submit()
        }
    }
       

</script>