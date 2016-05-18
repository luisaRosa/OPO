


<%@page import="br.ufac.bsi.es1.controleDeDoacoes.Logic.GeraPdf"%>
<%@page import="br.ufac.bsi.es1.controleDeDoacoes.Logic.MotivoNaoDoacao"%>
<%@page import="br.ufac.bsi.es1.controleDeDoacoes.Logic.CausaMorte"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
		 




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<jsp:useBean id="conexao" class="br.ufac.bsi.es1.controleDeDoacoes.DB.Conexao"  scope="session" />
<jsp:useBean id="usuarioLogic" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.UsuarioLogic" scope="session" />
<jsp:useBean id="usuario" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Usuario" scope="session" />
<jsp:useBean id="paciente" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Paciente" scope="page" />
<jsp:useBean id="pacienteLogic" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.PacienteLogic" scope="page" />
<jsp:useBean id="notificacaoLogic" 	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.NotificacaoLogic" scope="page" />
<jsp:useBean id="hospital" 	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Hospital" scope="page" />
<jsp:useBean id="hospitalLogic" 	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.HospitalLogic" scope="page" />
<jsp:useBean id="notificacao" 	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Notificacao" scope="page" />
<jsp:useBean id="endereco" 	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Endereco" scope="page" />
<jsp:useBean id="enderecoLogic" 	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.EnderecoLogic" 	scope="page" />
<jsp:useBean id="causaMorte" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.CausaMorte" scope="page" />
<jsp:useBean id="causaMorteLogic" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.CausaMorteLogic" scope="page" />
<jsp:useBean id="motivoNaoDoacaoLogic" 	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.MotivoNaoDoacaoLogic" scope="page" />
<jsp:useBean id="motivoNaoDoacao" 	class="br.ufac.bsi.es1.controleDeDoacoes.Logic.MotivoNaoDoacao" 	scope="page" />

<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
</head>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" media="all"
	href="/WebContent/css/fonts.css " />
<link rel="stylesheet" type="text/css" media="all"
	href="./resources/css/default.css " />

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
				<li><a href="index.jsp" accesskey="3" title="">Login</a></li>
				
				<%
					 SimpleDateFormat  dataFormat = new SimpleDateFormat("yyyy-MM-dd");
						if (usuario.getCpf().equalsIgnoreCase("admin")) {
					%>
				<li><a href="CadastroUsuario.jsp" accesskey="4" title="">Cadastro de usuário</a></li>
				<%} %>
				<li><a href="CadastroNotificacao.jsp" accesskey="5" title="">Cadastro de notificação</a></li>
				<label for="user" style="color:white;">&nbsp&nbsp Você está logado como: <%=usuarioLogic.getUsuario(usuario.getCpf()).getNome() %></label>
			</ul>
		</div>
	</div>
</div>
<div class="wrapper">
	<div id="welcome" class="container" >	
