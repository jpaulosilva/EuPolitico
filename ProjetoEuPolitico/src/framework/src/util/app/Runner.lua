BibliotecaAuxiliarScript.execute('framework.src.util.app.Action');
BibliotecaAuxiliarScript.execute('framework.src.util.event.BibliotecaAuxiliarEvento');

Runner = {}

Runner.actions = {};
Runner.teclas_actions = {};

Runner.teclas = {}
Runner.teclas.ok = "OK";
Runner.teclas.left = "LEFT";

function Runner.__index(tabela,chave)
	return Runner[chave];
end

function Runner.new()
	local retorno = {};
	retorno = setmetatable(retorno,Runner);

	retorno.actions = {};
	retorno.teclas_actions = {};
	retorno.teclas = {}

	return retorno;
end

function Runner:incluirAction(id, funcao,...)
	self.actions[id] = Action.new();
	self.actions[id].id = id;
	self.actions[id].run = funcao;
	
	local teclas = {...};

	for i,v in pairs(teclas) do
		if(self.teclas_actions[string.upper(v)] == nil) then
			self.teclas_actions[string.upper(v)] = {};
		end

		table.insert(self.teclas_actions[string.upper(v)],self.actions[id]);
	end
end

function Runner:removerAction(id)
	self.actions[id] = nil;
end

function Runner:run(evt)
	--error(string.upper(BibliotecaAuxiliarEvento.getTecla(evt)));
	if(self.teclas_actions[string.upper(BibliotecaAuxiliarEvento.getTecla(evt))] ~= nil) then
		for i,v in ipairs(self.teclas_actions[BibliotecaAuxiliarEvento.getTecla(evt)]) do
			v:run();
		end
	end
end

