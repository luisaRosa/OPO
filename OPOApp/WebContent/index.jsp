<jsp:useBean id="conexao" class="br.ufac.es1.controleDeDoacoes.DB.Conexao"  scope="session" />
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
			<ul>
				<li class="active"><li><a href="#" accesskey="2" title="">Acompanhamento</a></li>
				<li><a href="#" accesskey="3" title="">Login/Logout</a></li>
				<li><a href="#" accesskey="4" title="">Careers</a></li>
				<li><a href="#" accesskey="5" title="">Contact Us</a></li>
			</ul>
		</div>
	</div>
</div>

<div class="wrapper">

	<div id="welcome" class="container">	
<div class="title">


<%
	
	String nome = "root";
	String senha = "root";
	conexao.conecte("jdbc:mysql://localhost/controlededoaçoes", nome, senha);

		if(conexao.estaConectado()){
			
			
%>

	  
 
 <jsp:include page="visualizar.jsp" /> 


<%} %>
	</div>
</div>
<div id="copyright">
	<p>&copy; OPO Web. L.A.G. Todos os direitos reservados. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
	
</div>
</body>
</html>
