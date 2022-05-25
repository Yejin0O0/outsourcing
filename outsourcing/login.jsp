<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" type="text/css" href="login.css">
    <link rel="stylesheet" type="text/css" href="public.css">
</head>
<body class="flex-center login-body">
    <article class="login">
        <header class="flex-column flex-center">
            <img class="login-logo" src="../src/logo.png">
            <h1 class="login-header">로그인</h1>
        </header>
        <section class="login-section">
            <form action="daily.jsp" method="post" class="flex-column login-form">
                <input name="id_value" class="login-input" type="text" placeholder="아이디">
                <input name="pw_value" class="login-input" type="password" placeholder="비밀번호">
                <div class="login-signup-btn">
                    <a class="login-signup-font" href="signup.jsp">회원가입하기</a>
                </div>
                <input class="login-submit-btn" type="submit" value="로그인하기">


            </form>
        </section>
    </article>
</body>

