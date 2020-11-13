<?
  include './dbconn.php';
  include("sidebar.php");
  session_start();
    //Execption Handling
    //편집중이다가 나오면 임시로 만들었던 테이블, 뷰 삭제//
    if($_SESSION['ing']==1){

      //편집 해제를 알려준다.
      $_SESSION['ing']=0;
      //편집 중이던 플레이리스트 번호 가져오기////////////
      $ssql = "SELECT MAX(pl_no) FROM allplaylist";
      $rresult = $connect->query($ssql);
      $rrow=mysqli_fetch_assoc($rresult);

      if(!$rrow['MAX[pl_no]']){
        $pl_num = 0;
      }
      $pl_num = $rrow['MAX(pl_no)']+1;

      //뷰 삭제/////////////////
      $sql = "DROP VIEW mylist";
      $connect->query($sql);


      //테이블 삭제////////////////////////
      $sql = "DROP TABLE playlist$pl_num";
      $connect->query($sql);
      ?><script>alert("테이블 정보가 저장되지 않습니다.");</script><?
    }

    //추천리스트//////////////////
    $id = $_SESSION['userid'];
    $age = $_SESSION['userage'];
    //현재 로그인 중인 회원의 나이대와 비슷한 다른 회원의 플레이리스트 들 중 랜덤 1개를 출력
    $sql = "SELECT a.pl_name, a.m_id FROM allplaylist a INNER JOIN (SELECT m_id FROM member WHERE ROUND(m_age,-1) = ROUND($age,-1)) b ON a.m_id = b.m_id WHERE a.m_id!='$id' ORDER BY RAND() LIMIT 1 ";
    $result = $connect->query($sql);
    $row = mysqli_fetch_assoc($result);

    $o_name = $row['m_id'];
    $o_pname = $row['pl_name'];
?>

<!DOCTYPE html>
<html>
<title>내정보창</title>

<body>
  <div class="w3-center" style="margin-left:20% ">
    <div class="w3-container w3-black w3-center w3-padding-8">
      <h1>내 정보</h1>
    </div>
    <div class="w3-pannel w3-gray">
       <br>
    </div>
    <br>
    <center>
      <div class="w3-pannel w3-card w3-padding-64" style="width:90%">
        <div class="w3-padding-16 w3-xlarge w3-border-bottom w3-border-black" style="width:60%">
          <span style="font-size:100px;line-height:0em;opacity:0.2">❝</span>
          <b> <span style="color:#9400d3"> &nbsp;<?echo $_SESSION['userid']?> </span> 님 환영합니다.&nbsp;</b>
          <span style="font-size:100px;line-height:0em;opacity:0.2">❞</span>
        </div>
        <br><br>
        <div class="w3-myfont">
          <button class="w3-button w3-large w3-green w3-padding-8" style="width:30%" onclick="location.href='newlist_check_page.php'">
            나만의 플레리스트 만들기
          </button> <br><br>
          <button class="w3-button w3-large w3-green w3-padding-8" style="width:30%"  onclick="location.href='mylist_page.php'">
            내 기존 리스트 보기
          </button> <br><br>
          <button class="w3-button w3-large w3-green w3-padding-8" style="width:30%"  onclick="location.href='otherlist_page.php'">
            타 사용자 리스트 추천받기
          </button> <br><br>
          <button class="w3-button w3-large w3-green w3-padding-8" style="width:30%"  onclick="location.href='updatemyinfo_page.php'">
            비밀번호 변경하기
          </button> <br>
        </div>
      </div>
    </center>
    <br>

    <br><br>

  </div>
</body>
</html>
