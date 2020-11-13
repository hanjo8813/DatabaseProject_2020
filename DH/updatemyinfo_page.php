<?
include './dbconn.php';
include("sidebar.php");
?>

<!DOCTYPE html>
<html>

<title>정보 변경 창</title>


  <!--Execption handling-->
<script type="text/javascript">
window.onload=function(){
 document.getElementById('my-form').onsubmit=function(){
  var pass=document.getElementById('pwd1').value;
  var passCheck=document.getElementById('pwd2').value;

  if(pass==passCheck){
   alert('비밀 번호가 변경 되었습니다.');
  }else{
   alert('비밀 번호가 일치 하지 않습니다.');
    return false;
  }

 }
}
</script>


<body>
  <div class="w3-center" style="margin-left:20% ">
    <div class="w3-container w3-black w3-center w3-padding-8">
      <h1>비밀번호 변경</h1>
    </div>
    <div class="w3-pannel w3-gray">
       <br>
    </div>
    <br>
    <br>
    <center>
      <div class="w3-pannel w3-card w3-padding-64" style="width:70%">
        <label class="w3-xlarge"><b>새 비밀번호를 입력해주세요.</b></label>
        <form id = "my-form" action = './updatemyinfo.php' method='get' style="width:40%" class = "w3-myfont">
          <br><br>
          <label class="w3-large"><b>새 비밀번호 입력</b></label>
          <br>
          <input class="w3-input w3-border w3-round-xxlarge" type="password" id="pwd1" name = "pwd1" placeholder="PASSWORD">
          <br>
          <label class="w3-large"><b>새 비밀번호 재입력</b></label>
          <br>
          <input class="w3-input w3-border w3-round-xxlarge" type="password" id="pwd2" placeholder="PASSWORD">
          <br><br>
          <input class="w3-button w3-large w3-green w3-hover-grey" type="submit" value="변경하기">
        </form>
      </center>
      <br><br>
    </div>
    </center>
  </div>

</body>
</html>
