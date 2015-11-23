BibliotecaAuxiliarScript.execute('framework.src.gui.TComponent');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Fonte');
BibliotecaAuxiliarScript.execute('framework.src.util.lua.BibliotecaAuxiliarTexto');

TText = TComponent.new();

--~Atributos 
TText.id = "TText";
TText.texto =  nil;
TText.fonte =  nil;
TText.isEditable =  false;
TText.tLabel =  nil;

TText.isAttTextoAlterado =  false;
TText.isAttFonteAlterado =  false;
TText.isAttIsEditableAlterado =  false;
TText.isAttTLabelAlterado =  false;

function TText.__index(tabela,chave)
	return TText[chave];
end


function TText.new(obj)
	local retorno = obj or {};
	retorno = setmetatable(retorno,TText);
	
	retorno:setFonte(Fonte.new({nome='tiresias', tamanho=12}));
	retorno.fonte.cor = Cor.new({r=0,g=255,b=255});
	
	
	return retorno;

end

--~Funcoes 
function TText:draw(source,x,y,largura,altura)
	if(self:isChanged()) then
		self:update();
	end
	
	BibliotecaAuxiliarDesenho.setCor(self.corFundo,source);
    BibliotecaAuxiliarDesenho.desenharRetangulo('fill',x + self.px,y + self.py,self.largura,self.altura,source);
	
	if(self.texto ~= nil)then
		local px_inicial = self.px_texto;
		local py_inicial = self.py_texto;
	
		for i = 1, #self.tb_texto_quebrado do
		  local palavra = tostring(self.tb_texto_quebrado[i]);

      if(palavra == "nil" or palavra == nil)then
         palavra = "";
      end
          
			BibliotecaAuxiliarDesenho.desenharTexto(self.fonte,x + self.px + px_inicial,y + self.py + py_inicial,palavra,source);
			py_inicial = py_inicial + self.altura_linha;
		end
		
	end

end

function TText:handler(evt)
if(self.changed)then
		evt.changed = true;
		self.changed = false;
	end
end

function TText:isChanged()
	return self.isAttTextoAlterado or self.isAttFonteAlterado;
end


function TText:update()
	self.tb_texto_quebrado = BibliotecaAuxiliarTexto.quebrarTexto(self.fonte,self.texto,self.largura - self.margemEsquerda - self.margemDireita);

	BibliotecaAuxiliarLog.registrarLog(tostring(self.tb_texto_quebrado[1]));	
	self.altura_linha = BibliotecaAuxiliarDesenho.getAlturaTexto(self.fonte,self.tb_texto_quebrado[1]) + 2;
	
	
	self.altura_texto = (#self.tb_texto_quebrado)*self.altura_linha;
	self:setAltura(self.altura_texto + self.margemSuperior + self.margemInferior)
		
	self.px_texto = self.margemEsquerda;
	self.py_texto = self.margemSuperior;

	self.isAttTextoAlterado = false;
	self.isAttFonteAlterado = false;
end


--~Gets 
function TText:getTexto()
	return self.texto;
end

function TText:getFonte()
	return self.fonte;
end

function TText:getIsEditable()
	return self.isEditable;
end

function TText:getTLabel()
	return self.tLabel;
end


--~Sets 
function TText:setTexto(texto)
	self.texto = texto;
	self.changed = true;
	self.isAttTextoAlterado = true;
end

function TText:setFonte(fonte)
	self.fonte = fonte;
	self.changed = true;
	self.isAttFonteAlterado = true;
end

function TText:setIsEditable(isEditable)
	self.isEditable = isEditable;
	self.changed = true;
	self.isAttIsEditableAlterado = true;
end

function TText:setTLabel(tLabel)
	self.tLabel = tLabel;
	self.changed = true;
	self.isAttTLabelAlterado = true;
end

