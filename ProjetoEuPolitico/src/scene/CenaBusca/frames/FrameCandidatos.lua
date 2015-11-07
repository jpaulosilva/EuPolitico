BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');

FrameCandidatos = TFrame.new();
FrameCandidatos.id = 'FrameCandidatos';


function FrameCandidatos:inicialize()

   -- Alterar propriedades do FramePrincipal
  FrameCandidatos:setLargura(1280);
  FrameCandidatos:setAltura(720);
  FrameCandidatos:setPx(0);
  FrameCandidatos:setPy(0);
  FrameCandidatos:setCorFundo(Cor.new({r=255,g=255,b=255,alpha=255}));
  
  local font_label= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_label.cor = Cor.new({r=0,g=0,b=0});
  
  local font_logo= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_logo.cor = Cor.new({r=255,g=94,b=94});
  
  
  local label = TLabel.new();
  label:setTexto("Frame Candidatos");
  label:setFonte(font_label);
  label:setPx(10);
  label:setPy(10);
  
  --*************************Legendas**************************************
  local labelBtTelaInicial = TLabel.new();
  labelBtTelaInicial:setTexto("TELA INICIAL");
  labelBtTelaInicial:setFonte(font_logo);

  local imageBtTelaInicial= TImage.new();
  imageBtTelaInicial:setSrcArquivoExterno("../media/legenda_vermelho_30.png");


  local iconeBtTelaInicial = TIcon.new();
  iconeBtTelaInicial:setTImage(imageBtTelaInicial);
  iconeBtTelaInicial:setTLabel(labelBtTelaInicial);
  iconeBtTelaInicial:setOrientacao(TIcon.TITULO_RIGHT);
  iconeBtTelaInicial:setPx(1050);
  iconeBtTelaInicial:setPy(660);
  
  FrameCandidatos:addComponent(label,1);
  FrameCandidatos:addComponent(iconeBtTelaInicial,2);
  
end