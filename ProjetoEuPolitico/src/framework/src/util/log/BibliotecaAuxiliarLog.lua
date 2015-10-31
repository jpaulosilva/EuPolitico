--------------------------------------------
-- Entidade BibliotecaAuxiliarLog
-- Biblioteca Auxiliar do Log

--------------------------------------------

-------------
-- Imports
-------------

BibliotecaAuxiliarScript.execute('framework.src.constantes.ConstantesDiretorio');

-----------------
--Log
-----------------



BibliotecaAuxiliarLog = {
--------------
--Atributos
--------------
salvarLog = false,
arquivoAberto = false,
arquivo,

------------------------------------------------
-- registrarLog()
-- Registra o Log
--
--Parametros: 	+ st_texto:string
--
------------------------------------------------

registrarLog = function(st_texto)

	tempo = os.date();

	if(BibliotecaAuxiliarLog.salvarLog == true) then


		if(BibliotecaAuxiliarLog.arquivoAberto == false) then
			local tabelaDataAtual = os.date('*t');

			anoAtual = tabelaDataAtual.year;
			mesAtual = tabelaDataAtual.month;
			diaAtual = tabelaDataAtual.day;
			horaAtual = tabelaDataAtual.hour;
			minAtual = tabelaDataAtual.min;
			secAtual = tabelaDataAtual.sec;

			if(mesAtual < 10) then
				mesAtual = '0'..mesAtual;
			end

			if(diaAtual < 10) then
				diaAtual = '0'..diaAtual;
			end

			if(horaAtual < 10) then
				horaAtual = '0'..horaAtual;
			end

			if(minAtual < 10) then
				minAtual = '0'..minAtual;
			end

			if(secAtual < 10) then
				secAtual = '0'..secAtual;
			end

			BibliotecaAuxiliarLog.arquivo = BibliotecaAuxiliarLog.abrirArquivo(ConstantesDiretorio.st_src_log..anoAtual..mesAtual..diaAtual..'_'..horaAtual..minAtual..secAtual..'.log');
		end

		io.write(tempo..' - '..tostring(st_texto)..'\n');
	end

	print(tempo..' - '..tostring(st_texto))
end,

------------------------------------------------
-- abrirArquivo()
-- Abre o arquivo com o nome especificado
--
--Parametros:	+ st_nome_arquivo:string
--
--Retorno:		file
------------------------------------------------

abrirArquivo = function(st_nome_arquivo)
	if(not BibliotecaAuxiliarLog.arquivoAberto) then
		arquivo = io.output(st_nome_arquivo);
		BibliotecaAuxiliarLog.arquivoAberto = true;
		return arquivo;
	end
end,

------------------------------------------------
-- fecharArquivo()
-- fecha Arquivo
--
------------------------------------------------


fecharArquivo = function()
	if(BibliotecaAuxiliarLog.arquivoAberto) then
		io.close(BibliotecaAuxiliarLog.arquivo);
		BibliotecaAuxiliarLog.arquivo = nil;
		BibliotecaAuxiliarLog.arquivoAberto = false;
	end

end

}

-----------------
-- Inicializacao
-----------------
