--~ /**
--~ Copyright 2008, 2009 UFPE - Universidade Federal de Pernambuco
--~
--~ Este arquivo � parte do programa Amadeus Sistema de Gest�o de Aprendizagem, ou simplesmente Amadeus LMS.
--~
--~ O Amadeus LMS � um software livre;
--~ voc� pode redistribui-lo e/ou modifica-lo dentro dos termos da Licen�a P�blica Geral GNU
--~ como publicada pela Funda��o do Software Livre (FSF); na vers�o 2 da Licen�a.
--~
--~ Este programa � distribu�do na esperan�a que possa ser �til, mas SEM NENHUMA GARANTIA;
--~ sem uma garantia impl�cita de ADEQUA��O a qualquer MERCADO ou APLICA��O EM PARTICULAR.
--~ Veja a Licen�a P�blica Geral GNU para maiores detalhes.
--~
--~ Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral GNU, sob o t�tulo "LICENCA.txt",
--~ junto com este programa, se n�o, escreva para a Funda��o do Software Livre (FSF) Inc.,
--~ 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA.
--~ **/

------------------------------------------------
-- Entidade BibliotecaAuxiliarEntradaSaida
-- Biblioteca Auxiliar de entrada e saida
--
------------------------------------------------

-----------------
--Imports
-----------------

-----------------
--Log
-----------------



BibliotecaAuxiliarEntradaSaida = {
--------------
--Atributos
--------------

------------------------------------------------
-- getCodigo()
-- Descri��o Retorna o c�digo presente no arquivo com nome = st_nomeArquivo
--
--Parametros: 	+ st_nomeArquivo:string
--
--Retorno:		+ string
------------------------------------------------
getCodigo = function (st_nomeArquivo)
	arquivo = io.input(st_nomeArquivo);
	local st_codigo = '';
	local st_linha = io.read();

	while (st_linha ~= nil) do
		st_codigo = st_codigo..st_linha..'\n';
		st_linha = io.read();
	end

	io.close(arquivo);
	return st_codigo;
end,

getXML = function (st_nomeArquivo)
	arquivo = io.input(st_nomeArquivo);

	local st_codigo = '';
	local st_linha = io.read();

	while (st_linha ~= nil) do
		st_codigo = st_codigo..st_linha;
		st_linha = io.read();
	end

	io.close(arquivo);
	return st_codigo;
end

}

-----------------
-- Inicializa��o
-----------------
