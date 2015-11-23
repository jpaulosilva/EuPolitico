BibliotecaAuxiliarScript.execute('framework.src.file.DAO_XML');
BibliotecaAuxiliarScript.execute('framework.src.file.DAO_CSV');

Cadastro = {};

Cadastro.dao = DAO_XML;
Cadastro.st_arquivo = "";
Cadastro.tb_dados = {};

function Cadastro:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function Cadastro:getDados()
	if(self.dao == DAO_XML)then
	 self.tb_dados = DAO_XML:getDados(self.st_arquivo);
	elseif(self.dao == DAO_CSV)then
	self.tb_dados = DAO_CSV:getDados(self.st_arquivo);
	end
end

module("Cadastro",package.seeall);