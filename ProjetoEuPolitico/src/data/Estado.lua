BibliotecaAuxiliarScript.execute('data.Cidade');

Estado = {};
Estado.nome = nil;
Estado.cidades = nil;
Estado.nomesCidades = nil;

function Estado.__index(tabela,chave)
  return Estado[chave];
end


function Estado.new(obj)
  local retorno = obj or {};
  retorno = setmetatable(retorno,Estado);
  retorno.cidades = {}
  retorno.nomesCidades = {};
  return retorno;
end


function Estado:getNome()
  return self.nome;
end

function Estado:setNome(nome)
  self.nome = nome;
end

function Estado:getCidades()
  return self.cidades;
end

function Estado:setCidades(cidades)
  self.cidades = cidades;
end

function Estado:getCidadePorNome(nome)
  local cidade;
  
  for i,v in pairs(self.cidades) do

      if (nome == v:getNome()) then
           cidade = v;
           break;
      end
   end
  
  return cidade;
end