--imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');

FrameAtualizacoes = TFrame.new();
FrameAtualizacoes.id = 'FrameAtualizacoes';


function FrameAtualizacoes:inicialize()

   -- Alterar propriedades do FramePrincipal
  FrameAtualizacoes:setLargura(1280);
  FrameAtualizacoes:setAltura(720);
  FrameAtualizacoes:setPx(0);
  FrameAtualizacoes:setPy(0);
  FrameAtualizacoes:setCorFundo(Cor.new({r=255,g=255,b=255,alpha=255}));
  
  local font_label= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_label.cor = Cor.new({r=0,g=0,b=0});
  
  
  local label = TLabel.new();
  label:setTexto("Frame Atualizações");
  label:setFonte(font_label);
  label:setPx(10);
  label:setPy(10);
  
  FrameAtualizacoes:addComponent(label,1);
	
end