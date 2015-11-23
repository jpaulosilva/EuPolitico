BibliotecaAuxiliarScript.execute('data.Escola');
BibliotecaAuxiliarScript.execute('data.FiltroEscola');
BibliotecaAuxiliarScript.execute('data.CarregarEscolas');

ListaEscolas = {};
ListaEscolas.escolas = {};

function ListaEscolas:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function ListaEscolas:getEscolas()
  return self.escolas
end

function ListaEscolas:pesquisarEscolas(filtroEscola)
  self.escolas = {};
  
  local callback_getEscolasWebResult = function(data,status)
    if status == 1 then
      for index,escola in pairs(data) do
        table.insert(self.escolas,escola)
      end
    else
      print("ListaEscolas vazia!!")
    end
  end
  params = filtroEscola:toParams();
  
  print("entrou");
  for i,v in pairs(params) do print(tostring(i),tostring(v)); end
  
  carregaEscolasWeb(callback_getEscolasWebResult,params)
  --
  --  print("Entrou>>>>>>>>>>>>>>>>>>>>>".. #self.escolas);
  --  print(tostring(not filtroEscola.nomeAlterado));
  --  print(tostring(filtroEscola:getNome()));
  --  print(tostring(not filtroEscola.estadoAlterado));
  --  print(tostring(filtroEscola:getEstado()));
  --  print(tostring(not filtroEscola.cidadeAlterado));
  --  print(tostring(filtroEscola:getCidade()));
  --  print(tostring(not filtroEscola.bairroAlterado));
  --  print(tostring(filtroEscola:getBairro()));
  --  print(tostring(not filtroEscola.idebAlterado));
  --  print(tostring(not filtroEscola.enemAlterado));
  --  print(tostring(not filtroEscola.taxaEvasaoAlterado));
  --
--  for i,v in pairs(self.escolas) do
--    if (
--      ((not filtroEscola.nomeAlterado) or filtroEscola:getNome() == nil or filtroEscola:getNome() == "" or filtroEscola:getNome() == v:getNome()) and
--      ((not filtroEscola.regiaoAlterado) or filtroEscola:getRegiao() == v:getRegiao()) and
--      ((not filtroEscola.estadoAlterado) or filtroEscola:getEstado() == v:getEstado()) and
--      ((not filtroEscola.cidadeAlterado) or filtroEscola:getCidade() == v:getCidade()) and
--      ((not filtroEscola.bairroAlterado) or filtroEscola:getBairro() == v:getBairro()) and
--      ((not filtroEscola.idebAlterado) or loadstring("filtroEscola:getIdeb() " .. filtroEscola:getIdebOperador() .." v:getIdeb()")) and
--      ((not filtroEscola.enemAlterado) or loadstring("filtroEscola:getEnem() ".. filtroEscola:getEnemOperador() .." v:getEnem()")) and
--      ((not filtroEscola.taxaEvasaoAlterado) or loadstring("filtroEscola:getTaxaEvasao()".. filtroEscola:getTaxaEvasaoOperador() .."v:getTaxaEvasao()"))
--      ) then
--      table.insert(escolasPesquisadas,v);
--    end
--  end
end

