BibliotecaAuxiliarScript.execute('data.FiltroComparacaoEscolas');
BibliotecaAuxiliarScript.execute('data.ComparacaoEscolas');

ListaComparacaoEscolas = {};
ListaComparacaoEscolas.comparacaoEscolas = {};


function ListaComparacaoEscolas:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function ListaComparacaoEscolas:getComparacaoEscolas()
  return self.comparacaoEscolas;
end


function ListaEstatisticas:buscarComparacaoEscolas(filtroComparacaoEscolas)
  
  self.comparacaoEscolas = {};
  
  local callback_comparacaoEscolasWeb = function (dados,status)
    if status == 1 then
      for indice, comparacao in pairs(dados) do
        table.insert(self.comparacaoEscolas,comparacao);
      end
    else
      print("Lista vazia!")
        
    end
  end
  
  
  params = filtroComparacaoEscolas:toParams();
  
  carregaComparacaoEscolasWeb(callback_comparacaoEscolasWeb,params);
  
end