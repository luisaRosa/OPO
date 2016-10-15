


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Notificacao"%>
<%@page import="java.util.List"%>
<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Paciente"%>
<jsp:useBean id="conexao" class ="br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao" scope="session" />
<jsp:useBean id="usuario" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="session" />
<jsp:useBean id="usuarioLogic" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.UsuarioLogic" scope="session" />
<jsp:useBean id="pacienteLogic" class ="br.ufac.bsi.ihm.controleDeDoacoes.Logic.PacienteLogic" scope="page" />
<jsp:useBean id="NotificacaoLogic" class ="br.ufac.bsi.ihm.controleDeDoacoes.Logic.NotificacaoLogic" scope="page" />
<jsp:useBean id="hospitalLogic" class ="br.ufac.bsi.ihm.controleDeDoacoes.Logic.HospitalLogic" scope="page" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE >
<html >
<head>

<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/fonts.css " />
<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/default.css " />
<link href="./resources/css/menu.css" rel="stylesheet" type="text/css" media="all" />

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
		<div align="center">
			<ul>
				<li><a  href="index.jsp">Início</a></li>
  				<li class=" active dropdown">
    				<a class="dropbtn">Notificação</a>
    				<div class="dropdown-content">
      					<a href="CadastroNotificacao.jsp">Cadastro de Notificação</a>
      					<a href="visualizar.jsp">Acompanhamento</a>
    				</div>
  				</li>
  				<%
						SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
						if (usuario.getCpf().equalsIgnoreCase("admin")) {
					%>
							<li class="dropdown">
			    				<a href="#" class="dropbtn">Usuário</a>
			    				<div class="dropdown-content">
			      					<a href="CadastroUsuario.jsp">Cadastro de Usuário</a>
			      					<a href="#l">Gerenciamento de Usuário</a>
									
			    				</div>
			  				</li>
			  			<%} %>	
			  			
			  
  				
				<li><a href="login.jsp">Logout</a></li>
				<div align="right">
					<label for="user" style="color: white;" >&nbsp&nbsp Você está logado como: <%=usuarioLogic.getUsuario(usuario.getCpf()).getNome() %></label>
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

 <h3> Acompanhamento de Notificações</h3>


</div>

<% 
	pacienteLogic.setConexao(conexao);	
	hospitalLogic.setConexao(conexao);
	NotificacaoLogic.setConexao(conexao);
	
	

	List <Paciente> pacientes = pacienteLogic.getPacientes();
	
	
%>

<table align='center'>
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
	    <td align="center"><%= paciente.getIdade() %></td>
	    <td align="center"><%= paciente.getHospital().getHospitalNotificador() %></td>
	     <% if (status.equalsIgnoreCase("em aberto")){%>
	    	 	<td align="center"><a href = "Finalizar.jsp?n=<%= paciente.getNome() %>"> Sim </a></td>
	     <%} else{ %>
	     		<td align="center">Finalizado</td>
	     	<%} %>
	   <td align="center"><%= data.format(data1.parse(paciente.getNotificacao().getDtNotificacao())) %></td> 
	    <td align="center"><%= paciente.getNotificacao().getStatus() %></td>
	    <% if(paciente.getNotificacao().getStatus().equalsIgnoreCase("finalizado")) {%>
	    <td align="center"><input type="image" name="adicionar"  src="./resources/images/61685.svg" height="30" width="30" align="center"/></a></td>
	    <%}else {%>
	    	<td align="center"><a href = "EvolucaoPaciente.jsp?n=<%= paciente.getNome()%>"><input type="image" name="adicionar"  src="./resources/images/54901.svg" height="30" width="30" align="center"/></a></td>
	    
	    
	   
	
	<%}	}%>
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

