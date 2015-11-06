Politico = {};

Politico.nome = nil;
Politico.idade = nil;
Politico.sexo = nil;
Politico.escolaridade = nil;
Politico.partido = nil;
Politico.cargo = nil;
Politico.regiao = nil;
Politico.estado = nil;
Politico.cidade = nil;
Politico.ocupacao = nil;
Politico.reeleicao = nil;
Politico.totalBensDeclarados = nil;
Politico.totalDoacoesRecebidas = nil;

function Politico:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function Politico:getNome()
  return self.nome;
end
function Politico:setNome(nome)
  self.nome = nome;
end

function Politico:getIdade()
  return self.idade;
end
function Politico:setIdade(idade)
  self.idade = idade;
end

function Politico:getSexo()
  return self.sexo;
end
function Politico:setSexo(sexo)
  self.sexo = sexo;
end

function Politico:getEscolaridade()
  return self.escolaridade;
end
function Politico:setEscolaridade(escolaridade)
  self.escolaridade = escolaridade;
end

function Politico:getPartido()
  return self.partido;
end
function Politico:setPartido(partido)
  self.partido = partido;
end

function Politico:getCargo()
  return self.cargo;
end
function Politico:setCargo(cargo)
  self.cargo = cargo;
end

function Politico:getRegiao()
  return self.regiao;
end
function Politico:setRegiao(regiao)
  self.regiao = regiao;
end

function Politico:getEstado()
  return self.estado;
end
function Politico:setEstado(estado)
  self.estado = estado;
end

function Politico:getCidade()
  return self.cidade;
end
function Politico:setCidade(cidade)
  self.cidade = cidade;
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