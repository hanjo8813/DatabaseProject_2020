<script>
<?
include './dbconn.php';
session_start();

$p_name = $_GET['pl_name'];
$id =  $_SESSION['userid'];

///////////////////플레이리스트 번호 가져오기////////////
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

///////////////////allplaylist에 추가/////////////////
$sql = "INSERT INTO allplaylist(pl_no, m_id, pl_name) VALUES($pl_num,'$id','$p_name')";
$result = $connect->query($sql);

$sql2 = "UPDATE playlist$pl_num SET pl_no = $pl_num WHERE (pl_no IS NULL)";
$result2 = $connect->query($sql2);

if(isset($result2)){  $_SESSION['ing']=0;
  ?>
                  alert('플레이리스트가 정상적으로 추가되었습니다.');
                  location.replace("mylist_page.php");
<?
}
?>

</script>
