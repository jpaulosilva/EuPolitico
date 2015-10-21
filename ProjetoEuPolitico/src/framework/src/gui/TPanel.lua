BibliotecaAuxiliarScript.execute('framework.src.gui.TConteiner');

TPanel = TConteiner.new();

--~Atributos 
TPanel.id = "TPanel";
TPanel.components =  nil;

TPanel.isAttComponentsAlterado =  false;

function TPanel.__index(tabela,chave)
	return TPanel[chave];
end


function TPanel.new(obj)
	local retorno = o or {};
	retorno = setmetatable(retorno,TPanel);
	retorno.components = {};
	retorno.isAttFocoVisibleAlterado = false;
	return retorno;
end

--~Funcoes 
