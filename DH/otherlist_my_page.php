<?
include './dbconn.php';
include("sidebar.php");

session_start();

  $o_name = $_GET['o_n'];
  $o_pname = $_GET['o_p'];

  $sql = "SELECT * FROM allplaylist WHERE pl_name = '$o_pname'";
  $result = $connect->query($sql);
  $row = mysqli_fetch_assoc($result);

  $pl_num = $row['pl_no'];
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
      <div class="w3-pannel w3-card w3-padding-16" style="width:95%">
          <br>
        <div class="w3-container">
          <div class="w3-padding-16 w3-xlarge w3-topbar w3-border w3-border-grey" style="width:50%">
        <label class="w3-xlarge"><b style="color:#9400d3">" <?echo $o_name?> "</b> 회원님의 <br><b style="color:#9400d3">" <?echo $o_pname?> "</b> 테이블</label>
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
                </tr>
                <!-- 내용물 -->
                <?php
                $sqll = "SELECT aaa.song_no, aaa.song_name, bbb.singer_name, aaa.song_gen, aaa.song_year, aaa.song_country, aaa.song_feel, bbb.pl_id FROM song aaa INNER JOIN
                  (SELECT aa.pl_id, aa.song_no, bb.singer_name FROM
                    (SELECT a.pl_id, a.song_no, b.sing_no FROM playlist$pl_num a INNER JOIN singer2song b ON a.song_no = b.song_no) aa
                    INNER JOIN singerinfo bb on aa.sing_no = bb.singer_no) bbb ON aaa.song_no =  bbb.song_no ORDER BY bbb.pl_id ";
                $resultt = $connect->query($sqll);

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
                    print "</tr>";
                  }
                }
                ?>
              </table>
            </center>
          </div>
          </div>
        </center>
        <br><br>
      </div>

</body>
</html>
