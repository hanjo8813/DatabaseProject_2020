<?
  include './dbconn.php';
  include("sidebar.php");
  session_start();

  $pl_num = $_GET['no'];
?>

<?
    if(isset($_GET['id'])){
      $delete_id = $_GET['id'];
      }
      /////////////////////////////////////////////////////////////삭제 입력들어왔을때////////////////////////////////////////
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

<title>내 리스트</title>

<body>
  <div class="w3-center" style="margin-left:20% ">
    <div class="w3-container w3-black w3-center w3-padding-8">
      <h1>내 리스트 수정</h1>
    </div>
    <div class="w3-pannel w3-gray">
       <br>
    </div>
    <br>

    <center>
      <div class="w3-pannel w3-card w3-padding-16" style="width:95%">
        <label class="w3-xlarge w3-border-bottom w3-border-black"><b>선택하신 플레이리스트입니다.</b></label>
        <br><br>

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
                $sqll = "SELECT aaa.song_no, aaa.song_name, bbb.singer_name, aaa.song_gen, aaa.song_year, aaa.song_country, aaa.song_feel, bbb.pl_id FROM song aaa INNER JOIN
                  (SELECT aa.pl_id, aa.song_no, bb.singer_name FROM
                    (SELECT a.pl_id, a.song_no, b.sing_no FROM playlist$pl_num a INNER JOIN singer2song b ON a.song_no = b.song_no) aa
                    INNER JOIN singerinfo bb on aa.sing_no = bb.singer_no) bbb ON aaa.song_no =  bbb.song_no ORDER BY bbb.pl_id";
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
                      <a class="w3-button w3-small w3-green w3-hover-grey" href = "mylist_my_page.php?no=<?echo $pl_num?>& id=<?echo $j?>" >삭제</a>
                      <?
                      "</td>";
                    print "</tr>";
                    $j++;
                  }
                }
               ?>
              </table>
              <br>
                <a class="w3-button w3-large w3-green w3-hover-grey w3-myfont" href = "mylist_add_page.php?no=<?echo $pl_num?>&sql=<?echo $sql?>" >노래 추가하기</a>
            </center>
          </div>
          </div>
        </center>
        <br><br>
      </div>

</body>
</html>
