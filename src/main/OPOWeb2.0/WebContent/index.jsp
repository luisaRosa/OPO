<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="conexao" class ="br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao" scope="session" />
<jsp:useBean id="usuario" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="session" />
<jsp:useBean id="usuarioLogic" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.UsuarioLogic" scope="session" />
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/bootstrap.css " />
<link href="./resources/css/menu.css" rel="stylesheet" type="text/css" media="all" />

<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/default.css"/>

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
        	<!--<span class="images/iconesemfundo.png"></span>-->
			<img align="center" src="http://static.tumblr.com/luli647/u6Eo69jad/iconebranco.png" width="63" height="55"/>
			<h1><a href="#"><strong>OPO Web</strong></a></h1>
	  </div>
		<div align="center">
			<ul>
				<li class="active"><a href="index.jsp">Início</a></li>
  				<li class="dropdown">
    				<a class="dropbtn">Notificação</a>
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
	      					<a href="GerenciarUsuario.jsp">Gerenciamento de Usuário</a>
							
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
					<label for="user" style="color: white;" >&nbsp&nbsp Você está logado como: <%=usuarioLogic.getUsuario(usuario.getCpf()).getNome() %></label>
				</div>
			</ul>
			
	
	
			
		</div>
	</div>
</div>
<div id="wrapper1">

	<div id="welcome" class="container">
	<%if (request.getAttribute("message") != null){  %>
	<div class ="alert alert-success">
	 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<p> <%=request.getAttribute("message") %></p>
		
	</div>
<%}%>	
	  	<div align="center">
		<h3>Bem vindo</h3>
		</div>
		<div align="center">
		<img src= ./resources/images/iconesemfundo.png width="200" height="176"/>
		</div>
		<div align="center">
		<h3>Sistema OPO Web</h3>
		</div>
		<br>
		<br>
		<br>
		
	</div>
</div>
<div id="copyright">
	<p>&copy; OPO Web. L.A.G. Todos os direitos reservados. | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
	
</div>
</body>
</html>
