--imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TMenu');

FramePrincipal = TFrame.new();
FramePrincipal.id = 'FramePrincipal';

function FramePrincipal:inicialize()

  -- Alterar propriedades do FramePrincipal
  FramePrincipal:setLargura(1280);
  FramePrincipal:setAltura(720);
  FramePrincipal:setPx(0);
  FramePrincipal:setPy(0);
  FramePrincipal:setCorFundo(Cor.new({r=255,g=255,b=255,alpha=255}));
  
  local font_label= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_label.cor = Cor.new({r=0,g=0,b=0});
  
  local font_logo= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_logo.cor = Cor.new({r=255,g=94,b=94});
  
  
  local menu = TMenu.new();
  menu:addAllItens(CenaPrincipal:getItensMenu());
  menu:setOrientacao(TMenu.VERTICAL);
  menu:setTamanhoJanela(5);
  menu:setIsVisibleSetas(false);
  menu:setIsItensCentralizados(false);
--  menu:setCorFoco(Cor.new({r=255,g=255,b=0,alpha=255}));
  menu:update();

  menu:setPx(20)--(FramePrincipal:getLargura() - menu:getLargura())/2);
  menu:setPy(100)--(FramePrincipal:getAltura() - menu:getAltura())/2);
  
  -- Incluir componentes gráficos
--  local panel= TPanel.new();
--  panel:setLargura(640);
--  panel:setAltura(360);
--  panel:setPx(10);
--  panel:setPy(10);
--  panel:setCorFundo(Cor.new({r=255,g=0,b=0}));
--  panel:addComponent(label,1);  

  local label = TLabel.new();
  label:setTexto("Eu Político");
  label:setFonte(font_label);
  label:setPx(10);
  label:setPy(10);
  
  --**************************Legendas*********************
  --Legenda Selecionar
  local labelBtOk = TLabel.new();
  labelBtOk:setTexto("SELECIONAR");
  labelBtOk:setFonte(font_logo);

  local imageBtOk= TImage.new();
  imageBtOk:setSrcArquivoExterno("../media/legenda_ok.png");


  local iconeBtOk= TIcon.new();
  iconeBtOk:setTImage(imageBtOk);
  iconeBtOk:setTLabel(labelBtOk);
  iconeBtOk:setOrientacao(TIcon.TITULO_RIGHT);
  iconeBtOk:setPx(440);
  iconeBtOk:setPy(660);
  
  --Legenda sair
  local labelBtSair = TLabel.new();
  labelBtSair:setTexto("SAIR");
  labelBtSair:setFonte(font_logo);

  local imageBtSair= TImage.new();
  imageBtSair:setSrcArquivoExterno("../media/legenda_vermelho_30.png");


  local iconeBtSair= TIcon.new();
  iconeBtSair:setTImage(imageBtSair);
  iconeBtSair:setTLabel(labelBtSair);
  iconeBtSair:setOrientacao(TIcon.TITULO_RIGHT);
  iconeBtSair:setPx(740);
  iconeBtSair:setPy(660);

  
  FramePrincipal:addComponent(label,1);
  FramePrincipal:addComponent(menu,2);
  FramePrincipal:addComponent(iconeBtOk,3);
  FramePrincipal:addComponent(iconeBtSair,4);
end
