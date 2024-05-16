// ==============================================================
// 		EVENTOS


// RESET
reset = function() {
	
	const payload = {
		op: "RESET"
	}
	
	fetch("ControllerServlet", {
    method: "POST",
    headers: {
        "Content-Type": "application/x-www-form-urlencoded"
    },
    body: new URLSearchParams(payload)
    }).then(() => {
		atualizaSessao()
		window.location.href = "/prova1"
	}).catch(() => {
		alert("Houve um erro ao resetar os dados")
	})
}

// NOVA AULA
novaAula = function() {
	window.location.href = "nova";
}

// CANCELA NOVA AULA (OU EDIÇÃO)
calcelarNovaAula = function() {
	window.location.href = "/prova1";
}

// EDITA UMA AULA COM ID ESPECIFICADO
editarAula = function(id) {
	window.location.href = "edit?id=" + id;
}



// ENVIA CONTEÚDO DA NOVA AULA
enviarNovaAula = function() {
	// obtém os valores a partir do formulário
	let data = document.getElementById('data-id').value;
	let horario = document.getElementById('hora-id').value;
	let duracao = document.getElementById('dur-id').value;
	let codDisciplina = document.getElementById('disc-id').value;
	let assunto = document.getElementById('ass-id').value;
	// verificando a validação
	
	
	if (!validaNovaAula(data, horario, duracao, codDisciplina, assunto)) {
        document.getElementById('msg-id').style.display = 'block';
        return;
    }
    
    const payload = {
		data,
		horario,
		duracao,
		codDisciplina,
		assunto,
		op: "CREATE"
	}
    
	fetch("ControllerServlet", {
    method: "POST",
    headers: {
        "Content-Type": "application/x-www-form-urlencoded"
    },
    body: new URLSearchParams(payload)
    }).then(() => {
		atualizaSessao()
		window.location.href = "/prova1"
	}).catch(() => {
		alert("Houve um erro ao criar")
	})
 }

// ENVIA CONTEÚDO EM EDIÇÃO
enviarEdit = function() {
	// obtém os valores a partir do formulário
	let id = document.getElementById('id').innerHTML;
	let data = document.getElementById('data-id').value;
	let horario = document.getElementById('hora-id').value;
	let duracao = document.getElementById('dur-id').value;
	let codDisciplina = document.getElementById('disc-id').value;
	let assunto = document.getElementById('ass-id').value;
	
	console.log(data, horario, duracao, codDisciplina, assunto)
	
	
	
if (!validaNovaAula(data, horario, duracao, codDisciplina, assunto)) {
        document.getElementById('msg-id').style.display = 'block';
        return;
    }
    
    const payload = {
		id,
		data,
		horario,
		duracao,
		codDisciplina,
		assunto,
		op: "UPDATE"
	}
    
	fetch("ControllerServlet", {
    method: "POST",
    headers: {
        "Content-Type": "application/x-www-form-urlencoded"
    },
    body: new URLSearchParams(payload)
    }).then(() => {
		atualizaSessao()
		window.location.href = "/prova1"
	}).catch(() => {
		alert("Houve um erro ao editar")
	})
}

// DELETA UMA AULA
deleta = function(id) {

	const payload = {
		id,
		op: "DELETE"
	}
	
	fetch("ControllerServlet", {
    method: "POST",
    headers: {
        "Content-Type": "application/x-www-form-urlencoded"
    },
    body: new URLSearchParams(payload)
    }).then(() => {
		atualizaSessao();
	    window.location.href = "/prova1";
	}).catch(() => {
		alert("Houve um erro ao deletar")
	})

	
			
}


const voltarParaoIndex = function() {
	 window.location.href = "/prova1";
}


const atualizaSessao = function() {
	let req = new XMLHttpRequest();
	req.open("POST", "ControllerServlet", true);
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.onreadystatechange = () => {
		if (req.readyState == 4 && req.status == 200) {
			// O QUE FAZER SE DEU CERTO
		} else {
			// O QUE FAZER SE DEU ERRADO
		}
	}
	req.send("op=START_SESSION");
}



// ============================================================
// 			VALIDAÇÕES

validaNovaAula = function(data, horario, duracao, codDisciplina, assunto) {
  const existsValues = [data,horario,duracao, codDisciplina, assunto].every(value => !!value)
  
  
    return existsValues;
}



// ===================================================================================
// 		INICIALIZA O PROCESSAMENTO

atualizaSessao();
