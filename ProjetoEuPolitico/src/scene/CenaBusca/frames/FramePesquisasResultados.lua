--imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');

FramePesquisasResultados = TFrame.new();
FramePesquisasResultados.id = 'FramePesquisasResultados';


function FramePesquisasResultados:inicialize()

   -- Alterar propriedades do FramePrincipal
  FramePesquisasResultados:setLargura(1280);
  FramePesquisasResultados:setAltura(720);
  FramePesquisasResultados:setPx(0);
  FramePesquisasResultados:setPy(0);
  FramePesquisasResultados:setCorFundo(Cor.new({r=255,g=255,b=255,alpha=255}));
  
  local font_label= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_label.cor = Cor.new({r=0,g=0,b=0});
  
  
  local label = TLabel.new();
  label:setTexto("Frame Pesquisas e Resultados");
  label:setFonte(font_label);
  label:setPx(10);
  label:setPy(10);
  
  FramePesquisasResultados:addComponent(label,1);
  
end