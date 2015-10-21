--------------------------------------------
-- Entidade BibliotecaAuxiliarTabela
-- Objeto grafico da Area de Texto

--------------------------------------------

-------------
-- Imports
-------------

-----------------
--Log
-----------------


BibliotecaAuxiliarTabela =
{

------------------------------------------------
-- mudarFoco()
--
--Parametros:
--
--Retorno:
------------------------------------------------
contem = function (tb_tabela, ob_registro)
	bl_contem = false;
	nb_indice = 1;

	while ((not bl_contem) and nb_indice <= #tb_tabela) do

		if(tb_tabela[nb_indice] == ob_registro) then
			bl_contem = true;
		else
			nb_indice = nb_indice+1;
		end
	end

	return bl_contem;
end,

------------------------------------------------
-- getVariavelTabela()
--
--Parametros:
--
--Retorno:
------------------------------------------------
getVariavelTabela = function(tb_tabela,st_variavel)
	--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarTabela: getVariavelTabela()');
	retorno = {};

--	BibliotecaAuxiliarLog.registrarLog(tostring(#tb_tabela));
	for indice = 1, #tb_tabela do

		for i,v in pairs(tb_tabela[indice]) do

			if (i == st_variavel) then
			--BibliotecaAuxiliarLog.registrarLog(tostring(v));
				table.insert(retorno,v);
			end
		end
	end

	return retorno;

end,

------------------------------------------------
-- quebrarTabela()
--
--Parametros:
--
--Retorno:
------------------------------------------------
quebrarTabela = function(tb_tabela,nb_quantidade_itens)

	local retorno = {}
	local itens = {}
	for indice = 1, #tb_tabela do
		table.insert(itens,tb_tabela[indice]);
		if(math.mod(indice,nb_quantidade_itens) == 0) or (indice == #tb_tabela) then
			table.insert(retorno,itens);
			itens= {};
		end
	end

	return retorno;
end,

quebrarTabelaPorIndice = function(tb_tabela,nb_lim,st_indice)

	local retorno = {}
	local itens = {}
	local indice_ordem = 1;

	for indice = 1, #tb_tabela do
		local item = tb_tabela[indice];
		local criterio = item[st_indice];


		if(retorno[criterio] == nil) then
			retorno[criterio] = {};
			item.indice_ordem = indice_ordem;
			indice_ordem = indice_ordem + 1;
		end

		if(#retorno[criterio] < nb_lim) then
			table.insert(retorno[criterio],item);
		end
	end


	return retorno;
end,

}

module("BibliotecaAuxiliarTabela",package.seeall);