PesquisaEleitoral = {};

PesquisaEleitoral.regiao = nil;
PesquisaEleitoral.estado = nil;
PesquisaEleitoral.cidade = nil;
PesquisaEleitoral.cargo = nil;
PesquisaEleitoral.candidato = nil;
PesquisaEleitoral.porcentagemVotos = nil;

function PesquisaEleitoral:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function PesquisaEleitoral:getRegiao()
  return self.regiao;
end
function PesquisaEleitoral:setRegiao(regiao)
  self.regiao = regiao;
end

function PesquisaEleitoral:getEstado()
  return self.estado;
end
function PesquisaEleitoral:setEstado(estado)
  self.estado = estado;
end

function PesquisaEleitoral:getCidade()
  return self.cidade;
end
function PesquisaEleitoral:setCidade(cidade)
  self.cidade = cidade;
end

function PesquisaEleitoral:getCargo()
	return self.cargo;
end
function PesquisaEleitoral:setCargo(cargo)
	self.cargo = cargo;
end

function PesquisaEleitoral:getCandidato()
	return self.candidato;
end
function PesquisaEleitoral:setCandidato(candidato)
	self.candidato = candidato;
end

function PesquisaEleitoral:getPorcentagemVotos()
	return self.porcentagemVotos;
end
function PesquisaEleitoral:setPorcentagemVotos(porcentagemVotos)
	self.porcentagemVotos = porcentagemVotos;
end