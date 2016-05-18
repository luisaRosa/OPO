

<%@page import="java.sql.SQLException"%>
<jsp:useBean id="conexao" class="br.ufac.bsi.es1.controleDeDoacoes.DB.Conexao"  scope="session" />
<jsp:useBean id="usuarioLogic" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.UsuarioLogic" scope="session" />
<jsp:useBean id="usuario" class="br.ufac.bsi.es1.controleDeDoacoes.Logic.Usuario" scope="session" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link rel="stylesheet" type="text/css"  media="all" href="/WebContent/css/fonts.css " />
<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/default.css " />

</head>
<body>

<div id="header-wrapper">

	<div id="header" class="container">
		<div id="logo">
        	<!--<span class="images/iconesemfundo.png"></span>-->
			<img align="center" src="http://static.tumblr.com/luli647/u6Eo69jad/iconebranco.png" width="63" height="55"/>
			<h1><a href="#">OPO Web</a></h1>
	  </div>
		<div id="menu">
		
		
		
		<%
	
			String nome = "root";
			String pass = "root";
			conexao.conecte("jdbc:mysql://localhost/controlededoacoes", nome, pass);
		
				if(conexao.estaConectado()){
		
			
		%>

					<ul>
					<li class="active"><a href="index.jsp" accesskey="3" title="">Login</a></li>
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
								
								<jsp:forward page="CadastroNotificacao.jsp" />
					 
								
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

	<form action="index.jsp" method="post">
	
	<p>Login: <input type="text" name="cpf" size="30"/></p>
	<p>Senha: <input type="password" name="senha" size="30" /></p>
	<p><input type="submit" name ="botaoLogin" value="Entrar" border="0px" class="button"/>	 </p>
</form>

	</div>
</div>
</div>
<div id="copyright">
	<p>&copy; OPO Web. L.A.G. Todos os direitos reservados. | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
</div>
</body>
</html>
