FiltroPolitico = {}

--Características simples
FiltroPolitico.nomeParlamentar = nil;
FiltroPolitico.nomeParlamentarAlterado = false;

FiltroPolitico.regiao = nil;
FiltroPolitico.regiaoAlterado = false;

FiltroPolitico.estado = nil;
FiltroPolitico.estadoAlterado = false;

FiltroPolitico.cidade = nil;
FiltroPolitico.cidadeAlterado = false;

FiltroPolitico.cargo = nil;
FiltroPolitico.cargoAlterado = false;

FiltroPolitico.partido = nil;
FiltroPolitico.partidoAlterado = false;

--Características avançadas
FiltroPolitico.id = nil;
FiltroPolitico.idAlterado = false;

FiltroPolitico.nomeCompleto = nil;
FiltroPolitico.nomeCompletoAlterado = false;

FiltroPolitico.idade = nil;
FiltroPolitico.idadeAlterado = false;

FiltroPolitico.ocupacao = nil;
FiltroPolitico.ocupacaoAlterado = false;


--FiltroPolitico.reeleicao = nil;
--FiltroPolitico.reeleicaoAlterado = false;

FiltroPolitico.totalBensDeclarados = nil;
FiltroPolitico.totalBensDeclaradosAlterado = false;

FiltroPolitico.totalDoacoesRecebidas = nil;
FiltroPolitico.totalDoacoesRecebidasAlterado = false;

FiltroPolitico.mandato = nil;
FiltroPolitico.mandatoAlterado = false;

FiltroPolitico.sexo = nil;
FiltroPolitico.sexoAlterado = false;

FiltroPolitico.telefone = nil;
FiltroPolitico.telefoneAlterado = false;

FiltroPolitico.email = nil;
FiltroPolitico.emailAlterado = false;

FiltroPolitico.nascimento = nil;
FiltroPolitico.nascimentoAlterado = false;

FiltroPolitico.faixaEtaria = nil;
FiltroPolitico.faixaEtariaAlterado = false;

FiltroPolitico.escolaridade = nil;
FiltroPolitico.escolaridadeAterado = false;

FiltroPolitico.situacao = nil;
FiltroPolitico.situacaoAlterado = false;

FiltroPolitico.numeroMandatos = nil;
FiltroPolitico.numeroMandatosAlterado = false;

FiltroPolitico.gastoTotal = nil;
FiltroPolitico.gastoTotalAlterado = false;

FiltroPolitico.gastoPorDia = nil;
FiltroPolitico.gastoPorDiaAlterado = false;

FiltroPolitico.assiduidade = nil;
FiltroPolitico.assiduidadeAlterado = false;

FiltroPolitico.numeroComissoes = nil;
FiltroPolitico.numeroComissoesAlterado = false;

FiltroPolitico.numeroProjetos = nil;
FiltroPolitico.numeroProjetosAlterado = false;


function FiltroPolitico:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function FiltroPolitico:getNomeParlamentar()
  return self.nomeParlamentar;
end
function FiltroPolitico:setNomeParlamentar(nomeParlamentar)
  self.nomeParlamentar = nomeParlamentar;
  self.nomeParlamentarAlterado = true;
end

function FiltroPolitico:getRegiao()
	return self.regiao;
end
function FiltroPolitico:setRegiao(regiao)
	self.regiao = regiao;
	self.regiaoAlterado = true;
end

function FiltroPolitico:getEstado()
  return self.estado;
end
function FiltroPolitico:setEstado(estado)
  self.estado = estado;
  self.estadoAlterado = true;
end

function FiltroPolitico:getCidade()
	return self.cidade;
end
function FiltroPolitico:setCidade(cidade)
	self.cidade = cidade;
	self.cidadeAlterado = true;
end

function FiltroPolitico:getCargo()
  return self.cargo;
end
function FiltroPolitico:setCargo(cargo)
  self.cargo = cargo;
  self.cargoAlterado = true;
end

function FiltroPolitico:getPartido()
  return self.partido;
end
function FiltroPolitico:setPartido(partido)
  self.partido = partido;
  self.partidoAlterado = true;
end



function FiltroPolitico:getId()
  return self.id;
end
function FiltroPolitico:setId(id)
  self.id = id;
  self.idAlterado = true;
end

function FiltroPolitico:getNomeCompleto()
	return self.nomeCompleto;
end
function FiltroPolitico:setNomeCompleto(nomeCompleto)
	self.nomeCompleto = nomeCompleto;
	self.nomeCompletoAlterado = true;
end

function FiltroPolitico:getIdade()
  return self.idade;
end
function FiltroPolitico:setIdade(idade)
  self.idade = idade;
  self.idadeAlterado = true;
end

function FiltroPolitico:getOcupacao()
  return self.ocupacao;
end
function FiltroPolitico:setOcupacao(ocupacao)
  self.ocupacao = ocupacao;
  self.ocupacaoAlterado = true;
end

function FiltroPolitico:getReeleicao()
  return self.reeleicao;
end
function FiltroPolitico:setReeleicao(reeleicao)
  self.reeleicao = reeleicao;
  self.reeleicaoAlterado = true;
end

function FiltroPolitico:getTotalBensDeclarados()
  return self.totalBensDeclarados;
