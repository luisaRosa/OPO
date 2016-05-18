<%@page import="br.ufac.bsi.es1.controleDeDoacoes.Logic.Hospital"%>
<%@page import="java.util.List"%>
<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javafx.scene.input.DataFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="br.ufac.bsi.es1.controleDeDoacoes.Logic.Notificacao"%>
<%@page
	import="br.ufac.bsi.es1.controleDeDoacoes.Logic.QuadroClinicoLogic"%>


<jsp:useBean id="conexao"
	class="br.ufac.bsi.es1.controleDeDoacoes.DB.Conexao" scope="session" />
<jsp:useBean id="usuarioLogic"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.UsuarioLogic"
	scope="session" />
<jsp:useBean id="usuario"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Usuario" scope="session" />
<jsp:useBean id="notificacaoLogic"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.NotificacaoLogic"
	scope="page" />
<jsp:useBean id="pacienteLogic"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.PacienteLogic"
	scope="page" />
<jsp:useBean id="paciente"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Paciente" scope="page" />
<jsp:useBean id="hospital"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Hospital" scope="page" />
<jsp:useBean id="hospitalLogic"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.HospitalLogic"
	scope="page" />
<jsp:useBean id="quadroclinico"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.QuadroClinico"
	scope="page" />
<jsp:useBean id="quadroClinicoLogic"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.QuadroClinicoLogic"
	scope="page" />
<jsp:useBean id="notificacao"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Notificacao"
	scope="page" />
<jsp:useBean id="endereco"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Endereco" scope="page" />
<jsp:useBean id="enderecoLogic"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.EnderecoLogic"
	scope="page" />
<jsp:useBean id="causaMorte"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.CausaMorte" scope="page" />
<jsp:useBean id="causaMorteLogic"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.CausaMorteLogic"
	scope="page" />
<jsp:useBean id="motivoNaoDoacaoLogic"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.MotivoNaoDoacaoLogic"
	scope="page" />
<jsp:useBean id="motivoNaoDoacao"
	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.MotivoNaoDoacao"
	scope="page" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" media="all"
	href="/WebContent/css/fonts.css " />
