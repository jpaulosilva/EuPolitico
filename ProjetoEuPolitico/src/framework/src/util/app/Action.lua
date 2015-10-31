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
	error('Função run não implementada!');
end