<div class="title">
	  <h3>Finalizar Processo</h3>
	  </div>
	  
	  <%
	  	  	pacienteLogic.setConexao(conexao);
	  		enderecoLogic.setConexao(conexao);
	  		causaMorteLogic.setConexao(conexao);
	  		motivoNaoDoacaoLogic.setConexao(conexao);
	  		notificacaoLogic.setConexao(conexao);
	  		
	  	  	DateFormat data = new SimpleDateFormat("dd/MM/yyyy");
	  	  	DateFormat data1 = new SimpleDateFormat("yyyy-MM-dd");

	  	  	if (request.getParameter("n") != null) {

	  	  		paciente = pacienteLogic.getPaciente(request.getParameter("n"));
	  	  	}
	  	  	
	  	  	if(request.getParameter("salvar")!= null){
	  	  		
		  	  		paciente = pacienteLogic.getPaciente(request.getParameter("nome"));
		  	  %>
		  	  
		  	  		<jsp:setProperty property="cep" name="endereco"/>
		  	  		<jsp:setProperty property="cidade" name="endereco"/>
		  	  		<jsp:setProperty property="bairro" name="endereco"/>
		  	  		<jsp:setProperty property="rua" name="endereco"/>
		  	  		<jsp:setProperty property="numCasa" name="endereco"/>
		  	  		<jsp:setProperty property="complemento" name="endereco"/>
		  	  		
		  	  
		  	  <% 
		  	 
			  	  	
			  		
			  		enderecoLogic.addEndereco(endereco);
		  	  		int id = enderecoLogic.recuperaId();
		  	  		paciente.setEndereco(enderecoLogic.getEndereco(id));
		  	  		paciente.setNotificacao(notificacaoLogic.getNotificacao(1));
		  	  		pacienteLogic.updPaciente(paciente);
		  	  
		  	 %>
		  			<script type="text/javascript">
	        			 alert("Finalizado com sucesso!")
	     		 </script>
	     		 
	     		 <% 
	     		 
	     		 String titulo = "Finalização da Doação\n \n";
	     		 String corpo = "Dados pessoais \n\n Nome: "+paciente.getNome()+"\n\n Idade: "+paciente.getIdade()+
	     				 "\n\nData de notificação: "+request.getParameter("dnot")+"\n\n"+
	     				 "Causa do Óbito: "+request.getParameter("causa")+"\n\n"+
	     				 "Hospital Notificador: "+request.getParameter("hospitalid")+"\n\n"+
	     				 "Rg-Ct: "+request.getParameter("rgct")+"\n\n"+
	     				 "Endereço: "+request.getParameter("rua")+"\n\n"+
	     				 "Nº: "+request.getParameter("numCasa")+"\n\n"+
	     				 "Complemento: "+request.getParameter("complemento")+"\n\n"+
	     				 "Bairro: "+request.getParameter("bairro")+"\n\n"+
	     				 "Cep: "+request.getParameter("cep")+"\n\n"+
	     				 "Cidade: "+request.getParameter("cidade")+"\n\n"+
	     				 "Data de Nascimento: "+request.getParameter("dnascimento")+"\n\n"+
	     				 "Hospital de Origem: "+ request.getParameter("horigem")+"\n\n"+
	     				 "Data de Internação: "+request.getParameter("dinternacao")+"\n\n"+
	     				 "RG: "+request.getParameter("rg")+"\n\n"+
	     				 "Cpf: "+request.getParameter("cpf")+"\n\n"+
	     				 "Cns:"+request.getParameter("cns")+"\n\n"+
	     				 "Nome da mãe:"+request.getParameter("mae")+"\n\n"+
	     				 "Nome do pai: "+request.getParameter("pai")+"\n\n"+
	     				 "Religião: "+request.getParameter("religiao")+"\n\n+"
	     				 ;
	     		 
	     		 
	     		 
	     		 	GeraPdf geraPdf = new GeraPdf();
	     		 	geraPdf.geraPdf(titulo, corpo,"Relatório.pdf" );
	     		 %>
		  	  
		  	
		  	  
		  
	  	<%} %>  	
			  		
			  	  		
	  	  
	  	  	 	
	  	 
