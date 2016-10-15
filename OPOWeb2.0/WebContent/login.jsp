<%@page import="java.sql.SQLException"%>
<jsp:useBean id="conexao" class="br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao" scope="session"/>
<jsp:useBean id="usuarioLogic" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.UsuarioLogic" scope="session" />
<jsp:useBean id="usuario" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="session" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link rel="stylesheet" type="text/css"  media="all" href="/WebContent/css/fonts.css " />
<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/default.css " />
<link href="./resources/css/menu.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>

<div id="header-wrapper">

	<div id="header" class="container">
		<div id="logo">
        	<!--<span class="images/iconesemfundo.png"></span>-->
			<img align="center" src="http://static.tumblr.com/luli647/u6Eo69jad/iconebranco.png" width="63" height="55"/>
			<h1><a href="#">OPO Web</a></h1>
	  </div>
		<div>
		
		
		
		<%
	
			String nome = "root";
			String pass = "root";
			conexao.conecte("jdbc:mysql://localhost/controlededoacoes", nome, pass);
		
				if(conexao.estaConectado()){
		
			
		%>

					<ul>
					<li class="active"><a href = "login.jsp" accesskey="3" title="">Login</a></li>
					<%
					usuarioLogic.setConexao(conexao);
			
					String cpf = request.getParameter("cpf");
					
					
					String senha = request.getParameter("senha");
					if((cpf!=null && senha!=null)){
						// usuario = usuarioLogic.getUsuario(cpf);
				
						%>
						
						<jsp:setProperty  name="usuario" property="cpf"/>
						<jsp:setProperty  name="usuario" property="senha"/>
						
					
					
						<%	
						System.out.println(usuario.getCpf());
						String n =  usuario.getSenha();%>
						
							
												
						
							<% if(n.equalsIgnoreCase(senha)){ %>
								
								<jsp:forward page="index.jsp" />
					 
								
					</ul>
								<%} %>
					
					
					
					<%}
						
				} %>	
			
				
		</div>
	</div>
</div>

<div class="wrapper1">


	<div id="welcome" class="container">	
	<div class="title">
	<br>
	<br>
	<br>
	</div>

	<form action="login.jsp" method="post">
	
	<p>Login: <input type="text" name="cpf" size="30"/></p>
	<p>Senha: <input type="password" name="senha" size="30" /></p>
	<p><input type="submit" name ="botaoLogin" value="Entrar" border="0px" class="buttonmenor"/>	 </p>
	</form>

	
</div>
</div>
<div id="copyright">
	<p>&copy; OPO Web. L.A.G. Todos os direitos reservados. | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
</div>
</body>
</html>
