<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.GeraPdfEvolucao"%>
<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.GeraPdfEvolucao"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page
	import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.EvolucaoPaciente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="conexao"
	class="br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao" scope="session" />
<jsp:useBean id="usuario"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="session" />
<jsp:useBean id="usuarioLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.UsuarioLogic"
	scope="session" />
<jsp:useBean id="pacienteLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.PacienteLogic"
	scope="session" />
<jsp:useBean id="paciente"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Paciente"
	scope="session" />
<jsp:useBean id="notificacao"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Notificacao"
	scope="session" />
<jsp:useBean id="evolucaoPaciente"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.EvolucaoPaciente"
	scope="page" />
<jsp:useBean id="evolucaoPacienteLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.EvolucaoPacienteLogic"
	scope="page" />


<!DOCTYPE html >

<html >


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" media="all"
	href="./resources/css/default1.css " />
	<link rel="stylesheet" type="text/css" media="all"
	href="/WebContent/css/fonts.css " />
	
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
					<li><a href="index.jsp">Início</a></li>
					
					<li class="active dropdown">
	    				<a class="dropbtn">Notificação</a>
	    				<div class="dropdown-content">
	      					<a href="CadastroNotificacao.jsp">Cadastro de Notificação</a>
	      					<a href="visualizar.jsp">Acompanhamento</a>
	    				</div>
  				    </li>

				<%	
					DateFormat data = new SimpleDateFormat("dd/MM/yyyy");
					DateFormat data1 = new SimpleDateFormat("yyyy-MM-dd");
					pacienteLogic.setConexao(conexao);
					
  					try{  
  					    
  						if (usuario.getCpf().equalsIgnoreCase("admin")) { %>
  					
  				
  					
					<li class="dropdown">
	    				<a href="#" class="dropbtn">Usuário</a>
	    				<div class="dropdown-content">
	      					<a href="CadastroUsuario.jsp">Cadastro de Usuário</a>
	      					<a href="#">Gerenciamento de Usuário</a>
							
	    				</div>
	  				</li>
  				<%       }else{%>
  				
					<li class="dropdown">
    				<a href="#" class="dropbtn">Usuário</a>
    				<div class="dropdown-content">
      					<a href="RedefinirSenha.jsp">Alterar senha</a>
      					
						
    				</div>
  				</li>
					
			<%	}
  						
  						%>
  	  					
  	  					<li class=" dropdown">
  						<a href="#" class="dropbtn">Atividades</a>
  						<div class="dropdown-content">
  								<% if (!(usuario.getCpf().equalsIgnoreCase("admin"))){ %>
  		      						<a href="CadastroAtividades.jsp">Cadastro de Atividades</a>
  		      					<%} %>
  		      					<a href="VisualizarAtividades.jsp">Acompanhamento de Atividades</a>      					
  								
  		    				</div>
  					
  	  				<%
  					}catch (NullPointerException npe){%>	
  						<jsp:forward page="login.jsp"></jsp:forward>
  				<%   }
  				%>
					

					<li><a href="login.jsp">Logout</a></li>
							
					<div align="right">
					<label for="user" style="color: white;">&nbsp&nbsp Você
						está logado como: <%=usuarioLogic.getUsuario(usuario.getCpf()).getNome()%></label>
				    </div>		
				</ul>
			</div>
		</div>
	</div>
	<div class="wrapper">
		<div id="welcome" class="container">
			<div class="title">
			<br><br><br>
				<h3>Detalhando Notificação</h3>
			</div>

			<%
				pacienteLogic.setConexao(conexao);
				evolucaoPacienteLogic.setConexao(conexao);
				if (request.getParameter("n") != null) {
					paciente = pacienteLogic.getPaciente(request.getParameter("n"));
				}
				
				if(request.getParameter("gerar")!= null){
					paciente = pacienteLogic.getPaciente(request.getParameter("nome"));
					
					String corpo = paciente.getNome()+";"+paciente.getIdade()+";"
						+paciente.getHospital().getHospitalNotificador()+ ";"
						+paciente.getNotificacao().getDtNotificacao();
					
					GeraPdfEvolucao geraPdf = new GeraPdfEvolucao();
					geraPdf.geraPdf(corpo,"Evolução "+request.getParameter("nome")+".pdf", conexao);
				}
		
			
			if(request.getParameter("cancelar")!=null){%>
				
							<jsp:forward page="visualizar.jsp"></jsp:forward>
					
				<%}%>


			<form action="EdicaoNotificacao.jsp" method="post">
				<!-- DADOS PESSOAIS-->

				<fieldset>
					<legend>Dados Gerais</legend>

					<table cellspacing="10">
						<tr>
							<td><label for="nome">Nome: </label></td>
							<td align="left"><input type="text" name="nome" size="40"
								value="<%=paciente.getNome()%>" readonly="readonly"></td>
							<td align="left"><label for="idade">Idade: </label></td>
							<td align="left"><input type="text" name="idade" size="4"
								align="right" value="<%=paciente.getIdade()%>"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td><label for="local">Local da internação: </label></td>
							<td align="left"><input type="text" name="local" size="40"
								value="<%=paciente.getHospital().getHospitalNotificador()%>"
								readonly="readonly"></td>
							<td align="left"><label for="data">Data da
									notificação: </label></td>
							<td align="left"><input type="text" name="data" size="10"
								value="<%=data.format(data1.parse(paciente.getNotificacao().getDtNotificacao()))%>"
								readonly="readonly" /></td>
						<tr>
					</table>

					</fieldset>
					

					<br> <br>

					<fieldset>
						<legend>Quadro Clínico</legend>
						<table cellspacing="10">
							<tr>
								<td><label for="pupilas">Pupilas:&nbsp&nbsp&nbsp&nbsp
										<input type="text" name="pupilas" size="30"
										value="<%=paciente.getQuadroClinico().getPupilas()%>"
										readonly="readonly" />
								</label></td>

								<td><label for="sedacao">Sedação:&nbsp&nbsp&nbsp&nbsp
										<input type="text" name="sedacao" size="10"
										value="<%=paciente.getQuadroClinico().getSedado()%>"
										readonly="readonly" />
								</label></td>
								<td><label for="ao"> Pressão Arterial:
										&nbsp&nbsp&nbsp&nbsp <input type="text" name="pressao"
										size="30"
										value="<%=paciente.getQuadroClinico().getPressaoArterial()%>"
										readonly="readonly" />
								</label></td>
							</tr>

							<tr>

								<td><label for="ao"> AO:&nbsp&nbsp&nbsp&nbsp <input
										type="text" name="ao" size="5"
										value="<%=paciente.getQuadroClinico().getEgAo()%>"
										readonly="readonly" /></label></td>
								<td align="left"><label for="mrv">
										MRV:&nbsp&nbsp&nbsp&nbsp <input type="text" name="mrv"
										size="5" value="<%=paciente.getQuadroClinico().getEgMrv()%>"
										readonly="readonly" />
								</label>
								<td><label for="mrm">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										MRM:&nbsp&nbsp&nbsp&nbsp <input type="text" name="mrm"
										size="5" value="<%=paciente.getQuadroClinico().getEgMrm()%>"
										readonly="readonly" />
								</label></td>
								<td>
							</tr>
						</table>
					</fieldset>
					<br> <br>
					<fieldset>

						<legend>Evolução do Paciente</legend>
						<table cellspacing="10">

							<table style="	border-spacing: 5;    border-collapse: collapse;   border: 1px solid black; " align="center">
								<tr style=" border: 1px solid black;">
									<th style=" border: 1px solid black;" style=" border:1px solid black;" width="165" align="center">Autor</th>
									<th style=" border: 1px solid black;"width="100" align="center">Data</th>
									<th style=" border: 1px solid black;"width="100" align="center">Horário</th>
									<th style=" border: 1px solid black;"width="635" align="center">Informação</th>
								</tr>
								<tr style=" border: 1px solid black;">
									<td style=" border: 1px solid black;"><%=paciente.getNotificacao().getUsuario().getNome()%></td>
									<td ><%=data.format(data1.parse(paciente.getNotificacao().getDtNotificacao()))%></td>
									<td style=" border: 1px solid black;"><%=paciente.getNotificacao().getHoraNotificacao()%></td>
									<td style=" border: 1px solid black;"><%=paciente.getQuadroClinico().getInformacoesAdd()%></td>
								</tr>
								<%
									List<EvolucaoPaciente> evolucoes = evolucaoPacienteLogic.getEvolucoes();
									for (EvolucaoPaciente evolucao : evolucoes) {
										if (evolucao.getPaciente().getNome().equals(paciente.getNome())) {
								%>
								<tr style=" border: 1px solid black;">


									<td style=" border: 1px solid black;" ><%=evolucao.getUsuarioSistema().getNome()%></td>
									<td style=" border: 1px solid black;"><%=data.format(data1.parse(evolucao.getDataEvolucao()))%></td>
									<td style=" border: 1px solid black;"><%=evolucao.getHoraEvolucao()%></td>
									<td style=" border: 1px solid black;"><%=evolucao.getEvolucaoPaciente()%></td>

								</tr>

								<%
									}
									}
							
								
										
						
			 %>

									
							</table>
						</table>
					</fieldset>

					<br /> <input type="submit" value="Gerar Pdf" class="buttonmenor"
						name="gerar" />
						<input type="submit" value="Cancelar" class="buttonmenor"
						name="cancelar" />
			</form>


			<p>
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
