<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="conexao" class="br.ufac.bsi.es1.controleDeDoacoes.DB.Conexao"  scope="session" />
<jsp:useBean id="usuarioLogic" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.UsuarioLogic" scope="session" />
<jsp:useBean id="usuario" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Usuario" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link rel="stylesheet" type="text/css"  media="all" href="/WebContent/css/fonts.css " />
<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/default.css " />

</head>
<body>
<%  %>

<div id="header-wrapper">

	<div id="header" class="container">
		<div id="logo">
        	<!--<span class="images/iconesemfundo.png"></span>-->
			<img align="center" src="http://static.tumblr.com/luli647/u6Eo69jad/iconebranco.png" width="63" height="55"/>
			<h1><a href="#">OPO Web</a></h1>
	  </div>
		<div id="menu">
			<ul>
				<li ><li><a href="visualizar.jsp" accesskey="2" title="">Acompanhamento</a></li>
				<li><a href="index.jsp" accesskey="3" title="">Login/Logout</a></li>
				<li class="active"><a href="CadastroUsuario.jsp" accesskey="4" title="">Cadastro de Usuário</a></li>
				<li><a href="CadastroNotificacao.jsp" accesskey="5" title="">Cadastro de Notificação</a></li>
				<label for="user" style="color:white;">&nbsp&nbsp Você está logado como: <%=usuarioLogic.getUsuario(usuario.getCpf()).getNome() %></label>
			</ul>
		</div>
	</div>
</div>
<div class="wrapper">
	<div id="welcome" class="container">	
<div class="title">
	  <!--<h2>Welcome to our website</h2>-->
</div>

	

		<% usuarioLogic.setConexao(conexao);
		
			if (request.getParameter("cadastrar")!= null){%>	
			
				<jsp:setProperty name="usuario" property = "nome" />
				<jsp:setProperty name="usuario" property = "cpf" />
				<jsp:setProperty name="usuario" property = "localTrabalho" />
				<jsp:setProperty name="usuario" property = "funcao" />
				<jsp:setProperty name="usuario" property = "senha" />
				
				<% usuarioLogic.addUsuario(usuario);%>
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
		<input type="submit" value="Cadastrar Usuário" name="cadastrar">
		<input type="reset" value="Limpar">
		</form>
	</div>
</div>
<div id="copyright">
	<p>&copy; OPO Web. L.A.G. Todos os direitos reservados. | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
	
</div>
</body>
</html>