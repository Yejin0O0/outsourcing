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
            <form action="signupModule.jsp" method="post" class="flex-column signup-form">
                <div class="flex-column signup-form-div">
                    <div class="signup-explain-div">
                        <p class="signup-explain-font">아이디 입력</p>
                    </div>
                    <div class="signup-border">
                        <input name="id_value" class="signup-input signup-id-input" type="text">
<!--                        <img class="signup-check-img" src="../src/check.svg">-->
                        <img class="signup-check-img" src="../src/circle-check-regular.svg">
                    </div>
                    <div class="signup-warning-div">
                        <p class="signup-warning-font">아이디가 이미 존재합니다</p>
                    </div>
                </div>
                <div class="flex-column signup-form-div">
                    <div class="signup-explain-div">
                        <p class="signup-explain-font">비밀번호 입력</p>
                    </div>
                    <input id="password" name="pw_value" class="signup-border signup-input" type="password">
                </div>
                <div class="flex-column signup-form-div">
                    <div class="signup-explain-div">
                        <p class="signup-explain-font">비밀번호 재입력</p>
                    </div>
                    <input id="password_check" class="signup-border signup-input" type="password">
                    <div id="password_warning" class="signup-warning-div">
                        <p class="signup-warning-font">비밀번호를 다시 한번 확인해주세요</p>
                    </div>
                </div>
                <div class="flex-column signup-form-div">
                    <div class="signup-explain-div">
                        <p class="signup-explain-font">이름</p>
                    </div>
                    <input name="name_value" class="signup-border signup-input" type="text">

                </div>
                <div class="flex-column signup-form-div">
                    <div class="signup-explain-div">
                        <p class="signup-explain-font">직책</p>
                    </div>
                    <select name="role_value" class="signup-border signup-select">
                        <option selected disabled>선택하세요</option>
                        <option value="관리자">관리자</option>
                        <option value="팀장">팀장</option>
                        <option value="사원">사원</option>
                    </select>
                </div>

                <input class="signup-submit-btn" type="submit" value="회원가입하기">


            </form>
        </section>
    </article>
</body>
<script type="text/javascript" src="signup.js"></script>