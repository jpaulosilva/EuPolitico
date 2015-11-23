Cor = {};

Cor.r = 255;
Cor.g = 255;
Cor.b = 255;
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