------------------------------------------------
-- Entidade BibliotecaAuxiliarEvento
-- Biblioteca Auxiliar de Evento
--
------------------------------------------------

-----------------
--Imports
-----------------

-----------------
--Log
-----------------

--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarEvento: BibliotecaAuxiliarEvento.lua');



BibliotecaAuxiliarEvento = {
--------------
--Atributos
--------------
ESQUERDA = 'CURSOR_LEFT',
DIREITA = 'CURSOR_RIGHT',
CIMA = 'CURSOR_UP',
BAIXO = 'CURSOR_DOWN',
OK = 'ENTER',
VERDE = 'w',
AZUL = 'q',
VERMELHO = 'e',
AMARELO = 'r',



------------------------------------------------
-- isBotaoAzul()
--
--
--Parametros:
--
--Retorno:
------------------------------------------------

isEventoControle = function(tb_evt)
	if(tb_evt.key ~= nil) then
		return true;
	end
	return false;
end,

isEventoPress = function(tb_evt)
	if(tb_evt.type == 'press') then
		return true;
	end
	return false;
end,

isEventoRelease = function(tb_evt)
	if(tb_evt.type == 'release') then
		return true;
	end
	return false;
end,



isEventoStart = function(tb_evt)
	if(tb_evt.class ~= nil and tb_evt.class == 'ncl' and tb_evt.action ~= nil and tb_evt.action == 'start') then
		return true;
	end
	return false;
end,

isBotaoAzul = function(tb_evt)
	if(tb_evt.key == 'BLUE') then
		return true;
	end
	return false;
end,


------------------------------------------------
-- isBotaoVerde()
--
--
--Parametros:
--
--Retorno:
------------------------------------------------
isBotaoVerde = function(tb_evt)
	if(tb_evt.key == 'GREEN') then
		return true;
	end

	return false;
end,

------------------------------------------------
-- isBotaoAmarelo()
--
--
--Parametros:
--
--Retorno:
------------------------------------------------
isBotaoAmarelo = function(tb_evt)
	if(tb_evt.key == 'YELLOW') then
		return true;
	end

	return false;
end,

------------------------------------------------
-- isBotaoVermelho()
--
--
--Parametros:
--
--Retorno:
------------------------------------------------
isBotaoVermelho = function(tb_evt)
	if(tb_evt.key == 'RED') then
		return true;
	end

	return false;
end,

------------------------------------------------
-- isBotaoDireita()
--
--
--Parametros:
--
--Retorno:
------------------------------------------------

isBotaoDireita = function(tb_evt)
	if(tb_evt.key == 'CURSOR_RIGHT') then
		return true;
	end

	return false;
end,

------------------------------------------------
-- isBotaoEsquerda()
--
--
--Parametros:
--
--Retorno:
------------------------------------------------
isBotaoEsquerda = function(tb_evt)
	if(tb_evt.key == 'CURSOR_LEFT') then
		return true;
	end

	return false;
end,

------------------------------------------------
-- isBotaoCima
--
--
--Parametros:
--
--Retorno:
------------------------------------------------

isBotaoCima = function(tb_evt)
	if(tb_evt.key == 'CURSOR_UP') then
		return true;
	end

	return false;
end,

------------------------------------------------
-- isBotaoBaixo()
--
--
--Parametros:
--
--Retorno:
------------------------------------------------

isBotaoBaixo = function(tb_evt)
	if(tb_evt.key == 'CURSOR_DOWN') then
		return true;
	end

	return false;
end,

------------------------------------------------
-- isBotaoOk()
--
--
--Parametros:
--
--Retorno:
------------------------------------------------
isBotaoOk = function(tb_evt)
	if(tb_evt.key == 'ENTER') then
		return true;
	end

	return false;
end,

------------------------------------------------
-- isNumero()
--
--
--Parametros:
--
--Retorno:
------------------------------------------------
isNumero = function(tb_evt)
	if(tonumber(tb_evt.key) ~= nil) then
		return true;
	end

	return false;
end,

------------------------------------------------
-- isEventoUsuario()
-- Descricao Funcao abc
--
--Parametros:
--
--Retorno:
------------------------------------------------
isEventoUsuario = function(tb_evt)
	if(tb_evt.class == 'user') then
		return true;
	end

	return false;
end,


------------------------------------------------
-- isDestino()
--
--
--Parametros:
--
--Retorno:
------------------------------------------------

isDestino = function(tb_evt,st_destino)
	if(tb_evt.destino == st_destino) then
		return true;
	end

	return false;
end,

------------------------------------------------
-- lancarEvento()
-- Descricao Funcao abc
--
--Parametros:
--
--Retorno:
------------------------------------------------

lancarEvento = function(tb_evt)

	evento = tb_evt or {};

	if(not BibliotecaAuxiliarEvento.isEventoUsuario(evento))
	then
		evento.class = 'user';
	end

	event.post('in', evento);
end,


------------------------------------------------
-- executarFuncaoControle()
--
--
--Parametros:
--
--Retorno:
------------------------------------------------

executarFuncaoControle = function(tb_mapeamento_funcoes,tb_evt)
	--BibliotecaAuxiliarLog.registrarLog("BibliotecaAuxiliarEvento: executarFuncaoControle()");
	--Executa fucao da tabela que mapeia 1x1 chave (tecla) e funcao
	if(tb_evt.key ~= nil) then
		 if ((tb_mapeamento_funcoes[tb_evt.key] ~= nil) or (tb_mapeamento_funcoes['CORES'] ~= nil) or (tb_mapeamento_funcoes['NUMERO'] ~= nil))  then
			tb_mapeamento_funcoes[tb_evt.key] ();
		end
	end
end,

------------------------------------------------
-- getTecla()
--  pega tecla
--
--Parametros:
--
--Retorno:
------------------------------------------------

getTecla = function(evt)
	--BibliotecaAuxiliarLog.registrarLog("BibliotecaAuxiliarEvento: getTecla()");
	return evt.key..'';
end,

------------------------------------------------
-- isBotaoDirecional()
-- verifica se e Botao Direcional
--
--Parametros:
--
--Retorno:
------------------------------------------------

isBotaoDirecional = function(evt)
	if(BibliotecaAuxiliarEvento.isBotaoCima(evt))or(BibliotecaAuxiliarEvento.isBotaoBaixo(evt))or(BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))or(BibliotecaAuxiliarEvento.isBotaoDireita(evt)) then
		return true;
	end

	return false;
end,

isBotaoNumerico = function(evt)
	if( BibliotecaAuxiliarEvento.getTecla(evt) == "0" or
		BibliotecaAuxiliarEvento.getTecla(evt) == "1" or
		BibliotecaAuxiliarEvento.getTecla(evt) == "2" or
		BibliotecaAuxiliarEvento.getTecla(evt) == "3" or
		BibliotecaAuxiliarEvento.getTecla(evt) == "4" or
		BibliotecaAuxiliarEvento.getTecla(evt) == "5" or
		BibliotecaAuxiliarEvento.getTecla(evt) == "6" or
		BibliotecaAuxiliarEvento.getTecla(evt) == "7" or
		BibliotecaAuxiliarEvento.getTecla(evt) == "8" or
		BibliotecaAuxiliarEvento.getTecla(evt) == "9") then
		return true;
	end

	return false;
end

}

module("BibliotecaAuxiliarEvento",package.seeall);