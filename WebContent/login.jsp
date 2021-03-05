<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/port1.css">
    <script defer src="js/log_in.js"></script>
</head>

<body>
    <div id="wrap">
        <header>
            <div id="inner">
                <div id="header_logo">
                    <h1><a href="port1.html"><img src="./img/logo.png" alt="logo"></a></h1>
                </div>
                <div id="header_menu">
                    <ul>
                        <li><a href="#">브랜드 소개</a></li>
                        <li><a href="#">토퍼&매트리스</a></li>
                        <li><a href="#">커튼</a></li>
                        <li><a href="#">배게&이불솜</a></li>
                        <li><a href="#">침구류</a></li>
                        <li><a href="board.jsp">고객센터</a></li>
                    </ul>
                </div>
                <div id="header_icons">
                    <div class="cart"><a href="#"></a></div>
                    <div class="login"><a href="./login.jsp"></a></div>
                    <div class="search"><a href="#"></a></div>
                </div>
            </div>
        </header>
        <div class="form-wrap">
            <div class="button-wrap">
                <div id="btn"></div>
                <button type="button" class="switch_btn" onclick="login()">LOG IN</button>
                <button type="button" class="switch_btn" onclick="register()">REGISTER</button>
            </div>
            <form id="login" action="loginAction.jsp" method="post"  class="input-group">
                <input type="text" name="userID" class="input-place" placeholder="User name or Email" required>
                <input type="password" name="userPASS" class="input-place" placeholder="Enter Password" required>
                <input type="checkbox" class="checkbox"><span class="check">Remember Password</span>
                <input type="submit" name="cmd" class="submit" value="Login">
			</form>
			<form id="register" action="loginAction.jsp" method="post"  class="input-group">
                <input type="text" name ="signName" class="input-place" placeholder="Your Name" required>
                <input type="text" name="signID" class="input-place" placeholder="User name" required>
                <input type="text" name="signAdd" class="input-place" placeholder="Home Adress" required>
                <input type="password" name="signPASS" class="input-place" placeholder="Enter Password" required>
                <input type="checkbox" class="checkbox"><span class="check">Terms and conditions</span>
                <input type="submit" name="cmd" class="submit" value="Register">
            </form>
            <div class="social-icons">
                <img src="img/fb.png" alt="facebook">
                <img src="img/tw.png" alt="twitter">
                <img src="img/gl.png" alt="google">
            </div>
        </div>
</body>

</html>