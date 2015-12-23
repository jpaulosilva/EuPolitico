FiltroCandidato = {}

--Características Simples
FiltroCandidato.nomeParlamentar = nil;
FiltroCandidato.nomeParlamentarAlterado = false;

FiltroCandidato.regiao = nil;
FiltroCandidato.regiaoAlterado = false;

FiltroCandidato.estado = nil;
FiltroCandidato.estadoAlterado = false;

FiltroCandidato.cidade = nil;
FiltroCandidato.cidadeAlterado = false;

FiltroCandidato.nomeCargo = nil;
FiltroCandidato.nomeCargoAlterado = false;

FiltroCandidato.nomePartido = nil;
FiltroCandidato.nomePartidoAlterado = false;



--Características Avançadas
FiltroCandidato.id = nil;
FiltroCandidato.idAlterado = false;

FiltroCandidato.nomeCompleto = nil;
FiltroCandidato.nomeCompletoAlterado = false;

FiltroCandidato.numero = nil;
FiltroCandidato.numeroAlterado = false;

FiltroCandidato.nomeSitCandidatura = nil;
FiltroCandidato.nomeSitCandidaturaAlterado = false;

FiltroCandidato.siglaPartido= nil;
FiltroCandidato.siglaPartidoAlterado = false;


FiltroCandidato.reeleicao = nil;
FiltroCandidato.reeleicaoAlterado = false;


FiltroCandidato.codLegenda = nil;
FiltroCandidato.codLegendaAlterado = false;

FiltroCandidato.nomeLegenda = nil;
FiltroCandidato.nomeLegendaAlterado = false;

FiltroCandidato.composicaoLegenda = nil;
FiltroCandidato.composicaoLegendaAlterado = false;

FiltroCandidato.sexo = nil;
FiltroCandidato.sexoAlterado = false;

FiltroCandidato.nomeRaca = nil;
FiltroCandidato.nomeRacaAlterado = false;

FiltroCandidato.nomeOcupacao = nil;
FiltroCandidato.nomeOcupacaoAlterado = false;

FiltroCandidato.nomeEscolaridade = nil;
FiltroCandidato.nomeEscolaridadeAlterado = false;

FiltroCandidato.municipioNascimento = nil;
FiltroCandidato.municipioNascimentoAlterado = false;

FiltroCandidato.estadoNascimento = nil;
FiltroCandidato.estadoNascimentoAlterado = false;

FiltroCandidato.totalBens = nil;
FiltroCandidato.totalBensAlterado = false;

FiltroCandidato.totalArrecadado = nil;
FiltroCandidato.totalArrecadadoAlterado = false;

FiltroCandidato.ehParlamentarAtual = nil;
FiltroCandidato.ehParlamentarAtualAlterado = false;

FiltroCandidato.cargoParlamentarAtual = nil;
FiltroCandidato.cargoParlamentarAtualAlterado = false;

FiltroCandidato.codParlamentarAtual = nil;
FiltroCandidato.codParlamentarAtualAlterado = false;

FiltroCandidato.totalGastos = nil;
FiltroCandidato.totalGastosAlterado = false;

FiltroCandidato.numeroPropostas = nil;
FiltroCandidato.numeroPropostasAlterado = false;

FiltroCandidato.numeroProcessosJustica = nil;
FiltroCandidato.numeroProcessosJusticaAlterado = false;


function FiltroCandidato:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function FiltroCandidato:getRegiao()
  return self.regiao;
end
function FiltroCandidato:setRegiao(regiao)
  self.regiao = regiao;
  self.regiaoAlterado = true;
end

function FiltroCandidato:getCidade()
  return self.cidade;
end
function FiltroCandidato:setCidade(cidade)
  self.cidade = cidade;
  self.cidadeAlterado = true;
end

function FiltroCandidato:getEstado()
  return self.estado;
end
function FiltroCandidato:setEstado(estado)
  self.estado = estado;
  self.estadoAlterado = true;
end

function FiltroCandidato:getNomeCargo()
  return self.nomeCargo;
end
function FiltroCandidato:setNomeCargo(nomeCargo)
  self.nomeCargo = nomeCargo;
  self.nomeCargoAlterado = true;
end

function FiltroCandidato:getNomeParlamentar()
  return self.nomeParlamentar;
end
function FiltroCandidato:setNomeParlamentar(nomeParlamentar)
  self.nomeParlamentar = nomeParlamentar;
  self.nomeParlamentarAlterado = true;
