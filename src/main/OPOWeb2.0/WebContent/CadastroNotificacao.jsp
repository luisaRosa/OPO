<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Hospital"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Date"%>
<!DOCTYPE html >
<%@page import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Notificacao"%>
<%@page
	import="br.ufac.bsi.ihm.controleDeDoacoes.Logic.QuadroClinicoLogic"%>


<jsp:useBean id="conexao"
	class="br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao" scope="session" />
<jsp:useBean id="usuarioLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.UsuarioLogic"
	scope="session" />
<jsp:useBean id="usuario"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario" scope="session" />
<jsp:useBean id="pacienteLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.PacienteLogic"
	scope="page" />
<jsp:useBean id="paciente"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Paciente" scope="page" />
<jsp:useBean id="hospital"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Hospital" scope="page" />
<jsp:useBean id="hospitalLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.HospitalLogic"
	scope="page" />
<jsp:useBean id="quadroclinico"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.QuadroClinico"
	scope="page" />
<jsp:useBean id="quadroClinicoLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.QuadroClinicoLogic"
	scope="page" />
<jsp:useBean id="notificacao"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.Notificacao"
	scope="page" />
<jsp:useBean id="notificacaoLogic"
	class="br.ufac.bsi.ihm.controleDeDoacoes.Logic.NotificacaoLogic"
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

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
	rel="stylesheet" />
	<link rel="stylesheet" type="text/css" media="all"
	href="./resources/css/default1.css " />
	<link rel="stylesheet" type="text/css" media="all"
	href="/WebContent/css/fonts.css " />
	
	<link href="./resources/css/menu.css" rel="stylesheet" type="text/css" media="all" />	
	



	


