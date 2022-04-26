<!DOCTYPE html>
<html>
<head>
    <title>Store form data in .txt file</title>
    <link rel="stylesheet" href="interpreter.css">
   
</head>

<body>
    <?php include "nav.php"?>
    <div class="header">
        <a href="index.php">&lt; Home</a>
        <h1>Interpreter</h1>
    </div>   
    <form method="POST">
        <button type="submit" name="submit">RUN</button><br>
        <textarea placeholder= "Enter Your Text Here" type="text" name="textdata"></textarea>
        <div class="divs"><?php
            function debug_to_console($data) {
                $output = $data;
                if (is_array($output))
                    $output = implode(',', $output);
            
                echo "<script>console.log('Debug: " . $output . "' );</script>";
            }
            exec('truncate -s 0 test.txt', $output, $return_status);       
            debug_to_console("first stop");
            if(isset($_POST['textdata']))
            {
            $data=$_POST['textdata'];
            $fp = fopen('test.txt', 'w');
            $write_success = fwrite($fp, $data);
            fclose($fp);
            debug_to_console("second stop");
            if(!$fp){
                debug_to_console("File open unsuccessful");
            }
            if(!$write_success){
                debug_to_console("File write unsuccessful");
            }
            debug_to_console("Bytes written: " . $write_success);
            // $exec = "echo Dovakin4! | /usr/bin/sudo -S cd root@172.105.106.29/var/www/html/Lexer_and_Parser_Merged; whoami" ;
            // exec('(cd .. && dune exec web_run/main.exe)', $output);
            shell_exec('sudo -u www-data /var/www/html/Lexer_and_Parser_Merged/web_run.sh');
            // exec('cd ..; sh web_run.sh', $output);
            // echo '<pre>test';
            // passthru('cd ..; make web_run');
            // echo '</pre>';
            // $output = shell_exec('cd ..; ./web_run.sh');
            // debug_to_console(shell_exec('whoami'));
            debug_to_console($output);

            $filename = "output.txt";
            $file = fopen( $filename, "r" );

            if( $file == false ) {
            echo ( "Error in opening file" );
            exit();
            }

            $filesize = filesize( $filename );
            $filetext = fread( $file, $filesize );
            fclose( $file );
            echo (  $filetext );
            };

            debug_to_console("third stop");
            echo "<br/><br/><i>Your input:</i><br/>";
            echo $data;
            ?>
</div>
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