end

function FiltroCandidato:getNomeCompleto()
  return self.nomeCompleto;
end
function FiltroCandidato:setNomeCompleto(nomeCompleto)
  self.nomeCompleto = nomeCompleto;
  self.nomeCompletoAlterado = true;
end

function FiltroCandidato:getNumero()
  return self.numero;
end
function FiltroCandidato:setNumero(numero)
  self.numero = numero;
  self.numeroAlterado = true;
end

function FiltroCandidato:getNomeSitCandidatura()
  return self.nomeSituacaoCandidatura;
end
function FiltroCandidato:setNomeSitCandidatura(nomeSitCandidatura)
  self.nomeSitCandidatura = nomeSitCandidatura;
  self.nomeSitCandidaturaAlterado = true;
end

function FiltroCandidato:getSiglaPartido()
  return self.siglaPartido;
end
function FiltroCandidato:setSiglaPartido(siglaPartido)
  self.siglaPartido = siglaPartido;
  self.siglaPartidoAlterado = true;
end

function FiltroCandidato:getReeleicao()
  return self.reeleicao;
end
function FiltroCandidato:setReeleicao(reeleicao)
  self.reeleicao = reeleicao;
  self.reeleicaoAlterado = true;
end

function FiltroCandidato:getNomePartido()
  return self.nomePartido;
end
function FiltroCandidato:setNomePartido(nomePartido)
  self.nomePartido = nomePartido;
  self.nomePartidoAlterado = true;
end

function FiltroCandidato:getCodLegenda()
  return self.codLegenda;
end
function FiltroCandidato:setCodLegenda(codLegenda)
  self.codLegenda = codLegenda;
  self.codLegendaAlterado = true;
end

function FiltroCandidato:getNomeLegenda()
  return self.nomeLegenda;
end
function FiltroCandidato:setNomeLegenda(nomeLegenda)
  self.nomeLegenda = nomeLegenda;
  self.nomeLegendaAlterado = true;
end

function FiltroCandidato:getComposicaoLegenda()
  return self.composicaLegenda;
end
function FiltroCandidato:setComposicaoLegenda(composicaoLegenda)
  self.composicaoLegenda = composicaoLegenda;
  self.composicaoLegendaAlterado = true;
end

function FiltroCandidato:getSexo()
  return self.sexo;
end
function FiltroCandidato:setSexo(sexo)
  self.sexo = sexo;
  self.sexoAlterado = true;
end

function FiltroCandidato:getNomeRaca()
  return self.nomeRaca;
end
function FiltroCandidato:setNomeRaca(nomeRaca)
  self.nomeRaca = nomeRaca;
  self.nomeRacaAlterado = true;
end

function FiltroCandidato:getNomeOpcupacao()
  return self.nomeOcupacao;
end
function FiltroCandidato:setNomeOcupacao(nomeOcupacao)
  self.nomeOcupacao = nomeOcupacao;
  self.nomeOcupacaoAlterado = true;
end

function FiltroCandidato:getNomeEscolaridade()
  return self.nomeEscolaridade;
end
function FiltroCandidato:setNomeEscolaridade(nomeEscolaridade)
  self.nomeEscolaridade = nomeEscolaridade;
  self.nomeEscolaridadeAlterado = true;
end

function FiltroCandidato:getMunicipioNascimento()
  return self.municipioNascimento;
end
function FiltroCandidato:setMunicipioNascimento(municipioNascimento)
  self.municipioNascimento = municipioNascimento;
  self.municipioNascimentoAlterado = true;
end

function FiltroCandidato:getEstadoNascimento()
  return self.estadoNascimento;
end
function FiltroCandidato:setEstadoNascimento(estadoNascimento)
  self.estadoNascimento = estadoNascimento;
  self.estadoNascimentoAlterado = true;
end

function FiltroCandidato:getTotalBens()
  return self.totalBens;
end
function FiltroCandidato:setTotalBens(totalBens)
  self.totalBens = totalBens;
  self.totalBensAlterado = true;
end

function FiltroCandidato:getTotalArrecadado()
  return self.totalArrecadado;
end
function FiltroCandidato:setTotalArrecadado(totalArrecadado)
  self.totalArreacadado = totalArrecadado;
  self.totalArrecadadoAlterado = true;
end

