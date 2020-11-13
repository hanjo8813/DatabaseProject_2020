<?
  include './dbconn.php';
  include("sidebar.php");
  session_start();

    //Execption Handling
    /////////////////////편집중이다가 나오면 다 뿌셔버리기///////////////////
    if($_SESSION['ing']==1){

      //편집해제
      $_SESSION['ing']=0;
      ///////////////////편집중이던 임시 플레이리스트 번호 가져오기////////////
      $ssql = "SELECT MAX(pl_no) FROM allplaylist";
      $rresult = $connect->query($ssql);
      $rrow=mysqli_fetch_assoc($rresult);

      if(!$rrow['MAX[pl_no]']){
        $pl_num = 0;
      }
      $pl_num = $rrow['MAX(pl_no)']+1;

      ////////////뷰 날려버리기/////////////////
      $sql = "DROP VIEW mylist";
      $connect->query($sql);


      ////////////테이블날려버리자////////////////////////

      $sql = "DROP TABLE playlist$pl_num";
      $connect->query($sql);
      ?><script>alert("테이블 정보가 저장되지 않습니다.");</script><?
    }
?>


<!DOCTYPE html>
<html>

<style>
.bgimg-1{
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

.bgimg-1 {
  background-image: url('./image/start.jpg');
  min-height: 150%;
}

@media only screen and (max-device-width: 1600px) {
  .bgimg-1 {
    background-attachment: scroll;
    min-height: 500px;
  }
}
</style>

<!-- 시작하기버튼 누른 후 창 -->
<script>
function btn()
{ var id=confirm('기존회원이십니까?');
  if(id) {
    alert('로그인창으로 이동합니다');
    location.href = 'login_page.php';
  }
  else {
    alert('회원가입창으로 이동합니다.');
    location.href = 'register_page.php';
  }
}
</script>

<title>사이트 소개</title>
<body>
  <div class="w3-center" style="margin-left:20% ">
    <div class="bgimg-1 w3-display-container w3-opacity-min">
      <div class="w3-display-middle" style="white-space:nowrap;">
        <span class="w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity">&nbsp;&nbsp;나만의 플레이리스트 만들기&nbsp;</span>
      </div>
    </div>

    <div class="w3-large w3-sand w3-grayscale">
      <div class="w3-content" style="max-width:700px">
        <h5 class="w3-padding-64"><span class="w3-tag w3-wide">ABOUT THE NAME</span></h5>
        <p><b class="w3-xlarge w3-border-bottom w3-border-black">나만의 플레이리스트 만들기란? </b><br><br><br>
          다양한 카테고리를 자신의 취향에 맞게 골라 플레이리스트를 만드는 서비스입니다.<br><br>
          플레이리스트를 만들고 쉽게 관리해보세요.<br><br><br>
        </p>
        <button class="w3-button w3-xlarge w3-black w3-hover-grey" onclick="btn()">&nbsp;&nbsp;시작하기&nbsp;&nbsp;</button>
        <br><br><br><br>
      </div>
    </div>
  </div>

</body>
</html>
