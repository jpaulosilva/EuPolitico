BibliotecaAuxiliarScript.execute('data.Estado');

Regiao = {};
Regiao.nome = nil;
Regiao.estados = nil;
Regiao.indice = nil;
Regiao.nomesEstados = nil;

function Regiao.__index(tabela,chave)
  return Regiao[chave];
end


function Regiao.new(obj)
  local retorno = obj or {};
  retorno = setmetatable(retorno,Regiao);
  retorno.estados = {}
  retorno.nomesEstados = {}
  return retorno;
end


function Regiao:getNome()
  return self.nome;
end

function Regiao:setNome(nome)
  self.nome = nome;
end

function Regiao:getEstados()
  return self.estados;
end

function Regiao:setEstados(estados)
  self.estados = estados;
end

function Regiao:getEstadoPorNome(nome)
  local estado;
  
  for i,v in pairs(self.estados) do

      if (nome == v:getNome()) then
           estado = v;
           break;
      end
   end
  
  return estado;
end