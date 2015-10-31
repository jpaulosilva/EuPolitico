BibliotecaAuxiliarScript.execute('framework.src.file.DAO_XML');

Cadastro = {};

Cadastro.dao = DAO_XML;
Cadastro.st_arquivo = "";
Cadastro.tb_dados = {};

function Cadastro.__index(tabela,chave)
	return Cadastro[chave];
end

function Cadastro.new()
	local retorno = {};
	retorno = setmetatable(retorno,Cadastro);
	return retorno;
end

function Cadastro:getDados()
	self.tb_dados = Cadastro.dao:getDados(self.st_arquivo);
end

module("Cadastro",package.seeall);