Fonte = {}

Fonte.nome = ''; 
Fonte.tamanho = 0;
Fonte.cor = nil;
Fonte.is_negrito = false;

function Fonte.__index(tabela,chave)
	return Fonte[chave];
end

function Fonte.new(o)
	local retorno = o or {};
	retorno = setmetatable(retorno,Fonte);
	
	if (retorno.cor == nil) then
		retorno.cor =  Cor.new({r=0,g=0,b=0});
	end
	
	return retorno;
end

