BibliotecaAuxiliarScript.execute('framework.src.gui.TMenuItem');
BibliotecaAuxiliarScript.execute('framework.src.gui.TImage');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.BibliotecaAuxiliarDesenho');
BibliotecaAuxiliarScript.execute('framework.src.util.event.BibliotecaAuxiliarEvento');
BibliotecaAuxiliarScript.execute('framework.src.util.lua.BibliotecaAuxiliarTabela');
BibliotecaAuxiliarScript.execute('framework.src.util.lua.BibliotecaAuxiliarMath');

TMenu = TMenuItem.new();

--~Atributos 
TMenu.id = "TMenu";
TMenu.isCiclico =  nil;
TMenu.itens =  nil;
TMenu.inicioJanela =  1;
TMenu.opcaoSelecionada =  1;
TMenu.tamanhoJanela =  3;
TMenu.opcaoSelecionadaJanela =  1;
TMenu.itensJanela =  nil;
TMenu.distanciaItens =  2;
TMenu.HORIZONTAL = 'HORIZONTAL';
TMenu.VERTICAL = 'VERTICAL';
TMenu.orientacao =  TMenu.VERTICAL;
TMenu.isVisibleSetas = true;

TMenu.isAttIsCiclicoAlterado =  false;
TMenu.isAttItensAlterado =  false;
TMenu.isAttInicioJanelaAlterado =  false;
TMenu.isAttOpcaoSelecionadaAlterado =  false;
TMenu.isAttTamanhoJanelaAlterado =  false;
TMenu.isAttOpcaoSelecionadaJanelaAlterado =  false;
TMenu.isAttItensJanelaAlterado =  false;
TMenu.isAttDistanciaItensAlterado =  false;
TMenu.isAttOrientacaoAlterado =  false;

function TMenu.__index(tabela,chave)
	return TMenu[chave];
end


function TMenu.new(obj)
	local retorno = obj or {};
	retorno = setmetatable(retorno,TMenu);
	
	--inicializando os atributos;
	retorno.itens = {};	
	
	--inicializando a img das setas;
	retorno.img_seta_left = TImage.new();
	retorno.img_seta_right = TImage.new();
	retorno.img_seta_up = TImage.new();
	retorno.img_seta_down = TImage.new();
	
	--ver se mantem ou nao as setas na memoria
	retorno.img_seta_left:setSrcArquivoExterno('../media/seta_left.png');
	retorno.img_seta_right:setSrcArquivoExterno('../media/seta_right.png');
	retorno.img_seta_up:setSrcArquivoExterno('../media/seta_up.png');
	retorno.img_seta_down:setSrcArquivoExterno('../media/seta_down.png');
	
	retorno.img_seta_left:update();
	retorno.img_seta_right:update();
	retorno.img_seta_up:update();
	retorno.img_seta_down:update();
	
	return retorno;
end

