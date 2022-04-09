<!-- <!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="compiler.css">
        <title>Compiler</title>
    </head>
    <body>
        <h1>Ocaml Interpreter</h1>
        <hr>
        <div>
            <form>     
                <button type="submit" class="butn" value="submit">Run</button>      
                <input placeholder="Input your code here ..." name="text" >
            </form> 
            // if(isset($_POST['submit'])=="submit"){
            //     $data=$_POST['text'];
            //     $fp= fopen("test.txt","a");
            //     fwrite($fp,$data);
            //     fclose($fp);
            // }

             
            
        </div>
        
    </body>
</html> -->

<!DOCTYPE html>
<html>
<head>
  <title>Store form data in .txt file</title>
  <link rel="stylesheet" href="compiler.css">

</head>

<body>
  <h1>Ocaml Interpreter</h1>
  <hr>
  <form method="post">
    <button type="submit" name="submit">RUN</button>
    <input placeholder= "Enter Your Text Here" type="text" name="textdata">
  </form>
</body>
</html>

<?php
              
if(isset($_POST['textdata']))
{
$data=$_POST['textdata'];
$fp = fopen('test.txt', 'w');
fwrite($fp, $data);
fclose($fp);
}
?>
