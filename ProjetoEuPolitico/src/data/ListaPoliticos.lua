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

function ListaPoliticos:getPoliticos()
  return self.politicos;
end


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
  
  print("Entrou pesquisar Políticos");
  
  
  carregaPoliticosWeb(callback_politicosWeb,params);

end
