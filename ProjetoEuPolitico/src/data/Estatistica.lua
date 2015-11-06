Estatistica = {};

Estatistica.regiao = nil;
Estatistica.estado = nil;
Estatistica.cidade = nil;
Estatistica.faixaEtaria = nil;
Estatistica.escolaridadeEnsMedio = nil;
Estatistica.escolaridadeEnsSuperior = nil;
Estatistica.altaRenda = nil;
Estatistica.baixaRenda = nil;

function Estatistica:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function Estatistica:getRegiao()
	return self.regiao;
end
function Estatistica:setRegiao(regiao)
	self.regiao = regiao;
end

function Estatistica:getEstado()
	return self.estado;
end
function Estatistica:setEstado(estado)
	self.estado = estado;
end

function Estatistica:getCidade()
	return self.cidade;
end
function Estatistica:setCidade(cidade)
	self.cidade = cidade;
end

function Estatistica:getFaixaEtaria()
	return self.faixaEtaria;
end
function Estatistica:setFaixaEtaria(faixaEtaria)
	self.faixaEtaria = faixaEtaria;
end

function Estatistica:getEscolaridadeEnsMedio()
	return self.escolaridadeEnsMedio;
end
function Estatistica:setEscolaridadeEnsMedio(escolaridadeEnsMedio)
	self.escolaridadeEnsmedio = escolaridadeEnsMedio;
end

function Estatistica:getEscolaridadeEnsSuperior()
	return self.escolaridadeEnsSuperior;
end
function Estatistica:setEscolaridadeEnsSuperior(escolaridadeEnsSuperior)
	self.escolaridadeEnsSuperior = escolaridadeEnsSuperior;
end

function Estatistica:getAltaRenda()
	return self.altaRenda;
end
function Estatistica:setAltaRenda(altaRenda)
	self.altaRenda = altaRenda;
end

function Estatistica:getBaixaRenda()
	return self.baixaRenda;
end
function Estatistica:setBaixaRenda(baixaRenda)
	return self.baixaRenda;
end