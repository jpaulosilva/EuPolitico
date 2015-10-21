BibliotecaAuxiliarScript.execute('framework.src.gui.TComponent');

TImage = TComponent.new();

--~Atributos 
TImage.id = "TImage";
TImage.srcArquivoExterno =  nil;
TImage.alturaImage =  nil;
TImage.larguraImage =  nil;

TImage.isAttAlturaImageAlterado =  false;
TImage.isAttLarguraImageAlterado =  false;
TImage.isAttSrcArquivoExternoAlterado =  false;

function TImage.__index(tabela,chave)
	return TImage[chave];
end


function TImage.new(obj)
	local retorno = obj or {};
	retorno = setmetatable(retorno,TImage);
	return retorno;
end

--~Funcões 
function TImage:draw()

	local img = BibliotecaAuxiliarDesenho.getImagem(self:getSrcArquivoExterno());	
	
	local updated = false;
	
	if(self:isChanged()) then
		self:update();
		updated = true;
	end
	
	--img:attrSize(self.largura,self.altura);
	
	local fundo = BibliotecaAuxiliarDesenho.newImagem(self.largura,self.altura);
	BibliotecaAuxiliarDesenho.limparTela(fundo,self:getCorFundo());



	
		
	BibliotecaAuxiliarDesenho.desenharImagem(0,0,img,fundo);
	
	return fundo,updated;
end

function TImage:handler(evt)

	if(self.changed)then
		evt.changed = true;
		self.changed = false;
	end
end

function TImage:isChanged()
	return self.isAttLarguraImageAlterado or self.isAttSrcArquivoExternoAlterado or self.isAttAlturaImageAlterado;
end

function TImage:update()
	
	if(self.isAttSrcArquivoExternoAlterado) then
		local img = BibliotecaAuxiliarDesenho.getImagem(self:getSrcArquivoExterno());
	
		local larguraOriginal, alturaOriginal = img:attrSize();	
		self:setLargura(self.larguraImage or larguraOriginal); 
		self:setAltura(self.alturaImage or alturaOriginal);
		
		self.isAttLarguraImageAlterado = false;
		self.isAttAlturaImageAlterado = false;
	end

end


--~Gets 
function TImage:getSrcArquivoExterno()
	return self.srcArquivoExterno;
end
 
function TImage:getAlturaImage()
	return self.alturaImage;
end

function TImage:getLarguraImage()
	return self.larguraImage;
end


--~Sets 
function TImage:setAlturaImage(alturaImage)
	self.alturaImage = alturaImage;
	self.changed = true;
	self.isAttAlturaImageAlterado = true;
end

function TImage:setLarguraImage(larguraImage)
	self.larguraImage = larguraImage;
	self.changed = true;
	self.isAttLarguraImageAlterado = true;
end
 
function TImage:setSrcArquivoExterno(srcArquivoExterno)
	self.srcArquivoExterno = srcArquivoExterno;
	self.changed = true;
	self.isAttSrcArquivoExternoAlterado = true;
end

