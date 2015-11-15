------------------------------------------------
-- Entidade BibliotecaAuxiliarDesenho
-- Biblioteca Auxiliar de Desenho
--
------------------------------------------------

-----------------
--Imports
-----------------

-----------------
--Log
-----------------
--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: BibliotecaAuxiliarDesenho.lua');

BibliotecaAuxiliarDesenho =
{

canvasClean = canvas:new(canvas:attrSize()),
-----------------
--Atributos
-----------------

ESTILO_CAMPO_PREENCHIDO = 'fill',
ESTILO_CAMPO_FECHADO = 'close',
ESTILO_TEXTO_NEGRITO = 'bold',

limparTela = function (cv_tela,cor)
	BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: limparTela('..tostring(cor.r)..', '..tostring(cor.g)..', '..tostring(cor.b)..', '..tostring(cor.alpha)..')');
	local cor_fundo = cor or {r=0,g=0,b=0,alpha=255};
	if(cv_tela ~=nil) then
		BibliotecaAuxiliarDesenho.setCor(cor_fundo,cv_tela)
		--BibliotecaAuxiliarDesenho.desenharRetangulo(BibliotecaAuxiliarDesenho.ESTILO_CAMPO_PREENCHIDO,0,0,l,a,cv_tela)
		cv_tela:clear ();
	end
end,

------------------------------------------------
-- getImagem()
-- Pega Imagem
--
--Parametros:
--
--Retorno:
------------------------------------------------
getImagem = function (st_caminhoArquivo)
	BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: getImagem('..tostring(st_caminhoArquivo)..')');
	return canvas:new(st_caminhoArquivo);
end,

------------------------------------------------
-- newImagem()
-- Cria Imagem
--
--Parametros:
--
--Retorno:
------------------------------------------------
newImagem = function (nb_l,nb_a)
	--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: newImagem('..nb_l..', '..nb_a..')');
	local imagem = canvas:new(nb_l,nb_a);
	return imagem;
end,


------------------------------------------------
-- mostrarTela()
-- mostra Tela
--
--Parametros:
--
--Retorno:
------------------------------------------------
mostrarTela = function (cv_tela)
	BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: mostrarTela()');
	cv_tela:flush();
end,

------------------------------------------------
-- desenharTextoAlerta()
-- desenha TextoAlerta
--
--Parametros:
--
--Retorno:
------------------------------------------------
desenharTextoAlerta = function (nb_px,nb_py, st_texto,cv_tela)
	cv_tela:attrFont(ConstantesPadraoUsabilidade.FONTE_CAMPO_TEXTO,ConstantesPadraoUsabilidade.TAMANHO_FONTE_CAMPO_TEXTO,ConstantesPadraoUsabilidade.NEGRITO);
	cv_tela:attrColor(255,0,0,255);
	cv_tela:drawText(nb_px,nb_py,st_texto);
	cv_tela:attrColor(0,0,0,255);

end,

------------------------------------------------
-- setCor()
-- seta Cor
------------------------------------------------
setCor = function(tb_cor,cv_imagemOrigem)
	BibliotecaAuxiliarLog.registrarLog('IN:  BibliotecaAuxiliarDesenho: setCor('..tostring(tb_cor.r)..', '..tostring(tb_cor.g)..', '..tostring(tb_cor.b)..', '..tostring(tb_cor.alpha)..')');
	if(cv_imagemOrigem ~= nil) then
		cv_imagemOrigem:attrColor(tb_cor.r,tb_cor.g,tb_cor.b,tb_cor.alpha);
	else
		error("Canvas nao Especificado");
	end

	BibliotecaAuxiliarLog.registrarLog('OUT:  BibliotecaAuxiliarDesenho: setCor('..tostring(tb_cor.r)..', '..tostring(tb_cor.g)..', '..tostring(tb_cor.b)..', '..tostring(tb_cor.alpha)..')');
end,

------------------------------------------------
-- setFonte()
-- Descricao Funcao abc
--
--Parametros:
--
--Retorno:
------------------------------------------------
setFonte = function(fonte,cv_origem)
	BibliotecaAuxiliarLog.registrarLog('IN: BibliotecaAuxiliarDesenho: setFonte('..tostring(fonte)..')');
	
	if(cv_origem ~= nil) then
		if(fonte.is_negrito)then
			cv_origem:attrFont(fonte.nome,fonte.tamanho,BibliotecaAuxiliarDesenho.ESTILO_TEXTO_NEGRITO);
		else
			cv_origem:attrFont(fonte.nome,fonte.tamanho);
		end
	else
		error("Canvas nao Especificado");
	end
	
	BibliotecaAuxiliarLog.registrarLog('OUT: BibliotecaAuxiliarDesenho: setFonte('..tostring(fonte)..')');
end,


------------------------------------------------
-- desenharRetangulo()
-- desenha Retangulo
--
--Parametros:
--
--Retorno:
------------------------------------------------
desenharRetangulo = function(st_estilo,nb_px,nb_py,nb_largura,nb_altura,cv_imagemOrigem)
	--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: desenharRetangulo('..tostring(st_estilo)..', '..tostring(nb_px)..', '..tostring(nb_py)..', '..tostring(nb_largura)..', '..tostring(nb_altura)..', '..tostring(cv_imagemOrigem)..')');
	if(cv_imagemOrigem ~= nil) then
		cv_imagemOrigem:drawRect(st_estilo,nb_px,nb_py,nb_largura,nb_altura)
	else
		error("Canvas nao Especificado");
	end
end,

------------------------------------------------
-- desenharTexto()
-- Descricao Funcao abc
--
--Parametros:
--
--Retorno:
------------------------------------------------
desenharTexto = function(fonte,nb_px,nb_py,st_texto,cv_imagemOrigem)
	BibliotecaAuxiliarLog.registrarLog('IN:  BibliotecaAuxiliarDesenho: desenharTexto('..tostring(fonte)..', '..tostring(nb_px)..', '..tostring(nb_py)..', '..tostring(st_texto)..', '..tostring(cv_imagemOrigem)..')');

	if(cv_imagemOrigem == nil) then
		error("Canvas nao Especificado");
	end

	BibliotecaAuxiliarDesenho.setFonte(fonte,cv_imagemOrigem);
	BibliotecaAuxiliarDesenho.setCor(fonte.cor,cv_imagemOrigem);

	cv_imagemOrigem:drawText(nb_px,nb_py,st_texto);
	BibliotecaAuxiliarLog.registrarLog('OUT:  BibliotecaAuxiliarDesenho: desenharTexto('..tostring(fonte)..', '..tostring(nb_px)..', '..tostring(nb_py)..', '..tostring(st_texto)..', '..tostring(cv_imagemOrigem)..')');
end,

------------------------------------------------
-- desenharImagem()
-- Descricao Funcao abc
--
--Parametros:
--
--Retorno:
------------------------------------------------
desenharImagem = function(nb_px,nb_py,cv_imagem,cv_destino)
	--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: desenharImagem('..tostring(nb_px)..', '..tostring(nb_py)..tostring(cv_imagem)..', '..tostring(cv_destino)..', '..')');
	
	if(cv_destino ~= nil) then
		cv_destino:compose(nb_px,nb_py,cv_imagem);
	else
		error("Canvas nao Especificado");
	end
end,

------------------------------------------------
-- desenharCampoTexto()
-- desenha Campo Texto
--
--Parametros:
--
--Retorno:
------------------------------------------------
desenharCampoTexto = function(tb_cor_fundo,nb_px,nb_py,nb_largura,nb_altura,bl_foco,tb_cor_foco,tb_fonte,st_texto,bl_cursor,cv_imagemOrigem)
	--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: desenharCampoTexto()');

	local canvas_origem = cv_imagemOrigem;
	local tem_cursor = bl_cursor or false;

	local canvasCampo = BibliotecaAuxiliarDesenho.desenharCampo(nb_largura,nb_altura,bl_foco,tb_cor_foco,tb_cor_fundo,bl_cursor);

	if(tem_cursor and bl_foco) then
		BibliotecaAuxiliarDesenho.desenharSetasVerticais(nb_px-22,nb_py,canvas_origem);
	end

	BibliotecaAuxiliarDesenho.desenharTexto(tb_fonte,10,25,st_texto,canvasCampo);

	BibliotecaAuxiliarDesenho.desenharImagem(nb_px,nb_py,canvasCampo,canvas_origem);
end,

------------------------------------------------
-- desenharCampo()
-- desenha Campo
--
--Parametros:
--
--Retorno:
------------------------------------------------
desenharCampo = function(nb_largura,nb_altura,bl_foco,tb_cor_foco,tb_cor_fundo)
	--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: desenharCampo('..tostring(nb_largura)..', '..tostring(nb_altura)..', '..tostring(bl_foco)..', '..tostring(tb_cor_foco)..', '..tostring(tb_cor_fundo)..', '..')');

	local canvasCampo = BibliotecaAuxiliarDesenho.newImagem(nb_largura,nb_altura);

	if(bl_foco) then
		BibliotecaAuxiliarDesenho.setCor(tb_cor_foco,canvasCampo);

		if(tb_cor_fundo.alpha == 0) then
			BibliotecaAuxiliarDesenho.desenharRetangulo(BibliotecaAuxiliarDesenho.ESTILO_CAMPO_FECHADO, 0,0, nb_largura-4,nb_altura-4,canvasCampo);
		else
			BibliotecaAuxiliarDesenho.desenharRetangulo(BibliotecaAuxiliarDesenho.ESTILO_CAMPO_PREENCHIDO, 0,0, nb_largura,nb_altura,canvasCampo);
		end

		BibliotecaAuxiliarDesenho.setCor(tb_cor_fundo,canvasCampo);
		BibliotecaAuxiliarDesenho.desenharRetangulo(BibliotecaAuxiliarDesenho.ESTILO_CAMPO_PREENCHIDO, 2,2, nb_largura-4,nb_altura-4,canvasCampo);
	else
		BibliotecaAuxiliarDesenho.setCor(tb_cor_fundo,canvasCampo);
		BibliotecaAuxiliarDesenho.desenharRetangulo(BibliotecaAuxiliarDesenho.ESTILO_CAMPO_PREENCHIDO, 0,0, nb_largura,nb_altura,canvasCampo);
	end

	return canvasCampo;
end,

------------------------------------------------
-- desenharBotao()
-- desenha Botao
--
--Parametros:
--
--Retorno:
------------------------------------------------
desenharBotao = function (st_nomeImagem,nb_px,nb_py,cv_imagemOrigem)
	--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: desenharBotao('..tostring(st_nomeImagem)..', '..tostring(nb_px)..', '..tostring(nb_py)..')');
	BibliotecaAuxiliarDesenho.desenharImagem(nb_px,nb_py,BibliotecaAuxiliarDesenho.getImagem(st_nomeImagem),cv_imagemOrigem);
end,


------------------------------------------------
-- medirTexto()
--
--
--Parametros: 	+ st_texto:string
--				+ tb_fonte:tabela
--
--Retorno:		+ number,number
------------------------------------------------
medirTexto = function(tb_fonte,st_texto,cv_tela)
	BibliotecaAuxiliarLog.registrarLog('IN:  BibliotecaAuxiliarDesenho: medirTexto('..tostring(tb_fonte)..', '..tostring(st_texto)..')');
	BibliotecaAuxiliarDesenho.setFonte(tb_fonte,cv_tela);
	--retorna a altura e a largura
	
	local l,a = cv_tela:measureText(st_texto);
	
	BibliotecaAuxiliarLog.registrarLog('OUT:  BibliotecaAuxiliarDesenho: medirTexto('..tostring(tb_fonte)..', '..tostring(st_texto)..')->'..tostring(l)..', '..tostring(a));
	
	return l,a;
end,

------------------------------------------------
-- getLarguraTexto()
--
--
--Parametros: 	+ st_texto:string
--				+ tb_fonte:tabela
--
--Retorno:		+ number
------------------------------------------------
getLarguraTexto = function(tb_fonte,st_texto)
	BibliotecaAuxiliarLog.registrarLog('IN:  BibliotecaAuxiliarDesenho: getLarguraTexto('..st_texto..')');
	local l,a = BibliotecaAuxiliarDesenho.medirTexto (tb_fonte,st_texto,canvas);
	BibliotecaAuxiliarLog.registrarLog('OUT:  BibliotecaAuxiliarDesenho: getLarguraTexto('..st_texto..')->'..tostring(l));
	return l;
end,



------------------------------------------------
-- getAlturaTexto()
--
--
--Parametros: 	+ st_texto:string
--				+ tb_fonte:tabela
--
--Retorno:		+ number
------------------------------------------------
getAlturaTexto = function(tb_fonte,st_texto)
	BibliotecaAuxiliarLog.registrarLog('IN:  BibliotecaAuxiliarDesenho: getAlturaTexto('..tostring(st_texto)..')');
	local l,a = BibliotecaAuxiliarDesenho.medirTexto(tb_fonte,"Texto",canvas);
	BibliotecaAuxiliarLog.registrarLog('OUT:  BibliotecaAuxiliarDesenho: getAlturaTexto('..tostring(st_texto)..')->'..tostring(a));
	return a;
end,

------------------------------------------------
-- desenharAreaTexto()
-- desenha Area Texto
--
--Parametros:
--
--Retorno:
------------------------------------------------
desenharAreaTexto = function(tb_cor_fundo,nb_px,nb_py,nb_largura,nb_altura,bl_foco,tb_cor_foco,tb_fonte,tabela_texto,bl_cursor,cv_imagemOrigem)
	--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: desenharAreaTexto('..tostring(tabela_texto)..')');
	local canvasCampo = BibliotecaAuxiliarDesenho.desenharCampo(nb_largura,nb_altura,bl_foco,tb_cor_foco,tb_cor_fundo,false);

	local tem_cursor = bl_cursor or false;

	for indice=1,#tabela_texto do
		BibliotecaAuxiliarDesenho.desenharTexto(tb_fonte,10,17*indice,tabela_texto[indice],canvasCampo);
	end

	if(tem_cursor and bl_foco) then
		BibliotecaAuxiliarDesenho.desenharSetasVerticais(nb_px-27,nb_py+7,cv_imagemOrigem);
	end

	BibliotecaAuxiliarDesenho.desenharImagem(nb_px,nb_py,canvasCampo,cv_imagemOrigem);
end,

------------------------------------------------
-- desenharMenu()
-- desenha Menu
--
--Parametros:
--
--Retorno:
------------------------------------------------
desenharMenu = function(tb_cor_fundo,nb_px,nb_py,nb_largura,nb_altura,bl_foco,tb_cor_foco,tabela_texto,nb_indiceFoco,tb_modelo_opcao,cv_imagemOrigem)
	--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: desenharMenu()');
	local canvasCampo = BibliotecaAuxiliarDesenho.desenharCampo(nb_largura,nb_altura,bl_foco,tb_cor_foco,tb_cor_fundo,false);
	--BibliotecaAuxiliarDesenho.desenharImagem(nb_px,nb_py,canvasCampo);

	local y_opcao = tb_modelo_opcao.py;
	for indice = 1, #tabela_texto do
		bl_isFoco = false;

		if (nb_indiceFoco == indice) then
			bl_isFoco = true;
			--BibliotecaAuxiliarDesenho.desenharSetasVerticais(nb_px,nb_py +(nb_altura_campo + 10)*indice);
		end

			BibliotecaAuxiliarDesenho.desenharCampoTexto(tb_modelo_opcao.tb_cor_fundo,
												tb_modelo_opcao.px,
												y_opcao,
												tb_modelo_opcao.largura,
												tb_modelo_opcao.altura,
												bl_isFoco,
												tb_modelo_opcao.tb_cor_foco,
												tb_modelo_opcao.tb_fonte,
												tabela_texto[indice],
												tb_modelo_opcao.bl_cursor,
												canvasCampo);

		y_opcao = y_opcao+(tb_modelo_opcao.altura);
	end

	BibliotecaAuxiliarDesenho.desenharImagem(nb_px,nb_py,canvasCampo,cv_imagemOrigem);
end,


------------------------------------------------
-- desenharMenuArea()
-- desenha Menu Area
--
--Parametros:
--
--Retorno:
------------------------------------------------
desenharMenuArea = function(tb_cor_fundo,nb_px,nb_py,nb_largura,nb_altura,bl_foco,tb_cor_foco,tabela_texto,nb_indiceFoco,tb_modelo_opcao,cv_imagemOrigem)
	--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: desenharMenuArea()');
	local canvasCampo = BibliotecaAuxiliarDesenho.desenharCampo(nb_largura,nb_altura,bl_foco,tb_cor_foco,tb_cor_fundo,false);
	--BibliotecaAuxiliarDesenho.desenharImagem(nb_px,nb_py,canvasCampo);

	local y_opcao = tb_modelo_opcao.py;

	--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: y_opcao('..tostring(y_opcao)..')');

	for indice = 1, #tabela_texto do
		bl_isFoco = false;

		if (nb_indiceFoco == indice) then
			bl_isFoco = true;
		end

			BibliotecaAuxiliarDesenho.desenharAreaTexto(tb_modelo_opcao.tb_cor_fundo,
												tb_modelo_opcao.px,
												y_opcao,
												tb_modelo_opcao.largura,
												tb_modelo_opcao.altura,
												bl_isFoco,
												tb_modelo_opcao.tb_cor_foco,
												tb_modelo_opcao.tb_fonte,
												tabela_texto[indice],
												tb_modelo_opcao.bl_cursor,
												canvasCampo);

		y_opcao = y_opcao+(tb_modelo_opcao.altura + 10);
	end

	BibliotecaAuxiliarDesenho.desenharImagem(nb_px,nb_py,canvasCampo,cv_imagemOrigem);
end,

------------------------------------------------
-- desenharCombo()
-- desenha Combo
--
--Parametros:
--
--Retorno:
------------------------------------------------
desenharCombo = function(tb_cor_fundo,nb_px,nb_py,nb_largura,nb_altura,bl_foco,tb_cor_foco,tb_modelo_opcao,cv_imagemOrigem)
	--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarDesenho: desenharCombo()');
	local canvasCampo = BibliotecaAuxiliarDesenho.desenharCampo(nb_largura,nb_altura,bl_foco,tb_cor_foco,tb_cor_fundo,false);

	tb_modelo_opcao:desenhar(canvasCampo);

	BibliotecaAuxiliarDesenho.desenharImagem(nb_px,nb_py,canvasCampo,cv_imagemOrigem);
end

}

module("BibliotecaAuxiliarDesenho",package.seeall);