function TMenu:draw()
	--desenha de acordo com a orientacao
	
	if(self.itensJanela == nil or self.itensJanela == {})then
		self.itensJanela = self:getJanela();
	end
	
	local componentes_menu = {};
	local componentes_menu_updated = false;
	local updated = false;
	
	for indice = 1, #self.itensJanela do
		local componente_updated = false;
		local componente = nil;
		
		componente, componente_updated = self.itensJanela[indice]:draw();
		componentes_menu_updated = componente_updated or componente_updated;
		table.insert(componentes_menu,componente);
	end
	
	if(self:isChanged() or componentes_menu_updated) then
		self:update();
		updated = true;
	end
	
	local fundo = BibliotecaAuxiliarDesenho.newImagem(self.largura,self.altura);
	BibliotecaAuxiliarDesenho.limparTela(fundo,self.corFundo);
	
	local px_inicial; 
	local py_inicial;
	
	if(self.orientacao == TMenu.HORIZONTAL)then
		--desenha setas esq
		
		px_inicial = self.margemEsquerda;
		py_inicial = (self.altura - self.img_seta_left.altura)/2;

		if(self.isVisibleSetas)then
			BibliotecaAuxiliarDesenho.desenharImagem(px_inicial,py_inicial,self.img_seta_left:draw(),fundo);
		
			px_inicial = px_inicial + self.img_seta_left.largura + self.distanciaItens;
		end			
	elseif(self.orientacao == TMenu.VERTICAL)then
		--desenha setas cima
		px_inicial = (self.largura - self.img_seta_left.largura)/2;
		py_inicial = self.margemSuperior;
		
		if(self.isVisibleSetas)then
			BibliotecaAuxiliarDesenho.desenharImagem(px_inicial,py_inicial,self.img_seta_up:draw(),fundo);
			
			py_inicial = py_inicial + self.img_seta_up.altura + self.distanciaItens;
		end
	end
	
	for indice = 1, #self.itensJanela do
		if(self.orientacao == TMenu.HORIZONTAL)then
			--desenhar itens na horizontal
			
			py_inicial = (self.altura - self.itensJanela[indice].altura)/2;
			
			if(indice == self.opcaoSelecionadaJanela and self:getIsFocoVisible())then
				--desenharfoco
				local foco = BibliotecaAuxiliarDesenho.newImagem(self.itensJanela[indice].largura + self.distanciaItens,self.altura);
				BibliotecaAuxiliarDesenho.limparTela(foco,self:getCorFoco());
				BibliotecaAuxiliarDesenho.desenharImagem(px_inicial-self.distanciaItens/2,0,foco,fundo);
			end
			
			BibliotecaAuxiliarDesenho.desenharImagem(px_inicial,py_inicial,componentes_menu[indice],fundo);
			px_inicial = px_inicial+self.itensJanela[indice].largura + self.distanciaItens;	
			
		elseif(self.orientacao == TMenu.VERTICAL)then
			--desenha itens na vertical
			
			px_inicial = (self.largura - self.itensJanela[indice].largura)/2;
			
			if(indice == self.opcaoSelecionadaJanela and self:getIsFocoVisible())then
				--desenharfoco
				--usar o obj foco
				local foco = BibliotecaAuxiliarDesenho.newImagem(self.itensJanela[indice].largura+(self.margemEsquerda+self.margemDireita),self.itensJanela[indice].altura + self.distanciaItens);
				BibliotecaAuxiliarDesenho.limparTela(foco,self:getCorFoco());
				BibliotecaAuxiliarDesenho.desenharImagem(px_inicial-(self.margemEsquerda+self.margemDireita)/2,py_inicial - self.distanciaItens/2,foco,fundo);
			
			end
			
			BibliotecaAuxiliarDesenho.desenharImagem(px_inicial,py_inicial,componentes_menu[indice],fundo);
			py_inicial = py_inicial + self.itensJanela[indice].altura + self.distanciaItens;	
			
		end
		
	end
	
	if(self.orientacao == TMenu.HORIZONTAL)then
		--desenhar seta direita;
		py_inicial = (self.altura - self.img_seta_right.altura)/2;
		if(self.isVisibleSetas)then
			BibliotecaAuxiliarDesenho.desenharImagem(px_inicial,py_inicial,self.img_seta_right:draw(),fundo);
		end
		
	elseif(self.orientacao == TMenu.VERTICAL)then
		--desenha seta baixo
		px_inicial = (self.largura - self.img_seta_right.largura)/2;
		
		if(self.isVisibleSetas)then
			BibliotecaAuxiliarDesenho.desenharImagem(px_inicial,py_inicial,self.img_seta_down:draw(),fundo);
		end
		
	end

	
	return fundo,updated;
end

