<!DOCTYPE html>
<html>
<head>
    <title>Store form data in .txt file</title>
    <link rel="stylesheet" href="compiler.css">
   
</head>

<body>
    <?php include "nav.php"?>
    <div class="header">
        <a href="index.php">&lt; Home</a>
        <h1>Compiler</h1>
    </div>   
    <form method="post">
        <button type="submit" name="submit">RUN</button><br>
        <textarea placeholder= "Enter Your Text Here" type="text" name="textdata"></textarea>
        <div class="divs"></div>
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

<?php
              
if(isset($_POST['textdata']))
{
$data=$_POST['textdata'];
$fp = fopen('test.txt', 'w');
fwrite($fp, $data);
fclose($fp);
sleep(1);
exec('start bash.exe', $output, $return_status);
sleep(1);
$filename = "output.txt";
$file = fopen( $filename, "r" );

if( $file == false ) {
echo ( "Error in opening file" );
exit();
}

$filesize = filesize( $filename );
$filetext = fread( $file, $filesize );
fclose( $file );
echo ( "test" );
echo ( "<pre>$filetext</pre>" );
}
?>
