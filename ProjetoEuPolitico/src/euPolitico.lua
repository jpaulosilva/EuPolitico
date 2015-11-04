
require("framework.framework_nclua");
BibliotecaAuxiliarScript.execute('framework.src.util.app.ObserverApplication');
BibliotecaAuxiliarScript.execute('scene.CenaPrincipal.CenaPrincipal'); 
BibliotecaAuxiliarScript.execute('scene.CenaAtualizacoes.CenaAtualizacoes');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.CenaBusca');
BibliotecaAuxiliarScript.execute('scene.CenaEstatisticas.CenaEstatisticas');
   
ObserverApplication.putScene(CenaPrincipal,CenaPrincipal.id);
ObserverApplication.putScene(CenaAtualizacoes,CenaAtualizacoes.id);
ObserverApplication.putScene(CenaBusca,CenaBusca.id);
ObserverApplication.putScene(CenaEstatisticas,CenaEstatisticas.id);


CenaPrincipal:inicialize();
CenaAtualizacoes:inicialize();
CenaBusca:inicialize();
CenaEstatisticas:inicialize();


ObserverApplication:inicialize();

    

   








