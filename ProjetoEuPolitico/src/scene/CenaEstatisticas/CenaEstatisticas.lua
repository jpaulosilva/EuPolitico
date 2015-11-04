BibliotecaAuxiliarScript.execute('framework.src.util.app.Scene')
BibliotecaAuxiliarScript.execute('scene.CenaEstatisticas.frames.FrameEstatisticas');


CenaEstatisticas = Scene.new();
CenaEstatisticas.id = 'CenaEstatisticas';
CenaEstatisticas.cor = Cor.new({r=255,g=255,b=255,alpha=255});

function CenaEstatisticas:inicialize()

  CenaEstatisticas:addFrame(FrameEstatisticas,FrameEstatisticas.id);
 
  
  FrameEstatisticas:inicialize();
  
end