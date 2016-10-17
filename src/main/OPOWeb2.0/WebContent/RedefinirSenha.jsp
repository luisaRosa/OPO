<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Exception.IdException"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="conexao" class="br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao"  scope="session" />
<jsp:useBean id="usuarioLogic" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.UsuarioLogic" scope="session" />
<jsp:useBean id="usuario" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="session" />
<jsp:useBean id="usuario1" class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />


<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/menu.css"/>
<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/bootstrap.css " />
<link rel="stylesheet" type="text/css"  media="all" href="/WebContent/css/fonts.css " />
<link rel="stylesheet" type="text/css"  media="all" href="./resources/css/default1.css " />


</head>
<body>
<%  %>

<div id="header-wrapper">

	<div id="header" class="container">
		<div id="logo">
        	<!--<span class="images/iconesemfundo.png"></span>-->
			<img align="center" src="http://static.tumblr.com/luli647/u6Eo69jad/iconebranco.png" width="63" height="55"/>
			<h1><a href="#"><strong>OPO Web</strong></a></h1>
	  </div>
		<div>
			<ul>
				<li ><a href="index.jsp">Início</a></li>
  				<li class="dropdown">
    				<a class="dropbtn">Notificação</a>
    				<div class="dropdown-content">
      					<a href="CadastroNotificacao.jsp">Cadastro de Notificação</a>
      					<a href="visualizar.jsp">Acompanhamento</a>
    				</div>
  				</li>
				<li class=" active dropdown">
	    				<a href="#" class="dropbtn">Usuário</a>
	    				<div class="dropdown-content">
	      					<a href="RedefinirSenha.jsp">Alterar Senha</a>
	      					
								    				</div>
	  			</li>
	  				
	  		
	  				
				
				
				<%String messageError ="";
				try{%>
					
					<li class=" dropdown">
				<a href="#" class="dropbtn">Atividades</a>
				<div class="dropdown-content">
						<% if (!(usuario.getCpf().equalsIgnoreCase("admin"))){ %>
      						<a href="CadastroAtividades.jsp">Cadastro de Atividades</a>
      					<%} %>
      					<a href="VisualizarAtividades.jsp">Acompanhamento de Atividades</a>      					
						
    				</div>
    				</li>
    				<li><a href="login.jsp">Logout</a></li>
			
				<% %>
				<div align="right">
					<label for="user" style="color:white;">&nbsp&nbsp Você está logado como: <%=usuarioLogic.getUsuario(usuario.getCpf()).getNome() %></label>
				<%}catch(NullPointerException npe){ %>	
					<jsp:forward page="login.jsp"></jsp:forward>
				<%} %>	
				</div>
			</ul>
		</div>
	</div>
</div>
<div class="wrapper">
	<div id="welcome" class="container">	
<div class="title">


	  <h4><strong>Redefinindo Senha</strong></h4>
	
</div>

	

		<% usuarioLogic.setConexao(conexao);
		   
		
			if (request.getParameter("confirmar")!= null){	
				
				
	    	 try{     
	    		int resultado1 = 0; 
	    		int resultado2 = 0;
	    		int verificasenha = usuarioLogic.verificaSenha(usuario, request.getParameter("senhaAtual"));
	    		int confirmasenha = usuarioLogic.confirmasenha(request.getParameter("novaSenha"), request.getParameter("confirmarSenha"));
	    		if(verificasenha == 0){	    			
	    			messageError = "A senha digitada não confere com a senha atual!";
	    		}
	    		
	    		if(confirmasenha == 0){
	    			messageError = messageError + " Nova Senha e confirmação devem ser iguais!";
	    		}
	    		
	  			
	  			if(verificasenha == 1 && confirmasenha ==1){
	  				usuario.setSenha(request.getParameter("novaSenha"));
	  				int resultado= usuarioLogic.updSenhaUsuario(usuario);
	  				if(resultado == 1){
	  				request.setAttribute("message", "Senha alterada com sucesso!");
					request.getRequestDispatcher("index.jsp").forward(request, response);
	  			}}
	  			
	        }catch(SQLException ie){
	        	System.out.print("entrei aqui");
	        	messageError = ie.getMessage();
	        }
				
				
					
			}%>
	  
	  
		<form method="post">
				<%System.out.print(messageError+"1");
	   if(!(messageError.equalsIgnoreCase(""))){%>
		   <div class ="alert alert-danger">
			 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<p> <%=messageError %></p>
		  </div>	
	<%	}%> 
		
		<!-- Dados pessoais-->
		<fieldset>
		 <legend>Dados de login</legend>
		 <table >
		  <tr>
		   <td>
		    <label for="nome">Senha Atual: </label>
		   </td>
		   <td align="center">
		    <input type="password" name="senhaAtual" size="40"  required autofocus>
		   </td>
		   </tr>
		   <tr>
		   <td>
		    <label for="cpf">Nova Senha: </label>
		   </td>
		   <td align="center">
		    <input align="center" type="password" name="novaSenha" size="40"  required autofocus>
		   </td>
		  </tr>
		   <tr>
		   <td>
		    <label for="cpf">Confirmar Senha: </label>
		   </td>
		   <td align="center">
		    <input type="password" name="confirmarSenha" size="40"  required autofocus>
		   </td>
		  </tr>
		 </table>
		</fieldset>
		
		<br>
		
		
		<input type="submit" value="Confirmar" name="confirmar" class="button1">
		<input type="submit" value="Cancelar" class="buttonmenor" name="cancelar">
		</form>
	</div>
</div>
<div id="copyright">
	<p>&copy; OPO Web. L.A.G. Todos os direitos reservados. | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
	
</div>
</body>
</html>