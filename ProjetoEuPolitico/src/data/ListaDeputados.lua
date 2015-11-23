BibliotecaAuxiliarScript.execute('data.FiltroPolitico');
BibliotecaAuxiliarScript.execute('data.Politico');
BibliotecaAuxiliarScript.execute('data.CarregarDeputados');

ListaDeputados = {}
ListaDeputados.deputados = {};

function ListaDeputados:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function ListaDeputados:getDeputados()
  return self.deputados;
end


function ListaDeputados:pesquisarDeputados(filtroPolitico)

  self.deputados = {};

  local callback_deputadosWeb = function (dados,status)
    if status == 1 then
      for indice, deputado in pairs(dados) do
        table.insert(self.deputados,deputado);
      end
    else
      print("Lista vazia!")

    end
  end
  
  params = filtroPolitico:toParams();
  
  print("Entrou pesquisar Deputados");
  
  
  carregaDeputadosWeb(callback_deputadosWeb,params);

end
