--------------------------------------------
-- Entidade BibliotecaAuxiliarScript
-- Objeto grafico da Area de Texto

--------------------------------------------

-------------
-- Imports
-------------

-----------------
--Log
-----------------

BibliotecaAuxiliarScript = {
--------------
--Atributos
--------------
tb_scriptsExecutados = {},

------------------------------------------------
-- adicionarScriptsExecutados()
-- Adiciona na tabela scripts que nao foram executados apartir desta entidade
--
--Parametros: 	+ tb_nomeArquivos:tabela
------------------------------------------------

addScriptExecuted = function (st_nomeArquivo)
	BibliotecaAuxiliarScript.tb_scriptsExecutados[st_nomeArquivo] = true;
end,
------------------------------------------------
-- executar()
-- Executa scripts
--
--Parametros: 	+ st_nomeArquivo:string
--
------------------------------------------------

execute = function (st_nomeArquivo)
	-- Verifica se o script ja foi executado antes de executa-lo.
	if(BibliotecaAuxiliarScript.tb_scriptsExecutados[st_nomeArquivo] == nil)
	then
		require(st_nomeArquivo);
		BibliotecaAuxiliarScript.addScriptExecuted(st_nomeArquivo);
	end
end,

------------------------------------------------
-- getScriptsExecutados()
-- Retorna a tabela com os scripts executados
--
--Retorno:		+ tabela
------------------------------------------------

getScriptsExecuted = function ()
	return BibliotecaAuxiliarScript.tb_scriptsExecutados;
end

}

module("BibliotecaAuxiliarScript",package.seeall);