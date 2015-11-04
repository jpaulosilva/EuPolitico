BibliotecaAuxiliarScript.execute('framework.src.util.app.Scene')
BibliotecaAuxiliarScript.execute('scene.CenaAtualizacoes.frames.FrameAtualizacoes');


CenaAtualizacoes = Scene.new();
CenaAtualizacoes.id = 'CenaAtualizacoes';
CenaAtualizacoes.cor = Cor.new({r=255,g=255,b=255,alpha=255});

function CenaAtualizacoes:inicialize()

  CenaAtualizacoes:addFrame(FrameAtualizacoes,FrameAtualizacoes.id);
 
  
  FrameAtualizacoes:inicialize();
  
end