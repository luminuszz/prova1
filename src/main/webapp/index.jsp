<%@page import="model.AulaDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Aulas</title>
</head>
<body>
	<header class="container-cabecalho">
	    <h3>Minhas Aulas</h3>
	</header>
	<nav class="container-nav">
		<div class="btn-nav" onclick="novaAula()">NOVA</div>
		<div class="btn-nav" onclick="reset()">RESET</div>
	</nav>
	<div class="container-geral">
	
		<%
		HttpSession sessao = request.getSession();
		
		if (sessao.getAttribute("lista") != null) {
			ArrayList<AulaDto> lista = (ArrayList<AulaDto>) sessao.getAttribute("lista");
			
			for (AulaDto aula: lista) {
				%>
				<div class="container-aula">
		            <div class="container-linha1">
		             	<div class="info">Id: <%= aula.id %> <span class="texto"></span></div>
		                <div class="info">Data: <%= aula.data %> <span class="texto"></span></div>
		                <div class="info">Hora: <%= aula.horario %> <span class="texto"></span></div>
		                <div class="info">Duração(h): <%= aula.duracao %> <span class="texto"></span></div>
		            </div>
		            <div class="container-linha2">
		                <div class="info">Disciplina: <span class="texto">  <%= aula.disciplina %> </span></div>
		                <div class="info">Assunto: <span class="texto"> <%= aula.assunto %> </span></div>
		            </div>
		            <div class="container-btns">
		                <div></div>
		                <div class="btn" onclick="editarAula(<%=aula.id%>)">EDITAR</div>
		                <div class="btn" onclick="deleta(<%=aula.id%>)">REMOVER</div>
		            </div>
		        </div>		
				<%
			}
		}
		%>
		
		<script src="script.js"></script>
	</div>
</body>
</html>