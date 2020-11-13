<?
include("sidebar.php");
include './dbconn.php';
session_start();
?>

<!DOCTYPE html>
<html>

<title>내 기존 리스트</title>

<body>
  <div class="w3-center" style="margin-left:20% ">
    <div class="w3-container w3-black w3-center w3-padding-8">
      <h1>내 리스트</h1>
    </div>
    <div class="w3-pannel w3-gray">
       <br>
    </div>
    <br><br>
    <center>
      <div class="w3-pannel w3-card w3-padding-32" style="width:80%">
        <center>
          <label class="w3-xlarge  w3-border-bottom w3-border-black"><b>&nbsp;&nbsp;&nbsp;플레이리스트를 보려면 클릭하세요.&nbsp;&nbsp;&nbsp;</b></label><br><br><br>
          <?
          $id=$_SESSION['userid'];
          $query = "SELECT pl_no, pl_name from allplaylist where m_id = '$id'";

          $result = $connect->query($query);

          while($row = mysqli_fetch_assoc($result))
          { $no = $row['pl_no'];
          ?>
          <a href="mylist_my_page.php?no=<?echo $no?>" class="w3-button w3-green w3-hover-grey w3-myfont">
          <?
                print "$row[pl_name]";
          ?>
        </a><br><br>
        <?
          }
          ?>
        </center>
      </div>
    </center>
    <br><br><br>
  </div>
</body>
</html>
