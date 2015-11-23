FiltroEstatisticasRegiao = {};
FiltroEstatisticasRegiao.pais = nil;
FiltroEstatisticasRegiao.paisAlterado = false;
FiltroEstatisticasRegiao.regiaoGeografica = nil;
FiltroEstatisticasRegiao.regiaoGeograficaAlterado = false;
FiltroEstatisticasRegiao.estado = nil;
FiltroEstatisticasRegiao.estadoAlterado = false;
FiltroEstatisticasRegiao.cidade = nil;
FiltroEstatisticasRegiao.cidadeAlterado = false;

FiltroEstatisticasRegiao.tipoLocal = nil;
FiltroEstatisticasRegiao.tipoLocalAlterado = false;

function FiltroEstatisticasRegiao:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function FiltroEstatisticasRegiao:getTipoLocal()
  return self.tipoLocal;
end

function FiltroEstatisticasRegiao:setTipoLocal(tipoLocal)
  self.tipoLocal = tipoLocal;
  self.tipoLocalAlterado = true;
end


function FiltroEstatisticasRegiao:getPais()
  return self.pais;
end

function FiltroEstatisticasRegiao:setPais(pais)
  self.pais = pais;
  self.paisAlterado = true;
end


function FiltroEstatisticasRegiao:getRegiaoGeografica()
  return self.regiaoGeografica;
end

function FiltroEstatisticasRegiao:setRegiaoGeografica(regiaoGeografica)
  self.regiaoGeografica = regiaoGeografica;
  self.regiaoGeograficaAlterado = true;
end

function FiltroEstatisticasRegiao:getEstado()
  return self.estado;
end

function FiltroEstatisticasRegiao:setEstado(Estado)
  self.estado = Estado;
  self.estadoAlterado = true;
end

function FiltroEstatisticasRegiao:getCidade()
  return self.cidade;
end

function FiltroEstatisticasRegiao:setCidade(cidade)
  self.cidade = cidade;
  self.cidadeAlterado = true;
end




function FiltroEstatisticasRegiao:toParams()

  local params = {};


  if (self.tipoLocal == "NAC") then
    params.tipoLocal="NAC";
    params.nomeLocal="Brasil";
  elseif (self.tipoLocal == "REG") then
    params.tipoLocal="REG";
    params.nomeLocal=self.regiaoGeografica;
  elseif (self.tipoLocal == "EST") then
    params.tipoLocal="EST";
    params.nomeLocal=self.estado;
  elseif (self.tipoLocal == "MUN") then
    params.codMunicipio = self.cidade
  end

  return params;

end
