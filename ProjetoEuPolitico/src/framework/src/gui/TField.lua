BibliotecaAuxiliarScript.execute('framework.src.gui.TMenuItem');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');

TField = TMenuItem.new();

--~Atributos
TField.id = "TField";
TField.tLabelTexto =  nil;
TField.texto =  "";
TField.fonte =  nil;
TField.tLabel =  nil;
TField.isMascara =  false;
TField.limiteMax =  10;
TField.isEditable =  true;
TField.distanciaLabel =  5;
TField.TITULO_UP = "TITULO_UP";
TField.TITULO_LEFT = "TITULO_LEFT";
TField.TITULO_RIGHT = "TITULO_RIGHT";
TField.TITULO_DOWN = "TITULO_DOWN";
TField.orientacao =  TField.TITULO_LEFT ;

TField.isAttTLabelTextoAlterado =  false;
TField.isAttTextoAlterado =  false;
TField.isAttFonteAlterado =  false;
TField.isAttTLabelAlterado =  false;
TField.isAttIsMascaraAlterado =  false;
TField.isAttLimiteMaxAlterado =  false;
TField.isAttIsEditableAlterado =  false;
TField.isAttDistanciaLabelAlterado =  false;
TField.isAttOrientacaoAlterado =  false;
TField.isAlfanumerico =  true;

TField.CHAR = ''
TField.KEY = nil
TField.IDX = -1
TField.TIMER = nil
TField.UPPER = false
TField.tempoUltimaExibicao = 0;

TField.MAP = {
  ['1'] = { '1', '.', ',' }
  , ['2'] = { 'a', 'b', 'c', '2' }
  , ['3'] = { 'd', 'e', 'f', '3' }
  , ['4'] = { 'g', 'h', 'i', '4' }
  , ['5'] = { 'j', 'k', 'l', '5' }
  , ['6'] = { 'm', 'n', 'o', '6' }
  , ['7'] = { 'p', 'q', 'r', 's', '7' }
  , ['8'] = { 't', 'u', 'v', '8' }
  , ['9'] = { 'w', 'x', 'y', 'z', '9' }
  , ['0'] = { ' ', '0' }
}

function TField.__index(tabela,chave)
  return TField[chave];
end

function TField:case(c)
  return (self.UPPER and string.upper(c)) or c
end

function TField:clearTexto()
  self.CHAR = '';
  self.IDX = -1;
  self.TIMER = nil;
  self.key = nil;
end

function TField.new(obj)
  local retorno = obj or {};
  retorno = setmetatable(retorno,TField);

  retorno:setTLabelTexto(TLabel.new());
  retorno.tLabelTexto:setTexto(retorno.texto);
  retorno.tLabelTexto:setCorFundo(Cor.new({r=255,g=255,b=255}));

  retorno.fonte = Fonte.new({nome='tiresias', tamanho=16});
  retorno.fonte.cor = Cor.new({r=0,g=0,b=0});

  retorno.tLabelTexto:setFonte(retorno.fonte);
  retorno.tLabelTexto.isTamanhoFixo = true;
  retorno.tLabelTexto.largura = retorno.limiteMax * BibliotecaAuxiliarDesenho.getLarguraTexto(retorno.fonte,'A');

  retorno.tLabelTexto:update();

  retorno:update();

  return retorno;
end

--~Funcoes
function TField:draw(source,x,y,largura,altura)
  self:update();

  --desenha o label
  if(self.tLabel ~= nil)then
    self.tLabel:draw(source,x + self.px,y + self.py,self.largura,self.altura);
  end

  self.tLabelTexto:setIsFoco(self:getIsFoco());
  self.tLabelTexto:setIsFocoVisible(self:getIsFocoVisible());

  --desenha o texto
  if(self.tLabelTexto ~= nil)then
    self.tLabelTexto:draw(source,x + self.px,y + self.py,self.largura,self.altura);
  end

end

