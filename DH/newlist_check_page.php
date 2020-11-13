<?
include './dbconn.php';
include("sidebar.php");

session_start();
  //Execption Handling
  //편집중이다가 나오면 예외처리
  if($_SESSION['ing']==1){


    $_SESSION['ing']=0;
    //편집 중이던 플레이리스트 번호 가져오기////////////
    $ssql = "SELECT MAX(pl_no) FROM allplaylist";
    $rresult = $connect->query($ssql);
    $rrow=mysqli_fetch_assoc($rresult);

    if(!$rrow['MAX[pl_no]']){
      $pl_num = 0;
    }
    $pl_num = $rrow['MAX(pl_no)']+1;

    //뷰 날려버리기/////////////////
    $sql = "DROP VIEW mylist";
    $connect->query($sql);

    //테이블날려버리자////////////////////////
    $sql = "DROP TABLE playlist$pl_num";
    $connect->query($sql);
    ?><script>alert("테이블 정보가 저장되지 않습니다.");</script><?
  }
?>

        <!--////////////////////db연동/////////////////-->
               <?
                //변수 선언
                 $aSex = $_POST['sex']; $aYear = $_POST['year'];  $aCountry = $_POST['country'];  $aGenre = $_POST['genre'];  $aFeel = $_POST['feel'];

                 if(isset($aYear)){
                 $N1 = count($aYear);
                  }
                if(isset($aCountry)){
                   $N2 = count($aCountry);
                 }
                 if(isset($aGenre)){
                   $N3 = count($aGenre);
                 }
                 if(isset($aFeel)){
                   $N4 = count($aFeel);
                 }
                 $where = '';
                 if($N1!=0||$N2!=0||$N3!=0||$N4!=0){
                   $where = $where."WHERE";
                 }

                 //남성,여성, 상관없음을 받고 각각의 조건들을 저장////////////////////////////////////////
                 if(empty($aSex)||$aSex=="??")
                 {
                   $arr1 = $arr2 = $arr3 = $arr4 = ' ';
                   $and1 = $and2 = $and3 = '';

                   for($i = 0 ; $i<$N1 ; $i++){
                   if($i==0&&$i!=$N1-1){
                     $arr1 = $arr1."(ROUND(aa.song_year,-1) =$aYear[$i] OR ";
                   }
                   else  if($i!=0 &&$i == $N1-1){
                       $arr1=$arr1."ROUND(aa.song_year,-1) = $aYear[$i])";
                     }
                   else if($i==0&&$i==$N1-1){
                     $arr1 = $arr1."(ROUND(aa.song_year,-1) = $aYear[$i])";
                   }
                   else{
                       $arr1=$arr1."ROUND(aa.song_year,-1) = $aYear[$i] OR ";
                     }
                   }

                   for($i = 0 ; $i<$N2 ; $i++){
                   if($i==0&&$i!=$N2-1){
                     $arr2 = $arr2."(aa.song_country ='$aCountry[$i]' OR ";
                   }
                   else  if($i!=0 &&$i == $N2-1){
                       $arr2=$arr2."aa.song_country ='$aCountry[$i]')";
                     }
                   else if($i==0&&$i==$N2-1){
                     $arr2 = $arr2."(aa.song_country = '$aCountry[$i]')";
                   }
                   else{
                       $arr2=$arr2."aa.song_country ='$aCountry[$i]' OR ";
                     }
                   }


                   for($i = 0 ; $i<$N3 ; $i++){
                   if($i==0&&$i!=$N3-1){
                     $arr3 = $arr3."(aa.song_gen ='$aGenre[$i]' OR ";
                   }
                   else  if($i!=0 &&$i == $N3-1){
                       $arr3=$arr3."aa.song_gen ='$aGenre[$i]')";
                     }
                   else if($i==0&&$i==$N3-1){
                     $arr3 = $arr3."(aa.song_gen = '$aGenre[$i]')";
                   }
                   else{
                       $arr3=$arr3."aa.song_gen ='$aGenre[$i]' OR ";
                     }
                   }

                   for($i = 0 ; $i<$N4 ; $i++){
                   if($i==0&&$i!=$N4-1){
                     $arr4 = $arr4."(aa.song_feel ='$aFeel[$i]' OR ";
                   }
                   else  if($i!=0 &&$i == $N4-1){
                       $arr4=$arr4."aa.song_feel ='$aFeel[$i]')";
                     }
                   else if($i==0&&$i==$N3-1){
                     $arr4 = $arr4."(aa.song_feel = '$aFeel[$i]')";
                   }
                   else{
                       $arr4=$arr4."aa.song_feel ='$aFeel[$i]' OR ";
                     }
                   }

                   if($N1!=0&&$N2!=0){
                     $and1 = $and1."AND";
                   }
                   if(($N1!=0||$N2!=0)&&$N3!=0){
                     $and2 = $and2."AND";
                   }
                   if(($N1!=0||$N2!=0||$N3!=0)&&$N4!=0){
                     $and3 = $and3."AND";
                   }


                     $sql =
                     "SELECT aa.song_no, aa.song_name, bb.singer_name, aa.song_gen, aa.song_year, aa.song_country, aa.song_feel
                     FROM song aa
                     INNER JOIN (SELECT a.song_no, a.sing_no, b.singer_name, b.singer_sex FROM singer2song a INNER JOIN singerinfo b ON a.sing_no = b.singer_no) bb
                     ON aa.song_no = bb.song_no
                     $where $arr1 $and1 $arr2 $and2 $arr3 $and3 $arr4 ORDER BY RAND() LIMIT 100";
                      $result = $connect->query($sql);

                      mysqli_close($connect);
                 }
                 else if($aSex == "남성"){
                    $arr1 = $arr2 = $arr3 = $arr4 = ' ';
                    $and1 = $and2 = $and3 = '';

                    for($i = 0 ; $i<$N1 ; $i++){
                    if($i==0&&$i!=$N1-1){
                      $arr1 = $arr1."(ROUND(aa.song_year,-1) ='$aYear[$i]' OR ";
                    }
                    else  if($i!=0 &&$i == $N1-1){
                        $arr1=$arr1."ROUND(aa.song_year,-1) ='$aYear[$i]')";
                      }
                    else if($i==0&&$i==$N1-1){
                      $arr1 = $arr1."(ROUND(aa.song_year,-1) = '$aYear[$i]')";
                    }
                    else{
                        $arr1=$arr1."ROUND(aa.song_year,-1) ='$aYear[$i]' OR ";
                      }
                    }

                    for($i = 0 ; $i<$N2 ; $i++){
                    if($i==0&&$i!=$N2-1){
                      $arr2 = $arr2."(aa.song_country ='$aCountry[$i]' OR ";
                    }
                    else  if($i!=0 &&$i == $N2-1){
                        $arr2=$arr2."aa.song_country ='$aCountry[$i]')";
                      }
                    else if($i==0&&$i==$N2-1){
                      $arr2 = $arr2."(aa.song_country = '$aCountry[$i]')";
                    }
                    else{
                        $arr2=$arr2."aa.song_country ='$aCountry[$i]' OR ";
                      }
                    }


                    for($i = 0 ; $i<$N3 ; $i++){
                    if($i==0&&$i!=$N3-1){
                      $arr3 = $arr3."(aa.song_gen ='$aGenre[$i]' OR ";
                    }
                    else  if($i!=0 &&$i == $N3-1){
                        $arr3=$arr3."aa.song_gen ='$aGenre[$i]')";
                      }
                    else if($i==0&&$i==$N3-1){
                      $arr3 = $arr3."(aa.song_gen = '$aGenre[$i]')";
                    }
                    else{
                        $arr3=$arr3."aa.song_gen ='$aGenre[$i]' OR ";
                      }
                    }

                    for($i = 0 ; $i<$N4 ; $i++){
                    if($i==0&&$i!=$N4-1){
                      $arr4 = $arr4."(aa.song_feel ='$aFeel[$i]' OR ";
                    }
                    else  if($i!=0 &&$i == $N4-1){
                        $arr4=$arr4."aa.song_feel ='$aFeel[$i]')";
                      }
                    else if($i==0&&$i==$N4-1){
                      $arr4 = $arr4."(aa.song_feel = '$aFeel[$i]')";
                    }
                    else{
                        $arr4=$arr4."aa.song_feel ='$aFeel[$i]' OR ";
                      }
                    }

                    if($N1!=0&&$N2!=0){
                      $and1 = $and1."AND";
                    }
                    if(($N1!=0||$N2!=0)&&$N3!=0){
                      $and2 = $and2."AND";
                    }
                    if(($N1!=0||$N2!=0||$N3!=0)&&$N4!=0){
                      $and3 = $and3."AND";
                    }

                      $sql = "SELECT aa.song_no, aa.song_name, bb.singer_name, aa.song_gen, aa.song_year, aa.song_country, aa.song_feel FROM song aa INNER JOIN
                              (SELECT a.song_no, a.sing_no, b.singer_name, b.singer_sex FROM singer2song a INNER JOIN singerinfo b ON a.sing_no = b.singer_no WHERE b.singer_sex ='남성') bb ON aa.song_no = bb.song_no
                              $where $arr1 $and1 $arr2 $and2 $arr3 $and3 $arr4 ORDER BY RAND() LIMIT 100";
                       $result = $connect->query($sql);
                       mysqli_close($connect);

                 }
                 else if($aSex =="여성"){
                   $arr1 = $arr2 = $arr3 = $arr4 = ' ';
                   $and1 = $and2 = $and3 = '';

                   for($i = 0 ; $i<$N1 ; $i++){
                   if($i==0&&$i!=$N1-1){
                     $arr1 = $arr1."(ROUND(aa.song_year,-1) ='$aYear[$i]' OR ";
                   }
                   else  if($i!=0 &&$i == $N1-1){
                       $arr1=$arr1."ROUND(aa.song_year,-1) ='$aYear[$i]')";
                     }
                   else if($i==0&&$i==$N1-1){
                     $arr1 = $arr1."(ROUND(aa.song_year,-1) = '$aYear[$i]')";
                   }
                   else{
                       $arr1=$arr1."ROUND(aa.song_year,-1) ='$aYear[$i]' OR ";
                     }
                   }

                   for($i = 0 ; $i<$N2 ; $i++){
                   if($i==0&&$i!=$N2-1){
                     $arr2 = $arr2."(aa.song_country ='$aCountry[$i]' OR ";
                   }
                   else  if($i!=0 &&$i == $N2-1){
                       $arr2=$arr2."aa.song_country ='$aCountry[$i]')";
                     }
                   else if($i==0&&$i==$N2-1){
                     $arr2 = $arr2."(aa.song_country = '$aCountry[$i]')";
                   }
                   else{
                       $arr2=$arr2."aa.song_country ='$aCountry[$i]' OR ";
                     }
                   }


                   for($i = 0 ; $i<$N3 ; $i++){
                   if($i==0&&$i!=$N3-1){
                     $arr3 = $arr3."(aa.song_gen ='$aGenre[$i]' OR ";
                   }
                   else  if($i!=0 &&$i == $N3-1){
                       $arr3=$arr3."aa.song_gen ='$aGenre[$i]')";
                     }
                   else if($i==0&&$i==$N3-1){
                     $arr3 = $arr3."(aa.song_gen = '$aGenre[$i]')";
                   }
                   else{
                       $arr3=$arr3."aa.song_gen ='$aGenre[$i]' OR ";
                     }
                   }

                   for($i = 0 ; $i<$N4 ; $i++){
                   if($i==0&&$i!=$N4-1){
                     $arr4 = $arr4."(aa.song_feel ='$aFeel[$i]' OR ";
                   }
                   else  if($i!=0 &&$i == $N4-1){
                       $arr4=$arr4."aa.song_feel ='$aFeel[$i]')";
                     }
                   else if($i==0&&$i==$N4-1){
                     $arr4 = $arr4."(aa.song_feel = '$aFeel[$i]')";
                   }
                   else{
                       $arr4=$arr4."aa.song_feel ='$aFeel[$i]' OR ";
                     }
                   }

                   if($N1!=0&&$N2!=0){
                     $and1 = $and1."AND";
                   }
                   if(($N1!=0||$N2!=0)&&$N3!=0){
                     $and2 = $and2."AND";
                   }
                   if(($N1!=0||$N2!=0||$N3!=0)&&$N4!=0){
                     $and3 = $and3."AND";
                   }

                     $sql = "SELECT aa.song_no, aa.song_name, bb.singer_name, aa.song_gen, aa.song_year, aa.song_country, aa.song_feel FROM song aa INNER JOIN
                             (SELECT a.song_no, a.sing_no, b.singer_name, b.singer_sex FROM singer2song a INNER JOIN singerinfo b ON a.sing_no = b.singer_no WHERE b.singer_sex ='여성') bb ON aa.song_no = bb.song_no
                             $where $arr1 $and1 $arr2 $and2 $arr3 $and3 $arr4 ORDER BY RAND() LIMIT 100";
                      $result = $connect->query($sql);
                      mysqli_close($connect);
                 }
               ?>

