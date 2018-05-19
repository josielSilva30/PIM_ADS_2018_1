<?php
  session_start();  
  //Incluindo a conexão com banco de dados
  include_once("conexao.php");
  //O campo usuário e senha preenchido entra no if para validar
  if((isset($_POST['email'])) && (isset($_POST['password']))){
    $usuario = mysqli_real_escape_string($link, $_POST['email']); //Escapar de caracteres especiais, como aspas, prevenindo SQL injection
    $password = mysqli_real_escape_string($link, $_POST['password']);
    $password = md5($password);
    //Buscar na tabela usuario o usuário que corresponde com os dados digitado no formulário
    $result_usuario = "SELECT * FROM usuarios WHERE emailUsuario = '$usuario' && senhaUsuario = '$password' LIMIT 1";
    $resultado_usuario = mysqli_query($link, $result_usuario);
    $resultado = mysqli_fetch_assoc($resultado_usuario);
    if(isset($resultado)){
      $_SESSION['codUsuario'] = $resultado['codUsuario'];
      $_SESSION['nomeUsuario'] = $resultado['nomeUsuario'];
      $_SESSION['codTipo'] = $resultado['codTipo'];
      $_SESSION['emailUsuario'] = $resultado['emailUsuario'];
      if($_SESSION['codTipo'] == "1"){
        header("Location: dashboard.html");
      }elseif($_SESSION['codTipo'] == "2"){
        header("Location: dashboard.html");
      }else{
        header("Location: dashboard.html");
      }
    //Não foi encontrado um usuario na tabela usuário com os mesmos dados digitado no formulário
    //redireciona o usuario para a página de login
    }else{ 
      //Váriavel global recebendo a mensagem de erro
      $_SESSION['loginErro'] = "Usuário ou senha Inválido";
      header("Location: index.php");
    }
    //O campo usuário e senha não preenchido entra no else e redireciona o usuário para a página de login
  }else{
    $_SESSION['loginErro'] = "Usuário ou senha inválido";
    header("Location: index.php");
  }
  ?>
<!--
<!DOCTYPE html lang="en">
<html>
<head>
    <meta charset="utf-8">
	<title>VerificaLogin</title>
	<script type="text/javascript" src="../Properties/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
    function loginsucesso(){
      setTimeout("location.href='../Apresentacao/dashboard.html'", 3000);
    }

    function loginerro(){
      setTimeout("location.href='index.php'", 3000);
    }
  </script>
</head>
<body>

<?php
    session_start();
    $email    = $_POST['inputEmail'];
    $password = $_POST['inputPassword'];

    $querry = "SELECT * FROM bancodados WHERE email='$email' AND senha='$senha'";
    $sql = mysqli_query($link,$querry) or die(mysqli_error());
    $row = mysqli_num_rows($sql);
    $dados = mysqli_fetch_assoc($sql);
    $user = $dados['user'];
    $_SESSION['id'] = $user; 
    $var="<br/>";

    if ($row > 0){
      $_SESSION ['email'] = $_POST ['email'];
      $_SESSION ['senha'] = $_POST ['senha'];
      echo "<center><h3>Login realizado com sucesso!</center></h3>";
      echo "<script>loginsucesso()</script>";
    } 
    else {
      echo "<center><h3>Usuário ou senha incorretos</center></h3>";
      echo "<script>loginerro()</script>";
    }
?>
-->