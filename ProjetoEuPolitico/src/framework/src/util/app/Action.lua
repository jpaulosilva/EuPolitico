Action = {};

Action.id = "";
Action.estado = "on";
Action.ON = "on";
Action.OFF = "off";


function Action.__index(tabela,chave)
	return Action[chave];
end

function Action.new()
	local retorno = {};
	retorno = setmetatable(retorno,Action);

	return retorno;
end

function Action:run()
	error('Fun��o run n�o implementada!');
end
