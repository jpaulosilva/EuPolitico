BibliotecaAuxiliarScript.execute('framework.src.util.app.Scene')
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FramePesquisasResultados');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FrameCandidatos');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FramePoliticos');


CenaBusca = Scene.new();
CenaBusca.id = 'CenaBusca';
CenaBusca.cor = Cor.new({r=255,g=255,b=255,alpha=255});

function CenaBusca:inicialize()

  CenaBusca:addFrame(FramePesquisasResultados,FramePesquisasResultados.id);
  CenaBusca:addFrame(FrameCandidatos,FrameCandidatos.id);
  CenaBusca:addFrame(FramePoliticos,FramePoliticos.id);
 
  
  FramePesquisasResultados:inicialize();
  FrameCandidatos:inicialize();
  FramePoliticos:inicialize();
  
end