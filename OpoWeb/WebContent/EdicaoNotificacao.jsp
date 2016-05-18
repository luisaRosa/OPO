<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.ufac.bsi.es1.controleDeDoacoes.Logic.EvolucaoPaciente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="conexao" class ="br.ufac.bsi.es1.controleDeDoacoes.DB.Conexao" scope="session" />
<jsp:useBean id="usuario" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Usuario" scope="session" />
<jsp:useBean id="usuarioLogic" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.UsuarioLogic" scope="session" />
<jsp:useBean id="pacienteLogic" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.PacienteLogic" scope="session" />
<jsp:useBean id="paciente" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Paciente" scope="session" />
<jsp:useBean id="notificacao" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Notificacao" scope="session" />
<jsp:useBean id="evolucaoPaciente" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.EvolucaoPaciente" scope="page"/>
<jsp:useBean id="evolucaoPacienteLogic" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.EvolucaoPacienteLogic" scope="page"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link rel="stylesheet" type="text/css"  media="all" href="/WebContent/css/fonts.css " />
<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/default.css " />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
        	<!--<span class="images/iconesemfundo.png"></span>-->
			<img align="center" src="http://static.tumblr.com/luli647/u6Eo69jad/iconebranco.png" width="63" height="55"/>
			<h1><a href="#">OPO Web</a></h1>
	  </div>
		<div id="menu">
			<ul>
				<li class="active"><li><a href="visualizar.jsp" accesskey="2" title="">Acompanhamento</a></li>
				<li><a href="index.jsp" accesskey="3" title="">Login/Logout</a></li>
				
				<% 
					pacienteLogic.setConexao(conexao);
					if(usuario.getCpf().equalsIgnoreCase("admin")){ %>
						<li><a href="CadastroUsuario.jsp" accesskey="4" title="">Cadastro de Usuário</a></li>
				<%}	%>
				
				<li><a href="CadastroNotificacao.jsp" accesskey="5" title="">Cadastro de notificação</a></li>
			    <label for="user" style="color:white;">&nbsp&nbsp Você está logado como: <%=usuarioLogic.getUsuario(usuario.getCpf()).getNome() %></label>
			</ul>
		</div>
	</div>
</div>
<div class="wrapper">
	<div id="welcome" class="container">	
<div class="title">
	  <h3>Detalhes da Notificação</h3>
	  </div>
	  
	  <%
	  	pacienteLogic.setConexao(conexao);
	    evolucaoPacienteLogic.setConexao(conexao);
	    
	    if(request.getParameter("n")!= null){
	    	paciente = pacienteLogic.getPaciente(request.getParameter("n"));
	    }
	   
	  	
	  	%>
	  
	  
		<form action="EdicaoNotificacao.jsp" method="post">
<!-- DADOS PESSOAIS-->
<fieldset>
 <legend>Quadro Clínico</legend>
 <table cellspacing="10">
  <tr>
   <td>
    <label for="nome">Nome: </label>
   </td>
   <td align="left">
    <input type="text" name="nome" size="40" value="<%=paciente.getNome() %>" readonly="readonly">
   </td>
   <td align="left">
   <label for="idade">Idade: </label>
   </td>
   <td align="left">
   <input type="text" name="idade" size="4" align="right" value="<%= paciente.getIdade() %>" readonly="readonly">
   </td>
   </tr>
   <tr>
   <td>
    <label for="local">Local da internação: </label>
   </td>
   <td align="left">
    <input type="text" name="local" size="40" value="<%= paciente.getHospital().getHospitalNotificador() %>" readonly="readonly">
   </td>
   <td align="left">
   <label for="data">Data da notificação: </label>
   </td>
   <td align="left">
   <input type="text" name="data" size="10" value="<%= paciente.getNotificacao().getDtNotificacao() %>" readonly="readonly"/>
   </td>
   <tr>
   <td>
   <label for="pupilas">Pupilas: </label>
   </td>
   <td align="left">
   <input type="text" name="pupilas" size="30" value="<%= paciente.getQuadroClinico().getPupilas() %>" readonly="readonly"/>
   </td>
   <td>
   <label for="sedacao">Sedação: </label>
   </td>
   <td>
   <input type="text" name="sedacao" size="10" value="<%= paciente.getQuadroClinico().getSedado()%>" readonly="readonly"/> 
   </td>
   </tr>
   <tr>
   <td>
   <label for="ao"> Pressão Arterial: </label>
   </td>
   <td align="left">
   <input type="text" name="pressao" size="30" value="<%= paciente.getQuadroClinico().getPressaoArterial()%>" readonly="readonly"/>
   </td>
   <td>
   
   </td>
   </tr>
   <tr>
   
   <td><label for="ao"> AO: <input type="text" name="ao" size="5"  value="<%= paciente.getQuadroClinico().getEgAo()%>" readonly="readonly"/></label></td>
  <td><label for="mrv">  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp MRV: <input type="text" name="mrv" size="5" value="<%= paciente.getQuadroClinico().getEgMrv()%>" readonly="readonly" /> </label> <td>
	<label for="mrm"> MRM: <input type="text" name="mrm" size="5"   value="<%= paciente.getQuadroClinico().getEgMrm()%>" readonly="readonly"/></label></td><td>
		   
		   	 
		   

	
   </tr>
 </table>
</fieldset>
<br>
<br>
<fieldset>

<legend>Evolução do Paciente</legend>
 <table cellspacing="10" >
 
 <table border="1" align="center">
  <tr>
    <th width="200" align="center">Autor</th>
    <th width="200" align="center">Data</th>
    <th width="600" align="center">Informação</th>
  </tr>
  <tr>
    <td><%= paciente.getNotificacao().getUsuario().getNome() %></td>
    <td><%= paciente.getNotificacao().getDtNotificacao() %></td>
    <td><%= paciente.getQuadroClinico().getInformacoesAdd() %></td>
     </tr>
    <% List<EvolucaoPaciente> evolucoes = evolucaoPacienteLogic.getEvolucoes();
    	for(EvolucaoPaciente evolucao: evolucoes){
    		if(evolucao.getPaciente().getNome().equals(paciente.getNome())){%>
    		<tr>
    		
    		
    			<td><%= evolucao.getUsuarioSistema().getNome() %></td>
    			<td><%= evolucao.getDataEvolucao() %></td>
    			<td><%= evolucao.getEvolucaoPaciente() %></td>
    			
    		</tr>
    		
    		<%} 
    		}%>
  
	
</table>
</table>
</fieldset>

<br />





</form>

		
		<p>
	</div>
</div>
<div id="copyright">
	<p>&copy; OPO Web. L.A.G. Todos os direitos reservados. | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
	
</div>
</body>
</html>
