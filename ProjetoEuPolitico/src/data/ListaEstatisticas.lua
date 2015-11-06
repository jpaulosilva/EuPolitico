ListaEstatisticas = {}
ListaEstatisticas.estatisticas = {};

function ListaEstatisticas:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function ListaEstatisticas:getEstatisticas()
	return self.estatisticas;
end