<form action="Finalizar.jsp" method="post">
<!-- DADOS PESSOAIS-->
<fieldset>
 <legend>Dados Identificadores</legend>
 <table cellspacing="10">
  <tr>
   <td>
    <label for="nome">Nome: </label>
   </td>
   <td align="left">
    <input type="text" name="nome" size="40" value="<%= paciente.getNome() %>" readonly="readonly">
       </td>
   <td>
    <label for="idade">Idade: </label>
   </td>
   <td align="left">
    <input type="number" name="idade" value=<%=paciente.getIdade() %> >
   </td>
   </tr>
   <tr>
   <td>
   <label for="dnot">Data de Notificação: </label>
   </td>
   <td align="left">
   <input type="text" name="dnot" value="<%=data.format(data1.parse(paciente.getNotificacao().getDtNotificacao())) %>" readonly="readonly" />
   </td>
  <td>
  <label for="causa">Causa do Óbito: </label>
  </td>
  <td align="left">
  <select  name="causa" >
  <% List<CausaMorte> causas = causaMorteLogic.getCausaMorte();
  
  		for(CausaMorte causa: causas){
  				if(!causa.getCausa().equalsIgnoreCase("nao morreu")){%>
  				<option  value="<%=causa.getCausa() %>"><%=causa.getCausa() %></option>
  				
  		<%}
  		} %>	
  	
  
  </select>
  </td>
  </tr>
  <tr>
  <td>
  <label for="hospitalid"> Hospital Notificador: </label>
  </td>
  <td align="left">
    <input type="text" name="hospitalid" size="40" value="<%=paciente.getHospital().getHospitalNotificador() %>" readonly="readonly" />
    </td>
  <td>
  <label for="rgct"> RG CT: </label>
  </td>
  <td align="left">
  <input type="number" name="rgct" />
  </td>
  </tr>
  <tr>
  <td>
  <label for="endereco"> Rua: </label>
  </td>
  <td align="left">
  <input type="text" name="rua" size="40"/>
  </td>
  <td>
  <label for="num">N° </label>
  </td>
  <td align="left">
  <input type="number" name="numCasa" size="7"/>
  </td>
  </tr>
  <tr>
  <td>
  <label for="complemento">Complemento: </label>  
  </td>
  <td align="left">
  <input type="text" name="complemento" />
  </td>
  <td>
  <label for="bairro"> Bairro: </label>
  </td>
  <td align="left">
  <input type="text" name="bairro" />
  </td>
  </tr>
  <tr>
  <td>
  <label for="cep">CEP: </label>
  </td>
  <td align="left">
  <input type="number" name="cep" />
  </td>
  <td>
  <label for="cidade"> Cidade: </label>
  </td>
  <td align="left">
  <input type="text" name="cidade" />
  </td>
  </tr>
  <tr>
  <td>
  <label for="dnascimento">Data de Nascimento: </label>
  </td>
  <td align="left">
  <input type="text" name="dnascimento" />
  </td>
  <td>
  <label for="horigem"> RH <font size="2">(Hospital de Origem): </font></label>
  </td>
  <td align="left">
  <input type="text" name="horigem" size="40"/>
  </td>
  </tr>
  <tr>
  <td>
  <label for="dinternacao"> Data de Internação: </label>
  </td>
  <td align="left">
  <input type="text" name="dinternacao" />
  </td>
  <td>
  <label for="rg"> RG: </label>
  </td>
  <td align="left">
  <input type="number" name="rg" />
  </td>
  </tr>
  <td>
  <label for="cpf"> CPF: </label>
  </td>
  <td align="left">
  <input type="number" name="cpf" />
  </td>
  <td>
  <label for="cns"> CNS: </label>
  </td>
  <td align="left">
  <input type="number" name="cns" />
  </td>
  </tr>
  <tr>
  <td>
  <label for="mae"> Nome da mãe: </label>
  </td>
  <td align="left">
  <input type="text" name="mae" size="40"/>
  </td>
  <td>
  <label for="pai">Nome do pai: </label>
  </td>
  <td align="left">
  <input type="text" name="pai" size="40"/>
  </td>
  </tr>
  <tr>
  <td>
  <label for="religiao"> Religião: </label>
  </td>
  <td align="left">
  <input type="text" name="religiao" size="40"/>
  </td>
  <td>
  <label for="mencefalica"> Morte Encefálica: </label>
  </td>
  <td align="left">
  <input type="radio" name="sim" />Sim
  <input type="radio" name="nao" />Não
  </td>
  </tr>
  <tr>
  <td>
  <label for="pcr">PCR: </label>
  </td>
  <td align="left">
  <input type="radio" name="sim" />Sim
  <input type="radio" name="nao" />Não
  </td>
  <td>
  <label for="doador"> Doador: </label>
  </td>
  <td align="left">
  <input type="radio" name="doador" value="sim" />Sim
  <input type="radio" name="doador"  value="não"/>Não
  </td>
  </tr>
 </table>
</fieldset>

<br/>
<fieldset>
 <legend>Contatos familiares</legend>
 <table cellspacing="10">
  <tr>
  <td align="left">
  <label for="nome1">Nome: <input type="text" name="nome1"  size="50"/></label>
  </td>
  <td align="left">
  <label for="parentesco1">Parentesco: <input type="text" name="parentesco1"  size="30"/></label>
  </td>
  <td align="left">
  <label for="telefone1">Telefone: <input type="text" name="telefone1" /></label>
  </td>
  </tr>
  <tr>
  <td align="left">
  <label for="nome2">Nome: <input type="text" name="nome2"  size="50"/></label>
  </td>
  <td align="left">
  <label for="parentesco2">Parentesco: <input type="text" name="parentesco2"  size="30"/></label>
  </td>
  <td align="left">
  <label for="telefone2">Telefone: <input type="text" name="telefone2" /></label>
  </td>
  </tr>
 </table>
