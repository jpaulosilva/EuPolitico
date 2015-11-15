

--Atualiza o foco nos campos selecionados
function atualizarFoco(itens,indexFoco, indexFocoVisible)
  local index = 1;
  for i,v in pairs(itens) do
    if (index == indexFoco)then
      v:setIsFoco(true);
    else
      v:setIsFoco(false);
    end


    if (index == indexFocoVisible)then
      v:setIsFocoVisible(true);
    else
      v:setIsFocoVisible(false);
    end

    index = index + 1;
  end
end

function createField(texto,px,py,larguraField,fonte,cor,isCentralizado)
  local fieldHeader = nil;

  fieldHeader = TField.new();
  fieldHeader:setFonte(fonte);
  fieldHeader:setIsEditable(false);
  fieldHeader:setTexto(texto);
  fieldHeader:setPx(px);
  fieldHeader:setPy(py);
  fieldHeader:getTLabelTexto():setLargura(larguraField);
  fieldHeader:getTLabelTexto():setCorFundo(cor);
  fieldHeader:getTLabelTexto().isCentralizado = isCentralizado;
  fieldHeader:getTLabelTexto().isTamanhoFixo =  true;
  fieldHeader:update();
  return fieldHeader;

end

--Background
function buildBackground()
	
	local panelBackground = TPanel.new();
	panelBackground:setLargura(1280);
	panelBackground:setAltura(720);
	panelBackground:setPx(0);
	panelBackground:setPy(0);
	
  local background = TImage.new();
  background:setSrcArquivoExterno("../media/background_escola.png");
  
  panelBackground:addComponent(background,1);
  
  return panelBackground
 
end

function buildPainelTV1_2()
  --Painel imagem de TV
  local panelTV= TPanel.new();
  panelTV:setLargura(630);
  panelTV:setAltura(350);
  panelTV:setPx(10);
  panelTV:setPy(40);
  panelTV:setCorFundo(Cor.new({r=255,g=255,b=255}));

  local imageTV= TImage.new();
  imageTV:setSrcArquivoExterno("../media/imagem_exemplo_tv_623x350.png");

  panelTV:addComponent(imageTV,1);

  return panelTV;
end

function buildPainelTV1_3()
  --Painel imagem de TV
  local panelTV= TPanel.new();
  panelTV:setLargura(450);
  panelTV:setAltura(240);
  panelTV:setPx(20);
  panelTV:setPy(10);

  local imageTV= TImage.new();
  imageTV:setSrcArquivoExterno("../media/imagem_exemplo_tv_405x208.png");

  panelTV:addComponent(imageTV,1);

  return panelTV;
end

function buildPainelTV1_4()
  --Painel imagem de TV
  local panelTV= TPanel.new();
  panelTV:setLargura(315);
  panelTV:setAltura(175);
  panelTV:setPx(5);
  panelTV:setPy(5);

  local imageTV= TImage.new();
  imageTV:setSrcArquivoExterno("../media/imagem_exemplo_tv_311x175.png");

  panelTV:addComponent(imageTV,1);

  return panelTV;
end

function  buildPainelLegendas(nomeNavegacao,nomeOk,nomeApagar,nomeVermelho,nomeVerde,nomeAmarelo,nomeAzul)

  local panel= TPanel.new();
  panel:setLargura(1270);
  panel:setAltura(60);
  panel:setPx(5);
  panel:setPy(655);
  panel:setCorFundo(Cor.new({r=200,g=255,b=255,alpha=255}));--{r=200,g=255,b=255,alpha=255}));

  local font_logo= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_logo.cor = Cor.new({r=0,g=0,b=0,alpha=255});--{r=153,g=204,b=51,alpha=255});

  local font_data= Fonte.new({nome='tiresias', tamanho=20,is_negrito = false,cor = Cor.new({r=255,g=94,b=94})});--{r=255,g=94,b=94})});

  local labelEducaInte = TLabel.new();
  labelEducaInte:setTexto("EU POLÍTICO");
  labelEducaInte:setFonte(font_logo);
  labelEducaInte:update();
  
  labelEducaInte:setPx(5);
  labelEducaInte:setPy((panel:getAltura() - labelEducaInte:getAltura())/2);

  panel:addComponent(labelEducaInte);

  local tabela = {};
  table.insert(tabela,{nome=nomeAzul,src="../media/legenda_azul_30.png",isNavegacao=false});
  table.insert(tabela,{nome=nomeAmarelo,src="../media/legenda_amarelo_30.png",isNavegacao=false});
  table.insert(tabela,{nome=nomeVerde,src="../media/legenda_verde_30.png",isNavegacao=false});
  table.insert(tabela,{nome=nomeVermelho,src="../media/legenda_vermelho_30.png",isNavegacao=false});
  table.insert(tabela,{nome=nomeApagar,src="../media/seta_left.png",isNavegacao=false});
  table.insert(tabela,{nome=nomeOk,src="../media/legenda_ok.png",isNavegacao=false});
  table.insert(tabela,{nome=nomeNavegacao,src="",isNavegacao=true});

  local px = 1270;

  for i,v in pairs(tabela) do
    local nome = v.nome;
    local src = v.src;
    local isNavegacao = v.isNavegacao;

    if(nome ~= nil and not isNavegacao) then
      local label = TLabel.new();
      label:setTexto(nome);
      label:setFonte(font_data);

      local image= TImage.new();
      image:setSrcArquivoExterno(src);

      local icone= TIcon.new();
      icone:setTImage(image);
      icone:setTLabel(label);
      icone:setOrientacao(TIcon.TITULO_RIGHT);
      icone:update();

      px = px - icone:getLargura() - 10;

      icone:setPx(px);
      icone:setPy((panel:getAltura() - icone:getAltura())/2);

      panel:addComponent(icone);
    elseif(nome ~= nil and isNavegacao) then

      local labelNavegar = TLabel.new();
      labelNavegar:setTexto(nome);
      labelNavegar:setFonte(font_data);
      labelNavegar:update();

      px = px - labelNavegar:getLargura() - 10;

      labelNavegar:setPx(px);
      labelNavegar:setPy((panel:getAltura() - labelNavegar:getAltura())/2);



      local imageSetaUp= TImage.new();
      imageSetaUp:setSrcArquivoExterno("../media/seta_up.png");
      imageSetaUp:update();

      px = px - imageSetaUp:getLargura() - 10;

      imageSetaUp:setPx(px);
      imageSetaUp:setPy((panel:getAltura() - 2 * imageSetaUp:getAltura() - 2)/2);

      local imageSetaDown= TImage.new();
      imageSetaDown:setSrcArquivoExterno("../media/seta_down.png");
      imageSetaDown:update();

      imageSetaDown:setPx(px);
      imageSetaDown:setPy(((panel:getAltura() - 2 * imageSetaUp:getAltura() - 2)/2) + imageSetaUp:getAltura() + 2);

      panel:addComponent(imageSetaUp);
      panel:addComponent(imageSetaDown);
      panel:addComponent(labelNavegar);

    end
  end

  return panel;
end
