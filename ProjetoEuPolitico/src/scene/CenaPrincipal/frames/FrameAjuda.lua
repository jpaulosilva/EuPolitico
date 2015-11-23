-- Imports
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');


FrameAjuda = TFrame.new();
FrameAjuda.id = 'FrameAjuda';

function FrameAjuda:inicialize()
  -- Alterar propriedades do FrameAjuda
  FrameAjuda:setLargura(1280); --320
  FrameAjuda:setAltura(720);
  FrameAjuda:setPx(0);
  FrameAjuda:setPy(0);
  FrameAjuda:setCorFundo(CenaPrincipal.cor);

  local font_label= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_label.cor = Cor.new({r=255,g=94,b=94});

  local font_logo= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_logo.cor = Cor.new({r=153,g=204,b=51});

  local label = TLabel.new();
  label:setTexto("FrameAjuda");
  label:setFonte(font_label);
  label:setPx(10);
  label:setPy(10);


  --**************************************************Legendas*****************************************************
  local labelEducaInte = TLabel.new();
  labelEducaInte:setTexto("EDUCAÇÃO INTELIGENTE");
  labelEducaInte:setFonte(font_logo);
  labelEducaInte:setPx(10);
  labelEducaInte:setPy(680);


  local labelMenu = TLabel.new();
  labelMenu:setTexto("MENU");
  labelMenu:setFonte(CenaBusca.font_data);

  local imageMenu= TImage.new();
  imageMenu:setSrcArquivoExterno("../media/legenda_vermelho_30.png");


  local iconeMenu= TIcon.new();
  iconeMenu:setTImage(imageMenu);
  iconeMenu:setTLabel(labelMenu);
  iconeMenu:setOrientacao(TIcon.TITULO_RIGHT);
  iconeMenu:setPx(1110);
  iconeMenu:setPy(670);

  FrameAjuda:addComponent(label,1);
  FrameAjuda:addComponent(labelEducaInte,2);
  FrameAjuda:addComponent(iconeMenu,3);

end
