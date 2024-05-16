<%@page import="enums.DisciplinaEnum"%>
<%@page import="model.AulaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8">
  <title>Prova 1</title>
  <link rel="stylesheet" href="style.css">
</head>

<body>
<%
HttpSession sessao = request.getSession();

Boolean hasError = (Boolean) sessao.getAttribute("hasError");
 
%>
<header class="container-cabecalho">
	
  <%if(!hasError) {
	  AulaDto dto = (AulaDto) sessao.getAttribute("dto");
  	  dto.reverteFormatoData();
	  int parsedCodDisciplina = Integer.parseInt(dto.codDisciplina);
	  DisciplinaEnum currentDisciplina = DisciplinaEnum.getDiscByCodigo(parsedCodDisciplina);
  %>
  
  <h3>Editando: aula de <span id="nome-disciplina"><%= currentDisciplina.getNome() %></span></h3>
  
  <%} %>
  
</header>
<nav class="container-nav">
  <div class="btn-nav" onclick="enviarEdit()">ENVIAR</div>
  <div class="btn-nav" onclick="calcelarNovaAula()">CANCELAR</div>
</nav>

<div class="container-geral">
	<div class="container-aula-edit" id="msg-id" hidden="hidden">
        <div class="texto">
            Erro ao tentar editar dados
        </div>
    </div>
    
    <%if(hasError) {%>
    <div class="container-aula-edit" id="msg-id" >
        <div class="texto">
           Erro ao tentar buscar os dados
           
           <button class="btn" onclick="voltarParaoIndex()">Voltar</button>
        </div>
    </div>
    <%} %>
    
    
    <% if (!hasError) { 
    
    	AulaDto dto = (AulaDto) sessao.getAttribute("dto");
    	
    	int parsedCodDisciplina = Integer.parseInt(dto.codDisciplina);

    	DisciplinaEnum currentDisciplina = DisciplinaEnum.getDiscByCodigo(parsedCodDisciplina);
    
    %>
      <div class="container-aula-edit">
    <div id="id" hidden="hidden"><%=dto.id%></div>
    <div class="container-linha1">
      <div class="info">Data: <input id="data-id" type="date" class="inp-data" value="<%=dto.data%>"></div>
      <div class="info">Horário: <input id="hora-id" type="text" class="inp-hora" value="<%= dto.horario  %>"></div>
      <div class="info">Duração: <input id="dur-id" type="number" class="inp-dur" value="<%= dto.duracao  %>"></div>
    </div>
    <div class="container-linha2">
      <div class="info">Disciplina: <%=currentDisciplina%>
        <select name="" id="disc-id" class="inp-disc" >
			<% 
            for (DisciplinaEnum disciplina : DisciplinaEnum.values()) {
                if (disciplina.getCodigo() == parsedCodDisciplina) {
                    out.println("<option value=\"" + disciplina.getCodigo() + "\" selected>" + disciplina.getNome() + "</option>");
                } else {
                    out.println("<option value=\"" + disciplina.getCodigo() + "\">" + disciplina.getNome() + "</option>");
                }
            }
        %>
          
         
        </select>
      </div>
      <div class="info">Assunto: <input id="ass-id" type="text" class="inp-ass" value="<%= dto.assunto%>"></div>
    </div>
  </div>
<% } %>
    
    

</div>

<script src="script.js"></script>

</body>

</html>