<link rel="stylesheet" type="text/css" media="all"
	href="./resources/css/default.css " />


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
					<li >
					<li><a href="visualizar.jsp" accesskey="2" title="">Acompanhamento</a></li>
					<li><a href="index.jsp" accesskey="3" title="">Login/Logout</a></li>
					<%
						SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd"); 
						if(usuario.getCpf().equalsIgnoreCase("admin")){
					%>
						<li><a href="CadastroUsuario.jsp" accesskey="4" title="">Cadastro
							de Usuário</a></li>
					<%
					}	
					%>
					<li class="active"><a href="CadastroNotificacao.jsp" accesskey="5" title="">Cadastro de
							notificação</a></li>
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
			
			
			<% 
			
			hospitalLogic.setConexao(conexao);
			enderecoLogic.setConexao(conexao);
			causaMorteLogic.setConexao(conexao);
			motivoNaoDoacaoLogic.setConexao(conexao);
			quadroClinicoLogic.setConexao(conexao);
			notificacaoLogic.setConexao(conexao);
			pacienteLogic.setConexao(conexao);
			
			List<String> dados = new ArrayList<String>();
			String a = null;
			String dad[] = null;
			
				if(request.getParameter("carregar")!= null){
					
					 try {
						    BufferedReader in = new BufferedReader(new FileReader("C:/Users/Luisa/Downloads/"+request.getParameter("arquivo")));
						    String str;
						    
						    
						    if((str = in.readLine()) != null){
						    	 a = str;
						    	dad = a.split(";");
						    	
						    	
						       
						    }
						    in.close();
						  } 
						  catch(IOException e){
						    out.println(e);
						  }
					}
				
				
	
				
			%>

			<%
			
			
			
			
			
				
				
			%>
			<%if (request.getParameter("cadastrar") != null) {%>
			
			
			
			<jsp:setProperty name="quadroclinico" property="pupilas"/>
			<jsp:setProperty name="quadroclinico" property="egAo"/>
			<jsp:setProperty name="quadroclinico" property="egMrv"/>
			<jsp:setProperty name="quadroclinico" property="egMrm"/>
			<jsp:setProperty name="quadroclinico" property="sedado"/>
			<jsp:setProperty name="quadroclinico" property="informacoesAdd"/>
			<% 
				quadroclinico.setPressaoArterial(request.getParameter("pressaoArterial")+"/"+request.getParameter("sias"));
				quadroClinicoLogic.addQuadroClinico(quadroclinico);
			
				notificacao.setStatus("em aberto");
				notificacao.setUsuario(usuario);
				notificacao.setDtNotificacao(dataFormat.format(new Date(System.currentTimeMillis())));
				System.out.println(new Date(System.currentTimeMillis()));
				notificacaoLogic.addNotificacao(notificacao);
				
				
			%>
			
			<%  
				
				
				endereco = enderecoLogic.getEndereco(1);
				causaMorte = causaMorteLogic.getCausaMorte(1);
				motivoNaoDoacao = motivoNaoDoacaoLogic.getMotivo(1);
				
			%>
			<jsp:setProperty name="paciente" property="nome"/>
			<jsp:setProperty name="paciente" property="idade"/>
			<% paciente.setCausaMorte(causaMorte);
			   paciente.setEndereco(endereco);
			   paciente.setmNaoDoacao(motivoNaoDoacao);
			   System.out.println(request.getParameter("hospitalNotificador"));
			   
			  hospital = hospitalLogic.getHospital(Integer.parseInt(request.getParameter("hospitalNotificador")));
			   paciente.setHospital(hospital);
			   
			  int id = quadroClinicoLogic.recuperaId();
			   paciente.setQuadroClinico(quadroClinicoLogic.getQuadroClinico(id));
			   System.out.println(id);
			   
			   
			   id = notificacaoLogic.recuperaId();
			   System.out.println(id);
			   paciente.setNotificacao(notificacaoLogic.getNotificacao(id));
			   
			   pacienteLogic.addPaciente(paciente);
			  
			  %>
			  
			   <script type="text/javascript">
		         alert("Notificação cadastrada com sucesso!");
		     		 </script>
			   
		 <%} %>
			<form action="CadastroNotificacao.jsp" method="post">
			<div align="center"><div align="center"><label for="cararq" >Carregue o formulário usando um arquivo:
				<input type="file" name="arquivo" >
				<input type="submit" name="carregar" value="Carregar" size="40" class="button" >
			</label></div> <br> <br></div>
			
			

				<!-- DADOS PESSOAIS-->
				<fieldset>
					<legend>Dados Pessoais</legend>
					<table cellspacing="10">
					
						<tr>
							<td><label for="nome">Nome: </label></td>
							<td align="left"><input type="text" name="nome" size="63"<%if (a != null){ %> value="<%= dad[0] %>"<%} %> >
							</td>
							<td><label for="idade">Idade: </label></td>
							<td align="left"><input type="text" name="idade" size="20"<%if (a != null){ %> value="<%= dad[1] %>"<%} %>>
							</td>
						</tr>
						<tr>
							<td><label for="hospital"> Hospital: </label></td>
							<td align="left">
							<select  name="hospitalNotificador">
								<%		
										List<Hospital>hospitais = hospitalLogic.getHospitais();
										for(Hospital hospital1 : hospitais){
											
											if(a != null && hospital1.getHospitalNotificador().equalsIgnoreCase(dad[2])){
												
												System.out.println(" id hospital = "+hospital1.getId());
												
								%>
												<option value="<%=hospital1.getId() %>" selected = "selected"> <%=hospital1.getHospitalNotificador() %></option>
								<%		
											}else{
								%>
												<option value="<%=hospital1.getId() %>"> <%=hospital1.getHospitalNotificador()%></option>
								
								<%
										}
									}
								%>
										
						 </select>
  								</td>
						</tr>
					</table>
				</fieldset>

				<br />
				<!-- Quadro Clínico -->
				<fieldset>
					<legend>Quadro clínico</legend>
					<table cellpadding="10" cellspacing="10">
						<tr>
							<td><label for="pupilas">
									<div align="right">Pupilas:</div>
							</label></td>
							<td align="right" width="20"><input type="text"
								name="pupilas" size="20" <%if (a != null){ %> value="<%= dad[3] %>"<%} %>/></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label>
									<div align="right">Escala de Gasglow:</div>
							</label></td>
							<td width="20" align="right"><label for="ao">
									<div align="right">AO:</div>
							</label> <select name="egAo">
							
							
							<% for (int i=1; i<5;i++) {
								
								if (a != null) { %>
										<option value="<%=dad[4]%>"selected="selected"><%=dad[4]%></option>
								<%} 
								else{%>
									<option value="<%= i %>"><%= i %></option>
								<%	}}
								%>
							</select></td>
							<td align="center" width="50"><label for="mrv">MRV:
							</label> <select name="egMrv">
							
							<% for (int i=1; i<5;i++) {
								
								if (a != null) { %>
										<option value="<%=dad[5]%>"selected="selected"><%=dad[5]%></option>
								<%} 
								else{%>
									<option value="<%= i %>"><%= i %></option>
								<%	}}
								%>
									
									
							</select></td>
							<td align="right" width="50"><label for="mrm">MRM: </label>
								<select name="egMrm">
									<% for (int i=1; i<5;i++) {%>
							
							<%if (a != null) { %>
									<option value="<%=dad[6]%>"selected="selected"><%=dad[6]%></option>
							<%} 
							else{%>
								<option value="<%= i %>"><%= i %></option>
							<%	}
							}%>
							</select></td>
						</tr>
						<tr>
							<td><label for="pressaoa">
									<div align="right">Pressão Arterial:</div>
							</label></td>
							<td align="right" width="50"><select name="pressaoArterial">
							
							<% for (int i=50; i<160;i = i+10) {
								
								if (a != null) { %>
										<option value="<%=dad[7]%>"selected="selected"><%=dad[7]%></option>
								<%} 
								else{%>
									<option value="<%= i %>"><%= i %></option>
								<%	}}
								%>
									
							</select></td>
							
							<td align="left"><select name="sias">
							<% for (int i=50; i<160;i = i+10) {
								
								if (a != null) { %>
										<option value="<%=dad[8]%>"selected="selected"><%=dad[8]%></option>
								<%} 
								else{%>
									<option value="<%= i %>"><%= i %></option>
								<%	}}
								%>
									
							</select></td>
						</tr>
						<tr>
							<td><label for="sedacao">
									<div align="right">Sedação:</div>
							</label></td>
							<td align="center" width="50"><input type="radio"
								name="sedado" value="sim" align="left" <% if(a != null && dad[9].equalsIgnoreCase("sim")){ %> checked="checked" <%} %>/> Sim <input
								type="radio" name="sedado" value="nao" align="left" <% if(a != null &&dad[9].equalsIgnoreCase("não")){ %> checked="checked" <%}%>/> Não</td>
						</tr>
						
					</table>
				</fieldset>
				<br />
				<!-- DADOS DE LOGIN -->
				<fieldset>
					<legend>Informações Adicionais</legend>
					<table>
						<tr>
							<textarea  name="informacoesAdd" ><%if (a != null){%><%=dad[10]%><%} %></textarea>
			
						</tr>
					</table>
				</fieldset>
				<br />
				<input type="submit" value="Cadastrar Notificação" name="cadastrar" class="button1">
					<input type="reset" value="Limpar" class="button">
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
