BibliotecaAuxiliarScript.execute('data.FiltroPolitico');
BibliotecaAuxiliarScript.execute('data.Politico');
BibliotecaAuxiliarScript.execute('data.CarregarPoliticos');

ListaPoliticos = {}
ListaPoliticos.politicos = {};

function ListaPoliticos:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

--[[Fun��o onde se obt�m o resultado da busca]]
function ListaPoliticos:getPoliticos()
  return self.politicos;
end

--[[Fun��o que � chamada quando se aperta o bot�o verde na interface
para a busca de pol�ticos. Aqui se chama o m�todo 'carregaPoliticosWeb' para consumo do Web Service]]
function ListaPoliticos:pesquisarPoliticos(filtroPolitico)

  self.politicos = {};

  local callback_politicosWeb = function (dados,status)
    if status == 1 then
      for indice, politico in pairs(dados) do
        table.insert(self.politicos,politico);
      end
    else
      print("Lista vazia!")

    end
  end
  
  params = filtroPolitico:toParams();
  
  print("Entrou pesquisar Pol�ticos");
  
  
  carregaPoliticosWeb(callback_politicosWeb,params);

end
