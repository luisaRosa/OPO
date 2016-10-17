<%@page import="java.util.List"%>
<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Atividade"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="conexao"
	class="br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao" scope="session" />
<jsp:useBean id="usuarioLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.UsuarioLogic"
	scope="session" />
<jsp:useBean id="usuario"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="session" />
	
<jsp:useBean id="atividade"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Atividade" scope="page"/>
	
<jsp:useBean id="atividadeLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.AtividadeLogic" scope="page"/>
	
<jsp:useBean id="registro"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.RegistroAtividades" scope="page"/>
	
<jsp:useBean id="registroLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.RegistroAtividadesLogic" scope="page"/>

<html>

<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" media="all"
	href="/WebContent/css/fonts.css " />
<link rel="stylesheet" type="text/css" media="all"
	href="./resources/css/default.css " />
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
  				
  				<%	
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
					
			<%	} %>
				
				<li class="active dropdown">
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
				<h3><strong>Atividades Diárias</strong></h3>
			</div>	
			
			<% 
				registroLogic.setConexao(conexao);
				atividadeLogic.setConexao(conexao);
				
				if (request.getParameter("n") != null) {

					registro = registroLogic.getAtividades(Integer.parseInt(request.getParameter("n")));
				}
				
				List<Atividade> atividades = atividadeLogic.getAtividades();
				String quantidades ="";
				String locais ="";
				String informacoes="";
				
				
				
					
			 %>
			
		
		<form action="ListarAtividades.jsp" method="post">
		 	<%
		 			
		 	
		 	
		 	%>
		 
		  <table class="table ls-table" border="1"  align='center'>
		  <thead>
		  <tr><th>Atividades</th><th>Quantidade</th><th>Hospital</th><th width="500">Evolução</th></tr>
		  <%
		  		for(Atividade atividade1 : atividades ){
			  		if(atividade1.getRegistro().getId() == registro.getId()){%>
		  <tr>
		  		<td><%= atividade1.getAtividade() %></td>
		  		<td><%= atividade1.getQuantidade() %></td>
		  		<td><%= atividade1.getLocal() %></td>
		  		<td><%= atividade1.getInformacoes() %></td>
		  	<%
		 			}
				}
			%>	
		  </tr>
		  </thead>
		  
		  </table>
			 	
				   
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