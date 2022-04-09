<?php
if(isset($_POST['submit'])){
    $data=$_POST['submit'];
    $fp= fopen("test.txt","a");
    fwrite($fp,$data);
    fclose($fp);
}

?>