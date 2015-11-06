ApuracaoVotos = {};

ApuracaoVotos.regiao = nil;
ApuracaoVotos.estado = nil;
ApuracaoVotos.cidade = nil;
ApuracaoVotos.cargo = nil;
ApuracaoVotos.ano = nil;
ApuracaoVotos.nomeCandidato = nil;
ApuracaoVotos.numeroCandidato = nil;
ApuracaoVotos.numeroVotos = nil;
ApuracaoVotos.porcentagemVotos = nil;

function ApuracaoVotos:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function ApuracaoVotos:getRegiao()
  return self.regiao;
end
function ApuracaoVotos:setRegiao(regiao)
  self.regiao = regiao;
end

function ApuracaoVotos:getEstado()
  return self.estado;
end
function ApuracaoVotos:setEstado(estado)
  self.estado = estado;
end

function ApuracaoVotos:getCidade()
  return self.cidade;
end
function ApuracaoVotos:setCidade(cidade)
  self.cidade = cidade;
end

function ApuracaoVotos:getCargo()
  return self.cargo;
end
function ApuracaoVotos:setCargo(cargo)
  self.cargo = cargo;
end

function ApuracaoVotos:getAno()
	return self.ano;
end
function ApuracaoVotos:setAno(ano)
	self.ano = ano;
end

function ApuracaoVotos:getNomeCandidato()
	return self.nomeCandidato;
end
function ApuracaoVotos:setNomeCandidato(nomeCandidato)
	self.nomeCandidato = nomeCandidato;
end

function ApuracaoVotos:getNumeroVotos()
	return self.numeroVotos;
end
function ApuracaoVotos:setNumeroVotos(numeroVotos)
	self.numeroVotos = numeroVotos;
end

function ApuracaoVotos:getPorcentagemVotos()
	return self.porcentagemVotos;
end
function ApuracaoVotos:setPorcentagemVotos(porcentagemVotos)
	self.porcentagemVotos = porcentagemVotos;
end