<?
    include './dbconn.php';

    $id=$_POST['id'];
    $pwd=$_POST['pwd'];
    $name=$_POST['name'];
    $age=$_POST['age'];

    $query="SELECT m_id, m_pwd from member where m_id='$id'";

    $result = mysqli_query($connect, $query);
    $num = mysqli_num_rows($result);

    //Exeption handling
    if ($num)
    {
      echo "<script>alert('해당 아이디가 존재함');history.go(-1)</script>";
    }

    else
    {
      $query="INSERT into member(m_id, m_pwd, m_name, m_age) values('$id', '$pwd', '$name', $age)";
      mysqli_query($connect, $query);
      echo "<script>alert('회원가입이 완료되었습니다'); location.href='./login_page.php';</script>";
    }

 ?>
