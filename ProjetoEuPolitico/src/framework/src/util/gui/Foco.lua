Foco = {};

Foco.st_estilo = "";
Foco.AMPLIADO = "AMPLIADO";
Foco.QUADRADO = "QUADRADO";
Foco.cor = nil;

function Foco.__index(tabela,chave)
	return Foco[chave];
end

function Foco.new(o)
	local retorno = o or {};
	retorno = setmetatable(retorno,Foco);
	retorno.cor = Cor.new({r=255,g=255});
	return retorno;
end

--add gets e sets