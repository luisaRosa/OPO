<%@page import="java.sql.SQLException"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html >
<jsp:useBean id="conexao"
	class="br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao" scope="session" />
<jsp:useBean id="usuarioLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.UsuarioLogic"
	scope="session" />
<jsp:useBean id="usuario"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="session" />
	
<jsp:useBean id="registro"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.RegistroAtividades" scope="page"/>
	
<jsp:useBean id="registroLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.RegistroAtividadesLogic" scope="page"/>
	
<jsp:useBean id="atividade"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Atividade" scope="page"/>
	
<jsp:useBean id="atividadeLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.AtividadeLogic" scope="page"/>
	
	
<html>

<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/bootstrap.css " />	
<link rel="stylesheet" type="text/css" media="all"
	href="/WebContent/css/fonts.css " />
<link rel="stylesheet" type="text/css" media="all"
	href="./resources/css/default1.css " />
<link href="./resources/css/menu.css" rel="stylesheet" type="text/css" media="all" />	
	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
					<a href="#"><strong>OPO Web</strong></a>
				</h1>
			</div>
			
			<div align="center">
			<ul>
				<li ><a href="index.jsp">Início</a></li>
  				<li  class="dropdown"   >
    				<a   class="dropbtn">Notificação</a>
    				<div class="dropdown-content">
      					<a href="CadastroNotificacao.jsp">Cadastro de Notificação</a>
      					<a href="visualizar.jsp">Acompanhamento</a>
    				</div>
  				</li>
  				
  				
  				<%	SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
  				    DateFormat data = new SimpleDateFormat("dd/MM/yyyy");
  				    String messageError="";
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
  					}catch (NullPointerException npe){%>	
  						<jsp:forward page="login.jsp"></jsp:forward>
  				<%   }
  				%>
  				
  				<li class="active dropdown">
					<a href="#" class="dropbtn">Atividades</a>
					<div class="dropdown-content">
							<% if (!(usuario.getCpf().equalsIgnoreCase("admin"))){ %>
	      						<a href="CadastroAtividades.jsp">Cadastro de Atividades</a>
	      					<%} %>
	      					<a href="VisualizarAtividades.jsp">Acompanhamento de Atividades</a>      					
							
	    				</div>
				
				</li>
  				
				<li><a href="login.jsp">Logout</a></li>
				<div align="right">
					<label for="user" style="color: white;" >&nbsp&nbsp Você está logado como: <%=usuarioLogic.getUsuario(usuario.getCpf()).getNome() %></label>
				</div>
			</ul>
			
			
		</div>
	</div>
	
	<div class="wrapper">
		<div id="welcome" class="container">
			<div class="title">
				<br>
			<br>
			<br>
				<h4><strong>Cadastrando Atividades Diárias</strong></h4>
			</div>
			
			<%
				usuarioLogic.setConexao(conexao);
	    		registroLogic.setConexao(conexao);
	    		atividadeLogic.setConexao(conexao);
			
				if(request.getParameter("registrar")!= null) {
					try{
					registro.setData(new Date(System.currentTimeMillis()).toString());
					registro.setUsuario(usuario);
					registroLogic.addAtividades(registro);
					int idRegistro = registroLogic.recuperaId();
					
					atividade.setAtividade("Potencial Doador");
					atividade.setUsuario(registroLogic.getAtividades(idRegistro).getUsuario());
					atividade.setLocal(request.getParameter("local1"));
					atividade.setQuantidade(Integer.parseInt(request.getParameter("quantidade1")));
					atividade.setInformacoes(request.getParameter("informacoes1"));
					atividade.setRegistro(registroLogic.getAtividades(idRegistro));
					
					atividadeLogic.addAtividades(atividade);
					
			
					
					atividade.setAtividade("Protocolos Abertos");
					atividade.setUsuario(registroLogic.getAtividades(idRegistro).getUsuario());
					atividade.setLocal(request.getParameter("local2"));
					atividade.setQuantidade(Integer.parseInt(request.getParameter("quantidade2")));
					atividade.setInformacoes(request.getParameter("informacoes2"));
					atividade.setRegistro(registroLogic.getAtividades(idRegistro));
					
					atividadeLogic.addAtividades(atividade);
					
					atividade.setAtividade("Entrevista PCR");
					atividade.setUsuario(registroLogic.getAtividades(idRegistro).getUsuario());
					atividade.setLocal(request.getParameter("local3"));
					atividade.setQuantidade(Integer.parseInt(request.getParameter("quantidade3")));
					atividade.setInformacoes(request.getParameter("informacoes3"));
					atividade.setRegistro(registroLogic.getAtividades(idRegistro));
					
					atividadeLogic.addAtividades(atividade);
					
					atividade.setAtividade("Captação");
					atividade.setUsuario(registroLogic.getAtividades(idRegistro).getUsuario());
					atividade.setLocal(request.getParameter("local4"));
					atividade.setQuantidade(Integer.parseInt(request.getParameter("quantidade4")));
					atividade.setInformacoes(request.getParameter("informacoes4"));
					atividade.setRegistro(registroLogic.getAtividades(idRegistro));
					
					atividadeLogic.addAtividades(atividade);
					
					atividade.setAtividade("Educação Continuada");
					atividade.setUsuario(registroLogic.getAtividades(idRegistro).getUsuario());
					atividade.setLocal(request.getParameter("local5"));
					atividade.setQuantidade(Integer.parseInt(request.getParameter("quantidade5")));
					atividade.setInformacoes(request.getParameter("informacoes5"));
					atividade.setRegistro(registroLogic.getAtividades(idRegistro));
					
					int resposta = atividadeLogic.addAtividades(atividade);
					if(resposta == 1){
		  				request.setAttribute("message", "Atividades Diárias cadastradas com sucesso!");
						request.getRequestDispatcher("VisualizarAtividades.jsp").forward(request, response);
		  			}
					}catch(SQLException sqle){
						messageError = sqle.getMessage();
					}
				 %>
					 <script type="text/javascript">
			         alert("Atividades diárias cadastradas com sucesso!");
		     		 </script>	
		     		 
		        
					
			<%		
				}
				
				if(request.getParameter("cancelar")!= null){%>
				
						<jsp:forward page="VisualizarAtividades.jsp"></jsp:forward>
					
			<%		
				}
			
			%>
				
			
			<form action="CadastroAtividades.jsp" method="post">
		<%	 if(!(messageError.equalsIgnoreCase(""))){%>
		   <div class ="alert alert-danger">
			 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<p> <%=messageError %></p>
		  </div>	
	<%	}%> 
			<fieldset>
					<legend>Dados Gerais</legend>
					<table cellspacing="10">
					
						<tr>
							<td><label for="data">Data: </label></td>
							<td align="left"><input type="text" name="data" size="20" value="<%=data.format(new Date(System.currentTimeMillis())) %>" >
							</td>
							<td><label for="enfermeiro">Enfermeiro: </label></td>
							<td align="left"><input type="text" name="enfermeiro" size="60" value="<%=usuarioLogic.getUsuario(usuario.getCpf()).getNome()%>" >
							</td>
						</tr>
						</table>
				</fieldset>
				
				<br>
				<br>
				<fieldset>
				
					<legend>Potencial Doador</legend>
					<table cellspacing="10" >
					<br>			    
				    <tr>
						<td><label for="quantidade">Quantidade: </label></td>
						<td align="left"><input type="number" name="quantidade1" size="10" required autofocus  >
						</td>
						<td><label for="local">Local: </label></td>
						<td align="left"><input type="text" name="local1" size="60"></td>
						
						</tr>
						<tr></tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
						
					</table>	
						<textarea  name="informacoes1" placeholder="Evolução"></textarea>
			
						
							  
				 	
				   
				 </fieldset>
				  
				 <br>
				<br>
				<fieldset>
				
					<legend>Protocolos Abertos</legend>
					<table cellspacing="10" >
					<br>			    
				    <tr>
						<td><label for="quantidade2">Quantidade: </label></td>
						<td align="left"><input type="number" name="quantidade2" size="10" required autofocus >
						</td>
						<td><label for="local2">Local: </label></td>
						<td align="left"><input type="text" name="local2" size="60"></td>
					</tr>
					
					<tr></tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
						
					</table>	
						<textarea  name="informacoes2" placeholder="Evolução"></textarea>		  
				 	
				  
				 </fieldset>
				 
				 <br>
				<br>
				<fieldset>
				
					<legend>Entrevista PCR</legend>
					<table cellspacing="10" >
					<br>			    
				    <tr>
						<td><label for="quantidade3">Quantidade: </label></td>
						<td align="left"><input type="number" name="quantidade3" size="10" required autofocus >
						</td>
						<td><label for="local3">Local: </label></td>
						<td align="left"><input type="text" name="local3" size="60"></td>
					</tr>	
					<tr></tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
						
					</table>	
						<textarea  name="informacoes3" placeholder="Evolução"></textarea>		  
				 
				 </fieldset>
				 
				 <br>
				<br>
				<fieldset>
				
					<legend>Captação</legend>
					<table cellspacing="10" >
					<br>			    
				    <tr>
						<td><label for="quantidade4">Quantidade: </label></td>
						<td align="left"><input type="number" name="quantidade4" size="10" required autofocus >
						</td>
						<td><label for="local4">Local: </label></td>
						<td align="left"><input type="text" name="local4" size="60"></td>
					</tr>
					
					<tr></tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
						
					</table>	
						<textarea  name="informacoes4" placeholder="Evolução"></textarea>			  
				 	
				  
				 </fieldset>
				 
				 <br>
				<br>
				<fieldset>
				
					<legend>Educação Continuada</legend>
					<table cellspacing="10" >
					<br>			    
				    <tr>
						<td><label for="quantidade5">Quantidade: </label></td>
						<td align="left"><input type="number" name="quantidade5" size="10" required autofocus >
						</td>
						<td><label for="local5">Local: </label></td>
						<td align="left"><input type="text" name="local5" size="60"></td>
					</tr>	
					
					<tr></tr>
						<tr>
						<td></td>
						<td></td>
						<td></td>
						
					</table>	
						<textarea  name="informacoes5" placeholder="Evolução"></textarea>		  
				 	
				  
				 </fieldset>
							
				<br />
				<input type="submit" value="Confirmar" name="registrar" class="button1">
				<input type="submit" value="Cancelar" name="cancelar" class="button1">
					</div>
			</form>
		</div>
				
	<div id="copyright">
		<p>
			&copy; OPO Web. L.A.G. Todos os direitos reservados. | Design by <a
				href="http://templated.co" rel="nofollow">TEMPLATED</a>.
		</p>

	</div>
</body>
</html>

