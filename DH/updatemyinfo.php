<?
include './dbconn.php';
         session_start();

         $id =  $_SESSION['userid'];
         $pwd = $_GET['pwd1'];
       if($pwd1==$pwd2){
         $sql = "UPDATE member SET m_pwd = '$pwd' WHERE m_id = '$id'";
         $connect->query($sql);

         ?><script>
                         location.replace("myinfo_page.php");
                 </script><?
       }

?>