<!-- 드랍다운 -->
<script>
function sexfunc() {
  var x = document.getElementById("sex");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}
function yearfunc() {
  var x = document.getElementById("year");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}
function countryfunc() {
  var x = document.getElementById("country");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}
function jenrefunc() {
  var x = document.getElementById("jenre");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}
function feelfunc() {
  var x = document.getElementById("feel");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>

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
          <b>원하는 항목을 체크해주세요.</b>
        </div>
        <br>
          <!-- action(페이지) name  value 같은것들 설정해야됨!!!!!!!!!!!!!!!!!!! -->
          <!-- action(페이지) name  value 같은것들 설정해야됨!!!!!!!!!!!!!!!!!!! -->
          <!-- action(페이지) name  value 같은것들 설정해야됨!!!!!!!!!!!!!!!!!!! -->
          <form action='newlist_check_page.php' id='check' method='post'>
        <div class="w3-container w3-myfont">

            <div class="w3-dropdown-click w3-dark-grey w3-round-xlarge" style="width:18%">
              <a onclick="sexfunc()" class="w3-button w3-round-xlarge w3-large" style="width:100%">성 별</a>
              <div id="sex" class="w3-dropdown-content w3-bar-block w3-border w3-center">
                  <p><input class="w3-radio" type="radio" name="sex" value = "남성" checked = "checked"><label> 남자</label></p>
                  <p><input class="w3-radio" type="radio" name="sex" value = "여성" ><label> 여자</label></p>
                  <p><input class="w3-radio" type="radio" name="sex" value = "??"><label> 상관없음</label></p>
              </div>
            </div>
            &nbsp;&nbsp;&nbsp;
            <div class="w3-dropdown-click w3-dark-grey w3-round-xlarge" style="width:18%">
              <a onclick="yearfunc()" class="w3-button w3-round-xlarge w3-large" style="width:100%">연 도</a>
              <div id="year" class="w3-dropdown-content w3-bar-block w3-border w3-center">
                  <p><input class="w3-check" type="checkbox" name="year[]" value="1990"> <label> 1985-1995</label></p>
                  <p><input class="w3-check" type="checkbox" name="year[]" value="2000"> <label> 1995-2005</label></p>
                  <p><input class="w3-check" type="checkbox" name="year[]" value="2010"> <label> 2005-2015</label></p>
                  <p><input class="w3-check" type="checkbox" name="year[]" value="2020"> <label> 2015-2020</label></p>
              </div>
            </div>
            &nbsp;&nbsp;&nbsp;
            <div class="w3-dropdown-click w3-dark-grey w3-round-xlarge" style="width:18%">
              <a onclick="countryfunc()" class="w3-button w3-round-xlarge w3-large" style="width:100%">나 라</a>
              <div id="country" class="w3-dropdown-content w3-bar-block w3-border w3-center">
                  <p><input class="w3-check" type="checkbox" name="country[]" value="K-POP"> <label> K-POP</label></p>
                  <p><input class="w3-check" type="checkbox" name="country[]" value="J-POP"> <label> J-POP</label></p>
                  <p><input class="w3-check" type="checkbox" name="country[]" value="B-POP"> <label> Brit-POP</label></p>
                  <p><input class="w3-check" type="checkbox" name="country[]" value="POP"> <label> POP</label></p>
              </div>
            </div>
            &nbsp;&nbsp;&nbsp;
            <div class="w3-dropdown-click w3-dark-grey w3-round-xlarge" style="width:18%">
              <a onclick="jenrefunc()" class="w3-button w3-round-xlarge w3-large" style="width:100%">장 르</a>
              <div id="jenre" class="w3-dropdown-content w3-bar-block w3-border w3-center">
                  <p><input class="w3-check" type="checkbox" name="genre[]" value="포크"> <label> 포크</label></p>
                  <p><input class="w3-check" type="checkbox" name="genre[]" value="록"> <label> 록</label></p>
                  <p><input class="w3-check" type="checkbox" name="genre[]" value="Soul"> <label> Soul</label></p>
                  <p><input class="w3-check" type="checkbox" name="genre[]" value="R&B"> <label> R&B</label></p>
                  <p><input class="w3-check" type="checkbox" name="genre[]" value="트로트"> <label> 트로트</label></p>
                  <p><input class="w3-check" type="checkbox" name="genre[]" value="발라드"> <label> 발라드</label></p>
                  <p><input class="w3-check" type="checkbox" name="genre[]" value="댄스"> <label> 댄스</label></p>
                  <p><input class="w3-check" type="checkbox" name="genre[]" value="힙합"> <label> 힙합</label></p>
              </div>
            </div>
            &nbsp;&nbsp;&nbsp;
            <div class="w3-dropdown-click w3-dark-grey w3-round-xlarge" style="width:18%">
              <a onclick="feelfunc()" class="w3-button w3-round-xlarge w3-large" style="width:100%">분 위 기</a>
              <div id="feel" class="w3-dropdown-content w3-bar-block w3-border w3-center">
                  <p><input class="w3-check" type="checkbox" name="feel[]" value="신나는"> <label> 신나는</label></p>
                  <p><input class="w3-check" type="checkbox" name="feel[]" value="슬픈" > <label> 슬픈</label></p>
                  <p><input class="w3-check" type="checkbox" name="feel[]" value="몽환적"> <label> 몽환적</label></p>
                  <p><input class="w3-check" type="checkbox" name="feel[]" value="달달한"> <label> 달달한</label></p>
                  <p><input class="w3-check" type="checkbox" name="feel[]" value="잔잔한"> <label> 잔잔한</label></p>
              </div>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br>
            <input class="w3-button w3-large w3-green w3-hover-grey" type="submit" value="생성하기" onclick = "">
          </div>

        </form>
        </div>
        </center>

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
                if(isset($result) ){
                while($row = mysqli_fetch_assoc($result)){
                   print "<tr>";
                      print "<th>$row[song_name]</th>";
                      print "<th>$row[singer_name]</th>";
                      print "<th>$row[song_gen]</th>";
                      print "<th>$row[song_year]</th>";
                      print "<th>$row[song_country]</th>";
                      print "<th>$row[song_feel]</th>";
                    print "</tr>";
               }
             }
               ?>
              </table>
              <br>
                <a class="w3-button w3-large w3-green w3-hover-grey w3-myfont" href = "newlist_delete_page.php?sql=<?echo $sql?>" >편집하기</a>
            </center>
          </div>
          </div>
        </center>
        <br><br>
      </div>

</body>
</html>
