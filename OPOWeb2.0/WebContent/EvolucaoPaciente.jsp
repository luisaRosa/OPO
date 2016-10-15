
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="conexao"
	class="br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao" scope="session" />
<jsp:useBean id="usuarioLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.UsuarioLogic"
	scope="session" />
<jsp:useBean id="usuario"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="session" />
<jsp:useBean id="pacienteLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.PacienteLogic"
	scope="session" />
<jsp:useBean id="paciente"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Paciente"
	scope="session" />
<jsp:useBean id="evolucaoLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.EvolucaoPacienteLogic"
	scope="page" />
<jsp:useBean id="evolucaopaciente"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.EvolucaoPaciente"
	scope="page" />
<!DOCTYPE html >
<html>

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
<link href="./resources/css/menu.css" rel="stylesheet" type="text/css" media="all" />

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
			<div >
				<ul>
						<li><a  href="index.jsp">Início</a></li>
					
					<li class="active dropdown">
	    				<a class="dropbtn">Notificação</a>
	    				<div  class="dropdown-content">
	    				<div id="item">
	      					<a  href="CadastroNotificacao.jsp" id="item">Cadastro de Notificação</a>
	      				</div>	
	      				<div id="item">
	      					<a href="visualizar.jsp" >Acompanhamento</a>
	      				</div>	
	    				</div>
  				    </li>

					<%
					 SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
						if (usuario.getCpf().equalsIgnoreCase("admin")) {
					%>
							<li class="active dropdown">
					    		<a  class="dropbtn">Usuário</a>
					    			<div  class="dropdown-content">
					      				<a  id = "item" href="CadastroUsuario.jsp">Cadastro de Usuário</a>
					      				<a href="#">Gerenciamento de Usuário</a>
										
					    			</div>
					  		</li>
					<%
						}
					%>
					
					
					
					<li><a href="login.jsp">Logout</a></li>
					
					<div align="right"><label for="user" style="color:white;">&nbsp&nbsp Você está logado como: <%=usuarioLogic.getUsuario(usuario.getCpf()).getNome() %></label></div>
					
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
				<h3>Cadastrando Evolução</h3>
			
				
				<% 
					evolucaoLogic.setConexao(conexao);
					pacienteLogic.setConexao(conexao);
				 final String a ;
				 
				if(  request.getParameter("n")!=null){
					System.out.println(request.getParameter("n"));
					
					paciente = pacienteLogic.getPaciente(request.getParameter("n"));
					
							
				}
				if(request.getParameter("confirmar")!=null){
					paciente = pacienteLogic.getPaciente(request.getParameter("paciente"));
					
					if(request.getParameter("evolucaoPaciente").equalsIgnoreCase("")){%>
					
					<script type="text/javascript">
		         alert("Preencha o campo de evolução do paciente");
		     		 </script>
		     	<%} 	
		     	else{ 
			
					
					evolucaopaciente.setUsuarioSistemaCPF(usuario);
					evolucaopaciente.setPaciente(paciente);
					evolucaopaciente.setEvolucaoPaciente(request.getParameter("evolucaoPaciente"));
					evolucaopaciente.setDataEvolucao(dataFormat.format(new Date(System.currentTimeMillis())));
					
					GregorianCalendar calendar = new GregorianCalendar();
			  		int hora = calendar.get(Calendar.HOUR_OF_DAY );
			  		int minutos = calendar.get(Calendar.MINUTE);
			  		String horario =  String.valueOf(hora)+":"+ String.valueOf(minutos);
			  		if(minutos < 10)
			  			horario = String.valueOf(hora)+":0"+ String.valueOf(minutos);
			  		
					evolucaopaciente.setHoraEvolucao(horario);
					evolucaoLogic.addEvolucaoPaciente(evolucaopaciente);
					%>
					
					
					<script type="text/javascript">
			         alert("Evolução salva com sucesso!");
			     		 </script>
			     		 
			     		
					
						
					<% }
				
				
					
				
				} 
				
				
				if(request.getParameter("cancelar")!=null){%>
				
						<jsp:forward page="visualizar.jsp"></jsp:forward>
					
				<%}
			 %>



			</div>
			<form action="EvolucaoPaciente.jsp" method="post">
			<fieldset>
			<table>
			<legend>Evolução do Paciente</legend>
			<br>
			<p>Paciente: <input type="text" name="paciente" size="30" value="<%=paciente.getNome()  %>" readonly="readonly"/></p>
			<p><textarea style="text-align: justify" name="evolucaoPaciente" placeholder="Evolução do Paciente"
				rows="2" cols="90"></textarea></p>
			</table>
			</fieldset>	
			<br> <input type="submit" value="Confirmar" name="confirmar" class="buttonmenor">
				<input type="submit" value="Cancelar" class="buttonmenor" name="cancelar">
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
