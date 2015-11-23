-- Imports
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TMenu');


FramePrincipal = TFrame.new();
FramePrincipal.id = 'FramePrincipal';

function FramePrincipal:inicialize()
  -- Alterar propriedades do FramePrincipal
  FramePrincipal:setLargura(1280); --320
  FramePrincipal:setAltura(720);
  FramePrincipal:setPx(0);
  FramePrincipal:setPy(0);
  FramePrincipal:setCorFundo(CenaPrincipal.cor);


  local font_logo= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_logo.cor = Cor.new({r=153,g=204,b=51});

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

  
  
  --Painel imagem de TV
  local panelTV= TPanel.new();
  panelTV:setLargura(1270); --630
  panelTV:setAltura(630); --350
  panelTV:setPx(5); --550
  panelTV:setPy(5); --100
  panelTV:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  
  local imageTV= TImage.new();
  imageTV:setSrcArquivoExterno("../media/imagem_exemplo_tv_623x350.png");
  imageTV:setPx(550);
  imageTV:setPy(100);
  
  panelTV:addComponent(imageTV,1);





  --********************************************Legendas**************************************************
  
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
  
  


  FramePrincipal:addComponent(buildBackground(),1); 
  FramePrincipal:addComponent(panelTV,2); 
  FramePrincipal:addComponent(menu,3);
  FramePrincipal:addComponent(iconeBtOk,4);
  FramePrincipal:addComponent(iconeBtSair,5)
  
  

end
