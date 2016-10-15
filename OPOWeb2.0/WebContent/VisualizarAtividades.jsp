<%@page import="java.util.ArrayList"%>
<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.RegistroAtividades"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Visualização de registros</title>
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
  				
  				<% SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
  					DateFormat data = new SimpleDateFormat("dd/MM/yyyy");
  					if (usuario.getCpf().equalsIgnoreCase("admin")) { %>
					<li class="dropdown">
	    				<a href="#" class="dropbtn">Usuário</a>
	    				<div class="dropdown-content">
	      					<a href="CadastroUsuario.jsp">Cadastro de Usuário</a>
	      					<a href="#">Gerenciamento de Usuário</a>
							
	    				</div>
	  				</li>
  				<%} %>
  												
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
	</div>
	
	<div class="wrapper">
		<div id="welcome" class="container">
			<div class="title">
			<br>
			<br>
			<br>
				<h3>Acompanhamento de Atividades Diárias</h3>
							
			</div>
			
			<%
				registroLogic.setConexao(conexao);
				DateFormat data1 = new SimpleDateFormat("yyyy-MM-dd");
				List<RegistroAtividades> registros = registroLogic.getAtividades();
				
					
					
						
			%>		
			
			<table class="table ls-table" border="1"  align='center'>
			<thead>
				<tr><th class="txt-center" >id</th><th>Data</th><th>Enfermeiro</th>
				<%
				for(RegistroAtividades registroa: registros){
					if(usuario.getCpf().equals("admin")){%>
					
					<tr><td width="60"><%=registroa.getId() %></td>
			    	<td width="200"><%= data.format(data1.parse(registroa.getData()))%></td>
			    	<td><%= registroa.getUsuario().getNome() %></td>
			    	 </tr>
						
					<%}else if(registroa.getUsuario().getCpf().equalsIgnoreCase(usuario.getCpf())){ %>
				<tr><td width="60"><a href = "ListarAtividades.jsp?n=<%= registroa.getId()%>"><%=registroa.getId() %></a></td>
			    <td width="200"><%= data.format(data1.parse(registroa.getData()))%></td>
			    <td><%= registroa.getUsuario().getNome() %></td>
			     </tr>
			<%	
				}
				}
			
			%>
</thead>
</table>
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