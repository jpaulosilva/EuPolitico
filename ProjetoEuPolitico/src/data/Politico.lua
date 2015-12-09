Politico = {};

--Características Simples
Politico.nomeParlamentar = nil;
Politico.regiao = nil;
Politico.uf = nil;
Politico.cidade = nil;
Politico.cargo = nil;
Politico.partido = nil;

--Características Avançadas
Politico.id = nil;
Politico.nomeCompleto = nil;
Politico.idade = nil;
Politico.ocupacao = nil;
Politico.reeleicao = nil;
Politico.totalBensDeclarados = nil;
Politico.totalDoacoesRecebidas = nil;
Politico.mandato = nil;
Politico.sexo = nil;
Politico.telefone = nil;
Politico.email = nil;
Politico.nascimento = nil;
Politico.faixaEtaria = nil;
Politico.escolaridade = nil;
Politico.situacao = nil;
Politico.numeroMandatos = nil;
Politico.gastoTotal = nil;
Politico.gastoPorDia = nil;
Politico.assiduidade = nil;
Politico.numeroComissoes = nil;
Politico.numeroProjetos = nil;

function Politico:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function Politico:getNomeParlamentar()
  return self.nomeParlamentar;
end
function Politico:setNomeParlamentar(nomeParlamentar)
  self.nomeParlamentar = nomeParlamentar;
end

function Politico:getRegiao()
  return self.regiao;
end
function Politico:setRegiao(regiao)
  self.regiao = regiao;
end

function Politico:getUf()
  return self.uf;
end
function Politico:setUf(uf)
  self.uf = uf;
end

function Politico:getCidade()
  return self.cidade;
end
function Politico:setCidade(cidade)
  self.cidade = cidade;
end

function Politico:getCargo()
  return self.cargo;
end
function Politico:setCargo(cargo)
  self.cargo = cargo;
end

function Politico:getPartido()
  return self.partido;
end
function Politico:setPartido(partido)
  self.partido = partido;
end



function Politico:getId()
  return self.id;
end
function Politico:setId(id)
  self.id = id;
end

function Politico:getNomeCompleto()
	return self.nomeCompleto;
end
function Politico:setNomeCompleto(nomeCompleto)
	self.nomeCompleto = nomeCompleto;
end

function Politico:getIdade()
  return self.idade;
end
function Politico:setIdade(idade)
  self.idade = idade;
end

function Politico:getOcupacao()
  return self.ocupacao;
end
function Politico:setOcupacao(ocupacao)
  self.ocupacao = ocupacao;
end

function Politico:getReeleicao()
  return self.reeleicao;
end
function Politico:setReeleicao(reeleicao)
  self.reeleicao = reeleicao;
end

function Politico:getTotalBensDeclarados()
  return self.totalBensDeclarados;
end
function Politico:setTotalBensDeclarados(totalBensDeclarados)
  self.totalBensDeclarados = totalBensDeclarados;
end

function Politico:getTotalDoacoesRecebidas()
  return self.totalDoacoesRecebidas;
end
function Politico:setTotalDoacoesRecebidas(totalDoacoesRecebidas)
  self.totalDoacoesRecebidas = totalDoacoesRecebidas;
end

function Politico:getMandato()
	return self.mandato;
end
function Politico:setMandato(mandato)
	self.mandato = mandato;
end

function Politico:getSexo()
  return self.sexo;
end
function Politico:setSexo(sexo)
  self.sexo = sexo;
end

function Politico:getTelefone()
	return self.telefone;
end
function Politico:setTelefone(telefone)
	self.telefone = telefone;
end

function Politico:getEmail()
	return self.email;
end
function Politico:setEmail(email)
	self.email = email;
end

function Politico:getNascimento()
	return self.nascimento;
end
function Politico:setNascimento(nascimento)
	self.nascimento = nascimento;
end

function Politico:getFaixaEtaria()
  return self.faixaEtaria;
end
function Politico:setFaixaEtaria(faixaEtaria)
  self.faixaEtaria = faixaEtaria;
end

function Politico:getEscolaridade()
  return self.escolaridade;
end
function Politico:setEscolaridade(escolaridade)
  self.escolaridade = escolaridade;
end

function Politico:getSituacao()
  return self.situacao;
end
function Politico:setSituacao(situacao)
  self.situacao = situacao;
end

function Politico:getNumeroMandatos()
  return self.numeroMandatos;
end
function Politico:setNumeroMandatos(numeroMandatos)
  self.numeroMandatos = numeroMandatos;
end

function Politico:getGastoTotal()
	return self.gastoTotal;
end
function Politico:setGastoTotal(gastoTotal)
	self.gastoTotal = gastoTotal;
end

function Politico:getGastoPorDia()
	return self.gastoPorDia;
end
function Politico:setGastoPorDia(gastoPorDia)
	self.gastoPorDia = gastoPorDia;
end

function Politico:getAssiduidade()
  return self.assiduidade;
end
function Politico:setAssiduidade(assiduidade)
  self.assiduidade = assiduidade;
end

function Politico:getNumeroComissoes()
  return self.numeroComissoes;
end
function Politico:setNumeroComissoes(numeroComissoes)
  self.numeroComissoes = numeroComissoes;
end

function Politico:getNumeroProjetos()
  return self.numeroProjetos;
end
function Politico:setNumeroProjetos(numeroProjetos)
  self.numeroProjetos = numeroProjetos;
end








