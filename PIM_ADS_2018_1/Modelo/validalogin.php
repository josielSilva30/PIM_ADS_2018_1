<?php
  session_start();  
  //Incluindo a conex�o com banco de dados
  include("conexao.php");

  header("Access-Control-Allow-Origin: *")
  //O campo usu�rio e senha preenchido entra no if para validar
  if((isset($_POST['email'])) && (isset($_POST['password']))){
    $usuario = mysqli_real_escape_string($link, $_POST['email']); 
    //Escapar de caracteres especiais, como aspas, prevenindo SQL injection
    $password = mysqli_real_escape_string($link, $_POST['password']);
    $password = md5($password);
    //Buscar na tabela usuario o usu�rio que corresponde com os dados digitado no formul�rio
    $result_usuario = "SELECT * FROM usuario WHERE emailUsuario = '$usuario' && senhaUsuario = '$password' LIMIT 1";
    $resultado_usuario = mysqli_query($link, $result_usuario);
    $resultado = mysqli_fetch_assoc($resultado_usuario);
    //Encontrado um usuario na tabela usu�rio com os mesmos dados digitado no formul�rio
    if(isset($resultado)){
      $_SESSION['codUsuario'] = $resultado['codUsuario'];
      $_SESSION['nomeUsuario'] = $resultado['nomeUsuario'];
      $_SESSION['codTipo'] = $resultado['codTipo'];
      $_SESSION['emailUsuario'] = $resultado['emailUsuario'];
      if($_SESSION['codTipo'] == "A"){
        header("Location: ../Apresentacao/dashboard.html");
      }elseif($_SESSION['codTipo'] == "A"){
        header("Location: ../Apresentacao/dashboard.html");
      }else{
        header("Location: ../Apresentacao/dashboard.html");
      }
    //N�o foi encontrado um usuario na tabela usu�rio com os mesmos dados digitado no formul�rio
    //redireciona o usuario para a p�gina de login
    }else{ 
      //V�riavel global recebendo a mensagem de erro
      $_SESSION['loginErro'] = "Usu�rio ou senha Inv�lido";
      header("Location: Login.html");
    }
    //O campo usu�rio e senha n�o preenchido entra no else e redireciona o usu�rio para a p�gina de login
  }else{
    $_SESSION['loginErro'] = "Usu�rio ou senha inv�lido";
    header("Location: Login.html");
  }
  ?>