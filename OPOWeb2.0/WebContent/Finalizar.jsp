


<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.GeraPdfFinalizar"%>
<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.GeraPdfFinalizar"%>
<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.MotivoNaoDoacao"%>
<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.CausaMorte"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<jsp:useBean id="conexao"
	class="br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao" scope="session" />
<jsp:useBean id="usuarioLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.UsuarioLogic"
	scope="session" />
<jsp:useBean id="usuario"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="session" />
<jsp:useBean id="paciente"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Paciente" scope="page" />
<jsp:useBean id="pacienteLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.PacienteLogic"
	scope="page" />
<jsp:useBean id="notificacaoLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.NotificacaoLogic"
	scope="page" />
<jsp:useBean id="hospital"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Hospital" scope="page" />
<jsp:useBean id="hospitalLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.HospitalLogic"
	scope="page" />
<jsp:useBean id="notificacao"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Notificacao"
	scope="page" />
<jsp:useBean id="endereco"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Endereco" scope="page" />
<jsp:useBean id="enderecoLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.EnderecoLogic"
	scope="page" />
<jsp:useBean id="causaMorte"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.CausaMorte" scope="page" />
<jsp:useBean id="causaMorteLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.CausaMorteLogic"
	scope="page" />
<jsp:useBean id="motivoNaoDoacaoLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.MotivoNaoDoacaoLogic"
	scope="page" />
<jsp:useBean id="motivoNaoDoacao"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.MotivoNaoDoacao"
	scope="page" />

<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
	rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="./resources/css/menu.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
