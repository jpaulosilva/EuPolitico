Cor = {};

Cor.r = 0;
Cor.g = 0;
Cor.b = 0;
Cor.alpha = 255;

function Cor.__index(tabela,chave)
	return Cor[chave];
end

function Cor.new(o)
	local retorno = o or {};
	retorno = setmetatable(retorno,Cor);
	return retorno;
end

--add gets e sets