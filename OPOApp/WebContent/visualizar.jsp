


<%@page import="br.ufac.es1.controleDeDoacoes.Logic.Notificacao"%>
<%@page import="java.util.List"%>
<%@page import="br.ufac.es1.controleDeDoacoes.Logic.Paciente"%>
<jsp:useBean id="conexao" class ="br.ufac.es1.controleDeDoacoes.DB.Conexao" scope="session" />
<jsp:useBean id="pacienteLogic" class ="br.ufac.es1.controleDeDoacoes.Logic.PacienteLogic" scope="page" />
<jsp:useBean id="NotificacaoLogic" class ="br.ufac.es1.controleDeDoacoes.Logic.NotificacaoLogic" scope="page" />
<jsp:useBean id="hospitalLogic" class ="br.ufac.es1.controleDeDoacoes.Logic.HospitalLogic" scope="page" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div class="wrapper">
<h1> Controle de notificações</h1>

<h2>Listagem de notificações</h2>
<% 
	hospitalLogic.setConexao(conexao);
	pacienteLogic.setConexao(conexao);
	NotificacaoLogic.setConexao(conexao);
	
	

	List <Paciente> pacientes = pacienteLogic.getPacientes();
	List <Notificacao> notificacoes = NotificacaoLogic.getNotificacoes();
	
%>

<table border="1">
	<tr><th>Nome do Paciente</th><th>Idade</th><th>Local</th><th>Finalizar</th><th>Data</th><th>Estado</th>
	<%
		for(Paciente paciente: pacientes){
			
				
			
	%>

	<tr><td><%= paciente.getNome() %></td>
	    <td><%= paciente.getIdade() %></td>
	    <td><%= paciente.getHospital().getHospitalNotificador() %>
	    <td> Aberto</td>
	    <%
	    	for(Notificacao notificacao: notificacoes){
	    		
	    		if(notificacao.getPaciente().getNome() == paciente.getNome())
	    	
	    %>
	    <td><% notificacao.getDtNotificacao() ; %>
	     
	 
	</tr>
	<input type ="button" name="botao_Visualizar" value="Visualizar">

	<%	}}%>

</table>

</div>

