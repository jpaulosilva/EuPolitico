Candidato = {};

Candidato.idade = nil;
Candidato.partido = nil;
Candidato.regiao = nil;
Candidato.estado = nil;
Candidato.cidade = nil;
Candidato.ocupacao = nil;
Candidato.reeleicao = nil;


Candidato.id = nil;
Candidato.estado = nil;
Candidato.nomeCargo = nil;
Candidato.nomeParlamentar = nil;
Candidato.nomeCompleto = nil;
Candidato.numero = nil;
Candidato.nomeSitCandidatura = nil;
Candidato.siglaPartido = nil;
Candidato.nomePartido = nil;
Candidato.codLegenda = nil;
Candidato.nomeLegenda = nil;
Candidato.composicaoLegenda = nil;
Candidato.sexo = nil;
Candidato.nomeRaca = nil;
Candidato.nomeOcupacao = nil;
Candidato.nomeEscolaridade = nil;
Candidato.municipioNascimento = nil;
Candidato.estadoNascimento = nil;
Candidato.totalBens = nil;
Candidato.totalArrecadado = nil;
Candidato.ehParlamentarAtual = nil;
Candidato.cargoParlamentarAtual = nil;
Candidato.codParlamentarAtual = nil;


function Candidato:new(o)
	o = o or {}
	setmetatable (o, self)
	self.__index = self
	return o
end



function Candidato:getRegiao()
  return self.regiao;
end
function Candidato:setRegiao(regiao)
  self.regiao = regiao;
end

function Candidato:getCidade()
  return self.cidade;
end
function Candidato:setCidade(cidade)
  self.cidade = cidade;
end

function Candidato:getOcupacao()
  return self.ocupacao;
end
function Candidato:setOcupacao(ocupacao)
  self.ocupacao = ocupacao;
end

function Candidato:getReeleicao()
  return self.reeleicao;
end
function Candidato:setReeleicao(reeleicao)
  self.reeleicao = reeleicao;
end



function Candidato:getId()
  return self.id;
end
function Candidato:setId(id)
  self.id = id;
end

function Candidato:getEstado()
  return self.estado;
end
function Candidato:setEstado(estado)
  self.estado = estado;
end

function Candidato:getNomeCargo()
	return self.nomeCargo;
end
function Candidato:setNomeCargo(nomeCargo)
	self.nomeCargo = nomeCargo;
end

function Candidato:getNomeParlamentar()
  return self.nomeParlamentar;
end
function Candidato:setNomeParlamentar(nomeParlamentar)
  self.nomeParlamentar = nomeParlamentar;
end

function Candidato:getNomeCompleto()
  return self.nomeCompleto;
end
function Candidato:setNomeCompleto(nomeCompleto)
  self.nomeCompleto = nomeCompleto;
end

function Candidato:getNumero()
  return self.numero;
end
function Candidato:setNumero(numero)
  self.numero = numero;
end

function Candidato:getNomeSitCandidatura()
  return self.nomeSitCandidatura;
end
function Candidato:setNomeSitCandidatura(nomeSitCandidatura)
  self.nomeSitCandidatura = nomeSitCandidatura;
end

function Candidato:getSiglaPartido()
  return self.siglaPartido;
end
function Candidato:setSiglaPartido(siglaPartido)
  self.siglaPartido = siglaPartido;
end

function Candidato:getNomePartido()
  return self.nomePartido;
end
function Candidato:setNomePartido(nomePartido)
  self.nomePartido = nomePartido;
end

function Candidato:getCodLegenda()
  return self.codLegenda;
end
function Candidato:setCodLegenda(codLegenda)
  self.codLegenda = codLegenda;
end

function Candidato:getNomeLegenda()
  return self.nomeLegenda;
end
function Candidato:setNomeLegenda(nomeLegenda)
  self.nomeLegenda = nomeLegenda;
end

function Candidato:getComposicaoLegenda()
  return self.composicaoLegenda;
end
function Candidato:setComposicaoLegenda(composicaoLegenda)
  self.composicaoLegenda = composicaoLegenda;
end

function Candidato:getSexo()
  return self.sexo;
end
function Candidato:setSexo(sexo)
  self.sexo = sexo;
end

function Candidato:getNomeRaca()
  return self.nomeRaca;
end
function Candidato:setNomeRaca(nomeRaca)
  self.nomeRaca = nomeRaca;
end

function Candidato:getNomeOcupacao()
  return self.nomeOcupacao;
end
function Candidato:setNomeOcupacao(nomeOcupacao)
  self.nomeOcupacao = nomeOcupacao;
end

function Candidato:getNomeEscolaridade()
  return self.nomeEscolaridade;
end
function Candidato:setNomeEscolaridade(nomeEscolaridade)
  self.nomeEscolaridade = nomeEscolaridade;
end

function Candidato:getIdade()
	return self.idade;
end
function Candidato:setIdade(idade)
	self.idade = idade;
end

function Candidato:getMunicipioNascimento()
  return self.municipioNascimento;
end
function Candidato:setMunicipioNascimento(municipioNascimento)
  self.municipioNascimento = municipioNascimento;
end

function Candidato:getEstadoNascimento()
  return self.estadoNascimento;
end
function Candidato:setEstadoNascimento(estadoNascimento)
  self.estadoNascimento = estadoNascimento;
end

function Candidato:getTotalBens()
  return self.totalBens;
end
function Candidato:setTotalBens(totalBens)
  self.totalBens = totalBens;
end

function Candidato:getTotalArrecadado()
  return self.totalArrecadado;
end
function Candidato:setTotalArrecadado(totalArrecadado)
  self.totalArrecadado = totalArrecadado;
end

function Candidato:getEhParlamentarAtual()
  return self.ehParlamentarAtual;
end
function Candidato:setEhParlamentarAtual(ehParlamentarAtual)
  self.ehParlamentarAtual = ehParlamentarAtual;
end

function Candidato:getCargoParlamentarAtual()
  return self.cargoParlamentarAtual;
end
function Candidato:setCargoParlamentarAtual(cargoParlamentarAtual)
  self.cargoParlamentarAtual = cargoParlamentarAtual;
end

function Candidato:getCodParlamentarAtual()
  return self.codParlamentarAtual;
end
function Candidato:setCodParlamentarAtual(codParlamentarAtual)
  self.codParlamentarAtual = codParlamentarAtual;
end



