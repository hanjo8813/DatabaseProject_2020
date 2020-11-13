<?
include './dbconn.php';
include("sidebar.php");

session_start();
    $pl_num = $_GET['no'];
    if($pl_num){$_SESSION['pl'] = $pl_num;}

    if($_SESSION['pl']){
      $pl_num = $_SESSION['pl'];
    }
  /////////////////////노래이름 받자/////////////////////
  $s_name = $_GET['s_name'];
  $sql = "SELECT aa.song_no, aa.song_name, bb.singer_name, aa.song_gen, aa.song_year, aa.song_country, aa.song_feel FROM song aa INNER JOIN
           (SELECT a.song_no, a.sing_no, b.singer_name, b.singer_sex FROM singer2song a INNER JOIN singerinfo b ON a.sing_no = b.singer_no) bb ON aa.song_no = bb.song_no
          WHERE aa.song_name LIKE '%$s_name%'";
  $result=  $connect->query($sql);

?>

<?
      if(isset($_GET['s_no'])){
        $add_no = $_GET['s_no'];
      }
      /////////////////////////////////////////////////////////////추가 입력들어왔을때////////////////////////////////////////
      if(isset($add_no)){

      $asql2 = "SELECT * FROM playlist$pl_num";
      $aresult = $connect->query($asql2);

      $atotal_rows = mysqli_num_rows($aresult);
      $set_auto = $atotal_rows +1;

      $sql = "ALTER TABLE playlist$pl_num AUTO_INCREMENT $set_auto";
      $connect->query($sql);

      $sql = "INSERT INTO playlist$pl_num(song_no) VALUES($add_no)";
      $connect->query($sql);

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
      <div class="w3-pannel w3-card w3-padding-16" style="width:60%">
        <br>
        <div class="w3-container">
          <form action='./newlist_add_page.php?' name='s_name' method='get' >
            <label class="w3-xlarge"><b>원하는 노래 제목을 검색하세요!</b></label>
            <br><br>
            <input class="w3-input w3-border w3-round-xxlarge" type="text" name="s_name" placeholder="노래 제목" style="width:50%">
            <br>
            <input class="w3-button w3-large w3-green w3-hover-grey w3-myfont" type="submit" value="검색">
            <br><br>
          </form>
          </div>
        </div>
      </center>

        <br><br>
        <center>
          <div class="w3-pannel w3-card w3-padding-16" style="width:95%">
            <label class="w3-xlarge"><b>< 검색결과 ></b></label>
            <br><br>
            <div class="w3-pannel" style="width:97%">
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
                  <th>추가</th>
                </tr>
                <!-- 내용물 -->
                <?php


                if(isset($s_name) ){
                while($row = mysqli_fetch_assoc($result)){
                   print "<tr>";
                      print "<th>$row[song_name]</th>";
                      print "<th>$row[singer_name]</th>";
                      print "<th>$row[song_gen]</th>";
                      print "<th>$row[song_year]</th>";
                      print "<th>$row[song_country]</th>";
                      print "<th>$row[song_feel]</th>";
                      print "<td>"
                      ?>
                      <a class="w3-button w3-small w3-green w3-hover-grey" href = "newlist_add_page.php?&no=<?echo $pl_num?>&s_no=<?echo $row['song_no']?>&s_name=<?echo $s_name?>" >추가</a>
                      <?
                      "</td>";
                    print "</tr>";
               }
             }
               ?>
              </table>
          </div>
          </div>
        </center>

        <br><br>
        <center>
          <div class="w3-pannel w3-card w3-padding-16" style="width:95%">
            <label class="w3-xlarge"><b class="border-bottom w3-border-black">< 회원님의 현재 테이블 ></b></label>
            <br><br>
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
                $sqll = "SELECT aaa.song_no, aaa.song_name, bbb.singer_name, aaa.song_gen, aaa.song_year, aaa.song_country, aaa.song_feel ,bbb.pl_id FROM song aaa INNER JOIN
                mylist bbb ON aaa.song_no =  bbb.song_no ORDER BY bbb.pl_id";
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
              <br>
              <a class="w3-button w3-large w3-green w3-hover-grey w3-myfont" href = "newlist_name_page.php?sql=<?echo $sql?>" >다음단계로</a>

            </center>
          </div>
          </div>
        </center>
        <br><br>
      </div>

</body>
</html>
