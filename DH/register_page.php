<?
include("sidebar.php");
?>

<!DOCTYPE html>
<html>

<title>회원가입창</title>

<body>
  <div class="w3-center" style="margin-left:20% ">
    <div class="w3-container w3-black w3-center w3-padding-8">
      <h1>회 원 가 입</h1>
    </div>
    <div class="w3-pannel w3-gray">
       <br>
    </div>
    <br><br>
    <center>
      <div class="w3-center w3-pannel w3-card w3-padding-32" style="width:70%">
        <center>
          <form action='./register.php' name='reg' method='post' style="width:40%">
            <label class="w3-large"><b>아이디</b></label>
            <input class="w3-input w3-border w3-round-xxlarge" type="text" name="id" placeholder="ID">
            <br>
            <label class="w3-large"><b>비밀번호</b></label>
            <input class="w3-input w3-border w3-round-xxlarge" type="password" name="pwd" placeholder="PASSWORD">
            <br>
            <label class="w3-large"><b>이름</b></label>
            <input class="w3-input w3-border w3-round-xxlarge" type="text" name="name" placeholder="name">
            <br>
            <label class="w3-large"><b>나이</b></label>
            <input class="w3-input w3-border w3-round-xxlarge" type="text" name="age" placeholder="age">
            <br>
            <input class="w3-button w3-large w3-green w3-hover-grey" type="submit" value="회원가입">
          </form>
        </center>
      </div>
    </center>
  </div>
</body>
</html>