</head>
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
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
				<img align="center"
					src="http://static.tumblr.com/luli647/u6Eo69jad/iconebranco.png"
					width="63" height="55" />
				<h1>
					<a href="#">OPO Web</a>
				</h1>
			</div>
			<div >
				<ul>
						<li><a class="active" href="index.jsp">Início</a></li>
					
					<li class="dropdown">
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
							<li id="dropdown">
					    		<a href="#"  class="dropbtn">Usuário</a>
					    			<div  class="dropdown-content">
					      				<a  id = "item" href="CadastroUsuario.jsp">Cadastro de Usuário</a>
					      				<!--<a href="#">Gerenciamento de Usuário</a>-->
										
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
				<h3>Finalizando Processo</h3>
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

				if (request.getParameter("salvar") != null) {

					paciente = pacienteLogic.getPaciente(request.getParameter("nome"));
					
					
				
						
						
						if((request.getParameter("causa").equalsIgnoreCase("")) || (request.getParameter("rgct").equalsIgnoreCase(""))
								||(request.getParameter("rua").equalsIgnoreCase(""))||(request.getParameter("numCasa").equalsIgnoreCase(""))||
								(request.getParameter("bairro").equalsIgnoreCase(""))||(request.getParameter("cep").equalsIgnoreCase(""))||
								(request.getParameter("cidade").equalsIgnoreCase(""))||(request.getParameter("dnascimento").equalsIgnoreCase(""))||
								(request.getParameter("dinternacao").equalsIgnoreCase(""))||(request.getParameter("rg").equalsIgnoreCase(""))||
								(request.getParameter("cpf").equalsIgnoreCase(""))||(request.getParameter("cns").equalsIgnoreCase(""))||
								(request.getParameter("me") == null)||(request.getParameter("pcr")==null)||(request.getParameter("doador")==null)){%>
						
							<script type="text/javascript">
							alert("Um ou mais campos não foram preenchidos, campos Obrigatórios: "+
									"\n -Causa da morte,\n -RG-CT, \n -Nº, \n -Bairro,\n -CEP,\n -Cidade,\n -Data de nascimento,\n -Data de Internação,\n -RG, \n -CPF, \n -CNS,\n -Morte Encefálica,\n -PCR, \n -Doador")
						</script>
			
<%}else{ %>
			<jsp:setProperty property="cep" name="endereco" />
			<jsp:setProperty property="cidade" name="endereco" />
			<jsp:setProperty property="bairro" name="endereco" />
			<jsp:setProperty property="rua" name="endereco" />
			<jsp:setProperty property="numCasa" name="endereco" />
			<jsp:setProperty property="complemento" name="endereco" />


			<%
				
					enderecoLogic.addEndereco(endereco);
					int id = enderecoLogic.recuperaId();
					paciente.setEndereco(enderecoLogic.getEndereco(id));
					notificacao = paciente.getNotificacao();
					notificacao.setStatus("finalizado");
					notificacaoLogic.updNotificacao(notificacao);
					paciente.setNotificacao(notificacao);
					pacienteLogic.updPaciente(paciente);
			%>
			<script type="text/javascript">
				alert("Finalizado com sucesso!")
			</script>

			<%
				String titulo = "Finalização do processo\n \n";
					/*
					
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
							 "Nome da mãe: "+request.getParameter("mae")+"\n\n"+
							 "Nome do pai: "+request.getParameter("pai")+"\n\n"+
							 "Religião: "+request.getParameter("religiao")+"\n\n+"
							 ;
					 */
					String corpo = paciente.getNome() + ";" + paciente.getIdade() + ";" + request.getParameter("rgct") + ";"
							+ request.getParameter("causa") + ";" + request.getParameter("hospitalid") + ";"
							+ request.getParameter("rua") + ";" + request.getParameter("numCasa") + ";"
							+ request.getParameter("complemento") + ";" + request.getParameter("bairro") + ";"
							+ request.getParameter("cep") + ";" + request.getParameter("cidade") + ";"
							+ request.getParameter("dnascimento") + ";" + request.getParameter("horigem") + ";"
							+ request.getParameter("dinternacao") + ";" + request.getParameter("rg") + ";"
							+ request.getParameter("cpf") + ";" + request.getParameter("cns") + ";"
							+ request.getParameter("pai") + ";" + request.getParameter("mae") + ";"
							+ request.getParameter("religiao") + ";" +request.getParameter("me")+";"+request.getParameter("pcr")+";"
							+ request.getParameter("doador")+";"+request.getParameter("nome1")+";"+ request.getParameter("parentesco1")+";"
							+request.getParameter("telefone1")+";" +request.getParameter("nome2")+";"
							+ request.getParameter("parentesco2")+";"+request.getParameter("telefone2")+";"+request.getParameter("motivo")+
							";" + request.getParameter("naodoadorpcr");
							

					
					GeraPdfFinalizar geraPdf = new GeraPdfFinalizar();
					geraPdf.geraPdf(titulo, corpo, "Relatório" + request.getParameter("nome") +".pdf");
					
			%>


					<jsp:forward page="visualizar.jsp"></jsp:forward>

			<%
				}}
			%>
			
		<%	if(request.getParameter("cancelar")!=null){%>
				
						<jsp:forward page="visualizar.jsp"></jsp:forward>
					
				<%}
			 %>





			<form action="Finalizar.jsp" method="post">
			<!-- DADOS PESSOAIS-->
			<fieldset>
					<legend>Dados Pessoais</legend>
					<table cellspacing="10">
					<tr>
							<td><label for="nome">Nome: </label></td>
							<td align="left"><input type="text" name="nome" size="40"
								value="<%=paciente.getNome()%>" readonly="readonly"></td>
							<td align="center"><label for="idade">Idade: </label></td>
							<td align="left"><input type="number" name="idade"
								value=<%=paciente.getIdade()%>></td>
					</tr>
					<tr>
						<td><label for="dnascimento">Data de Nascimento:* </label></td>
						<td align="left"><input type="date" name="dnascimento" /></td>
						<td><label for="rg"> RG:* </label></td>
						<td align="left"><input type="number" name="rg" /></td>
						
					</tr>
					<tr>
						<td><label for="cpf"> CPF:* </label></td>
						<td align="left"><input type="number" name="cpf" /></td>
						<td><label for="cns"> CNS:* </label></td>
						<td align="left"><input type="number" name="cns" /></td>
						
						</tr>
						
						<tr>
							<td><label for="rgct"> RG CT:* </label></td>
							<td align="left"><input type="number" name="rgct" /></td>
							<td><label for="religiao"> Religião: </label></td>
							<td align="left"><input type="text" name="religiao"
								size="20" /></td>
						</tr>
						
						<tr>
							<td><label for="mae"> Nome da mãe: </label></td>
							<td align="left"><input type="text" name="mae" size="30" />
							<td><label for="pai">Nome do pai: </label></td>
							<td align="left"><input type="text" name="pai" size="30" />
							</td>
							</td>
						</tr>
						
						
					</table>
			</fieldset>	
			<br>	
					
				<!-- DADOS DA NOTIFICAÇÃO-->
				<fieldset>
					<legend>Dados do Processo de Doação</legend>
					<table cellspacing="10">
						
						<tr>
							<td><label for="dnot">Data de Notificação: </label></td>
							<td align="left"><input type="text" name="dnot"
								value="<%=data.format(data1.parse(paciente.getNotificacao().getDtNotificacao()))%>"
								readonly="readonly" /></td>
							<td><label for="causa">Causa do Óbito:* </label></td>
							<td align="left"><input type="text" name="causa" ></td>
						</tr>
						<tr>
							<td><label for="hospitalid"> Hospital Notificador: </label></td>
							<td align="left"><input type="text" name="hospitalid"	size="35"
								value="<%=paciente.getHospital().getHospitalNotificador()%>"
								readonly="readonly" /></td>
								<td><label for="horigem"> RH <font size="2">(Hospital
										de Origem): </font></label></td>
							<td align="left"><input type="text" name="horigem" size="35" />
							</td>
							
						</tr>
						
						<tr>
							<td><label for="dinternacao"> Data de Internação:* </label></td>
							<td align="left"><input type="date" name="dinternacao" /></td>
							<td><label for="mencefalica"> Morte Encefálica:* </label></td>
							<td align="left"><input type="radio" name="me" value="Sim"/>Sim <input
								type="radio" name="me"  value="Não"/>Não</td>							
							
						</tr>
												
						<tr>
							<td><label for="pcr">PCR:* </label></td>
							<td align="left"><input type="radio" name="pcr" value="Sim" />Sim <input
								type="radio" name="pcr" value="Não" />Não</td>
							<td><label for="doador"> Doador:* </label></td>
							<td align="left"><input type="radio" name="doador" value="sim"
								 />Sim <input type="radio" name="doador" value="não" />Não
							</td>
						</tr>
					</table>
				</fieldset>

				<br />
				
				<!-- ENDEREÇO-->
				<fieldset>
					<legend>Dados de Endereço</legend>
					<table cellspacing="10">
						<tr>
							<td><label for="endereco"> Rua:* </label></td>
							<td align="left"><input type="text" name="rua" size="40" />
							</td>
							<td><label for="num">N°:*</label></td>
							<td align="left"><input type="number" name="numCasa"
								size="7" /></td>
						</tr>
						<tr>
							<td><label for="complemento">Complemento: </label></td>
							<td align="left"><input type="text" name="complemento" /></td>
							<td><label for="bairro"> Bairro:* </label></td>
							<td align="left"><input type="text" name="bairro" /></td>
						</tr>
						<tr>
							<td><label for="cep">CEP:* </label></td>
							<td align="left"><input type="number" name="cep" /></td>
							<td><label for="cidade"> Cidade:* </label></td>
							<td align="left"><input type="text" name="cidade" /></td>
						</tr>
					</table>
				</fieldset>
				<br />
				
				<fieldset>
					<legend>Contatos familiares</legend>
					<table cellspacing="10">
						<tr>
							<td align="left"><label for="nome1">Nome: <input
									type="text" name="nome1" size="50" /></label></td>
							<td align="left"><label for="parentesco1">Parentesco:
									<input type="text" name="parentesco1" size="15" />
							</label></td>
							<td align="left"><label for="telefone1">Telefone: <input
									type="text" name="telefone1" /></label></td>
						</tr>
						<tr>
							<td align="left"><label for="nome2">Nome: <input
									type="text" name="nome2" size="50" /></label></td>
							<td align="left"><label for="parentesco2">Parentesco:
									<input type="text" name="parentesco2" size="15" />
							</label></td>
							<td align="left"><label for="telefone2">Telefone: <input
									type="text" name="telefone2" /></label></td>
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
							<td align="left"><input type="radio" name="naodoadorpcr" value="Antes de fechar o protocolo de ME"/> Antes
								de fechar o protocolo de ME</td>
							<td align="center"><input type="radio" name="naodoadorpcr" value="Depois de fechar o protocolo de ME" />
								Antes do acolhimento familiar</td>
							<td align="left"><input type="radio" name="naodoadorpcr" value="Depois do acolhimento familiar" />
								Depois do acolhimento familiar</td>
						</tr>
						
					</table>
				</fieldset>
				<br />
				<fieldset>
					<legend>Sem condições clínicas</legend>
					<table cellspacing="10">
						<tr>
							<td align="left"><input type="radio" name="motivo"
								value="Infecção" /> Infecção</td>
							<td align="left"><input type="radio" name="motivo"
								value="Neoplasia" /> Neoplasia</td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="motivo"
								value="Co-morbidades" /> Co-morbidades</td>
							<td align="left"><input type="radio" name="motivo"
								value="Sisfunção múltipla de órgãos" /> Disfunção mútiplas
								órgãos</td>
						</tr>
					</table>
				</fieldset>
				<br />
				<fieldset>
					<legend>Recusa familiar</legend>
					<table cellspacing="10">
						<tr>
							<td align="left"><input type="radio" name="motivo"
								value="Religião" /> Religião</td>
							<td align="left"><input type="radio" name="motivo"
								size="100" value="Não doador em vida" /> Não era doador em vida</td>
							<td align="left"><input type="radio" name="motivo" size="60"
								value="Família não acredita na me" /> Familia não acredita em ME</td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="motivo"
								value="Familia não respondeu" /> Família não respondeu - PCR</td>
							<td align="left"><input type="radio" name="motivo"
								value="Não especificado" /> Não especificado</td>
							<td align="left"><input type="radio" name="outro" /> Outro
								<input type="text" name="motivo" size="40" /></td>
						</tr>
					</table>
				</fieldset>
				<br />
				<fieldset>
					<legend>Sorologia positiva</legend>
					<table cellspacing="10">
						<tr>
							<td align="left"><input type="radio" name="motivo"
								value="Hepatite B" />Hepatite B</td>
							<td align="left"><input type="radio" name="motivo"
								value="Chagas" />Chagas</td>
							<td align="left"><input type="radio" name="motivo"
								value="Hepatite C" />Hepatite C</td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="motivo"
								value="Htlv" />HTLV</td>
							<td align="left"><input type="radio" name="motivo"
								value="HIV" />HIV</td>
							<td align="left"><input type="radio" name="motivo"
								value="Sífilis" />Sífilis</td>
						</tr>
					</table>
				</fieldset>
				<br />
				<fieldset>
					<legend>Sem etiologia definida</legend>
					<table cellspacing="10">
						<tr>
							<td align="right"><label for="motivo"><div
										align="right">Motivo:</div></label></td>
							<td align="left"><input type="text" name="motivo" size="70" /></td>
						</tr>
					</table>
				</fieldset>
				<br />
				<fieldset>
					<legend>Não preenche diagnóstico de ME</legend>
					<table cellspacing="10">
						<tr>
							<td align="right"><label for="motivo"><div
										align="right">Motivo:</div></label></td>
							<td align="left"><input type="text" name="motivo" size="70" /></td>
						</tr>
					</table>
				</fieldset>
				<div align="left">* Campos Obrigatórios</div>
				<br>

				<br /> <input type="submit" value=" Salvar e Gerar Pdf"
					class="button1" name="salvar" onclick="div.print()"> 
					<input type="submit" value="Cancelar" class="buttonmenor" name="cancelar">
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
