<?
include './dbconn.php';
include("sidebar.php");

?>


<!DOCTYPE html>
<html>

<title>리스트 만들기</title>

<body>
  <div class="w3-center" style="margin-left:20% ">
    <div class="w3-container w3-black w3-center w3-padding-8">
      <h1>플레이리스트 만들기</h1>
    </div>
    <div class="w3-pannel w3-gray">
       <br>
    </div>
    <br><br>
    <center>
      <div class="w3-pannel w3-card w3-padding-64" style="width:70%">
        <label class="w3-xlarge"><b>플레이리스트 이름을 지어주세요!</b></label>
        <br><br><br>
        <form action='./newlist_name.php' name='p_name' method='get' style="width:50%">
          <input class="w3-input w3-border w3-round-xxlarge" type="text" name="pl_name" placeholder="플레이리스트명">
          <br><br>
          <input class="w3-button w3-large w3-green w3-hover-grey w3-myfont" type="submit" value="내 리스트에 추가">
        </form>
      </div>
    </center>
    <br><br>
</body>
</html>
