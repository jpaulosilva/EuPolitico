BibliotecaAuxiliarScript.execute('framework.src.gui.TMenuItem');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TImage');

TLine = TMenu.new();

--~Atributos 
TLine.id = "TLine";
TLine.data =  nil;
TLine.orientacao =  TLine.TITULO_UP;
TLine.font_header= Fonte.new({nome='tiresias', tamanho=20, is_negrito = true,cor = Cor.new({r=255,g=255,b=255})});
TLine.font_data = Fonte.new({nome='tiresias', tamanho=20,is_negrito = false,cor = Cor.new({r=255,g=94,b=94})});


TLine.isAttTImageAlterado =  false;
TLine.isAttTLabelAlterado =  false;
TLine.isAttOrientacaoAlterado =  false;

function TLine.__index(tabela,chave)
	return TLine[chave];
end


function TLine.new(obj)
	local retorno = obj or {};
	retorno = setmetatable(retorno,TLine);
	return retorno;
end

--~Funcões 
function TLine:draw()
	local img_icone = nil;
	local lb_icone = nil;
	local img_icone_updated = false;
	local lb_icone_updated = false;
	local updated = false;

	
	--desenha a imagem
	if(self.tImage ~= nil)then
		img_icone,img_icone_updated = self.tImage:draw();
	end
	
	--desenha o label
	if(self.tLabel ~= nil)then
		lb_icone,lb_icone_updated = self.tLabel:draw();
	end
	
	
	if(self:isChanged() or img_icone_updated or lb_icone_updated) then
		self:update();
		updated = true;
	end
	
	local fundo = BibliotecaAuxiliarDesenho.newImagem(self.largura,self.altura);
	BibliotecaAuxiliarDesenho.limparTela(fundo,self.corFundo);
	
	--desenha a imagem no fundo
	if(img_icone ~= nil)then
		BibliotecaAuxiliarDesenho.desenharImagem(self.tImage.px,self.tImage.py,img_icone,fundo);
	end
	
	--desenha o label no fundo
	if(lb_icone ~= nil)then
		BibliotecaAuxiliarDesenho.desenharImagem(self.tLabel.px,self.tLabel.py,lb_icone,fundo);
	end
	
	return fundo,updated;
end

function TLine:handler(evt)
	if(self.changed)then
		evt.changed = true;
		self.changed = false;
	end
end

function TLine:isChanged()
	return self.isAttOrientacaoAlterado or self.isAttTLabelAlterado or self.isAttTImageAlterado;
end

function TLine:update()
	
	if((self.tImage ~= nil) and (self.tLabel ~= nil))then
		if(self.orientacao == TLine.TITULO_UP) or (self.orientacao == TLine.TITULO_DOWN)then
			self:setAltura(self.tImage.altura + self.tLabel.altura + 1 + self.margemSuperior + self.margemInferior);
			self:setLargura(math.max(self.tImage.largura,self.tLabel.largura) + self.margemEsquerda+self.margemDireita);
			
			self.tImage:setPx((self.largura - self.tImage.largura)/2);
			self.tLabel:setPx((self.largura - self.tLabel.largura)/2);
			
			if(self.orientacao == TLine.TITULO_UP) then
				
				self.tLabel:setPy(self.margemSuperior);
				self.tImage:setPy(self.tLabel.py + self.tLabel.altura + 1);
			
			elseif(self.orientacao == TLine.TITULO_DOWN)then
				
				self.tImage:setPy(self.margemSuperior);
				self.tLabel:setPy(self.tImage.py + self.tImage.altura + 1);
			
			end
		
		elseif(self.orientacao == TLine.TITULO_LEFT) or (self.orientacao == TLine.TITULO_RIGHT)then
			self:setAltura(math.max(self.tImage.altura,self.tLabel.altura) + self.margemSuperior+self.margemInferior);
			self:setLargura(self.tImage.largura + self.tLabel.largura +10 + self.margemEsquerda + self.margemDireita);
			
			self.tLabel:setPy((self.altura - self.tLabel.altura)/2);
			self.tImage:setPy((self.altura - self.tImage.altura)/2); 
				
			if(self.orientacao == TLine.TITULO_LEFT) then
				
				self.tLabel:setPx(self.margemEsquerda);
				self.tImage:setPx(self.tLabel.px + self.tLabel.largura + 10);
					
			elseif(self.orientacao == TLine.TITULO_RIGHT)then
				
				self.tImage:setPx(self.margemEsquerda);
				self.tLabel:setPx(self.tImage.px + self.tImage.largura + 10);
				
			end
		end
	elseif(self.tImage ~= nil)then
		self:setAltura(self.tImage.altura + self.margemSuperior+self.margemInferior);
		self:setLargura(self.tImage.largura + self.margemEsquerda+self.margemDireita);
		
		self.tImage:setPx((self.margemEsquerda+self.margemDireita)/2);
		self.tImage:setPy((self.margemInferior+self.margemSuperior)/2);
	
	elseif(self.tLabel ~= nil)then
		self:setAltura(self.tLabel.altura + self.margemSuperior+self.margemInferior);
		self:setLargura(self.tLabel.largura + self.margemEsquerda+self.margemDireita);
		
		self.tLabel:setPx((self.margemEsquerda+self.margemDireita)/2);
		self.tLabel:setPy((self.margemInferior+self.margemSuperior)/2);
	else
	

	end
	
	self.isAttTLabelAlterado = false;
	self.isAttTImageAlterado = false;	
end


--~Gets 
function TLine:getTImage()
	return self.tImage;
end

function TLine:getTLabel()
	return self.tLabel;
end

function TLine:getOrientacao()
	return self.orientacao;
end


--~Sets 
function TLine:setTImage(tImage)
	if(tImage ~= nil)then
		tImage:update();
		self.tImage = tImage;
		self.changed = true;
		self.isAttTImageAlterado = true;
	end
end

function TLine:setTLabel(tLabel)
	if(tLabel ~= nil)then
		tLabel:update();
		self.tLabel = tLabel;
		self.changed = true;
		self.isAttTLabelAlterado = true;
	end
end

function TLine:setOrientacao(orientacao)
	self.orientacao = orientacao;
	self.changed = true;
	self.isAttOrientacaoAlterado = true;
end

