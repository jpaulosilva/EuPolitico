BibliotecaAuxiliarScript.execute('framework.src.util.app.Scene')
BibliotecaAuxiliarScript.execute('scene.CenaPrincipal.frames.FrameInteracao');
BibliotecaAuxiliarScript.execute('scene.CenaPrincipal.frames.FramePrincipal');


CenaPrincipal = Scene.new();
CenaPrincipal.id = 'CenaPrincipal';
CenaPrincipal.cor = Cor.new({r=255,g=255,b=255,alpha=255});

function CenaPrincipal:inicialize()

  CenaPrincipal:addFrame(FramePrincipal,FramePrincipal.id);
  CenaPrincipal:addFrame(FrameInteracao,FrameInteracao.id);
  
  FrameInteracao:inicialize();
  FramePrincipal:inicialize();
	
end