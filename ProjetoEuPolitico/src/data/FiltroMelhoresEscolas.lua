FiltroMelhoresEscolas = {};

FiltroMelhoresEscolas.pais = nil;
FiltroMelhoresEscolas.paisAlterado = false;
FiltroMelhoresEscolas.regiaoGeografica = nil;
FiltroMelhoresEscolas.regiaoGeograficaAlterado = false;
FiltroMelhoresEscolas.estado = nil;
FiltroMelhoresEscolas.estadoAlterado = false;
FiltroMelhoresEscolas.indice = nil;
FiltroMelhoresEscolas.indiceAlterado = false;

FiltroEstatisticasRegiao.tipoLocal = nil;
FiltroEstatisticasRegiao.tipoLocalAlterado = false;


function FiltroMelhoresEscolas:new(o)
  o = o or {};
  setmetatable (o,self);
  self.__index = self;
  return o;
end


function FiltroMelhoresEscolas:getTipoLocal()
  return self.tipoLocal;
end

function FiltroMelhoresEscolas:setTipoLocal(tipoLocal)
  self.tipoLocal = tipoLocal;
  self.tipoLocalAlterado = true;
end


function FiltroMelhoresEscolas:getPais()
  return self.pais;
end

function FiltroMelhoresEscolas:setPais(pais)
  self.pais = pais;
  self.paisAlterado = true;
end


function FiltroMelhoresEscolas:getRegiaoGeografica()
  return self.regiaoGeografica;
end

function FiltroMelhoresEscolas:setRegiaoGeografica(regiaoGeografica)
  self.regiaoGeografica = regiaoGeografica;
  self.regiaoGeograficaAlterado = true;
end

function FiltroMelhoresEscolas:getEstado()
  return self.estado;
end

function FiltroMelhoresEscolas:setEstado(Estado)
  self.estado = Estado;
  self.estadoAlterado = true;
end

function FiltroMelhoresEscolas:getIndice()
  return self.cidade;
end

function FiltroMelhoresEscolas:setIndice(indice)
  self.indice = indice;
  self.indiceAlterado = true;
end


function FiltroMelhoresEscolas:toParams()

  local params = {};


  if (self.tipoLocal == "NAC") then
    params.tipoLocal="NAC";
    params.nomeLocal="Brasil";
    params.indice="3";
  elseif (self.tipoLocal == "REG") then
    params.tipoLocal="REG";
    params.nomeLocal=self.regiaoGeografica;
    params.indice="3";
  elseif (self.tipoLocal == "EST") then
    params.tipoLocal="EST";
    params.nomeLocal=self.estado;
    params.indice="3";
  end

  return params;

end
