require("framework.framework_nclua");
BibliotecaAuxiliarScript.execute('framework.src.util.app.ObserverApplication');
BibliotecaAuxiliarScript.execute('scene.CenaAtualizacoes.CenaAtualizacoes');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.CenaBusca');
BibliotecaAuxiliarScript.execute('scene.CenaBuscaCandidatos.CenaBuscaCandidatos');
BibliotecaAuxiliarScript.execute('scene.CenaPrincipal.CenaPrincipal');
BibliotecaAuxiliarScript.execute('scene.CenaEstatisticas.CenaEstatisticas');      		


ObserverApplication.putScene(CenaPrincipal,CenaPrincipal.id);
ObserverApplication.putScene(CenaBusca,CenaBusca.id);
ObserverApplication.putScene(CenaBuscaCandidatos,CenaBuscaCandidatos.id);
ObserverApplication.putScene(CenaEstatisticas,CenaEstatisticas.id);
ObserverApplication.putScene(CenaAtualizacoes,CenaAtualizacoes.id);


CenaPrincipal:inicialize();
CenaBusca:inicialize();
CenaBuscaCandidatos:inicialize();
CenaEstatisticas:inicialize();
CenaAtualizacoes:inicialize();

ObserverApplication:inicialize();
