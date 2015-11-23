Bairro = {};
Bairro.nome = nil;

function Bairro.__index(tabela,chave)
  return Bairro[chave];
end

function Bairro.new(obj)
  local retorno = obj or {};
  retorno = setmetatable(retorno,Bairro);
  return retorno;
end

function Bairro:getNome()
  return self.nome;
end

function Bairro:setNome(nome)
  self.nome = nome;
end