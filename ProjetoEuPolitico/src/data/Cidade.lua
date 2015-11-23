BibliotecaAuxiliarScript.execute('data.Bairro');

Cidade = {};
Cidade.codigo = nil;
Cidade.nome = nil;
Cidade.bairros = nil;

function Cidade.__index(tabela,chave)
  return Cidade[chave];
end


function Cidade.new(obj)
  local retorno = obj or {};
  retorno = setmetatable(retorno,Cidade);
  retorno.bairros = {}
  return retorno;
end

function Cidade:getCodigo()
  return self.codigo;
end

function Cidade:setCodigo(codigo)
  self.codigo = codigo;
end

function Cidade:getNome()
  return self.nome;
end

function Cidade:setNome(nome)
  self.nome = nome;
end

function Cidade:getBairros()
  return self.bairros;
end

function Cidade:setBairros(bairros)
  self.bairros = bairros;
end

function Cidade:getBairroPorNome(nome)
  local cidade;
  
  for i,v in pairs(self.bairros) do

      if (nome == v:getNome()) then
           cidade = v;
           break;
      end
   end
  
  return cidade;
end