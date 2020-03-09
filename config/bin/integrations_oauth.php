<?php
echo "Generating OAuth for vuestorefront integration.";
try {
  $user = getenv('MYSQL_USER');
  $pass = getenv('MYSQL_PASSWORD');
  $host = getenv('DB_HOST');
  $dbname = getenv('MYSQL_DATABASE');
  $file = "/var/local/integrations_oauth.sql";
  $sql_file = fopen($file, 'r');
  $sql = fread($sql_file, filesize($file));
  $conn = new PDO("mysql:host=" . $host . ";dbname=" . $dbname , $user, $pass);
  $output = $conn->exec($sql);
} catch (PDOException $e) {
    //error
    echo "Your fail message: " . $e->getMessage();
}
?>
