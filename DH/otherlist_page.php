
<?
  include './dbconn.php';
  include("sidebar.php");
  session_start();

    //////////////////////추천리스트//////////////////
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

<title>타 사용자 리스트 추천받기</title>

<body>
  <div class="w3-center" style="margin-left:20% ">
    <div class="w3-container w3-black w3-center w3-padding-8">
      <h1>타 사용자 리스트 추천받기</h1>
    </div>
    <div class="w3-pannel w3-gray">
       <br>
    </div>
    <br>
    <center>
      <div class="w3-pannel w3-card w3-padding-64" style="width:90%">
        <div class="w3-padding-16 w3-xlarge w3-border-bottom w3-border-black" style="width:60%">
          <span style="font-size:100px;line-height:0em;opacity:0.2">❝</span>
          <b>&nbsp;<span style="color:#9400d3"><? echo $_SESSION['userage']-$_SESSION['userage']%10 ?>대</span> 가 좋아할만한 리스트입니다.&nbsp;</b>
          <span style="font-size:100px;line-height:0em;opacity:0.2">❞</span>
        </div>
        <br><br>
        <div class="w3-padding-32 w3-xlarge w3-topbar w3-border w3-border-grey" style="width:50%">
          <label class="w3-large w3-myfont"> <b style="color:#9400d3">" <? echo ("$o_name")?>  "</b> 님의 리스트는 어떠세요?</b></label>
          <br><br>
          <a href="otherlist_my_page.php?o_n=<?echo $o_name?>&o_p=<?echo $o_pname?>" class="w3-button w3-large w3-dark-grey w3-padding-8 w3-myfont  ">
          <? print "$o_pname"; ?> </a>
        </div>
        <br><br>
        <a class="w3-button w3-large w3-green w3-padding-8 w3-myfont" href='otherlist_page.php'>다른 리스트 보기</a>
      </div>
    </center>
    <br><br><br>
  </div>

</body>
</html>
