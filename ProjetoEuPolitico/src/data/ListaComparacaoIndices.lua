
BibliotecaAuxiliarScript.execute('data.ComparacaoIndicesEscolas');


ListaComparacaoIndicesEscolas = {};
ListaComparacaoIndicesEscolas.comparacaoIndicesEscolas = {};


function ListaComparacaoIndicesEscolas:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function ListaComparacaoIndicesEscolas:getComparacaoIndices()
  return self.comparacaoIndicesEscolas;
end


function ListaComparacaoIndicesEscolas:buscarComparacaoIndices(filtroComparacaoIndices)
  
  self.comparacaoIndices = {};
  
  local callback_comparacaoIndicesEscolasWeb = function (dados,status)
    if status == 1 then
      for i, indice  in pairs(dados) do
        table.insert(self.comparacaoIndices,indice);
      end
    else
      print("Lista vazia!")
        
    end
  end
  
  
  params = filtroComparacaoIndices:toParams();
  
  carregaComparacaoIndicesEscolasWeb(callback_comparacaoIndicesEscolasWeb,params);
  
end