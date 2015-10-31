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

--------------------------------------------
-- Entidade BibliotecaAuxiliarMath
-- Objeto gráfico da Area de Texto

--------------------------------------------

-------------
-- Imports
-------------

-----------------
--Log
-----------------


BibliotecaAuxiliarMath =
{


sum = function(...)
	local tabela = {...};
	local retorno = 0;
	for i,v in pairs(tabela) do
		if (type(v)=="number") then
			retorno = retorno +v;
		else
			error("Os parámetros não são do tipo number!")
		end
	end	
	return retorno;
end,

getDistancia = function (px1,px2,py1,py2)
	return math.sqrt(math.pow(math.abs(px1-px2),2)+math.pow(math.abs(py1-py2),2));
end


}

module("BibliotecaAuxiliarMath",package.seeall);