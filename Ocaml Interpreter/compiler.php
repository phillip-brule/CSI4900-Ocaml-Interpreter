<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="compiler.css">
        <title>Compiler</title>
    </head>
    <body>
        <h1>Ocaml Interpreter</h1>
        <hr>
        <div>
            <form method="post" action="/run.php">
                <button type="submit" class="butn" name=
                "submit">Run</button>
            </form>
            <?php
            if(isset($_POST['submit'])){
                $data=$_POST['submit'];
                $fp= fopen("test.txt","a");
                fwrite($fp,$data);
                fclose($fp);
            }

            ?>
            <textarea placeholder="Input your code here ..." name="comment" form="usrform"></textarea>
            <output></output>
            
        </div>
        
    </body>
</html>