function FiltroCandidato:getEhParlamentarAtual()
  return self.ehParlamentarAtual;
end
function FiltroCandidato:setEhParlamentarAtual(ehParlamentarAtual)
  self.ehParlamentarAtual = ehParlamentarAtual;
  self.ehParlamentarAtualAlterado = true;
end

function FiltroCandidato:getCargoParlamentarAtual()
  return self.cargoParlamentarAtual;
end
function FiltroCandidato:setCargoParlamentarAtual(cargoParlamentarAtual)
  self.cargoParlamentarAtual = cargoParlamentarAtual;
  self.cargoParlamentarAtualAlterado = true;
end


function FiltroCandidato:getCodParlamentarAtual()
  return self.CodParlamentarAtual;
end
function FiltroCandidato:setCodParlamentarAtual(codParlamentarAtual)
  self.codParlamentarAtual = codParlamentarAtual;
  self.codParlamentarAtualAlterado = true;
end

function FiltroCandidato:getTotalGastos()
	return self.totalGastos;
end
function FiltroCandidato:setTotalGastos(totalGastos)
	self.totalGastos = totalGastos;
	self.totalGastosAlterado = true;
end


function FiltroCandidato:getNumeroPropostas()
  return self.numeroPropostas;
end
function FiltroCandidato:setNumeroPropostas(numeroPropostas)
  self.numeroPropostas = numeroPropostas;
  self.numeroPropostasAlterado = true;
end


function FiltroCandidato:getNumeroProcessosJustica()
  return self.numeroProcessosJustica;
end
function FiltroCandidato:setNumeroProcessosJustica(numeroProcessosJustica)
  self.numeroProcessosJustica = numeroProcessosJustica;
  self.numeroProcessosJusticaAlterado = true;
end


function FiltroCandidato:limparCaracteristicas()

  self.sexo = nil;
  self.sexoAlterado = false;
  
end


function FiltroCandidato:toParams()

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
  
  if (self.nomeCargoAlterado) then
    params.nomeCargo = self.nomeCargo;
  end
  
  if (self.nomeParlamentarAlterado) then
    params.nomeParlamentar = self.nomeParlamentar;
  end
  
  if (self.nomeCompletoAlterado) then
    params.nomeCompleto = self.nomeCompleto;
  end
  
  if (self.numeroAlterado) then
    params.numero = self.numero;
  end
  
  if (self.nomeSitCandidaturaAlterado) then
    params.nomeSitCandidatura = self.nomeSitCandidatura;
  end
  
  if (self.siglaPartidoAlterado) then
    params.siglaPartido = self.siglaPartido;
  end
  
  if (self.nomePartidoAlterado) then
    params.nomePartido = self.nomePartido;
  end
  
  if (self.codLegendaAlterado) then
    params.codLegenda = self.codLegenda;
  end
  
  if (self.nomeLegendaAlterado) then
    params.nomeLegenda = self.nomeLegenda;
  end
  
  if (self.composicaoLegendaAlterado) then
    params.composicaoLegenda = self.composicaoLegenda;
  end
  
  if (self.sexoAlterado) then
    params.sexo = self.sexo;
  end
  
  if (self.nomeRacaAlterado) then
    params.nomeRaca = self.nomeRaca;
  end
  
  if (self.nomeOcupacaoAlterado) then
    params.nomeOcupacao = self.nomeOcupacao;
  end  
  
  if (self.nomeEscolaridadeAlterado) then
    params.nomeEscolaridade = self.nomeEscolaridade;
  end  
  
  if (self.municipioNascimentoAlterado) then
    params.municipioNascimento = self.municipioNascimento;
  end  
  
  if (self.estadoNascimentoAlterado) then
    params.estadoNascimento = self.estadoNascimento;
  end  
  
  if (self.totalBensAlterado) then
    params.totalBens = self.totalBens;
  end
  
  if (self.totalArrecadadoAlterado) then
    params.totalArrecadado = self.totalArrecadado;
  end  
  
  if (self.ehParlamentarAtualAlterado) then
    params.ehParlamentarAtual = self.ehParlamentarAtual;
  end
  
  if (self.cargoParlamentarAtualAlterado) then
    params.cargoParlamentarAtual = self.cargoParlamentarAtual;
  end
  
  if (self.codParlamentarAtualAlterado) then
    params.codParlamentarAtual = self.codParlamentarAtual;
  end
  
  
  return params;
  
end