<?
include("sidebar.php");
?>

<!DOCTYPE html>
<html>

<title>로그인창</title>

<body>
  <div class="w3-center" style="margin-left:20%">
    <div class="w3-container w3-black w3-center w3-padding-8">
      <h1>로 그 인</h1>
    </div>
    <div class="w3-pannel w3-gray">
    <br>
    </div>
    <br><br><br>
    <center>
      <div class="w3-pannel w3-card w3-padding-64" style="width:70%">
        <form action='./login.php' name='login' method='get' style="width:40%">
          <label class="w3-xlarge"><b>아이디</b></label>
          <input class="w3-input w3-border w3-round-xxlarge" type="text" name="id" placeholder="ID">
          <br>
          <label class="w3-xlarge"><b>비밀번호</b></label>
          <input class="w3-input w3-border w3-round-xxlarge" type="password" name="pwd" placeholder="PASSWORD">
          <br><br>
          <input class="w3-button w3-large w3-green w3-hover-grey" type="submit" value="로그인">
          &nbsp;&nbsp;&nbsp;
          <button class="w3-button w3-large w3-green w3-hover-grey" type = "button" onclick = "location.href='register_page.php' ">회원가입</button>
        </form>
      </center>
      <br><br>
    </div>
  </div>
</body>
</html>
