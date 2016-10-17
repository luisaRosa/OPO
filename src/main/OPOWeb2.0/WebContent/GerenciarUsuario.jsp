<!DOCTYPE html >
<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<jsp:useBean id="conexao" class="br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao"  scope="session" />
<jsp:useBean id="usuarioLogic" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.UsuarioLogic" scope="session" />
<jsp:useBean id="usuario" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="session" />

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/bootstrap.css " />
<link href="./resources/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="./resources/css/menu.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" media="all"
	href="./resources/css/default.css " />


<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
        	<!--<span class="images/iconesemfundo.png"></span>-->
			<img align="center" src="http://static.tumblr.com/luli647/u6Eo69jad/iconebranco.png" width="63" height="55"/>
			<h1><a href="#"><strong>OPO Web </strong></a></h1>
	  </div>
		<div align="center">
			<ul>
				<li><a class="active" href="index.jsp">Início</a></li>
  				<li class="dropdown">
    				<a href="#" class="dropbtn">Notificação</a>
    				<div class="dropdown-content">
      					<a href="CadastroNotificacao.jsp">Cadastro de Notificação</a>
      					<a href="visualizar.jsp">Acompanhamento</a>
    				</div>
  				</li>
				<li class="dropdown">
    				<a href="#" class="dropbtn">Usuário</a>
    				<div class="dropdown-content">
      					<a href="CadastroUsuario.jsp">Cadastro de Usuário</a>
      					<a href="GerenciarUsuario.jsp">Gerenciamento de Usuário</a>
						
    				</div>
  				</li>
				
				<%try{ %>
  					
  					<li class=" dropdown">
					<a href="#" class="dropbtn">Atividades</a>
					<div class="dropdown-content">
							<% if (!(usuario.getCpf().equalsIgnoreCase("admin"))){ %>
	      						<a href="CadastroAtividades.jsp">Cadastro de Atividades</a>
	      					<%} %>
	      					<a href="VisualizarAtividades.jsp">Acompanhamento de Atividades</a>      					
							
	    				</div>
	    				</li>
	    				<li><a href="telaInicio.html">Logout</a></li>
				
  				<%%>
  				<div align="right"> 
					<label for="user" style="color:white;">&nbsp&nbsp Você está logado como: <%=usuarioLogic.getUsuario(usuario.getCpf()).getNome() %></label>
					</div>
				<%}catch(NullPointerException npe){ %>	
					<jsp:forward page="login.jsp"></jsp:forward>
				<%} %>	
			</ul>
		</div>
	</div>
</div>
<div class="wrapper">
	<div id="welcome" class="container">	
<div class="title">
	  <h4><strong>Gerenciando usuários</strong></h4>
	  </div>
	  	<table align='center'>
<thead>
<% usuarioLogic.setConexao(conexao);
 if (request.getAttribute("message") != null){  %>
	<div class ="alert alert-success">
	 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<p> <%=request.getAttribute("message") %></p>
		
	</div>
<%}%>

	<tr>
		<th>CPF</th>
		<th>Nome</th>
		<th>Função</th>
		<th>Editar</th>
		<th>Excluir</th>
	</tr>
	<%
	List<Usuario> usuarios = usuarioLogic.getUsuarios(); 
		for(Usuario usuario1: usuarios){
			if(!(usuario1.getCpf().equalsIgnoreCase("admin"))){%>
	<tr>
	
		<td><%=usuario1.getCpf() %></td>
	    <td><%=usuario1.getNome() %></td>
	    <td><%=usuario1.getFuncao() %></td>
	    <td style="text-align:center"><a href="EdicaoUsuario.jsp?usuario=<%=usuario1.getCpf() %>" ><img src="./resources/images/editar.png" width="20" height="20"/></a></td>
	    <td style="text-align:center"><a href="ExclusaoUsuario.jsp?usuario=<%=usuario1.getCpf() %>" ><img src="./resources/images/deletar.png" width="20" height="20"/></a></td>
	</tr>
	<%}} %>
</thead>
</table>
	</div>
</div>
<div id="copyright">
	<p>&copy; OPO Web. L.A.G. Todos os direitos reservados. | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
	
</div>
</body>
</html>
