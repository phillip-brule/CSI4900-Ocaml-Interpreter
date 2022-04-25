<!DOCTYPE html>
<html>
<head>
    <title>Interpreter</title>
    <link rel="stylesheet" href="compiler.css">
   
</head>
<?php   
if(isset($_POST['textdata']))
{
$data=$_POST['textdata'];
$fp = fopen('test.txt', 'w');
fwrite($fp, $data);
fclose($fp);
exec('make web_run', $output, $return_status);
}
?>
<body>
    <?php include "nav.php"?>
    <div class="header">
        <a href="index.php">&lt; Home</a>
        <h1>Interpreter</h1>
    </div>   
    <form method="post">
        <button type="submit" name="submit">RUN</button><br>
        <textarea placeholder= "Enter Your Text Here" type="text" name="textdata"></textarea>
        <div class="divs"><?php echo $output?></div>
    </form>
    <br>
    <br>
    <footer>
        <div class="student">
            <h4>Aditya Nair</h4>
            <h4>Phillip Brule</h4>
            <h4>Ribhav Khosla</h4>
        </div>
        <div class="prof">
            <h4>Supervisor: Dr. Amy Felty</h4>
        </div>
    </footer>

</body>
</html>


