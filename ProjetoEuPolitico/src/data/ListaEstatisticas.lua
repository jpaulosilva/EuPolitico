BibliotecaAuxiliarScript.execute('data.FiltroEstatisticasRegiao');
BibliotecaAuxiliarScript.execute('data.Estatistica');
BibliotecaAuxiliarScript.execute('data.CarregarEstatisticas');

ListaEstatisticas = {};
ListaEstatisticas.estatisticas = {};


function ListaEstatisticas:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function ListaEstatisticas:getEstatisticas()
	return self.estatisticas;
end


function ListaEstatisticas:buscarEstatisticas(filtroEstatisticas)
	self.estatisticas = {};
	
	local callback_estatisticasWeb = function (dados,status)
		if status == 1 then
		  for indice, estatistica in pairs(dados) do
		  	table.insert(self.estatisticas,estatistica);
		  end
		else
		  print("Lista vazia!")
		    
		end
	end
	
	
	params = filtroEstatisticas:toParams();
	
	carregaEstatisticasWeb(callback_estatisticasWeb,params);
	
end