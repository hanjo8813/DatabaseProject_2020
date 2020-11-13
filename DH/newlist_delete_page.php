<?
  include './dbconn.php';
  include("sidebar.php");
  session_start();

  $_SESSION['ing'] = 1;     //편집중

  $sql = $_GET['sql'];
  $result = $connect->query($sql);

  if(isset($_GET['id'])){
    $delete_id = $_GET['id'];
  }

  if($result){
  $total_rows = mysqli_num_rows($result);
  }
  ///////////////////플레이리스트 번호 가져오기////////////
  $ssql = "SELECT MAX(pl_no) FROM allplaylist";
  $rresult = $connect->query($ssql);
  $rrow=mysqli_fetch_assoc($rresult);

  if(!$rrow['MAX[pl_no]']){
    $pl_num = 0;
  }
  $pl_num = $rrow['MAX(pl_no)']+1;

  ////////////////////플레이리스트 생성, 삽입///////////////////////////////////
  if(!isset($delete_id)){
  $sql1 = "CREATE table playlist$pl_num( pl_id INT NOT NULL AUTO_INCREMENT,  pl_no INT, song_no INT NOT NULL, primary key(pl_id), FOREIGN KEY(pl_no) REFERENCES allplaylist(pl_no) ON DELETE CASCADE,
          FOREIGN KEY(song_no) REFERENCES song(song_no) ON DELETE CASCADE ) DEFAULT CHARACTER SET utf8 collate utf8_general_ci";
  $connect->query($sql1);


  for($i=0 ; $i<$total_rows ; $i++){
    $row=mysqli_fetch_assoc($result);
    $var = $row['song_no'];
    $sql2 = "INSERT INTO playlist$pl_num(song_no) VALUES ($var)";
    $connect->query($sql2);
  }
}

?>

<?
      //삭제 입력들어왔을때////////////////////////////////////////
      if(isset($delete_id)){
      $dsql = "DELETE FROM playlist$pl_num WHERE pl_id = $delete_id";
      $connect->query($dsql);

      $dsql2 = "SELECT * FROM playlist$pl_num";
      $dresult = $connect->query($dsql2);
  //다음 삭제를 위한 pl_id 재정렬
      $dtotal_rows = mysqli_num_rows($dresult);
      for($i=$delete_id; $i<=$dtotal_rows ; $i++){
        $k = $i+1;
        $usql = "UPDATE playlist$pl_num SET pl_id = $i WHERE pl_id = $k";
        $connect->query($usql);
      }
      }
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
    <br>

    <center>
      <div class="w3-pannel w3-card w3-padding-16" style="width:95%">
        <div class="w3-xlarge">
          <b>삭제할 노래를 선택하세요.</b>
        </div>
        <br>

        <center>
          <div class="w3-pannel w3-card w3-padding-16" style="width:95%">
            <div class="w3-pannel" style="width:97%">
            <center>
              <!--여기부터 테이블-->
              <table class="w3-table w3-striped w3-myfont">
                <!-- 칼럼명 -->
                <tr class="w3-dark-grey">
                  <th>제목</th>
                  <th>가수</th>
                  <th>장르</th>
                  <th>발매년도</th>
                  <th>나라</th>
                  <th>분위기</th>
                  <th>삭제</th>
                </tr>
                <!-- 내용물 -->
                <?php

                //뷰 생성 //
                $sql  = "CREATE VIEW mylist AS SELECT aa.pl_id, aa.song_no, bb.singer_name FROM
                  (SELECT a.pl_id, a.song_no, b.sing_no FROM playlist$pl_num a INNER JOIN singer2song b ON a.song_no = b.song_no) aa
                  INNER JOIN singerinfo bb on aa.sing_no = bb.singer_no WITH CHECK OPTION";
                   $connect->query($sql);

                   //뷰를 이용하여 회원이 선택한 플레이리스트 목록 출력
                $sqll = "SELECT aaa.song_no, aaa.song_name, bbb.singer_name, aaa.song_gen, aaa.song_year, aaa.song_country, aaa.song_feel, bbb.pl_id FROM song aaa INNER JOIN
                  mylist bbb ON aaa.song_no =  bbb.song_no ORDER BY bbb.pl_id ";
                $resultt = $connect->query($sqll);

                $j=1;
                if( $resultt )
                {
                while($row = mysqli_fetch_assoc($resultt))
                {
                   print "<tr>";
                      print "<td>$row[song_name]</td>";
                      print "<td>$row[singer_name]</td>";
                      print "<td>$row[song_gen]</td>";
                      print "<td>$row[song_year]</td>";
                      print "<td>$row[song_country]</td>";
                      print "<td>$row[song_feel]</td>";
                      print "<td>"
                      ?>
                      <a class="w3-button w3-small w3-green w3-hover-grey" href = "newlist_delete_page.php?sql=<?echo $sql?>& id=<?echo $j?>" >삭제</a>
                      <?
                      "</td>";
                    print "</tr>";
                    $j++;
                  }
                }
               ?>
              </table>
              <br>
                <a class="w3-button w3-large w3-green w3-hover-grey" href = "newlist_add_page.php?no=<?echo $pl_num?>" >다음단계로</a>
            </center>
          </div>
          </div>
        </center>
        <br><br>
      </div>

</body>
</html>
