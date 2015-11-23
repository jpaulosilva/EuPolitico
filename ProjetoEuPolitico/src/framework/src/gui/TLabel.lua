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
TLabel.isCentralizado = false;

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
function TLabel:draw(source,x,y,largura,altura)
  self:update();

  if(self.isFocoVisible)then

    BibliotecaAuxiliarDesenho.setCor(self:getCorFoco(),source);
  else
    BibliotecaAuxiliarDesenho.setCor(self.corFundo,source);
  end

  BibliotecaAuxiliarDesenho.desenharRetangulo('fill',x + self.px,y + self.py,self.largura,self.altura,source);
  if(self.texto ~= nil)then
    local texto_quebrado = BibliotecaAuxiliarTexto.quebrarTexto(self.fonte,self.texto,self.largura - self.margemEsquerda - self.margemDireita,1);
    BibliotecaAuxiliarDesenho.desenharTexto(self.fonte,x + self.px + self.pxTexto,y + self.py + self.pyTexto,texto_quebrado[1],source);
  end
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

  if(self.isCentralizado)then
    self.pxTexto = (self.largura - self.larguraTexto)/2;
  else
    self.pxTexto = self.margemEsquerda;
  end

  if(self.isCentralizado)then
    self.pyTexto = (self.altura -  self.alturaTexto)/2;
  else
    self.pyTexto = self.margemSuperior;
  end

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
