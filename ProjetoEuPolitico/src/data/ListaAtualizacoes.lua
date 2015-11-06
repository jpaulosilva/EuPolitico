ListaAtualizacoes = {}
ListaAtualizacoes.atualizacoes = {};

function ListaAtualizacoes:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function ListaAtualizacoes:getAtualizacoes()
	return self.atualizacoes;
end