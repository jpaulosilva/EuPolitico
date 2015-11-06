ListaCandidatos = {}
ListaCandidatos.candidatos = {};

function ListaCandidatos:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function ListaCandidatos:getCandidatos()
	return self.candidatos;
end