</fieldset>
<br />
<h3>Se não doador</h3>
<br />
<fieldset>
 <legend>PCR</legend>
 <table cellspacing="10">
   <tr>
     <td align="left"><input type="radio" name="antes" />
       Antes da abordagem</td>
     <td align="left"><input type="radio" name="depois" />
       Depois da abordagem</td>
   </tr>
   <tr>
     <td align="left"><label for="examec">Exame complementar: </label>
     </td>
     <td align="left"><input type="text" name="examec" size="50"/>
     </td>
   </tr>
 </table>
</fieldset>
<br />
<fieldset>
 <legend>Sem condições clínicas</legend>
 <table cellspacing="10">
  <tr>
     <td align="left"><input type="radio" name="motivo" value="infecção"/>
       Infecção</td>
     <td align="left"><input type="radio" name="motivo" value="neoplasia" />
       Neoplasia</td>
	   </tr>
	   <tr>
     <td align="left"><input type="radio" name="motivo" value="co-morbidades"/>
       Co-morbidades</td>
     <td align="left"><input type="radio" name="motivo" value="disfunção múltipla de órgãos"/>
       Disfunção mútiplas órgãos</td>
   </tr>
 </table>
</fieldset>
<br />
<fieldset>
 <legend>Recusa familiar</legend>
 <table cellspacing="10">
   <tr>
     <td align="left"><input type="radio" name="motivo" value="religião" />
       Religião</td>
     <td align="left"><input type="radio" name="motivo" size="100" value="não doador em vida"/>
       Não era doador em vida</td>
     <td align="left"><input type="radio" name="motivo" size="60" value="família não acredita na me"/>
       Familia não acredita em ME</td>
   </tr>
   <tr>
     <td align="left"><input type="radio" name="motivo" value="familia não respondeu" />
       Família não respondeu - PCR</td>
     <td align="left"><input type="radio" name="motivo" value="não especificado"/>
       Não especificado</td>
     <td align="left"><input type="radio" name="outro" />
       Outro <input type="text" name="motivo" size="40"/></td>
   </tr>
 </table>
</fieldset>
<br />
<fieldset>
 <legend>Sorologia positiva</legend>
 <table cellspacing="10">
  <tr>
     <td align="left"><input type="radio" name="motivo" value="hepatite B" />Hepatite B</td>
     <td align="left"><input type="radio" name="motivo" value="chagas"/>Chagas</td>
	 <td align="left"><input type="radio" name="motivo" value="hepatite C" />Hepatite C</td>
   </tr>
   <tr>
   <td align="left"><input type="radio" name="motivo" value="htlv"/>HTLV</td>
   <td align="left"><input type="radio" name="motivo" value="hiv"/>HIV</td>
   <td align="left"><input type="radio" name="motivo" value="sifilis" />Sífilis</td>
   </tr>
 </table>
</fieldset>
<br />
<fieldset>
 <legend>Sem etiologia definida</legend>
 <table cellspacing="10">
  <tr>
     <td align="right"><label for="motivo"><div align="right">Motivo:</div></label></td>
     <td align="left"><input type="text" name="motivo"  size="70"/></td>
   </tr>
 </table>
</fieldset>
<br />
<fieldset>
 <legend>Não preenche diagnóstico de ME</legend>
 <table cellspacing="10">
  <tr>
     <td align="right"><label for="motivo"><div align="right">Motivo:</div></label></td>
     <td align="left"><input type="text" name="motivo"  size="70"/></td>
   </tr>
 </table>
</fieldset>
<br />
<input type="submit" value=" Salvar e Gerar Pdf" class="button1" name="salvar" onclick="div.print()">
<input type="submit" value="Não finalizado" class="button1" name="naoFinalizado">
</form>	
		<p>
	</div>
</div>
<div id="copyright">
	<p>&copy; OPO Web. L.A.G. Todos os direitos reservados. | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
	
</div>
</body>
</html>
