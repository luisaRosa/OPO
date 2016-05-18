
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="conexao"
	class="br.ufac.bsi.es1.controleDeDoacoes.DB.Conexao" scope="session" />
<jsp:useBean id="usuarioLogic"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.UsuarioLogic"
	scope="session" />
<jsp:useBean id="usuario"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Usuario" scope="session" />
<jsp:useBean id="pacienteLogic"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.PacienteLogic"
	scope="session" />
<jsp:useBean id="paciente"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Paciente"
	scope="session" />
<jsp:useBean id="evolucaoLogic"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.EvolucaoPacienteLogic"
	scope="page" />
<jsp:useBean id="evolucaopaciente"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.EvolucaoPaciente"
	scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html xmlns="http://www.w3.org/1999/xhtml">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" media="all"
	href="/WebContent/css/fonts.css " />
<link rel="stylesheet" type="text/css" media="all"
	href="./resources/css/default.css " />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
	rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<!--<span class="images/iconesemfundo.png"></span>-->
				<img align="center"
					src="http://static.tumblr.com/luli647/u6Eo69jad/iconebranco.png"
					width="63" height="55" />
				<h1>
					<a href="#">OPO Web</a>
				</h1>
			</div>
			<div id="menu">
				<ul>
					<li class="active">
					<li><a href="visualizar.jsp" accesskey="2" title="">Acompanhamento</a></li>
					<li><a href="index.jsp" accesskey="3" title="">Login/Logout</a></li>

					<%
					 SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
						if (usuario.getCpf().equalsIgnoreCase("admin")) {
					%>
					<li><a href="CadastroUsuario.jsp" accesskey="4" title="">Cadastro
							de Usuário</a></li>
					<%
						}
					%>
					<li><a href="CadastroNotificacao.jsp" accesskey="5" title="">Cadastro
							de notificação</a></li>
					<label for="user" style="color:white;">&nbsp&nbsp Você está logado como: <%=usuarioLogic.getUsuario(usuario.getCpf()).getNome() %></label>
				</ul>
			</div>
		</div>
	</div>
	<div class="wrapper">
		<div id="welcome" class="container">
			<div class="title">
				<h3>Cadastrar Evolução</h3>
				
				<% evolucaoLogic.setConexao(conexao);
				 final String a ;
				 
				if(  request.getParameter("n")!=null){
					System.out.println(request.getParameter("n"));
					
					paciente = pacienteLogic.getPaciente(request.getParameter("n"));
					
							
				}
				if(request.getParameter("salvar")!=null){
					paciente = pacienteLogic.getPaciente(request.getParameter("paciente"));
					evolucaopaciente.setUsuarioSistemaCPF(usuario);
					evolucaopaciente.setPaciente(paciente);
					evolucaopaciente.setEvolucaoPaciente(request.getParameter("evolucaoPaciente"));
					evolucaopaciente.setDataEvolucao(dataFormat.format(new Date(System.currentTimeMillis())));
					evolucaoLogic.addEvolucaoPaciente(evolucaopaciente);
				
				%>
					<script type="text/javascript">
			         alert("Evolução salva com sucesso!");
			     		 </script>
				
				<%} %>



			</div>
			<form action="EvolucaoPaciente.jsp" method="post">
			<fieldset>
			<table>
			<legend>Evolução do Paciente</legend>
			<br>
			<p>Paciente: <input type="text" name="paciente" size="30" value="<%=paciente.getNome()  %>" readonly="readonly"/></p>
			<p><textarea style="text-align: justify" name="evolucaoPaciente"
				rows="2" cols="90"></textarea></p>
			</table>
			</fieldset>	
			<br> <br> <input type="submit" name="salvar" value="Salvar"
				align="center" width="25"  class="button"/> <br />
		</form>

		</div>
		
	</div>
	<div id="copyright">
		<p>
			&copy; OPO Web. L.A.G. Todos os direitos reservados. | Design by <a
				href="http://templated.co" rel="nofollow">TEMPLATED</a>.
		</p>

	</div>
</body>
</html>
