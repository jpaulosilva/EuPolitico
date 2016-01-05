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

--[[Função onde se obtém o resultado da busca]]
function ListaPoliticos:getPoliticos()
  return self.politicos;
end

--[[Função que é chamada quando se aperta o botão verde na interface
para a busca de políticos. Aqui se chama o método 'carregaPoliticosWeb' para consumo do Web Service]]
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
