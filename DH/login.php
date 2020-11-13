
<?
include './dbconn.php';

         session_start();
         $id=$_GET['id'];
         $pw=$_GET['pwd'];

         $query = "SELECT m_id, m_pwd, m_age from member where m_id= '$id'" ;
         $result = $connect->query($query);

         if(mysqli_num_rows($result)==1) {

                 $row=mysqli_fetch_assoc($result);

                 if($row['m_pwd']==$pw){
                   $age = $row['m_age'];
                         $_SESSION['userid']=$id;
                         $_SESSION['userage']=$age;
                         if(isset($_SESSION['userid'])){
                         ?>      <script>
                                         alert("로그인 되었습니다.");
                                         location.replace("myinfo_page.php");
                                 </script>
 <?
                         }
                         else{
                                 echo "session fail";
                         }
                 }

                 else {
         ?>              <script>
                                 alert("아이디 혹은 비밀번호가 잘못되었습니다.");
                                 history.back();
                         </script>
         <?php
                 }
         }

                 else{
 ?>              <script>
                         alert("아이디 혹은 비밀번호가 잘못되었습니다.");
                         history.back();
                 </script>
 <?
         }

 ?>
