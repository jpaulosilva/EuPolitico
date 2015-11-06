Candidato = {};

Candidato.nome = nil;
Candidato.idade = nil;
Candidato.sexo = nil;
Candidato.escolaridade = nil;
Candidato.partido = nil;
Candidato.cargo = nil;
Candidato.regiao = nil;
Candidato.estado = nil;
Candidato.cidade = nil;
Candidato.ocupacao = nil;
Candidato.reeleicao = nil;
Candidato.totalBensDeclarados = nil;
Candidato.totalDoacoesRecebidas = nil;

function Candidato:new(o)
	o = o or {}
	setmetatable (o, self)
	self.__index = self
	return o
end


function Candidato:getNome()
	return self.nome;
end
function Candidato:setNome(nome)
	self.nome = nome;
end

function Candidato:getIdade()
	return self.idade;
end
function Candidato:setIdade(idade)
	self.idade = idade;
end

function Candidato:getSexo()
	return self.sexo;
end
function Candidato:setSexo(sexo)
	self.sexo = sexo;
end

function Candidato:getEscolaridade()
	return self.escolaridade;
end
function Candidato:setEscolaridade(escolaridade)
	self.escolaridade = escolaridade;
end

function Candidato:getPartido()
	return self.partido;
end
function Candidato:setPartido(partido)
	self.partido = partido;
end

function Candidato:getCargo()
	return self.cargo;
end
function Candidato:setCargo(cargo)
	self.cargo = cargo;
end

function Candidato:getRegiao()
	return self.regiao;
end
function Candidato:setRegiao(regiao)
	self.regiao = regiao;
end

function Candidato:getEstado()
	return self.estado;
end
function Candidato:setEstado(estado)
	self.estado = estado;
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

function Candidato:getTotalBensDeclarados()
	return self.totalBensDeclarados;
end
function Candidato:setTotalBensDeclarados(totalBensDeclarados)
	self.totalBensDeclarados = totalBensDeclarados;
end