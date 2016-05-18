


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="br.ufac.bsi.es1.controleDeDoacoes.Logic.Notificacao"%>
<%@page import="java.util.List"%>
<%@page import="br.ufac.bsi.es1.controleDeDoacoes.Logic.Paciente"%>
<jsp:useBean id="conexao" class ="br.ufac.bsi.es1.controleDeDoacoes.DB.Conexao" scope="session" />
<jsp:useBean id="usuario" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Usuario" scope="session" />
<jsp:useBean id="usuarioLogic" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.UsuarioLogic" scope="session" />
<jsp:useBean id="pacienteLogic" class ="br.ufac.bsi.es1.controleDeDoacoes.Logic.PacienteLogic" scope="page" />
<jsp:useBean id="NotificacaoLogic" class ="br.ufac.bsi.es1.controleDeDoacoes.Logic.NotificacaoLogic" scope="page" />
<jsp:useBean id="hospitalLogic" class ="br.ufac.bsi.es1.controleDeDoacoes.Logic.HospitalLogic" scope="page" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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

<div id="header-wrapper">

	<div id="header" class="container">
		<div id="logo">
        	<!--<span class="images/iconesemfundo.png"></span>-->
			<img align="center" src="http://static.tumblr.com/luli647/u6Eo69jad/iconebranco.png" width="63" height="55"/>
			<h1><a href="#">OPO Web</a></h1>
			<%
			
			%>
			
	  </div>
		<div id="menu">
			<ul>
				<li class="active"><a href="visualizar.jsp" accesskey="2" title="">Acompanhamento</a></li>
				<li><a href="index.jsp" accesskey="3" title="">Login/Logout</a></li>
				
					
				<% if(usuario.getCpf().equalsIgnoreCase("admin")){ %>
					<li><a href="CadastroUsuario.jsp" accesskey="4" title="">Cadastro de Usuário</a></li>
				<%}	%>	
				
					<li><a href = "CadastroNotificacao.jsp" accesskey="5" title="">Cadastro de Notificação</a></li>
					<label for="user" style="color:white;">&nbsp&nbsp Você está logado como: <%=usuarioLogic.getUsuario(usuario.getCpf()).getNome() %></label>
			</ul>
		</div>
	</div>
</div>   

<div class="wrapper">

<div id="welcome" class="container">	
	<div class="title">

<!-- <h1> Controle de notificações</h1>

<h2>Listagem de notificações</h2>-->

<% 
	pacienteLogic.setConexao(conexao);	
	hospitalLogic.setConexao(conexao);
	NotificacaoLogic.setConexao(conexao);
	
	

	List <Paciente> pacientes = pacienteLogic.getPacientes();
	
	
%>

<table class="table ls-table" border="1"  align='center'>
<thead>
	<tr><th class="txt-center" >Nome do Paciente</th><th>Idade</th><th>Local</th><th>Finalizar</th><th>Data</th>
	<th>Estado</th><th>EvoluirPaciente</th>
	<%
	DateFormat data = new SimpleDateFormat("dd/MM/yyyy");
	DateFormat data1 = new SimpleDateFormat("yyyy-MM-dd");
		for(Paciente paciente: pacientes){
			
		String status = paciente.getNotificacao().getStatus();
		
		
			
	%>

	<tr><td><a href = "EdicaoNotificacao.jsp?n=<%= paciente.getNome()%>"><%=paciente.getNome() %></a></td>
	    <td><%= paciente.getIdade() %></td>
	    <td><%= paciente.getHospital().getHospitalNotificador() %></td>
	     <% if (status.equalsIgnoreCase("em aberto")){%>
	    	 	<td><a href = "Finalizar.jsp?n=<%= paciente.getNome() %>"> Sim </a></td>
	     <%} else{ %>
	     		<td>Finalizado</td>
	     	<%} %>
	   <td><%= data.format(data1.parse(paciente.getNotificacao().getDtNotificacao())) %></td> 
	    <td><%= paciente.getNotificacao().getStatus() %></td>
	    <td><a href = "EvolucaoPaciente.jsp?n=<%= paciente.getNome()%>"><input type="image" name="adicionar"  src="https://image.freepik.com/icones-gratis/sinal-de-mais-em-um-circulo_318-53198.png" height="30" width="30" align="center"/></a></td>
	    
	    
	   
	
	<%	}%>
	</tr>
</thead>
</table>
</div>
</div>
</div>
<div id="copyright">
	<p>&copy; OPO Web. L.A.G. Todos os direitos reservados. | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
</div>
</body>
</html>

