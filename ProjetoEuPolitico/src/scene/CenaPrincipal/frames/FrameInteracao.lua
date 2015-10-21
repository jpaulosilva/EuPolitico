-- Imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.gui.TImage');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');   


FrameInteracao = TFrame.new();
FrameInteracao.id = 'FrameInteracao';

function FrameInteracao:inicialize()
  -- Alterar propriedades do FrameInteracao
  FrameInteracao:setLargura(1280);
  FrameInteracao:setAltura(720);
  FrameInteracao:setPx(0);
  FrameInteracao:setPy(0);
  FrameInteracao:setCorFundo(CenaPrincipal.cor);
  
  -- Incluir componentes gráficos
  local imageIconeCartola = TImage.new();
  imageIconeCartola:setSrcArquivoExterno('../media/interacao.png');
  imageIconeCartola:setPx(1130);
  imageIconeCartola:setPy(570);  
  
  FrameInteracao:addComponent(imageIconeCartola,1);
end