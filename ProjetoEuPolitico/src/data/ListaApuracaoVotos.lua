ListaApuracaoVotos = {}
ListaApuracaoVotos.apuracaoVotos = {};

function ListaApuracaoVotos:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function ListaApuracaoVotos:getApuracaoVotos()
	return self.apuracaoVotos;
end