BibliotecaAuxiliarScript.execute('framework.src.gui.TComponent');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Fonte');

TLabel = TComponent.new();

--~Atributos 
TLabel.id = "TLabel";
TLabel.texto =  "";
TLabel.isTamanhoFixo =  false;
TLabel.fonte = nil;

TLabel.isAttTextoAlterado =  false;
TLabel.isAttIsTamanhoFixoAlterado =  false;
TLabel.isAttFonteAlterado =  false;

function TLabel.__index(tabela,chave)
	return TLabel[chave];
end


function TLabel.new(obj)
	local retorno = obj or {};
	retorno = setmetatable(retorno,TLabel);
	
	if(retorno.fonte == nil)then
		retorno:setFonte(Fonte.new({nome='tiresias', tamanho=16}));
		retorno.fonte.cor = Cor.new({r=255,g=255,b=255});
	end
	
	return retorno;
end

--~Funcoes 
function TLabel:draw()
	
	local updated = false;
	if(self:isChanged()) then
		self:update();
		updated = true;
	end
	
	local fundo = BibliotecaAuxiliarDesenho.newImagem(self.largura,self.altura);
	BibliotecaAuxiliarDesenho.limparTela(fundo,self.corFundo);
	
	if(self.texto ~= nil)then
		BibliotecaAuxiliarDesenho.desenharTexto(self.fonte,self.pxTexto,self.pyTexto,self.texto,fundo);
	end
	return fundo,updated;
end

function TLabel:handler(evt)
	if(self.changed)then
		evt.changed = true;
		self.changed = false;
	end
end

function TLabel:isChanged()
	return self.isAttTextoAlterado or self.isAttFonteAlterado;
end

function TLabel:update()
	self.alturaTexto = BibliotecaAuxiliarDesenho.getAlturaTexto(self.fonte,self.texto);
	self.larguraTexto = BibliotecaAuxiliarDesenho.getLarguraTexto(self.fonte,self.texto);
	
	self:setAltura(self.alturaTexto + self.margemSuperior + self.margemInferior);
	
	if(not self.isTamanhoFixo)then
		self:setLargura(self.larguraTexto + self.margemEsquerda + self.margemDireita);
	end	
		
	self.pxTexto = self.margemEsquerda;
	self.pyTexto = self.margemSuperior;
	
	self.isAttTextoAlterado= false;
	self.isAttFonteAlterado = false;
end


--~Gets 
function TLabel:getTexto()
	return self.texto;
end

function TLabel:getIsTamanhoFixo()
	return self.isTamanhoFixo;
end

function TLabel:getFonte()
	return self.fonte;
end


--~Sets 
function TLabel:setTexto(texto)
	self.texto = texto;
	self.changed = true;
	self.isAttTextoAlterado = true;
end

function TLabel:setIsTamanhoFixo(isTamanhoFixo)
	self.isTamanhoFixo = isTamanhoFixo;
	self.changed = true;
	self.isAttIsTamanhoFixoAlterado = true;
end

function TLabel:setFonte(fonte)
	self.fonte = fonte;
	self.changed = true;
	self.isAttFonteAlterado = true;
end

