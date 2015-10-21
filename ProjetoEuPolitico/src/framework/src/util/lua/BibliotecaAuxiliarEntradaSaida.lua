--~ /**
--~ Copyright 2008, 2009 UFPE - Universidade Federal de Pernambuco
--~
--~ Este arquivo é parte do programa Amadeus Sistema de Gestão de Aprendizagem, ou simplesmente Amadeus LMS.
--~
--~ O Amadeus LMS é um software livre;
--~ você pode redistribui-lo e/ou modifica-lo dentro dos termos da Licença Pública Geral GNU
--~ como publicada pela Fundação do Software Livre (FSF); na versão 2 da Licença.
--~
--~ Este programa é distribuído na esperança que possa ser útil, mas SEM NENHUMA GARANTIA;
--~ sem uma garantia implícita de ADEQUAÇÃO a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR.
--~ Veja a Licença Pública Geral GNU para maiores detalhes.
--~
--~ Você deve ter recebido uma cópia da Licença Pública Geral GNU, sob o título "LICENCA.txt",
--~ junto com este programa, se não, escreva para a Fundação do Software Livre (FSF) Inc.,
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
-- Descrição Retorna o código presente no arquivo com nome = st_nomeArquivo
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
-- Inicialização
-----------------