function TField:handler(evt)
  if(self.isEditable)then
    if(BibliotecaAuxiliarEvento.isNumero(evt)) then
      local tempoAgora =  event.uptime();
      local diferencaTempo = (tempoAgora - self.tempoUltimaExibicao)/1000;

      local key = BibliotecaAuxiliarEvento.getTecla(evt);

      if(self.isAlfanumerico)then
        if (self.KEY == nil or (self.KEY == key and diferencaTempo < 1)) then
          self:apagarUltimoChar();
        else
          self:clearTexto();
        end

        self.IDX = (self.IDX + 1) % #self.MAP[key]
        self.CHAR = self.MAP[key][self.IDX+1]
        self.KEY = key

        self:setTexto(self.texto..(self:case(self.CHAR)));

        self.tempoUltimaExibicao = tempoAgora;
      else
        self:escreverTexto(key)
      end

    elseif(BibliotecaAuxiliarEvento.isBotaoCima(evt))then
      self.UPPER = not self.UPPER;
    elseif(BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))then
      self:apagarUltimoChar();
      self:clearTexto();
    --  elseif(BibliotecaAuxiliarEvento.isBotaoOk(evt))then
    --    self:apagarTexto();
    --    self:clearTexto();
    end
  end
  if(self.changed)then
    evt.changed = true;
    self.changed = false;
  end
end

function TField:isChanged()
  return self.isAttTLabelAlterado or self.isAttTextoAlterado;
end

function TField:update()

  if(self.isAttTextoAlterado) then
    if(self.isMascara)then
      local mascara = "";
      for i = 1,#self.texto do
        mascara = mascara.."*";
      end
      self.tLabelTexto:setTexto(mascara);
    else
      self.tLabelTexto:setTexto(self.texto);
    end
    self.isAttTextoAlterado = false;
  end

  if(self.isAttFonteAlterado)then
    self.tLabelTexto:setFonte(self.fonte);

    self.isAttFonteAlterado = false;

  end

  if((self.tLabelTexto ~= nil) and (self.tLabel ~= nil))then
    if(self.orientacao == TField.TITULO_UP) or (self.orientacao == TField.TITULO_DOWN)then
      self:setAltura(self.tLabelTexto.altura + self.tLabel.altura +self.distanciaLabel + self.margemSuperior+self.margemInferior);
      self:setLargura(math.max(self.tLabelTexto.largura,self.tLabel.largura) + self.margemEsquerda+self.margemDireita);

      self.tLabelTexto:setPx((self.largura - self.tLabelTexto.largura)/2);
      self.tLabel:setPx((self.largura - self.tLabel.largura)/2);

      if(self.orientacao == TField.TITULO_UP) then

        self.tLabel:setPy(self.margemSuperior);
        self.tLabelTexto:setPy(self.tLabel.py + self.tLabel.altura + self.distanciaLabel);

      elseif(self.orientacao == TField.TITULO_DOWN)then

        self.tLabelTexto:setPy(self.margemSuperior);
        self.tLabel:setPy(self.tLabelTexto.py + self.tLabelTexto.altura + self.distanciaLabel);

      end

    elseif(self.orientacao == TField.TITULO_LEFT) or (self.orientacao == TField.TITULO_RIGHT)then
      self:setAltura(math.max(self.tLabelTexto.altura,self.tLabel.altura) + self.margemSuperior+self.margemInferior);
      self:setLargura(self.tLabelTexto.largura + self.tLabel.largura +self.distanciaLabel + self.margemEsquerda + self.margemDireita);

      self.tLabel:setPy((self.altura - self.tLabel.altura)/2);
      self.tLabelTexto:setPy((self.altura - self.tLabelTexto.altura)/2);

      if(self.orientacao == TField.TITULO_LEFT) then

        self.tLabel:setPx(self.margemEsquerda);
        self.tLabelTexto:setPx(self.tLabel.px + self.tLabel.largura + self.distanciaLabel);

      elseif(self.orientacao == TField.TITULO_RIGHT)then

        self.tLabelTexto:setPx(self.margemEsquerda);
        self.tLabel:setPx(self.tLabelTexto.px + self.tLabelTexto.largura + self.distanciaLabel);

      end
    end
  elseif(self.tLabelTexto ~= nil)then
    self:setAltura(self.tLabelTexto.altura + self.margemSuperior + self.margemInferior);
    self:setLargura(self.tLabelTexto.largura + self.margemEsquerda + self.margemDireita);


    self.tLabelTexto:setPx((self.margemEsquerda+self.margemDireita)/2);
    self.tLabelTexto:setPy((self.margemInferior+self.margemSuperior)/2);

  elseif(self.tLabel ~= nil)then
    self:setAltura(self.tLabel.altura + self.margemSuperior+self.margemInferior);
    self:setLargura(self.tLabel.largura + self.margemEsquerda+self.margemDireita);

    self.tLabel:setPx((self.margemEsquerda+self.margemDireita)/2);
    self.tLabel:setPy((self.margemInferior+self.margemSuperior)/2);
  else

  end

  self.isAttTLabelAlterado = false;
  self.isAttTextoAlterado = false;

