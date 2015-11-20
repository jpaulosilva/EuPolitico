Politico = {};

Politico.idade = nil;
Politico.escolaridade = nil;

Politico.ocupacao = nil;
Politico.reeleicao = nil;
Politico.totalBensDeclarados = nil;
Politico.totalDoacoesRecebidas = nil;

Politico.id = nil;
Politico.regiao = nil;
Politico.cidade = nil;
Politico.nomeParlamentar = nil;
Politico.nomeCompleto = nil;
Politico.cargo = nil;
Politico.partido = nil;
Politico.mandato = nil;
Politico.sexo = nil;
Politico.uf = nil;
Politico.telefone = nil;
Politico.email = nil;
Politico.nascimento = nil;
Politico.gastoTotal = nil;
Politico.gastoPorDia = nil;

function Politico:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function Politico:getId()
	return self.id;
end
function Politico:setId(id)
	self.id = id;
end

function Politico:getRegiao()
  return self.regiao;
end
function Politico:setRegiao(regiao)
  self.regiao = regiao;
end

function Politico:getCidade()
  return self.cidade;
end
function Politico:setCidade(cidade)
  self.cidade = cidade;
end

function Politico:getNomeParlamentar()
  return self.nomeParlamentar;
end
function Politico:setNomeParlamentar(nomeParlamentar)
  self.nomeParlamentar = nomeParlamentar;
end

function Politico:getNomeCompleto()
	return self.nomeCompleto;
end
function Politico:setNomeCompleto(nomeCompleto)
	self.nomeCompleto = nomeCompleto;
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

function Politico:getUf()
	return self.uf;
end
function Politico:setUf(uf)
	self.uf = uf;
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




function Politico:getIdade()
  return self.idade;
end
function Politico:setIdade(idade)
  self.idade = idade;
end

function Politico:getEscolaridade()
  return self.escolaridade;
end
function Politico:setEscolaridade(escolaridade)
  self.escolaridade = escolaridade;
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