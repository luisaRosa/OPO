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
	      					<a href="CadastroUsuario.jsp">Cadastro de Usuário</a>
	      					<a href="GerenciarUsuario.jsp">Gerenciamento de Usuário</a>
								    				</div>
	  			</li>	
				
				<%String messageError="";
				try{ %>
  					
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


	  <h4><strong>Editando Usuário</strong></h4>
	
</div>

	

		<% usuarioLogic.setConexao(conexao);
		   if (request.getParameter("usuario") != null) {
				usuario1 = usuarioLogic.getUsuario(request.getParameter("usuario"));
			}
		
			if (request.getParameter("confirmar")!= null){	
				 usuario1 = usuarioLogic.getUsuario(request.getParameter("cpf"));
				
	    	 try{     
	    		 
	    		usuario1.setNome(request.getParameter("nome")); 
	    		usuario1.setFuncao(request.getParameter("funcao"));
	    		usuario1.setLocalTrabalho(request.getParameter("localTrabalho"));
	  			int resultado = usuarioLogic.updUsuario(usuario1);
	  			if(resultado == 1){
	  				request.setAttribute("message", "Edição de usuário efetuada com sucesso!");
					request.getRequestDispatcher("GerenciarUsuario.jsp").forward(request, response);
	  			}
	  			
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
		 <legend>Dados Pessoais</legend>
		 <table cellspacing="10">
		  <tr>
		   <td>
		    <label for="nome">Nome: </label>
		   </td>
		   <td align="left">
		    <input type="text" name="nome" size="63" value="<%=usuario1.getNome() %>" required autofocus>
		   </td>
		   </tr>
		   <tr>
		   <td>
		    <label for="cpf">CPF: <font size="02">(apenas números)</font></label>
		   </td>
		   <td align="left">
		    <input type="text" name="cpf" value="<%=usuario1.getCpf() %>" readonly="readonly">
		   </td>
		  </tr>
		 </table>
		</fieldset>
		
		<br />
		<!-- Dados profissionais -->
		<fieldset>
		 <legend>Dados Profissionais</legend>
		 <table cellspacing="10">
		
		  <tr>
		   <td>
		    <label for="localTrabalho">Local de trabalho: </label>
		   </td>
		   <td align="left">
		    <input type="text" name="localTrabalho" size="60" value="<%=usuario1.getLocalTrabalho() %>"required autofocus >
		   </td>
		   </tr>
		   <tr>
		   <td>
		    <label for="funcao">Função: </label>
		   </td>
		   <td align="left">
		    <input type="text" name="funcao" size="60" value="<%=usuario1.getFuncao()%>">
		     </td>
		  </tr>
		  
		 </table>
		</fieldset>
		<br/>
		
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