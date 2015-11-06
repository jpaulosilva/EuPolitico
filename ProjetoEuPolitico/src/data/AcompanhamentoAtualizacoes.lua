AcompanhamentoAtualizacoes = {};

AcompanhamentoAtualizacoes.politicoAcompanhado = nil;
AcompanhamentoAtualizacoes.estado = nil;
AcompanhamentoAtualizacoes.cidade = nil;
AcompanhamentoAtualizacoes.cargo = nil;
AcompanhamentoAtualizacoes.pauta = nil;
AcompanhamentoAtualizacoes.tipo = nil;

function AcompanhamentoAtualizacoes:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function AcompanhamentoAtualizacoes:getPoliticoAcompanhado()
	return self.politicoAcompanhado;
end
function AcompanhamentoAtualizacoes:setPoliticoAcompanhado(politicoAcompanhado)
	self.politicoAcompanhado = politicoAcompanhado;
end

function AcompanhamentoAtualizacoes:getEstado()
	return self.estado;
end
function AcompanhamentoAtualizacoes:setEstado(estado)
	self.estado = estado;
end

function AcompanhamentoAtualizacoes:getCidade()
	return self.cidade;
end
function AcompanhamentoAtualizacoes:setCidade(cidade)
	self.cidade = cidade;
end

function AcompanhamentoAtualizacoes:getCargo()
	return self.cargo;
end
function AcompanhamentoAtualizacoes:setCargo(cargo)
	self.cargo = cargo;
end

function AcompanhamentoAtualizacoes:getPauta()
	return self.pauta;
end
function AcompanhamentoAtualizacoes:setPauta(pauta)
	self.pauta = pauta;
end

function AcompanhamentoAtualizacoes:getTipo()
	return self.tipo;
end
function AcompanhamentoAtualizacoes:setTipo(tipo)
	self.tipo = tipo;
end