function TMenu:handler(evt)
	if(BibliotecaAuxiliarEvento.isBotaoOk(evt) and self.itensJanela[self.opcaoSelecionadaJanela] ~= nil and self.itensJanela[self.opcaoSelecionadaJanela].action ~= nil)then
		self.itensJanela[self.opcaoSelecionadaJanela]:action(evt);
	elseif((self.orientacao == TMenu.VERTICAL and (BibliotecaAuxiliarEvento.isBotaoCima(evt) or BibliotecaAuxiliarEvento.isBotaoBaixo(evt))) or (self.orientacao == TMenu.HORIZONTAL and (BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))))then
		self.itensJanela = self:getJanela(evt);
	elseif(self.itensJanela ~= nil and self.itensJanela[self.opcaoSelecionadaJanela] ~= nil and self.itensJanela[self.opcaoSelecionadaJanela].handler ~= nil)then
		self.itensJanela[self.opcaoSelecionadaJanela]:handler(evt);
	end
	
	if(self.changed)then
		evt.changed = true;
		self.changed = false;
	end
end

function TMenu:isChanged()
	return self.isAttItensAlterado;
end

function TMenu:update()
	if(self.itensJanela == nil)then
		self:setItensJanela(self:getJanela());
	end
	
	if(self.isAttItensAlterado)then
		if(self.orientacao == TMenu.HORIZONTAL) then
			self:setAltura(math.max(unpack(BibliotecaAuxiliarTabela.getVariavelTabela(self.itens,"altura")))+self.margemSuperior+self.margemInferior);		
			self:setLargura(BibliotecaAuxiliarMath.sum(self.img_seta_left.largura,self.img_seta_right.largura,self.margemEsquerda,self.margemDireita,(#self.itensJanela + 2) * self.distanciaItens, unpack(BibliotecaAuxiliarTabela.getVariavelTabela(self.itensJanela,"largura"))));	

		elseif(self.orientacao == TMenu.VERTICAL)then
			BibliotecaAuxiliarLog.registrarLog(tostring(BibliotecaAuxiliarTabela.getVariavelTabela(self.itens,"largura")));
			BibliotecaAuxiliarLog.registrarLog(tostring((BibliotecaAuxiliarTabela.getVariavelTabela(self.itens,"largura"))));
			BibliotecaAuxiliarLog.registrarLog(tostring(math.max(unpack(BibliotecaAuxiliarTabela.getVariavelTabela(self.itens,"largura")))));

			self:setLargura(math.max(unpack(BibliotecaAuxiliarTabela.getVariavelTabela(self.itens,"largura"))) + self.margemEsquerda + self.margemDireita);		
			self:setAltura(BibliotecaAuxiliarMath.sum(self.img_seta_left.altura,self.img_seta_right.altura,self.margemSuperior,self.margemInferior,(#self.itensJanela + 2) * self.distanciaItens, unpack(BibliotecaAuxiliarTabela.getVariavelTabela(self.itensJanela,"altura"))));	
		
		end
		
	self.isAttItensAlterado = false;
	
	end
	
	
end



function TMenu:addItem(item)
	item:update();
	table.insert(self.itens,item);
	self.isAttItensAlterado = true;
end

function TMenu:addAllItens(itens)
	for i,v in pairs(itens) do
		self:addItem(v);
	end	
end

function TMenu:removeAllItens()
	self:setItens({});
end

function TMenu:getJanela(evt)
	local itens = {};
	if(self.orientacao == TMenu.HORIZONTAL or self.orientacao == TMenu.VERTICAL)then
		if(evt ~= nil and ((BibliotecaAuxiliarEvento.isBotaoEsquerda(evt) and self.orientacao == TMenu.HORIZONTAL)  or (BibliotecaAuxiliarEvento.isBotaoCima(evt)and self.orientacao == TMenu.VERTICAL)))then
			if(self.opcaoSelecionada > 1) then
				self:setOpcaoSelecionada(self.opcaoSelecionada - 1);
			end
			
			if(self.opcaoSelecionadaJanela > 1) then
				self:setOpcaoSelecionadaJanela(self.opcaoSelecionadaJanela - 1);
			end
		elseif(evt ~= nil and ((BibliotecaAuxiliarEvento.isBotaoDireita(evt)and self.orientacao == TMenu.HORIZONTAL) or (BibliotecaAuxiliarEvento.isBotaoBaixo(evt)and self.orientacao == TMenu.VERTICAL)))then
			
			if(self.opcaoSelecionada < #self.itens) then
				self:setOpcaoSelecionada(self.opcaoSelecionada + 1);
			end
			
			if(self.opcaoSelecionadaJanela < self.tamanhoJanela) then
				self:setOpcaoSelecionadaJanela(self.opcaoSelecionadaJanela + 1);
			end
			
		end
	end
	
	if(self.inicioJanela > self.opcaoSelecionada)then
		self:setInicioJanela(self.inicioJanela - 1);
	elseif(self.inicioJanela + self.tamanhoJanela - 1 < self.opcaoSelecionada) then
		self:setInicioJanela(self.inicioJanela + 1);
	end
	
	
	for indice = self.inicioJanela, self.inicioJanela + self.tamanhoJanela - 1 do
		table.insert(itens,self.itens[indice]);
	end
	
	return itens;
end



--~Gets 
function TMenu:getIsCiclico()
	return self.isCiclico;
end

function TMenu:getItens()
	return self.itens;
end

function TMenu:getInicioJanela()
	return self.inicioJanela;
end

function TMenu:getOpcaoSelecionada()
	return self.opcaoSelecionada;
end

function TMenu:getTamanhoJanela()
	return self.tamanhoJanela;
end

function TMenu:getOpcaoSelecionadaJanela()
	return self.opcaoSelecionadaJanela;
end

function TMenu:getItensJanela()
	return self.itensJanela;
end

function TMenu:getDistanciaItens()
	return self.distanciaItens;
end

function TMenu:getOrientacao()
	return self.orientacao;
end

function TMenu:getIsVisibleSetas()
	return self.isVisibleSetas;
end
 
--~Sets 
function TMenu:setIsVisibleSetas(isVisibleSetas)
	self.isVisibleSetas = isVisibleSetas;
	self.changed = true;
end

function TMenu:setIsCiclico(isCiclico)
	self.isCiclico = isCiclico;
	self.changed = true;
	self.isAttIsCiclicoAlterado = true;
end

function TMenu:setItens(itens)
	self.itens = itens;
	self.changed = true;
	self.isAttItensAlterado = true;
end

function TMenu:setInicioJanela(inicioJanela)
	self.inicioJanela = inicioJanela;
	self.changed = true;
	self.isAttInicioJanelaAlterado = true;
end

function TMenu:setOpcaoSelecionada(opcaoSelecionada)
	self.opcaoSelecionada = opcaoSelecionada;
	self.changed = true;
	self.isAttOpcaoSelecionadaAlterado = true;
end

function TMenu:setTamanhoJanela(tamanhoJanela)
	self.tamanhoJanela = tamanhoJanela;
	self.changed = true;
	self.isAttTamanhoJanelaAlterado = true;
end

function TMenu:setOpcaoSelecionadaJanela(opcaoSelecionadaJanela)
	self.opcaoSelecionadaJanela = opcaoSelecionadaJanela;
	self.changed = true;
	self.isAttOpcaoSelecionadaJanelaAlterado = true;
end

function TMenu:setItensJanela(itensJanela)
	self.itensJanela = itensJanela;
	self.changed = true;
	self.isAttItensJanelaAlterado = true;
end

function TMenu:setDistanciaItens(distanciaItens)
	self.distanciaItens = distanciaItens;
	self.changed = true;
	self.isAttDistanciaItensAlterado = true;
end

function TMenu:setOrientacao(orientacao)
	self.orientacao = orientacao;
	self.changed = true;
	self.isAttOrientacaoAlterado = true;
end

