<?
//자신에게 맞는 값으로 설정해야됨
$db_host = "localhost";
$db_user = "root";
$db_passwd = "8813";
$db_name = "dh2";

$connect = mysqli_connect($db_host, $db_user, $db_passwd, $db_name);

if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

?>
