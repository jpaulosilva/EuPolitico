ListaPesquisaEleitoral = {}
ListaPesquisaEleitoral.pesquisaEleitoral = {};

function ListaPesquisaEleitoral:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function ListaPesquisaEleitoral:getPesquisaEleitoral()
	return self.pesquisaEleitoral;
end