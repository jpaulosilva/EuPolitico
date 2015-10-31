--imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');

FramePrincipal = TFrame.new();
FramePrincipal.id = 'FramePrincipal';

function FramePrincipal:inicialize()

  -- Alterar propriedades do FramePrincipal
  FramePrincipal:setLargura(1280);
  FramePrincipal:setAltura(720);
  FramePrincipal:setPx(0);
  FramePrincipal:setPy(0);
  FramePrincipal:setCorFundo(Cor.new({r=255,g=255,b=255,alpha=255}));
  
  font_label= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_label.cor = Cor.new({r=0,g=0,b=0});
  
  -- Incluir componentes gráficos
--  local panel= TPanel.new();
--  panel:setLargura(640);
--  panel:setAltura(360);
--  panel:setPx(10);
--  panel:setPy(10);
--  panel:setCorFundo(Cor.new({r=255,g=0,b=0}));
  

  local label = TLabel.new();
  label:setTexto("Eu Político");
  label:setFonte(font_label);
  label:setPx(10);
  label:setPy(10);
  
--  panel:addComponent(label,1);
  
  FramePrincipal:addComponent(label,1);
end
