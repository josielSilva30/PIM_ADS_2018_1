<?php
  session_start();  
  //Incluindo a conexão com banco de dados
  include("conexao.php");

  header("Access-Control-Allow-Origin: *")
  //O campo usuário e senha preenchido entra no if para validar
  if((isset($_POST['email'])) && (isset($_POST['password']))){
    $usuario = mysqli_real_escape_string($link, $_POST['email']); 
    //Escapar de caracteres especiais, como aspas, prevenindo SQL injection
    $password = mysqli_real_escape_string($link, $_POST['password']);
    $password = md5($password);
    //Buscar na tabela usuario o usuário que corresponde com os dados digitado no formulário
    $result_usuario = "SELECT * FROM usuario WHERE emailUsuario = '$usuario' && senhaUsuario = '$password' LIMIT 1";
    $resultado_usuario = mysqli_query($link, $result_usuario);
    $resultado = mysqli_fetch_assoc($resultado_usuario);
    //Encontrado um usuario na tabela usuário com os mesmos dados digitado no formulário
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
    //Não foi encontrado um usuario na tabela usuário com os mesmos dados digitado no formulário
    //redireciona o usuario para a página de login
    }else{ 
      //Váriavel global recebendo a mensagem de erro
      $_SESSION['loginErro'] = "Usuário ou senha Inválido";
      header("Location: Login.html");
    }
    //O campo usuário e senha não preenchido entra no else e redireciona o usuário para a página de login
  }else{
    $_SESSION['loginErro'] = "Usuário ou senha inválido";
    header("Location: Login.html");
  }
  ?>