<!DOCTYPE html>
<? session_start(); ?>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 웹 라이브러리 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 웹 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
h1{
  font-family: 'Do Hyeon', sans-serif;
}
.w3-myfont{
  font-family: 'Noto Sans KR', sans-serif;
}
html,body,h2,h3,h4,h5,h6{
  font-family: 'Noto Serif KR', serif;
}
body, html {
  line-height: 1.8;
}
</style>

<body>
  <!-- 로그인 안했을때 경고창 -->
  <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4" style="width:30%">
      <header class="w3-container w3-green">
        <span onclick="document.getElementById('id01').style.display='none'"
        class="w3-button w3-display-topright">&times;</span>
      </header>
      <div class="w3-container w3-center w3-large">
        <br><br><b>로그인이 필요한 서비스입니다.</b><br><br><br>
      </div>
    </div>
  </div>

  <? if( $_SESSION['userid']==null ) {?>
    <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:20%">
      <img src="./image/logo.png" width = "310" height="130">
      <a class="w3-bar-item w3-dark-grey w3-xlarge"><i class="fa fa-bars"></i>&nbsp;&nbsp;Menu</a>
      <a href="first_page.php" class="w3-bar-item w3-green w3-large w3-button"><i class="fa fa-home"></i>&nbsp;&nbsp;Home</a>
      <button onclick="document.getElementById('id01').style.display='block'" class="w3-bar-item w3-large w3-button"><b><i class="fa fa-male"></i>&nbsp;&nbsp;내 정보</b></button>
      <button onclick="document.getElementById('id01').style.display='block'" class="w3-bar-item w3-large w3-button"><b><i class="fa fa-search"></i>&nbsp;&nbsp;플레이리스트 만들기</b></button>
      <a href="login_page.php" class="w3-bar-item w3-large w3-button"><i class="fa fa-power-off"></i><b>&nbsp;&nbsp;로그인</b></a>
    </div>
    <? } else{ ?>
    <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:20%">
      <img src="./image/logo.png" width = "310" height="130">
      <a class="w3-bar-item w3-dark-grey w3-xlarge"><i class="fa fa-bars"></i>&nbsp;&nbsp;Menu</a>
      <a href="first_page.php" class="w3-bar-item w3-green w3-large w3-button"><i class="fa fa-home"></i>&nbsp;&nbsp;Home</a>
      <a href="myinfo_page.php" class="w3-bar-item w3-large w3-button"><b><i class="fa fa-male"></i>&nbsp;&nbsp;내 정보</b></a>
      <a href="newlist_check_page.php" class="w3-bar-item w3-large w3-button"><b><i class="fa fa-search"></i>&nbsp;&nbsp;플레이리스트 만들기</b></a>
      <button class="w3-bar-item w3-large w3-button" onclick="location.href='./logout.php'"><i class="fa fa-power-off"></i><b>&nbsp;&nbsp;로그아웃</b></button>
    </div>
    <?}?>
</body>
</html>