end
function FiltroPolitico:setTotalBensDeclarados(totalBensDeclarados)
  self.totalBensDeclarados = totalBensDeclarados;
  self.totalBensDeclaradosAlterado = true;
end

function FiltroPolitico:getTotalDoacoesRecebidas()
  return self.totalDoacoesRecebidas;
end
function FiltroPolitico:setTotalDoacoesRecebidas(totalDoacoesRecebidas)
  self.totalDoacoesRecebidas = totalDoacoesRecebidas;
  self.totalDoacoesRecebidasAlterado = true;
end

function FiltroPolitico:getMandato()
	return self.mandato;
end
function FiltroPolitico:setMandato(mandato)
	self.mandato = mandato;
	self.mandatoAlterado = true;
end

function FiltroPolitico:getSexo()
	return self.sexo;
end
function FiltroPolitico:setSexo(sexo)
	self.sexo = sexo;
	self.sexoAlterado = true;
end

function FiltroPolitico:getTelefone()
	return self.telefone;
end
function FiltroPolitico:setTelefone(telefone)
	self.telefone = telefone;
	self.telefoneAlterado = true;
end

function FiltroPolitico:getEmail()
	return self.email;
end
function FiltroPolitico:setEmail(email)
	self.email = email;
	self.emailAlterado = true;
end

function FiltroPolitico:getNascimento()
	return self.nascimento;
end
function FiltroPolitico:setNascimento(nascimento)
	self.nascimento = nascimento;
	self.nascimentoAlterado = true;
end

function FiltroPolitico:getFaixaEtaria()
  return self.faixaEtaria;
end
function FiltroPolitico:setFaixaEtaria(faixaEtaria)
  self.faixaEtaria = faixaEtaria;
  self.faixaEtariaAlterado = true;
end

function FiltroPolitico:getEscolaridade()
  return self.escolaridade;
end
function FiltroPolitico:setEscolaridade(escolaridade)
  self.escolaridade = escolaridade;
  self.escolaridadeAlterado = true;
end

function FiltroPolitico:getSituacao()
  return self.situacao;
end
function FiltroPolitico:setSituacao(situacao)
  self.situacao = situacao;
  self.situacaoAlterado = true;
end

function FiltroPolitico:getNumeroMandatos()
  return self.numeroMandatos;
end
function FiltroPolitico:setNumeroMandatos(numeroMandatos)
  self.numeroMandatos = numeroMandatos;
  self.numeroMandatosAlterado = true;
end

function FiltroPolitico:getGastoTotal()
	return self.gastoTotal;
end
function FiltroPolitico:setGastoTotal(gastoTotal)
	self.gastoTotal = gastoTotal;
	self.gastoTotalAlterado = true;
end

function FiltroPolitico:getGastoPorDia()
	return self.gastoPorDia;
end
function FiltroPolitico:setGastoPorDia(gastoPorDia)
	self.gastoPorDia = gastoPorDia;
	self.gastoPorDiaAlterado = true;
end

function FiltroPolitico:getAssiduidade()
  return self.assiduidade;
end
function FiltroPolitico:setAssiduidade(assiduidade)
  self.assiduidade = assiduidade;
  self.assiduidadeAlterado = true;
end

function FiltroPolitico:getNumeroComissoes()
  return self.numeroComissoes;
end
function FiltroPolitico:setNumeroComissoes(numeroComissoes)
  self.numeroComissoes = numeroComissoes;
  self.numeroComissoesAlterado = true;
end

function FiltroPolitico:getNumeroProjetos()
  return self.numeroProjetos;
end
function FiltroPolitico:setNumeroProjetos(numeroProjetos)
  self.numeroProjetos = numeroProjetos;
  self.numeroProjetosAlterado = true;
end



function FiltroPolitico:limparCaracteristicas()

  self.sexo = nil;
  self.sexoAlterado = false;
	
end



function FiltroPolitico:toParams()

	local params = {};
	
	if (self.regiaoAlterado) then
		params.regiao = self.regiao;
	end
	
	if (self.cidadeAlterado) then
		params.cidade = self.cidade;
	end
	
	if (self.estadoAlterado) then
		params.estado = self.estado;
	end
	
	if (self.nomeParlamentarAlterado) then
		params.nomeParlamentar = self.nomeParlamentar;
	end
	
	if (self.nomeCompletoAlterado) then
		params.nomeCompleto = self.nomeCompleto;
	end
	
	if (self.cargoAlterado) then
		params.cargo = self.cargo;
	end
	
	if (self.partidoAlterado) then
		params.partido = self.partido;
	end
	
	if (self.mandatoAlterado) then
		params.mandato = self.mandato;
	end
	
	if (self.sexoAlterado) then
		params.sexo = self.sexo;
	end
	
	if (self.telefoneAlterado) then
		params.telefone = self.telefone;
	end
	
	if (self.emailAlterado) then
		params.email = self.email;
	end
	
	if (self.nascimentoAlterado) then
		params.nascimento = self.nascimento;
	end
	
	if (self.gastoTotalAlterado) then
		params.gastoTotal = self.gastoTotal;
	end
	
	if (self.gastoPorDiaAlterado) then
		params.gastoPorDia = self.gastoPorDia;
	end
	
	return params;
	
end