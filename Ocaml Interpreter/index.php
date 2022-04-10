<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="index.css">
        <title>Interpreter</title>
    </head>
    <body>
        <h2>Interpreter for: <br><span class="auto-input"></span><br>Made In Ocaml</h2>

        <div>   
            <a href="about.php"><button>About</button></a>
            <a href="compiler.php"><button>Compiler</button></a>
        </div>
    
    </body>
    <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>
    <script>
        var typed = new Typed(".auto-input", {
            strings: ["Letrec.", "Proc."],
            typeSpeed: 100,
            backSpeed: 30,
            loop: true
        })

    </script>
</html>