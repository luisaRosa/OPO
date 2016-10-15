<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="conexao" class="br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao"  scope="session" />
<jsp:useBean id="usuarioLogic" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.UsuarioLogic" scope="session" />
<jsp:useBean id="usuario" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="session" />
<jsp:useBean id="usuario1" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link rel="stylesheet" type="text/css"  media="all" href="/WebContent/css/fonts.css " />
<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/default.css " />
<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/menu.css"/>

</head>
<body>

<div id="header-wrapper">

	<div id="header" class="container">
		<div id="logo">
        	<!--<span class="images/iconesemfundo.png"></span>-->
			<img align="center" src="http://static.tumblr.com/luli647/u6Eo69jad/iconebranco.png" width="63" height="55"/>
			<h1><a href="#">OPO Web</a></h1>
	  </div>
		<div>
			<ul>
				<li class="active"><a href="index.jsp">Início</a></li>
  				<li class="dropdown">
    				<a class="dropbtn">Notificação</a>
    				<div class="dropdown-content">
      					<a href="CadastroNotificacao.jsp">Cadastro de Notificação</a>
      					<a href="visualizar.jsp">Acompanhamento</a>
    				</div>
  				</li>
				<li class="dropdown">
	    				<a href="#" class="dropbtn">Usuário</a>
	    				<div class="dropdown-content">
	      					<a href="CadastroUsuario.jsp">Cadastro de Usuário</a>
	      					<a href="EditarUsuario.jsp">Gerenciamento de Usuário</a>
								    				</div>
	  				</li>
				<li><a href="login.jsp">Logout</a></li>
				<div align="right">
					<label for="user" style="color:white;">&nbsp&nbsp Você está logado como: <%=usuarioLogic.getUsuario(usuario.getCpf()).getNome() %></label>
				</div>
			</ul>
		</div>
	</div>
</div>
<div class="wrapper">
	<div id="welcome" class="container">	
<div class="title">
<br>
<br>
<br>

	  <h3>Cadastrando Usuário</h3>
</div>

	

		<% usuarioLogic.setConexao(conexao);
		
			if (request.getParameter("confirmar")!= null){%>	
			
				<jsp:setProperty name="usuario1" property = "nome" />
				<jsp:setProperty name="usuario1" property = "cpf" />
				<jsp:setProperty name="usuario1" property = "localTrabalho" />
				<jsp:setProperty name="usuario1" property = "funcao" />
				<jsp:setProperty name="usuario1" property = "senha" />
				
				<% usuarioLogic.addUsuario(usuario1);%>
				<script type="text/javascript">
		         alert("Usuário cadastrado com sucesso!")
		      </script>
					
			<%}%>
	  
	  
		<form method="post">
				
		
		<!-- Dados pessoais-->
		<fieldset>
		 <legend>Dados Pessoais</legend>
		 <table cellspacing="10">
		  <tr>
		   <td>
		    <label for="nome">Nome: </label>
		   </td>
		   <td align="left">
		    <input type="text" name="nome" size="63">
		   </td>
		   </tr>
		   <tr>
		   <td>
		    <label for="cpf">CPF: <font size="02">(apenas números)</font></label>
		   </td>
		   <td align="left">
		    <input type="text" name="cpf">
		   </td>
		  </tr>
		 </table>
		</fieldset>
		
		<br />
		<!-- Dados profissionais -->
		<fieldset>
		 <legend>Dados Profissionais</legend>
		 <table cellspacing="10">
		
		  <tr>
		   <td>
		    <label for="localTrabalho">Local de trabalho: </label>
		   </td>
		   <td align="left">
		    <input type="text" name="localTrabalho" size="60">
		   </td>
		   </tr>
		   <tr>
		   <td>
		    <label for="funcao">Função: </label>
		   </td>
		   <td align="left">
		    <input type="text" name="funcao" size="60">
		   </td>
		  </tr>
		  
		 </table>
		</fieldset>
		<br/>
		<!-- Dados de login -->
		<fieldset>
		 <legend>Dados de login</legend>
		 <table cellspacing="10">
		  <tr>
		   <td>
		    <label for="pass">Senha: </label>
		   </td>
		   <td align="left">
		    <input type="password" name="senha">
		   </td>
		  </tr>
		  <tr>
		   
		  </tr>
		 </table>
		</fieldset>
		<br />
		<input type="submit" value="Confirmar" name="confirmar" class="button1">
		<input type="submit" value="Cancelar" class="buttonmenor" name="cancelar">
		</form>
	</div>
</div>
<div id="copyright">
	<p>&copy; OPO Web. L.A.G. Todos os direitos reservados. | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
	
</div>
</body>
</html>