BibliotecaAuxiliarScript.execute('data.FiltroMelhoresEscolas');
BibliotecaAuxiliarScript.execute('data.MelhoresEscolas');
BibliotecaAuxiliarScript.execute('data.CarregarMelhoresEscolas');

ListaMelhoresEscolas = {};
ListaMelhoresEscolas.melhoresEscolas = {};


function ListaMelhoresEscolas:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function ListaMelhoresEscolas:getMelhoresEscolas()
  return self.melhoresEscolas;
end

function ListaMelhoresEscolas:buscarMelhoresEscolas(filtroMelhoresEscolas)
  
  self.melhoresEscolas = {};
  
  local callback_melhoresEscolasWeb = function (dados,status)
    if status == 1 then
      for indice, melhorEscola in pairs(dados) do
        table.insert(self.melhoresEscolas,melhorEscola);
      end
    
    else
      print("Lista vazia!")
        
    end
  end
  
  
  params = filtroMelhoresEscolas:toParams();
  
  carregaMelhoresEscolasWeb(callback_melhoresEscolasWeb,params);
  
end
