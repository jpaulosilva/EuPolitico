BibliotecaAuxiliarScript.execute('framework.src.gui.TComponent');

TMenuItem = TComponent.new();

function TMenuItem.__index(tabela,chave)
	return TMenuItem[chave];
end

function TMenuItem.new()
	local retorno = {};
	retorno = setmetatable(retorno,TMenuItem);
	return retorno;
end

function TMenuItem:action(evt)
	error('TMenuItem: Função action não implementada!');
end