end


function TField:apagarUltimoChar()
  if(#self.texto > 0)then
    self:setTexto(string.sub(self.texto,0,#self.texto-1));
  end
end

function TField:apagarTexto()
  self:setTexto('');
end

function TField:escreverTexto(texto)
  if(#self.texto < self.limiteMax)then
    self:setTexto(self.texto..texto);
  end
end

--~Gets
function TField:getTLabelTexto()
  return self.tLabelTexto;

end

function TField:getTexto()
  return self.texto;
end

function TField:getFonte()
  return self.fonte;
end

function TField:getTLabel()
  return self.tLabel;
end

function TField:getIsMascara()
  return self.isMascara;
end

function TField:getIsAlfanumerico()
  return self.isAlfanumerico;
end

function TField:getLimiteMax()
  return self.limiteMax;
end

function TField:getIsEditable()
  return self.isEditable;
end

function TField:getDistanciaLabel()
  return self.distanciaLabel;
end

function TField:getOrientacao()
  return self.orientacao;
end


--~Sets
function TField:setTLabelTexto(tLabelTexto)
  self.tLabelTexto = tLabelTexto;
  self.changed = true;
  tLabelTexto:update();
  self.isAttTLabelTextoAlterado = true;
end

function TField:setTexto(texto)
  self.texto = texto;
  self.changed = true;
  self.isAttTextoAlterado = true;
end

function TField:setFonte(fonte)
  self.fonte = fonte;
  self.changed = true;
  self.isAttFonteAlterado = true;
end

function TField:setTLabel(tLabel)
  self.tLabel = tLabel;
  self.changed = true;
  tLabel:update();
  self.isAttTLabelAlterado = true;
end

function TField:setIsMascara(isMascara)
  self.isMascara = isMascara;
  self.changed = true;
  self.isAttIsMascaraAlterado = true;
end

function TField:setIsAlfanumerico(isAlfanumerico)
  self.isAlfanumerico = isAlfanumerico;
  self.changed = true;
end

function TField:setLimiteMax(limiteMax)
  self.limiteMax = limiteMax;
  self.changed = true;
  self.isAttLimiteMaxAlterado = true;
end

function TField:setIsEditable(isEditable)
  self.isEditable = isEditable;
  self.changed = true;
  self.isAttIsEditableAlterado = true;
end

function TField:setDistanciaLabel(distanciaLabel)
  self.distanciaLabel = distanciaLabel;
  self.changed = true;
  self.isAttDistanciaLabelAlterado = true;
end

function TField:setOrientacao(orientacao)
  self.orientacao = orientacao;
  self.changed = true;
  self.isAttOrientacaoAlterado = true;
end









































































































































































































































