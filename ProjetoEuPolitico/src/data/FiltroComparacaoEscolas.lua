FiltroComparacaoEscolas = {};

FiltroComparacaoEscolas.codEscola = nil;
FiltroComparacaoEscolas.codEscolaAlterado = false;
FiltroComparacaoEscolas.pais = nil;
FiltroComparacaoEscolas.paisAlterado = false;
FiltroComparacaoEscolas.regiao = nil;
FiltroComparacaoEscolas.regiaoAlterado = false;
FiltroComparacaoEscolas.estado = nil;
FiltroComparacaoEscolas.estadoAlterado = false;
FiltroComparacaoEscolas.cidade = nil;
FiltroComparacaoEscolas.cidadeAlterado = false;


function FiltroComparacaoEscolas:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function FiltroComparacaoEscolas:getCodEscola()
  return self.codEscola;
end

function FiltroComparacaoEscolas:setCodEscola(codEscola)
  self.codEscola = codEscola;
end


function FiltroComparacaoEscolas:getPais()
  return self.pais;
end

function FiltroComparacaoEscolas:setPais(pais)
  self.pais = pais;
  self.paisalterado = true;
end


function FiltroComparacaoEscolas:getRegiao()
  return self.regiao;
end

function FiltroComparacaoEscolas:setRegiao(regiao)
  self.regiao = regiao;
  self.regiaoAlterado = true;
end

function FiltroComparacaoEscolas:getEstado()
  return self.estado;
end

function FiltroComparacaoEscolas:setEstado(Estado)
  self.estado = Estado;
  self.estadoAlterado = true;
end

function FiltroComparacaoEscolas:getCidade()
  return self.cidade;
end

function FiltroComparacaoEscolas:setCidade(cidade)
  self.cidade = cidade;
  self.cidadeAlterado = true;
end




function FiltroComparacaoEscolas:toParams()

  local params = {};

  if (self.codEscolaAlterado) then
    params.codEscola = self.codEscola;
  end


  if (self.paisAlterado) then
    params.pais = self.pais;

  end

  if (self.regiaoAlterado) then
    params.regiao = self.regiao;

  end

  if (self.estadoAlterado) then
    params.estado = self.estado;

  end

  if (self.cidadeAlterado) then
    params.cidade = self.cidade;

  end


  return params;

end
