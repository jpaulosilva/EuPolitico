DAO = {};

function DAO.__index(tabela,chave)
	return DAO[chave];
end

function DAO.new()
	local retorno = {};
	retorno = setmetatable(retorno,DAO);
	return retorno;
end

function DAO:getDados(st_arquivo)
	error('Função getDados não implementada!');
end

module("DAO",package.seeall);

