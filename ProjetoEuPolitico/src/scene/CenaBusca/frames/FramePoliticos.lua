BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');

FramePoliticos = TFrame.new();
FramePoliticos.id = 'FramePoliticos';


function FramePoliticos:inicialize()

   -- Alterar propriedades do FramePrincipal
  FramePoliticos:setLargura(1280);
  FramePoliticos:setAltura(720);
  FramePoliticos:setPx(0);
  FramePoliticos:setPy(0);
  FramePoliticos:setCorFundo(Cor.new({r=255,g=255,b=255,alpha=255}));
  
  local font_label= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_label.cor = Cor.new({r=0,g=0,b=0});
  
  
  local label = TLabel.new();
  label:setTexto("Frame Políticos");
  label:setFonte(font_label);
  label:setPx(10);
  label:setPy(10);
  
  FramePoliticos:addComponent(label,1);
  
end