<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
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
  				<li  class="active dropdown"   >
    				<a   class="dropbtn">Notificação</a>
    				<div class="dropdown-content">
      					<a href="CadastroNotificacao.jsp">Cadastro de Notificação</a>
      					<a href="visualizar.jsp">Acompanhamento</a>
    				</div>
  				</li>
  				
  				<% SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
  				try{%>
  					<%	if (usuario.getCpf().equalsIgnoreCase("admin")) { %>
  					
  				
  					
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
					
			<%	}%>
  					
  					<li class=" dropdown">
					<a href="#" class="dropbtn">Atividades</a>
					<div class="dropdown-content">
							<% if (!(usuario.getCpf().equalsIgnoreCase("admin"))){ %>
	      						<a href="CadastroAtividades.jsp">Cadastro de Atividades</a>
	      					<%} %>
	      					<a href="VisualizarAtividades.jsp">Acompanhamento de Atividades</a>      					
							
	    				</div>
				
  				<%	}catch (NullPointerException npe){%>	
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
			<div class="title" align="center">
			
			<br>
			<br>
			<br>
				<h3>Cadastrando Notificação</h3>
				
			</div>
			
			
			<% 
			
			hospitalLogic.setConexao(conexao);
			enderecoLogic.setConexao(conexao);
			causaMorteLogic.setConexao(conexao);
			motivoNaoDoacaoLogic.setConexao(conexao);
			quadroClinicoLogic.setConexao(conexao);
			notificacaoLogic.setConexao(conexao);
			pacienteLogic.setConexao(conexao);
			
			
			String a = null;
			String dado[] = null;
			
				if(request.getParameter("carregar")!= null){
					
					 try {
						    BufferedReader in = new BufferedReader(new FileReader("C:/Users/Luisa Rosa/Downloads/"+request.getParameter("arquivo")));
						    String str;
						    
						    
						    if((str = in.readLine()) != null){
						    	 a = str;
						    	dado = a.split(";");
						    	
						    	
						       
						    }
						    in.close();
						  } 
						  catch(Exception e){%>
							  <script type="text/javascript">
						         alert("Erro ao carregar o arquivo, tente novamente!");
						     		 </script>
						    
				<%		  }
					}
				
				
	
				
			%>

			<%
			
			
				
			%>
			<%if (request.getParameter("confirmar") != null) {%>
			
			
								
					<jsp:setProperty name="quadroclinico" property="pupilas"/>
					<jsp:setProperty name="quadroclinico" property="egAo"/>
					<jsp:setProperty name="quadroclinico" property="egMrv"/>
					<jsp:setProperty name="quadroclinico" property="egMrm"/>
					<jsp:setProperty name="quadroclinico" property="sedado"/>
					<jsp:setProperty name="quadroclinico" property="informacoesAdd"/>
					<% 
						quadroclinico.setPressaoArterial(request.getParameter("pressaoArterial")+"/"+request.getParameter("sias"));
						quadroClinicoLogic.addQuadroClinico(quadroclinico);
					
						notificacao.setStatus("em aberto");
						notificacao.setUsuario(usuario);
						notificacao.setDtNotificacao(dataFormat.format(new Date(System.currentTimeMillis())));
						
						GregorianCalendar calendar = new GregorianCalendar();
				  		int hora = calendar.get(Calendar.HOUR_OF_DAY );
				  		int minutos = calendar.get(Calendar.MINUTE);
				  		String horario =  String.valueOf(hora)+":"+ String.valueOf(minutos);
				  		if(minutos < 10)
				  			horario = String.valueOf(hora)+":0"+ String.valueOf(minutos);
				  		
				  		notificacao.setHoraNotificacao(horario);
				  		
						System.out.println(new Date(System.currentTimeMillis()));
						notificacaoLogic.addNotificacao(notificacao);
						
						
					%>
					
					<%  
						
						
						endereco = enderecoLogic.getEndereco(1);
						causaMorte = causaMorteLogic.getCausaMorte(1);
						motivoNaoDoacao = motivoNaoDoacaoLogic.getMotivo(1);
						
						%>
				
					   
					<jsp:setProperty name="paciente" property="nome"/>
					<jsp:setProperty name="paciente" property="idade"/>
					<% paciente.setCausaMorte(causaMorte);
					   paciente.setEndereco(endereco);
					   paciente.setmNaoDoacao(motivoNaoDoacao);
					   System.out.println(request.getParameter("hospitalNotificador"));
					   
					  hospital = hospitalLogic.getHospital(Integer.parseInt(request.getParameter("hospitalNotificador")));
					   paciente.setHospital(hospital);
					   
					  int id = quadroClinicoLogic.recuperaId();
					   paciente.setQuadroClinico(quadroClinicoLogic.getQuadroClinico(id));
					   System.out.println(id);
					   
					   
					   id = notificacaoLogic.recuperaId();
					   System.out.println(id);
					   paciente.setNotificacao(notificacaoLogic.getNotificacao(id));
					   pacienteLogic.addPaciente(paciente);%>
					   
					   <script type="text/javascript">
							alert("Cadastro efetuado com sucesso!")
						</script>
					   
					  
			  <%}  
			
			
				if(request.getParameter("cancelar")!=null){%>
				
						<jsp:forward page="visualizar.jsp"></jsp:forward>
					
				<%}
			 %>
			 
			 
			 
			 
			   
		
						
						
						
						
								
						
								
						
			   
			<form action="CadastroNotificacao.jsp" method="post" >
			<div align="center"><div align="center"><label for="cararq" >Carregue o formulário usando um arquivo:
				<input type="file" name="arquivo" >
				<input type="submit" name="carregar" value="Carregar" size="40" class="buttonmenor" >
			</label></div> <br> <br></div>
			
			
<!-- DADOS PESSOAIS-->
<fieldset>
 <legend>Dados Pessoais</legend>
	<table cellspacing="10">
					
	 <tr>
	  <td><label for="nome" >Nome:* </label></td>
	  <td align="left"><input id="nome" type="text" name="nome"  size="63"<%if (a != null){ %> value="<%= dado[0] %>"<%}if(request.getParameter("arquivo") != null){ %> required autofocus <%} %>></td>
	  
	  <td><label for="idade">Idade:* </label></td>
	  <td align="left"><input type="number" name="idade" size="20"<%if (a != null){ %> value="<%= dado[1] %>"<%}if(request.getParameter("arquivo") != null){ %> required autofocus <%} %>></td>
	</tr>
	<tr>
	  <td><label for="hospital"> Hospital: </label></td>
	  <td align="left">
	  <select  name="hospitalNotificador" class="selectpicker">
		<%		
			List<Hospital>hospitais = hospitalLogic.getHospitais();
			for(Hospital hospital1 : hospitais){
				if(a != null && hospital1.getHospitalNotificador().equalsIgnoreCase(dado[2])){
					System.out.println(" id hospital = "+hospital1.getId());
		%>
     	           <option value="<%=hospital1.getId() %>" selected = "selected"> <%=hospital1.getHospitalNotificador() %></option>
	   <%		
				}else{
		%>
					<option value="<%=hospital1.getId() %>"> <%=hospital1.getHospitalNotificador()%></option>
								
		<%
				}
			}
		%>
	  </select>
  	  </td>
	</tr>
   </table>
</fieldset>
<br>
<!-- Quadro Clínico -->
<fieldset>
 <legend>Quadro clínico</legend>
   <table cellpadding="10" cellspacing="10">
     <tr>
		<td><label for="pupilas">
			<div align="right">Pupilas:*</div>
			</label>
		</td>
		<td align="right" width="20"><input  type="text" name="pupilas" size="20" <%if (a != null){ %> value="<%= dado[3] %>"<%}if(request.getParameter("arquivo") != null){ %> required autofocus <%} %>/>
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
	  <td><label>
	      <div align="right">Escala de Gasglow:</div>
		 </label>
	  </td>
	   <td width="20" align="right">
	     <label for="ao">
		  <div align="right">AO:</div>
		 </label> <select name="egAo">
			<% for (int i=1; i<5;i++) {
		     		if (a != null) { %>
						<option value="<%=dado[4]%>"selected="selected"><%=dado[4]%></option>
			<%      } 
					else{%>
						<option value="<%= i %>"><%= i %></option>
			<%	    } 
		       }
			%>
			      </select>
	   </td>
	   <td align="center" width="50">
	   <label for="mrv">MRV:
	   </label> <select name="egMrv">
			<% for (int i=1; i<5;i++) {
		        	if (a != null) { %>
						<option value="<%=dado[5]%>"selected="selected"><%=dado[5]%></option>
			<%      } 
					else{
			%>
						<option value="<%= i %>"><%= i %></option>
			<%	    }
		        }
			%>
									
			 	</select>
		</td>
		<td align="right" width="50"><label for="mrm">MRM: </label>
		<select name="egMrm">
		  	<% for (int i=1; i<5;i++) {
					if (a != null) { %>
						<option value="<%=dado[6]%>"selected="selected"><%=dado[6]%></option>
			<%      }else{%>
						<option value="<%= i %>"><%= i %></option>
			<%	    }
				}%>
		</select>
		</td>
	</tr>
	<tr>
	    <td><label for="pressaoa">
			<div align="right">Pressão Arterial:</div>
			</label>
		</td>
		    <td align="right" width="50"><select name="pressaoArterial">
			<% for (int i=50; i<160;i = i+10) {
					if (a != null) { %>
						<option value="<%=dado[7]%>"selected="selected"><%=dado[7]%></option>
			<%      }else{%>
						<option value="<%= i %>"><%= i %></option>
			<%	    }
				}
			%>
			</select>
			</td>
			<td align="left"><select name="sias">
			<% for (int i=50; i<160;i = i+10) {
				   if (a != null) { %>
			          <option value="<%=dado[8]%>"selected="selected"><%=dado[8]%></option>
			<%  }else{%>
					 <option value="<%= i %>"><%= i %></option>
			<%	} 
			  }
			%>
			</select></td>
			</tr>
			<tr>
			<td><label for="sedacao">
				<div align="right">Sedação:*</div>
				</label></td>
				<td align="center" width="50"><input type="radio" name="sedado" value="sim" align="left" checked = "checked"<% if(a != null && dado[9].equalsIgnoreCase("sim")){ %> checked="checked" <%} %>/> Sim <input
				type="radio" name="sedado" value="nao" align="left" <% if(a != null &&dado[9].equalsIgnoreCase("não")){ %> checked="checked" <%}%>/> Não</td>
			</tr>
</table>
</fieldset>
<br>
<!-- Informações adicionais -->
<fieldset>
<legend>Informações Adicionais*</legend>
	<table>
		<tr>
			<textarea name="informacoesAdd" style="text-align: justify"<%if(request.getParameter("arquivo") != null){%> required autofocus <%} %>><%if (a != null){%><%=dado[10]%><%} %></textarea>
		</tr>
	</table>
</fieldset>
<div align="left">* Campos Obrigatórios</div>
<br>
<br>
<input type="submit" value="Confirmar" name="confirmar" class="buttonmenor">
<input type="submit" value="Cancelar" class="buttonmenor" name="cancelar">
</form>
</div>
</div>
	<div id="copyright">
	<p>&copy; OPO Web. L.A.G. Todos os direitos reservados. | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
	
</div>
</body>
</html>
