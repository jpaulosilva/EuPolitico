--imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');

FrameEstatisticas = TFrame.new();
FrameEstatisticas.id = 'FrameEstatisticas';


function FrameEstatisticas:inicialize()

   -- Alterar propriedades do FramePrincipal
  FrameEstatisticas:setLargura(1280);
  FrameEstatisticas:setAltura(720);
  FrameEstatisticas:setPx(0);
  FrameEstatisticas:setPy(0);
  FrameEstatisticas:setCorFundo(Cor.new({r=255,g=255,b=255,alpha=255}));
  
  local font_label= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_label.cor = Cor.new({r=0,g=0,b=0});
  
  
  local label = TLabel.new();
  label:setTexto("Frame Estatísticas");
  label:setFonte(font_label);
  label:setPx(10);
  label:setPy(10);
  
  FrameEstatisticas:addComponent(label,1);
  
end