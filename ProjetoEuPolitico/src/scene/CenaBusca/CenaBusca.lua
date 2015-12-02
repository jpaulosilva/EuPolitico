BibliotecaAuxiliarScript.execute('framework.src.util.app.Scene');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FrameConsultarPolitico');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FrameConsultarPoliticoAvancado');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FrameVisualizarPolitico');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FrameVisualizarEscolaComparar');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FramePesquisasResultados');
BibliotecaAuxiliarScript.execute('data.Localizacoes');
BibliotecaAuxiliarScript.execute('data.ListaDeputados');
BibliotecaAuxiliarScript.execute('data.Politico');
BibliotecaAuxiliarScript.execute('data.FiltroPolitico');
BibliotecaAuxiliarScript.execute('data.ListaEstatisticas');
BibliotecaAuxiliarScript.execute('data.Estatistica');
BibliotecaAuxiliarScript.execute('data.FiltroEstatisticasRegiao');
BibliotecaAuxiliarScript.execute('utils.Utils');

BibliotecaAuxiliarScript.execute('data.ListaMelhoresEscolas');
BibliotecaAuxiliarScript.execute('data.MelhoresEscolas');       --[[código adicionado]]--
BibliotecaAuxiliarScript.execute('data.FiltroMelhoresEscolas');

CenaBusca = Scene.new();
CenaBusca.id = 'CenaBusca';
CenaBusca.cor = Cor.new({r=255,g=255,b=255,alpha=255});
CenaBusca.font_label = Fonte.new({nome='tiresias', tamanho=20, is_negrito = true,cor = Cor.new({r=255,g=255,b=255})});
CenaBusca.font_header= Fonte.new({nome='tiresias', tamanho=20, is_negrito = true,cor = Cor.new({r=255,g=255,b=0})});
CenaBusca.font_data = Fonte.new({nome='tiresias', tamanho=20,is_negrito = false,cor = Cor.new({r=255,g=255,b=255})});
CenaBusca.cor_header = Cor.new({r=0,g=255,b=0,alpha=120});
CenaBusca.cor_line = Cor.new({r=0,g=255,b=0,alpha=30});

CenaBusca.lista = ListaDeputados:new();
CenaBusca.filtro = FiltroPolitico:new();
CenaBusca.regiaoSelecionada = " - ";
CenaBusca.estadoSelecionado = " - ";
CenaBusca.cidadeSelecionada = " - ";
CenaBusca.cargoSelecionado = " - ";
CenaBusca.partidoSelecionado = " - ";
CenaBusca.indiceRegiao = 1;
CenaBusca.indiceEstado = 1;
CenaBusca.indiceCidade = 1;
CenaBusca.indiceCargo = 1;
CenaBusca.indicePartido = 1;
CenaBusca.resultado = {};
CenaBusca.politicoSelecionado = nil;
CenaBusca.indiceEscolaMenu = 1;
CenaBusca.itensMenuAvancado = nil;
CenaBusca.painelConsultarPolitico = nil;
CenaBusca.painelResultados = nil;
CenaBusca.painelConsultarPoliticoAvancado = nil;
CenaBusca.panelFoco = "painelConsultarPolitico";
CenaBusca.indexFocoVisible = 1;
CenaBusca.indexFoco = 2;
CenaBusca.labelAcao = "BUSCAR";
CenaBusca.indiceItemMenuAvancado = 1;
CenaBusca.indiceItemMenuAvancadoJanela = 1;
CenaBusca.indiceItemMenuAvancadoDetalhado = 1;
CenaBusca.indiceItemMenuAvancadoDetalhadoJanela = 1;
CenaBusca.indiceItemMenuAvancadoDetalhadoJanelaInicio = 1;
CenaBusca.frameCorrente = nil;

CenaBusca.resultadoVisualizarEscolaComparar = {};
CenaBusca.isCarregandoPesquisaVisualizarEscolaComparar = false;

CenaBusca.filtroNacional = FiltroEstatisticasRegiao:new();
CenaBusca.filtroRegional = FiltroEstatisticasRegiao:new();
CenaBusca.filtroEstadual = FiltroEstatisticasRegiao:new();
CenaBusca.filtroMunicipal = FiltroEstatisticasRegiao:new();
CenaBusca.listaNacional = ListaEstatisticas:new();
CenaBusca.listaRegional = ListaEstatisticas:new();
CenaBusca.listaEstadual = ListaEstatisticas:new();
CenaBusca.listaMunicipal = ListaEstatisticas:new();


CenaBusca.filtroNacionalMelhores = FiltroMelhoresEscolas:new();
CenaBusca.filtroRegionalMelhores = FiltroMelhoresEscolas:new();
CenaBusca.filtroEstadualMelhores = FiltroMelhoresEscolas:new();  --[[código adicionado]]--
CenaBusca.listaNacionalMelhores = ListaMelhoresEscolas:new();
CenaBusca.listaRegionalMelhores = ListaMelhoresEscolas:new();
CenaBusca.listaEstadualMelhores = ListaMelhoresEscolas:new();


function CenaBusca:inicialize()

  CenaBusca.itensMenuAvancado = {
    {'../media/regulamentacao.png','Regulamentada',detalhesMultselect=false,detalhes={"Não","Sim","Em Tramitação"},mascara={}},
    {'../media/dep_administrativa.png','Dep. Administrativa',detalhesMultselect=false,detalhes={"Federal","Estadual","Municipal","Privada"},mascara={}},
    {'../media/status.png','Situação',detalhesMultselect=false,detalhes={"Em Atividade","Paralisada","Extinta","Extinta (Ano anterior)"},mascara={}},
    {'../media/localidade.png','Localidade',detalhesMultselect=false,detalhes={"Urbana","Rural"},mascara={}},
    {'../media/agua.png','Água',detalhesMultselect=true,detalhes={"Filtrada","Rede Pública","Poço Artesiano","Cacimba","Fonte/Rio","Inexistente"},mascara={}},
    {'../media/energia.png', 'Energia',detalhesMultselect=true,detalhes={"Rede Pública","Gerador","Outros","Inexistente"},mascara={}},
    {'../media/esgoto.png','Esgoto',detalhesMultselect=true,detalhes={"Rede Pública","Fossa","Inexistente"},mascara={}},
    {'../media/lixo.png','Lixo',detalhesMultselect=true,detalhes={"Coleta periódica","Queima","Joga em outra área","Recicla","Enterra","Outros"},mascara={}},
    {'../media/dependencias.png','Dependências',detalhesMultselect=true,detalhes={"Lab. de Informática","Lab. de Ciências","Biblioteca","Auditório","Refeitório","Pátio Coberto","Pátio Descoberto","Parque Infantil","Berçário  ","Quadra Coberta","Quadra Descoberta","Área Verde  ","Acessibilidade (","Atendimento Especial","Banheiro Dentro","Banheiro Fora","Chuveiro","Almoxarifado","Alojamento de Aluno","Sala de Diretoria","Sala de Leitura","Sala de Professores","Secretaria","Despensa  ","Cozinha","Lavanderia"},mascara={}}
  };

  CenaBusca:addFrame(FrameConsultarPolitico,FrameConsultarPolitico.id);
  CenaBusca:addFrame(FrameConsultarPoliticoAvancado,FrameConsultarPoliticoAvancado.id);
  CenaBusca:addFrame(FrameVisualizarPolitico,FrameVisualizarPolitico.id);
  CenaBusca:addFrame(FrameVisualizarEscolaComparar,FrameVisualizarEscolaComparar.id);
  CenaBusca:addFrame(FramePesquisasResultados,FramePesquisasResultados.id);


  FrameConsultarPolitico:inicialize();
  FrameConsultarPoliticoAvancado:inicialize();
  FrameVisualizarPolitico:inicialize();
  FrameVisualizarEscolaComparar:inicialize();
  FramePesquisasResultados:inicialize();

  CenaBusca.resultado = CenaBusca.lista:getDeputados();


  CenaBusca.filtroNacional:setTipoLocal("NAC");
  CenaBusca.filtroRegional:setTipoLocal("REG");
  CenaBusca.filtroEstadual:setTipoLocal("EST");
  CenaBusca.filtroMunicipal:setTipoLocal("MUN");


  CenaBusca.filtroNacionalMelhores:setTipoLocal("NAC");
  CenaBusca.filtroRegionalMelhores:setTipoLocal("REG");  --[[código adicionado]]--
  CenaBusca.filtroEstadualMelhores:setTipoLocal("EST");

  CenaBusca.colunas = {
    {indice="enem", titulo = "Enem", isPercentual=false},
    {indice="idebAnosIniciais", titulo = "IDEB A.I.", isPercentual=false},
    {indice="idebAnosFinais", titulo = "IDEB A.F.", isPercentual=false},
    {indice="regulamentadaSim", titulo = "Regulamentada(Sim)", isPercentual=true},
    {indice="regulamentadaNao", titulo = "Regulamentada(Não)", isPercentual=true},
    {indice="regulamentadaTramitacao", titulo = "Regulamentada(Tramitação)", isPercentual=true},
    {indice="dependenciaAdministrativaFederal", titulo = "Dependência Adm.(Federal)", isPercentual=true},
    {indice="dependenciaAdministrativaEstadual", titulo = "Dependência Adm.(Estadual)", isPercentual=true},
    {indice="dependenciaAdministrativaMunicipal", titulo = "Dependência Adm.(Municipal)", isPercentual=true},
    {indice="dependenciaAdministrativaPrivada", titulo = "Dependência Adm.(Privada)", isPercentual=true},
    {indice="situacaoFuncionamentoAtividade", titulo = "Situação Func.(Em Atividade)", isPercentual=true},
    {indice="situacaoFuncionamentoParalisada", titulo = "Situação Func.(Paralisada)", isPercentual=true},
    {indice="situacaoFuncionamentoExtinta", titulo = "Situação Func.(Extinta)", isPercentual=true},
    {indice="situacaoFuncionamentoExtintaAnoAnterior", titulo = "Situação Func.(Ext. Ano Ant.)", isPercentual=true},
    {indice="situacaoFuncionamentoAtividadeNaoInformado", titulo = "Situação Func.(Não Informado)", isPercentual=true},
    {indice="tipoLocalizacaoUrbana", titulo = "Tipo Loc. (Urbana)", isPercentual=true},
    {indice="tipoLocalizacaoRural", titulo = "Tipo Loc. (Rural)", isPercentual=true},
    {indice="aguaFiltrada", titulo = "Água(Filtrada)", isPercentual=true},
    {indice="aguaPublica", titulo = "Água(Pública)", isPercentual=true},
    {indice="aguaPocoArtesiano", titulo = "Água(Poço Artesiano)", isPercentual=true},
    {indice="aguaCacimba", titulo = "Água(Cacimba)", isPercentual=true},
    {indice="aguaRio", titulo = "Água(Rio)", isPercentual=true},
    {indice="aguaInexistente", titulo = "Água(Inexistente)", isPercentual=true},
    {indice="energiaPublica", titulo = "Energia(Pública)", isPercentual=true},
    {indice="energiaGerador", titulo = "Energia(Gerador)", isPercentual=true},
    {indice="energiaOutros", titulo = "Energia(Outros)", isPercentual=true},
    {indice="energiaInexistente", titulo = "Energia(Inexistente)", isPercentual=true},
    {indice="esgotoPublico", titulo = "Esgoto(Público)", isPercentual=true},
    {indice="esgotoFossa", titulo = "Esgoto(Fossa)", isPercentual=true},
    {indice="esgotoInexistente", titulo = "Esgoto(Inexistente)", isPercentual=true},
    {indice="lixoColetaPeriodica", titulo = "Lixo(Coleta Periódica)", isPercentual=true},
    {indice="lixoQueima", titulo = "Lixo(Queima)", isPercentual=true},
    {indice="lixoJogaOutraArea", titulo = "Lixo(Joga em Outra Área)", isPercentual=true},
    {indice="lixoRecicla", titulo = "Lixo(Recicla)", isPercentual=true},
    {indice="lixoEnterra", titulo = "Lixo(Enterra)", isPercentual=true},
    {indice="lixoOutros", titulo = "Lixo(Outros)", isPercentual=true},
    {indice="laboratorioInformatica", titulo = "Laboratorio de Informática", isPercentual=true},
    {indice="laboratorioCiencias", titulo = "Laboratorio de Ciências", isPercentual=true},
    {indice="biblioteca", titulo = "Biblioteca", isPercentual=true},
    {indice="auditorio", titulo = "Auditório", isPercentual=true},
    {indice="refeitorio", titulo = "Refeitório", isPercentual=true},
    {indice="patioCoberto", titulo = "Pátio Coberto", isPercentual=true},
    {indice="patioDescoberto", titulo = "Pátio Descoberto", isPercentual=true},
    {indice="parqueInfantil", titulo = "Parque Infantil", isPercentual=true},
    {indice="bercario", titulo = "Berçario", isPercentual=true},
    {indice="quadraCoberta", titulo = "Quadra Coberta", isPercentual=true},
    {indice="quadraDescoberta", titulo = "Quadra Descoberta", isPercentual=true},
    {indice="areaVerde", titulo = "Área Verde", isPercentual=true},
    {indice="dependenciasPNE", titulo = "Dependências PNE", isPercentual=true},
    {indice="ensinoEspecial", titulo = "Ensino Especial", isPercentual=true},
    {indice="sanitarioDentroPredio", titulo = "Sanitário (Dentro do Prédio)", isPercentual=true},
    {indice="sanitarioForaPredio", titulo = "Sanitário (Fora do Prédio)", isPercentual=true},
    {indice="sanitarioEducInfant", titulo = "Sanitário (Educação Infantil)", isPercentual=true},
    {indice="sanitarioPNE", titulo = "Sanitário (PNE)", isPercentual=true},
    {indice="banheiroChuveiro", titulo = "Banheiro com Chuveiro", isPercentual=true},
    {indice="almoxarifado", titulo = "Almoxarifado", isPercentual=true},
    {indice="alojamentoAluno", titulo = "Alojamento Alunos", isPercentual=true},
    {indice="alojamentoProfessor", titulo = "Alojamento Professores", isPercentual=true},
    {indice="salaDiretoria", titulo = "Sala Diretoria", isPercentual=true},
    {indice="salaLeitura", titulo = "Sala Leitura", isPercentual=true},
    {indice="salaProfessores", titulo = "Sala Professores", isPercentual=true},
    {indice="secretaria", titulo = "Secretaria", isPercentual=true},
    {indice="despensa", titulo = "Despensa", isPercentual=true},
    {indice="cozinha", titulo = "Cozinha", isPercentual=true},
    {indice="lavanderia", titulo = "Lavanderia", isPercentual=true},
    {indice="atendimentoEspecial", titulo = "Atendimento Especial", isPercentual=true}
  };

end

--Seleciona a região
function CenaBusca:getDadosRegioes()
  local retorno = {};
  table.insert(retorno," - ");

  for i,v in pairs(Localizacoes.nomesRegioes) do
    table.insert(retorno,v);
  end

  return retorno;
end


--Seleciona os Estados
function CenaBusca:getDadosEstados()
  local retorno = {};
  table.insert(retorno," - ");

  if(CenaBusca.regiaoSelecionada ~= nil and CenaBusca.regiaoSelecionada ~= " - ")then
    for i,v in pairs(Localizacoes.regioes[CenaBusca.regiaoSelecionada].nomesEstados) do
      table.insert(retorno,v);
    end
  end

  return retorno;
end

--Seleciona as cidades
function CenaBusca:getDadosCidades()
  local retorno = {};
  table.insert(retorno," - ");

  if(CenaBusca.estadoSelecionado ~= nil and CenaBusca.estadoSelecionado ~= " - ")then
    local estado = Localizacoes.regioes[CenaBusca.regiaoSelecionada]:getEstados()[CenaBusca.estadoSelecionado];
    Localizacoes:carregaCidades(estado);
    for i,v in pairs(estado.nomesCidades) do
      table.insert(retorno,v);
    end
  end

  return retorno;
end

--Seleciona os cargos
function CenaBusca:getDadosCargos()
  local retorno = {};
  table.insert(retorno," - ");

  cargos = {"Deputado Federal", "Senador"}
  for i,v in pairs(cargos) do
    table.insert(retorno,tostring(v));
  end


  return retorno;
end


--Seleciona índices do IDEB
function CenaBusca:getDadosPartidos()
  local retorno = {};
  table.insert(retorno," - ");

  partidos = {"PT", "PMDB", "DEM", "PP", "PR", "PSDB"}

  for i,v in pairs(partidos) do
    table.insert(retorno,tostring(v));
  end

  return retorno;
end

--Coloca os resultados da busca na tabela de resultados
function CenaBusca:getItensResultado(itens)


  for i,v in pairs(CenaBusca.resultado) do

    local partido = v:getPartido() or "-";
    local cargo =  "-"; --v:getCargo() or
    local nome = v:getNomeParlamentar() or "-";
    local cidade =  "-"; --v:getCidade() or
    local estado = v:getUf() or "-";
    local idade =  "-"; --v:getIdade() or
    local sexo = v:getSexo() or "-";
    local escolaridade =  "-"; --v:getEscolaridade() or

    local line = TConteiner.new();
    line:setLargura(1270);
    line:setAltura(40);

    line:addComponent(createField(partido,0,5,100,CenaBusca.font_header,CenaBusca.cor_header,true));
    line:addComponent(createField(cargo,110,5,110,CenaBusca.font_header,CenaBusca.cor_header,true));
    line:addComponent(createField(nome,230,5,400,CenaBusca.font_header,CenaBusca.cor_header,true));
    line:addComponent(createField(cidade,640,5,200,CenaBusca.font_header,CenaBusca.cor_header,true));
    line:addComponent(createField(estado,850,5,70,CenaBusca.font_header,CenaBusca.cor_header,true));
    line:addComponent(createField(idade,930,5,70,CenaBusca.font_header,CenaBusca.cor_header,true));
    line:addComponent(createField(sexo,1010,5,70,CenaBusca.font_header,CenaBusca.cor_header,true));
    line:addComponent(createField(escolaridade,1090,5,170,CenaBusca.font_header,CenaBusca.cor_header,true));

    line.action = function (self,evt)

      evt.rule_key = "acessarCenaVisualizarPolitico";
      CenaBusca.politicoSelecionado = v;
      CenaBusca.isCarregandoDetalhes = true;

      FrameVisualizarPolitico:inicialize();
      
      print("FRAME VISUALIZAR POLITICO!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")

      local APP = coroutine.create (
        function ()

          local f_callback = function(politicoModificado)
            CenaBusca.politicoSelecionado = politicoModificado;
            FrameVisualizarPolitico:inicialize();
            CenaBusca.isCarregandoDetalhes = false;

            FrameVisualizarPolitico:inicialize();
            
            
            print("FRAME VISUALIZAR POLITICO!*********************************")
            
            Display.show();
          end

          carregaDetalhesDeputado(f_callback,CenaBusca.politicoSelecionado);
          print("CHAMOU CARREGA DETALHES POLÍTICO!!")
        end
      )

      coroutine.resume(APP)
    end

    table.insert(itens,line);

  end
end

function CenaBusca:updateFiltro(frame)
  local indiceRegulamentacao = 1;
  local indiceDepAdministrativa = 2;
  local indiceStatus = 3;
  local indiceLocalidade = 4;
  local indiceAgua = 5;
  local indiceEnergia = 6;
  local indiceEsgoto = 7;
  local indiceLixo = 8;
  local indiceDependencias = 9;

  CenaBusca.filtro:limparCaracteristicas();

  if(frame.id == FrameConsultarPoliticoAvancado.id)then

    for indice,opcaoSelecionada in pairs(CenaBusca.itensMenuAvancado[indiceRegulamentacao].mascara) do
      if(opcaoSelecionada)then
        CenaBusca.filtro:setRegulamentada(indice-1);
        break;
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBusca.itensMenuAvancado[indiceDepAdministrativa].mascara) do
      if(opcaoSelecionada)then
        CenaBusca.filtro:setDependenciasAdministrativas(indice);
        break;
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBusca.itensMenuAvancado[indiceStatus].mascara) do
      if(opcaoSelecionada)then
        CenaBusca.filtro:setSituacaoFuncionamento(indice);
        break;
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBusca.itensMenuAvancado[indiceLocalidade].mascara) do
      if(opcaoSelecionada)then
        CenaBusca.filtro:setLocalidade(indice);
        break;
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBusca.itensMenuAvancado[indiceAgua].mascara) do
      if(opcaoSelecionada)then
        if(indice == 1)then
          CenaBusca.filtro:setAguaFiltrada("true");
        elseif(indice == 2)then
          CenaBusca.filtro:setAguaPublica("true");
        elseif(indice == 3)then
          CenaBusca.filtro:setAguaPocoArtesiano("true");
        elseif(indice == 4)then
          CenaBusca.filtro:setAguaCacimba("true");
        elseif(indice == 5)then
          CenaBusca.filtro:setAguaRio("true");
        elseif(indice == 6)then
          CenaBusca.filtro:setAguaInexistente("true");
        end
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBusca.itensMenuAvancado[indiceEnergia].mascara) do
      if(opcaoSelecionada)then
        if(indice == 1)then
          CenaBusca.filtro:setEnergiaPublica("true");
        elseif(indice == 2)then
          CenaBusca.filtro:setEnergiaGerador("true");
        elseif(indice == 3)then
          CenaBusca.filtro:setEnergiaOutros("true");
        elseif(indice == 4)then
          CenaBusca.filtro:setEnergiaInexistente("true");
        end
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBusca.itensMenuAvancado[indiceEsgoto].mascara) do
      if(opcaoSelecionada)then
        if(indice == 1)then
          CenaBusca.filtro:setEsgotoPublico("true");
        elseif(indice == 2)then
          CenaBusca.filtro:setEsgotoFossa("true");
        elseif(indice == 3)then
          CenaBusca.filtro:setEsgotoInexistente("true");
        end
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBusca.itensMenuAvancado[indiceLixo].mascara) do
      if(opcaoSelecionada)then
        if(indice == 1)then
          CenaBusca.filtro:setLixoColetaPeriodica("true");
        elseif(indice == 2)then
          CenaBusca.filtro:setLixoQueima("true");
        elseif(indice == 3)then
          CenaBusca.filtro:setLixoJogaOutraArea("true");
        elseif(indice == 4)then
          CenaBusca.filtro:setLixoRecicla("true");
        elseif(indice == 5)then
          CenaBusca.filtro:setLixoEnterra("true");
        elseif(indice == 6)then
          CenaBusca.filtro:setLixoOutros("true");
        end
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBusca.itensMenuAvancado[indiceDependencias].mascara) do
      if(opcaoSelecionada)then
        if(indice == 1)then
          CenaBusca.filtro:setLaboratorioInformatica("true");
        elseif(indice == 2)then
          CenaBusca.filtro:setLaboratorioCiencias("true");
        elseif(indice == 3)then
          CenaBusca.filtro:setBiblioteca("true");
        elseif(indice == 4)then
          CenaBusca.filtro:setAuditorio("true");
        elseif(indice == 5)then
          CenaBusca.filtro:setRefeitorio("true");
        elseif(indice == 6)then
          CenaBusca.filtro:setPatioCoberto("true");
        elseif(indice == 7)then
          CenaBusca.filtro:setPatioDescoberto("true");
        elseif(indice == 8)then
          CenaBusca.filtro:setParqueInfantil("true");
        elseif(indice == 9)then
          CenaBusca.filtro:setBercario("true");
        elseif(indice == 10)then
          CenaBusca.filtro:setQuadraCoberta("true");
        elseif(indice == 11)then
          CenaBusca.filtro:setQuadraDescoberta("true");
        elseif(indice == 12)then
          CenaBusca.filtro:setAreaVerde("true");
        elseif(indice == 13)then
          CenaBusca.filtro:setDependenciasPNE("true");
        elseif(indice == 14)then
        --            CenaBusca.filtro:setAtendimentoEspecial("true");
        elseif(indice == 15)then
          CenaBusca.filtro:setSanitarioDentroPredio("true");
        elseif(indice == 16)then
          CenaBusca.filtro:setSanitarioForaPredio("true");
        elseif(indice == 17)then
          CenaBusca.filtro:setBanheiroChuveiro("true");
        elseif(indice == 18)then
          CenaBusca.filtro:setAlmoxarifado("true");
        elseif(indice == 19)then
          CenaBusca.filtro:setAlojamentoAluno("true");
        elseif(indice == 20)then
          CenaBusca.filtro:setSalaDiretoria("true");
        elseif(indice == 21)then
          CenaBusca.filtro:setSalaLeitura("true");
        elseif(indice == 22)then
          CenaBusca.filtro:setSalaProfessores("true");
        elseif(indice == 23)then
          CenaBusca.filtro:setSecretaria("true");
        elseif(indice == 24)then
          CenaBusca.filtro:setDespensa("true");
        elseif(indice == 25)then
          CenaBusca.filtro:setCozinha("true");
        elseif(indice == 26)then
          CenaBusca.filtro:setLavanderia("true");
        end
      end
    end
  end

end

--Função filtro para pesquisar escolas por nome, estado, cidade, nota ENEM, ou IDEB
function CenaBusca:pesquisarPoliticos(frame)

  CenaBusca.isCarregandoPesquisa = true;

  CenaBusca.isNenhumResultado = false;

  frame:inicialize();
  local APP = coroutine.create (

      function ()

        --CenaBusca:updateFiltro(frame);

        if(CenaBusca.filtro.nomeParlamentar == "")then
          CenaBusca.filtro.nomeParlamentarAlterado = false;
        end

        if(CenaBusca.filtro.estado == " - ")then
          CenaBusca.filtro.estadoAlterado = false;
        end

        if(CenaBusca.filtro.cidade == " - ")then
          CenaBusca.filtro.cidadeAlterado = false;
        end

        if(CenaBusca.filtro.cargo == " - ")then
          CenaBusca.filtro.cargoAlterado = false;
        end

        if(CenaBusca.filtro.partido == " - ")then
          CenaBusca.filtro.partidoAlterado = false;
        end

--        if(CenaBusca.filtro.idebAnosIniciaisMin == " - ")then
--          CenaBusca.filtro.idebAnosIniciaisMinAlterado = false;
--        end
--
--        if(CenaBusca.filtro.idebAnosIniciaisMax == " - ")then
--          CenaBusca.filtro.idebAnosIniciaisMaxAlterado = false;
--        end
--
--        if(CenaBusca.filtro.idebAnosFinaisMin == " - ")then
--          CenaBusca.filtro.idebAnosFinaisMinAlterado = false;
--        end
--
--        if(CenaBusca.filtro.idebAnosFinaisMax == " - ")then
--          CenaBusca.filtro.idebAnosFinaisMaxAlterado = false;
--        end

        CenaBusca.lista:pesquisarDeputados(CenaBusca.filtro);
        CenaBusca.isCarregandoPesquisa = false;

        CenaBusca.resultado = CenaBusca.lista:getDeputados();

        if(#CenaBusca.resultado > 0)then
          CenaBusca.indexFocoVisible = 2
          CenaBusca.indexFoco = 2
          CenaBusca.panelFoco = "painelResultados";
          CenaBusca.labelAcao = "CAMPOS"

        else
          CenaBusca.isNenhumResultado = true;
        --          frame:inicialize();
        --          Display.show();

        end

        frame:inicialize();
        Display.show();
      end
  )

  coroutine.resume(APP)
end

--Limpa os campos de pesquisa
function CenaBusca:clear()
  CenaBusca.lista = ListaDeputados:new();
  CenaBusca.filtro = FiltroPolitico:new();
  CenaBusca.regiaoSelecionada = " - ";
  CenaBusca.estadoSelecionado = " - ";
  CenaBusca.cidadeSelecionada = " - ";
  CenaBusca.enemSelecionado = " - ";
  CenaBusca.indiceRegiao = 1;
  CenaBusca.indiceEstado = 1;
  CenaBusca.indiceCidade = 1;
  CenaBusca.indiceEnem = 1;
  CenaBusca.indiceIdebAnosIniciaisMin = 1;
  CenaBusca.indiceIdebAnosIniciaisMax = 1;
  CenaBusca.indiceIdebAnosFinaisMin = 1;
  CenaBusca.indiceIdebAnosFinaisMax = 1;
  CenaBusca.resultado = {};
  CenaBusca.politicoSelecionado = nil;
  CenaBusca.indiceEscolaMenu = 1;
end

--Carrega itens para a busca avançada
function CenaBusca:getItensMenuAvancado(frame)

  local itens = {};

  for i,v in pairs(CenaBusca.itensMenuAvancado) do
    local src = v[1];
    local nome = v[2];

    local image = TImage.new();
    image:setSrcArquivoExterno(src);

    local label = TLabel.new();
    label:setTexto(nome);
    label:setFonte(CenaBusca.font_label);

    local icone = TIcon.new();
    icone:setTImage(image);
    icone:setTLabel(label);
    icone:setOrientacao(TIcon.TITULO_RIGHT);

    icone.handler = function (self,evt)
      if(BibliotecaAuxiliarEvento.isEventoControle(evt)) then

        if(BibliotecaAuxiliarEvento.isBotaoCima(evt) and CenaBusca.indiceItemMenuAvancado > 1)then
          CenaBusca.indiceItemMenuAvancado = CenaBusca.indiceItemMenuAvancado - 1;
          CenaBusca.indiceItemMenuAvancadoDetalhado = 1;
          CenaBusca.indiceItemMenuAvancadoDetalhadoJanelaInicio = 1;
          frame:inicialize();
        elseif(BibliotecaAuxiliarEvento.isBotaoBaixo(evt) and CenaBusca.indiceItemMenuAvancado < #CenaBusca.itensMenuAvancado)then
          CenaBusca.indiceItemMenuAvancado = CenaBusca.indiceItemMenuAvancado + 1;
          CenaBusca.indiceItemMenuAvancadoDetalhado = 1;
          CenaBusca.indiceItemMenuAvancadoDetalhadoJanelaInicio = 1;
          frame:inicialize();
        elseif(BibliotecaAuxiliarEvento.isBotaoDireita(evt)) then
          CenaBusca.indexFocoVisible = 3;
          CenaBusca.indexFoco = 3;
          CenaBusca.panelFoco = "painelConsultarPoliticoAvancado";
          frame:inicialize();
        end
      end
    end

    table.insert(itens,icone);

  end

  return itens;
end

--Detalha os itens da busca avançada
function CenaBusca:getItensMenuAvancadoDetalhes(frame,indiceItemSelecionado,menu)

  local itens = {};



  for i,v in pairs(CenaBusca.itensMenuAvancado[indiceItemSelecionado].detalhes) do
    local nome = v;

    if(CenaBusca.itensMenuAvancado[indiceItemSelecionado].mascara[i] == nil)then
      CenaBusca.itensMenuAvancado[indiceItemSelecionado].mascara[i] = false;
    end

    local image = TImage.new();
    if(CenaBusca.itensMenuAvancado[indiceItemSelecionado].mascara[i])then
      image:setSrcArquivoExterno("../media/check_habilitado.png");
    else
      image:setSrcArquivoExterno("../media/check_desabilitado.png");
    end

    local label = TLabel.new();
    label:setTexto(nome);
    label:setFonte(CenaBusca.font_label);

    local icone = TIcon.new();
    icone:setTImage(image);
    icone:setTLabel(label);
    icone:setOrientacao(TIcon.TITULO_RIGHT);

    icone.action = function (self,evt)
      CenaBusca.itensMenuAvancado[indiceItemSelecionado].mascara[i] = not CenaBusca.itensMenuAvancado[indiceItemSelecionado].mascara[i];

      if((not CenaBusca.itensMenuAvancado[indiceItemSelecionado].detalhesMultselect) and CenaBusca.itensMenuAvancado[indiceItemSelecionado].mascara[i])then
        for indiceItem,valorItem in pairs(CenaBusca.itensMenuAvancado[indiceItemSelecionado].detalhes) do
          if(indiceItem ~=i) then
            CenaBusca.itensMenuAvancado[indiceItemSelecionado].mascara[indiceItem] = false;
          end
        end
      end

      frame:inicialize();
    end

    icone.handler = function (self,evt)
      CenaBusca.indiceItemMenuAvancadoDetalhado = menu:getOpcaoSelecionada();
      CenaBusca.indiceItemMenuAvancadoDetalhadoJanela = menu:getOpcaoSelecionadaJanela();
      CenaBusca.indiceItemMenuAvancadoDetalhadoJanelaInicio = menu:getInicioJanela();

      if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoEsquerda(evt)) then
        CenaBusca.indiceItemMenuAvancadoDetalhado = 1;
        CenaBusca.indiceItemMenuAvancadoDetalhadoJanela = 1;
        CenaBusca.indiceItemMenuAvancadoDetalhadoJanelaInicio = 1;
        CenaBusca.indexFocoVisible = 1;
        CenaBusca.indexFoco = 1;
        CenaBusca.panelFoco = "painelConsultarPoliticoAvancado";
        frame:inicialize();
      end
    end

    table.insert(itens,icone);

  end

  return itens;
end

--Constrói o painel no qual os dados são inseridos para busca de escolas
function CenaBusca:buildPainelConsultarPolitico(frame)
  -- Incluir componentes gráficos
  local panel= TPanel.new();
  panel:setLargura(630);
  panel:setAltura(385);
  panel:setPx(645);
  panel:setPy(5);
  panel:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));--{r=200,g=255,b=255,alpha=255}));



  local font_teclado= Fonte.new({nome='tiresias', tamanho=14, is_negrito = false});
  font_teclado.cor = Cor.new({r=255,g=255,b=255});


  local imageTeclado= TImage.new();
  imageTeclado:setSrcArquivoExterno("../media/teclado.png");
  imageTeclado:setPx(430);
  imageTeclado:setPy(40);
  panel:addComponent(imageTeclado,5);



  local pxComponent = 2;
  local pyComponent = 2;
  local indiceComponente = 1;

  --Field Nome
  local labelField = TLabel.new();
  labelField.indice = indiceComponente;
  labelField:setTexto("Nome:");
  labelField:setFonte(CenaBusca.font_label);
  labelField:setPx(pxComponent);
  labelField:setPy(pyComponent);
  labelField:update();

  indiceComponente = indiceComponente + 1;

  if(CenaBusca.fieldNome == nil)then
    CenaBusca.fieldNome = TField.new();
  end

  local fieldNome = CenaBusca.fieldNome;

  fieldNome.indice = indiceComponente;

  fieldNome:setFonte(CenaBusca.font_data);
  fieldNome:setIsEditable(true);
  fieldNome:setTexto(CenaBusca.filtro:getNomeParlamentar());
  fieldNome:setPx(pxComponent + labelField:getLargura() + 2);
  fieldNome:setPy(pyComponent);
  fieldNome:getTLabelTexto():setLargura(550);
  fieldNome:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=90}));
  fieldNome.indice = indiceComponente;

  panel:addComponent(labelField,labelField.indice);
  panel:addComponent(fieldNome,fieldNome.indice);

  CenaBusca.filtro:setNomeParlamentar(fieldNome:getTexto());

  --Choicer Regiao
  local pyComponent = pyComponent + fieldNome:getAltura() + 2;
  pxComponent = 2;
  indiceComponente = indiceComponente + 1;

  local labelChoicerRegiao = TLabel.new();
  labelChoicerRegiao.indice = indiceComponente;
  labelChoicerRegiao:setTexto("Regiao:");
  labelChoicerRegiao:setFonte(CenaBusca.font_label);
  labelChoicerRegiao:setPx(pxComponent);
  labelChoicerRegiao:setPy(pyComponent);
  labelChoicerRegiao:update();

  pxComponent = labelChoicerRegiao:getLargura() + 2;
  indiceComponente = indiceComponente + 1;

  local tchoicerRegiao = TChoicer.new();
  tchoicerRegiao.indice = indiceComponente;
  tchoicerRegiao:setFonte(CenaBusca.font_data);
  tchoicerRegiao:addAllItens(CenaBusca:getDadosRegioes());
  tchoicerRegiao:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerRegiao:setOpcaoSelecionada(CenaBusca.indiceRegiao)
  tchoicerRegiao:setInicioJanela(CenaBusca.indiceRegiao)
  tchoicerRegiao:setIsFoco(true);
  tchoicerRegiao:setPx(pxComponent);
  tchoicerRegiao:setPy(pyComponent);
  tchoicerRegiao:update();
  CenaBusca.regiaoSelecionada = tchoicerRegiao:getItens()[tchoicerRegiao:getOpcaoSelecionada(CenaBusca.indiceRegiao)]:getTexto();
  CenaBusca.filtro:setRegiao(CenaBusca.regiaoSelecionada);

  CenaBusca.filtroRegionalMelhores:setRegiaoGeografica(CenaBusca.regiaoSelecionada); --[[código adicionado]]--

  panel:addComponent(labelChoicerRegiao,labelChoicerRegiao.indice);
  panel:addComponent(tchoicerRegiao,tchoicerRegiao.indice);

  --Choicer Estado
  local pyComponent = pyComponent + tchoicerRegiao:getAltura() + 2;
  pxComponent = 2;
  indiceComponente = indiceComponente + 1;

  local labelChoicerEstado = TLabel.new();
  labelChoicerEstado.indice = indiceComponente;
  labelChoicerEstado:setTexto("Estado:");
  labelChoicerEstado:setFonte(CenaBusca.font_label);
  labelChoicerEstado:setPx(pxComponent);
  labelChoicerEstado:setPy(pyComponent);
  labelChoicerEstado:update();

  pxComponent = labelChoicerEstado:getLargura() + 2;
  indiceComponente = indiceComponente + 1;

  local tchoicerEstado = TChoicer.new();
  tchoicerEstado.indice = indiceComponente;
  tchoicerEstado:setFonte(CenaBusca.font_data);
  tchoicerEstado:addAllItens(CenaBusca:getDadosEstados());
  tchoicerEstado:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerEstado:setOpcaoSelecionada(CenaBusca.indiceEstado)
  tchoicerEstado:setInicioJanela(CenaBusca.indiceEstado)
  tchoicerEstado:setIsFoco(true);
  tchoicerEstado:setPx(pxComponent);
  tchoicerEstado:setPy(pyComponent);
  tchoicerEstado:update();
  CenaBusca.estadoSelecionado = tchoicerEstado:getItens()[tchoicerEstado:getOpcaoSelecionada(CenaBusca.indiceEstado)]:getTexto();
  CenaBusca.filtro:setEstado(CenaBusca.estadoSelecionado);

  CenaBusca.filtroEstadualMelhores:setEstado(CenaBusca.estadoSelecionado); --[[código adicionado]]--

  panel:addComponent(labelChoicerEstado,labelChoicerEstado.indice);
  panel:addComponent(tchoicerEstado,tchoicerEstado.indice);

  --Choicer Cidade
  local pyComponent = pyComponent + tchoicerEstado:getAltura() + 2;
  pxComponent = 2;
  indiceComponente = indiceComponente + 1;

  local labelChoicerCidade = TLabel.new();
  labelChoicerCidade.indice = indiceComponente;
  labelChoicerCidade:setTexto("Cidade:");
  labelChoicerCidade:setFonte(CenaBusca.font_label);
  labelChoicerCidade:setPx(pxComponent);
  labelChoicerCidade:setPy(pyComponent);
  labelChoicerCidade:update();

  pxComponent = labelChoicerCidade:getLargura() + 2;
  indiceComponente = indiceComponente + 1;

  local tchoicerCidade = TChoicer.new();
  tchoicerCidade.indice = indiceComponente;
  tchoicerCidade:setFonte(CenaBusca.font_data);
  tchoicerCidade:addAllItens(CenaBusca:getDadosCidades());
  tchoicerCidade:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerCidade:setOpcaoSelecionada(CenaBusca.indiceCidade)
  tchoicerCidade:setInicioJanela(CenaBusca.indiceCidade)
  tchoicerCidade:setIsFoco(true);
  tchoicerCidade:setPx(pxComponent);
  tchoicerCidade:setPy(pyComponent);
  tchoicerCidade:update();
  CenaBusca.cidadeSelecionada = tchoicerCidade:getItens()[CenaBusca.indiceCidade]:getTexto();
  if(CenaBusca.indiceCidade > 1)then
    CenaBusca.filtro:setCidade(Localizacoes.regioes[CenaBusca.regiaoSelecionada]:getEstados()[CenaBusca.estadoSelecionado]:getCidades()[CenaBusca.cidadeSelecionada]:getCodigo());
  else
    CenaBusca.filtro.cidadeAlterado = false;
  end

  panel:addComponent(labelChoicerCidade,labelChoicerCidade.indice);
  panel:addComponent(tchoicerCidade,tchoicerCidade.indice);

  --Choicer Cargo
  pyComponent = pyComponent + tchoicerCidade:getAltura() + 2;
  pxComponent = 2;
  indiceComponente = indiceComponente + 1;

  local labelChoicerCargo = TLabel.new();
  labelChoicerCargo.indice = indiceComponente;
  labelChoicerCargo:setTexto("Cargo:");
  labelChoicerCargo:setFonte(CenaBusca.font_label);
  labelChoicerCargo:setPx(pxComponent);
  labelChoicerCargo:setPy(pyComponent);
  labelChoicerCargo:update();

  pxComponent = labelChoicerCargo:getLargura() + 2;
  indiceComponente = indiceComponente + 1;

  local tchoicerCargo = TChoicer.new();
  tchoicerCargo.indice = indiceComponente;
  tchoicerCargo:setFonte(CenaBusca.font_data);
  tchoicerCargo:addAllItens(CenaBusca:getDadosCargos());
  tchoicerCargo:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerCargo:setOpcaoSelecionada(CenaBusca.indiceCargo)
  tchoicerCargo:setInicioJanela(CenaBusca.indiceCargo)
  tchoicerCargo:setPx(pxComponent);
  tchoicerCargo:setPy(pyComponent);
  tchoicerCargo:update();

  CenaBusca.cargoSelecionado = tchoicerCargo:getItens()[CenaBusca.indiceCargo]:getTexto();
  CenaBusca.filtro:setCargo(CenaBusca.cargoSelecionado);

  panel:addComponent(labelChoicerCargo,labelChoicerCargo.indice);
  panel:addComponent(tchoicerCargo,tchoicerCargo.indice);



  --Choicer Partido
  pyComponent = pyComponent + tchoicerCargo:getAltura() + 2;
  pxComponent = 2;
  indiceComponente = indiceComponente + 1;

  local labelChoicerPartido = TLabel.new();
  labelChoicerPartido.indice = indiceComponente;
  labelChoicerPartido:setTexto("Partido:");
  labelChoicerPartido:setFonte(CenaBusca.font_label);
  labelChoicerPartido:setPx(pxComponent);
  labelChoicerPartido:setPy(pyComponent);
  labelChoicerPartido:update();

  pxComponent = labelChoicerPartido:getLargura() + 2;
  indiceComponente = indiceComponente + 1;

  local tchoicerPartido = TChoicer.new();
  tchoicerPartido.indice = indiceComponente;
  tchoicerPartido:setFonte(CenaBusca.font_data);
  tchoicerPartido:addAllItens(CenaBusca:getDadosPartidos());
  tchoicerPartido:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerPartido:setOpcaoSelecionada(CenaBusca.indicePartido)
  tchoicerPartido:setInicioJanela(CenaBusca.indicePartido)
  tchoicerPartido:setPx(pxComponent);
  tchoicerPartido:setPy(pyComponent);
  tchoicerPartido:update();

  CenaBusca.partidoSelecionado = tchoicerPartido:getItens()[CenaBusca.indicePartido]:getTexto();
  CenaBusca.filtro:setPartido(CenaBusca.partidoSelecionado);

  panel:addComponent(labelChoicerPartido,labelChoicerPartido.indice);
  panel:addComponent(tchoicerPartido,tchoicerPartido.indice);





  --Interações
  fieldNome.afterHandler = function (self,evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and (BibliotecaAuxiliarEvento.isBotaoNumerico(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))) then
      CenaBusca.filtro:setNomeParlamentar(self:getTexto());
      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoBaixo(evt)) then
      CenaBusca.indexFocoVisible = labelChoicerRegiao.indice;
      CenaBusca.indexFoco = tchoicerRegiao.indice;
      CenaBusca.panelFoco = "painelConsultarPolitico";
      frame.inicialize();
    end
  end

  tchoicerRegiao.afterHandler = function (self,evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and (BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))) then

      CenaBusca.indiceRegiao = tchoicerRegiao:getOpcaoSelecionada();
      CenaBusca.indiceEstado = 1;
      CenaBusca.indiceCidade = 1;
      CenaBusca.indiceBairro = 1;

      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoCima(evt)) then
      CenaBusca.indexFocoVisible = labelField.indice;
      CenaBusca.indexFoco = fieldNome.indice;
      CenaBusca.panelFoco = "painelConsultarPolitico";
      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoBaixo(evt)) then
      CenaBusca.indexFocoVisible = labelChoicerEstado.indice;
      CenaBusca.indexFoco = tchoicerEstado.indice;
      CenaBusca.panelFoco = "painelConsultarPolitico";
      frame.inicialize();
    end
  end

  tchoicerEstado.afterHandler = function (self,evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and (BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))) then

      CenaBusca.indiceEstado = tchoicerEstado:getOpcaoSelecionada();
      CenaBusca.indiceCidade = 1;
      CenaBusca.indiceBairro = 1;

      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoCima(evt)) then
      CenaBusca.indexFocoVisible = labelChoicerRegiao.indice;
      CenaBusca.indexFoco = tchoicerRegiao.indice;
      CenaBusca.panelFoco = "painelConsultarPolitico";
      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoBaixo(evt)) then
      CenaBusca.indexFocoVisible = labelChoicerCidade.indice;
      CenaBusca.indexFoco = tchoicerCidade.indice;
      CenaBusca.panelFoco = "painelConsultarPolitico";
      frame.inicialize();


    end
  end

  tchoicerCidade.afterHandler = function (self,evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and (BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))) then
      CenaBusca.indiceCidade = tchoicerCidade:getOpcaoSelecionada();
      CenaBusca.indiceBairro = 1;

      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoCima(evt)) then
      CenaBusca.indexFocoVisible = labelChoicerEstado.indice;
      CenaBusca.indexFoco = tchoicerEstado.indice;
      CenaBusca.panelFoco = "painelConsultarPolitico";
      frame.inicialize();


    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoBaixo(evt)) then
      CenaBusca.indexFocoVisible = labelChoicerCargo.indice;
      CenaBusca.indexFoco = tchoicerCargo.indice;
      CenaBusca.panelFoco = "painelConsultarPolitico";
      frame.inicialize();


    end
  end

  tchoicerCargo.afterHandler = function (self,evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and (BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))) then
      CenaBusca.indiceCargo = tchoicerCargo:getOpcaoSelecionada();
      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoCima(evt)) then
      CenaBusca.indexFocoVisible = labelChoicerCidade.indice;
      CenaBusca.indexFoco = tchoicerCidade.indice;
      CenaBusca.panelFoco = "painelConsultarPolitico";
      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoBaixo(evt)) then
      CenaBusca.indexFocoVisible = labelChoicerPartido.indice;
      CenaBusca.indexFoco = tchoicerPartido.indice;
      CenaBusca.panelFoco = "painelConsultarPolitico";
      frame.inicialize();


    end
  end


  tchoicerPartido.afterHandler = function (self,evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and (BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))) then
      CenaBusca.indicePartido = tchoicerPartido:getOpcaoSelecionada();
      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoCima(evt)) then
      CenaBusca.indexFocoVisible = labelChoicerCargo.indice;
      CenaBusca.indexFoco = tchoicerCargo.indice;
      CenaBusca.panelFoco = "painelConsultarPolitico";
      frame.inicialize();

   

    end
  end



  return panel;
end

--Função que constrói o painel onde é mostrado o resultado da busca
function CenaBusca:buildPainelResultados(frame)
  local panelResultados= TPanel.new();
  panelResultados:setLargura(1270);
  panelResultados:setAltura(255);
  panelResultados:setPx(5);
  panelResultados:setPy(395);
  panelResultados:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));--{r=200,g=255,b=255,alpha=255}));
  panelResultados:setCorFoco({r=0,g=255,b=0,alpha=240});

  local font_logo= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_logo.cor = Cor.new({r=153,g=204,b=51,alpha=255});

  local pxComponent = 5;
  local pyComponent = 5;

  local line = TConteiner.new();
  line:setLargura(1270);
  line:setAltura(40);
  line:setPx((panelResultados:getLargura() - line:getLargura())/2);
  line:setPy(pyComponent);

  line:addComponent(createField("PARTIDO",0,5,100,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("CARGO",110,5,110,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("NOME",230,5,400,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("CIDADE",640,5,200,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("UF",850,5,70,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("IDADE",930,5,70,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("SEXO",1010,5,70,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("ESCOLARIDADE",1090,5,170,CenaBusca.font_header,CenaBusca.cor_header,true));

  pyComponent = pyComponent + line:getAltura() + 2;

  panelResultados:addComponent(line,1);

  local resultados = {};

  if(not CenaBusca.isCarregandoPesquisa and panelResultados.components[2] == nil)then
    CenaBusca:getItensResultado(resultados);
    if(#resultados > 0)then
      local menu = TMenu.new();
      menu:addAllItens(resultados);
      menu:setOrientacao(TMenu.VERTICAL);
      menu:setTamanhoJanela(5);
      menu:setIsVisibleSetas(false);
      menu:update();
      menu:setPx((panelResultados:getLargura() - menu:getLargura())/2);
      menu:setPy(pyComponent);

      panelResultados:addComponent(menu,2);
    end
  end

  if (CenaBusca.isCarregandoPesquisa)then
    panelResultados.components[2] = nil;
    local labelCarregando = TLabel.new();
    labelCarregando:setTexto("Carregando...");
    labelCarregando:setFonte(CenaBusca.font_data);
    labelCarregando:update();
    labelCarregando:setPx((panelResultados:getLargura() - labelCarregando:getLargura())/2);
    labelCarregando:setPy((panelResultados:getAltura() - labelCarregando:getAltura())/2);

    panelResultados:addComponent(labelCarregando,11);
  end


  if (CenaBusca.isNenhumResultado)then
    panelResultados.components[2] = nil;
    local labelNenhumResultado = TLabel.new();
    labelNenhumResultado:setTexto("Nenhum resultado encontrado!");
    labelNenhumResultado:setFonte(CenaBusca.font_data);
    labelNenhumResultado:update();
    labelNenhumResultado:setPx((panelResultados:getLargura() - labelNenhumResultado:getLargura())/2);
    labelNenhumResultado:setPy((panelResultados:getAltura() - labelNenhumResultado:getAltura())/2);

    panelResultados:addComponent(labelNenhumResultado,12);
  end


  return panelResultados;
end

--Constrói o painel no qual os dados são inseridos para busca avançada de escolas
function CenaBusca:buildPainelConsultarPoliticoAvancado(frame)
  -- Incluir componentes gráficos
  local panel= TPanel.new();
  panel:setLargura(630);
  panel:setAltura(385);
  panel:setPx(5);
  panel:setPy(5);
  panel:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));--{r=200,g=255,b=255,alpha=255}));

  local menuOpcoes = TMenu.new();
  menuOpcoes:addAllItens(CenaBusca:getItensMenuAvancado(frame));
  menuOpcoes:setOpcaoSelecionada(CenaBusca.indiceItemMenuAvancado);
  menuOpcoes:setOpcaoSelecionadaJanela(CenaBusca.indiceItemMenuAvancado);
  menuOpcoes:setOrientacao(TMenu.VERTICAL);
  menuOpcoes:setTamanhoJanela(9);
  menuOpcoes:setIsItensCentralizados(false);
  menuOpcoes:update();

  menuOpcoes:setPx(5)--(FramePrincipal:getLargura() - menu:getLargura())/2);
  menuOpcoes:setPy(5)--(FramePrincipal:getAltura() - menu:getAltura())/2);

  panel:addComponent(menuOpcoes,1)

  local imageSeta = TImage.new();
  imageSeta:setSrcArquivoExterno("../media/seta_right.png");
  imageSeta:update();
  imageSeta:setPx(menuOpcoes:getLargura() + 20)--(FramePrincipal:getLargura() - menu:getLargura())/2);
  imageSeta:setPy(19 + (38 * (CenaBusca.indiceItemMenuAvancado-1)) + imageSeta:getAltura()/2 + 2);

  panel:addComponent(imageSeta,2)

  local menuDetalhes = TMenu.new();
  menuDetalhes:setOpcaoSelecionada(CenaBusca.indiceItemMenuAvancadoDetalhado);
  menuDetalhes:setOpcaoSelecionadaJanela(CenaBusca.indiceItemMenuAvancadoDetalhadoJanela);
  menuDetalhes:setInicioJanela(CenaBusca.indiceItemMenuAvancadoDetalhadoJanelaInicio);
  local itens = CenaBusca:getItensMenuAvancadoDetalhes(frame,menuOpcoes:getOpcaoSelecionada(),menuDetalhes);
  menuDetalhes:addAllItens(itens);
  menuDetalhes:setOrientacao(TMenu.VERTICAL);
  menuDetalhes:setTamanhoJanela(math.min(#itens,9));
  menuDetalhes:setIsItensCentralizados(false);
  menuDetalhes:update();

  menuDetalhes:setPx(imageSeta:getPx() + imageSeta:getLargura() + 20)--(FramePrincipal:getLargura() - menu:getLargura())/2);
  menuDetalhes:setPy(5)--(FramePrincipal:getAltura() - menu:getAltura())/2);

  panel:addComponent(menuDetalhes,3)

  return panel;
end

--[[Método responsável por comparar os dados estatísticos gerais e das melhores escolas com os dados da escola em questão]]--
function CenaBusca:pesquisarVisualizarEscolaComparar()

  CenaBusca.isCarregandoPesquisaVisualizarEscolaComparar = true;

  FrameVisualizarEscolaComparar:inicialize();
  local APP = coroutine.create (

      function ()

        CenaBusca.listaNacional:buscarEstatisticas(CenaBusca.filtroNacional)

        if(CenaBusca.filtroRegional.regiaoGeografica ~= " - " and CenaBusca.filtroRegional.regiaoGeograficaAlterado)then
          CenaBusca.listaRegional:buscarEstatisticas(CenaBusca.filtroRegional)
        end

        if(CenaBusca.filtroEstadual.estado ~= " - " and CenaBusca.filtroEstadual.estadoAlterado)then
          CenaBusca.listaEstadual:buscarEstatisticas(CenaBusca.filtroEstadual)
        end

        if(CenaBusca.filtroMunicipal.cidade ~= " - " and CenaBusca.filtroMunicipal.cidadeAlterado)then
          CenaBusca.listaMunicipal:buscarEstatisticas(CenaBusca.filtroMunicipal)
        end


        --[[código adicionado]]--
        CenaBusca.listaNacionalMelhores:buscarMelhoresEscolas(CenaBusca.filtroNacionalMelhores)

        if(CenaBusca.filtroRegionalMelhores.regiaoGeografica ~= " - " and CenaBusca.filtroRegionalMelhores.regiaoGeograficaAlterado)then
          CenaBusca.listaRegionalMelhores:buscarMelhoresEscolas(CenaBusca.filtroRegionalMelhores)
        end

        if(CenaBusca.filtroEstadualMelhores.estado ~= " - " and CenaBusca.filtroEstadualMelhores.estadoAlterado)then
          CenaBusca.listaEstadualMelhores:buscarMelhoresEscolas(CenaBusca.filtroEstadualMelhores)
        end



        --*****************************************************************************************************************

        CenaBusca.isCarregandoPesquisaVisualizarEscolaComparar = false;

        FrameVisualizarEscolaComparar:inicialize();
        Display.show();
      end
  )

  coroutine.resume(APP)
end

--Faz a comparação de dados estatísticos da escola selecionada em nível municipal, estadual, regional e nacional
function CenaBusca:getItensResultadoDetalhesComparar(itens)


  if(CenaBusca.listaNacional.estatisticas[1] ~=nil)then

    local estatisticasEscola = CenaBusca.politicoSelecionado:toEstatistica();

    for i,v in pairs(CenaBusca.colunas) do
      local estatistica = v.titulo;
      local escola = " - ";
      local nacional = CenaBusca:getEstatistica(CenaBusca.listaNacional.estatisticas[1][v.indice], v.isPercentual);
      local regional = " - ";
      local estadual = " - ";
      local municipal = " - ";

      if(estatisticasEscola[v.indice] ~= nil)then
        escola = estatisticasEscola[v.indice];
      end

      if(CenaBusca.listaRegional.estatisticas[1] ~= nil)then
        regional = CenaBusca:getEstatistica(CenaBusca.listaRegional.estatisticas[1][v.indice], v.isPercentual);
      end

      if(CenaBusca.listaEstadual.estatisticas[1] ~= nil)then
        estadual = CenaBusca:getEstatistica(CenaBusca.listaEstadual.estatisticas[1][v.indice], v.isPercentual);
      end

      if(CenaBusca.listaMunicipal.estatisticas[1] ~= nil)then
        municipal = CenaBusca:getEstatistica(CenaBusca.listaMunicipal.estatisticas[1][v.indice], v.isPercentual);
      end


      local line = TConteiner.new();
      line:setLargura(1270);
      line:setAltura(40);

      local sizeFields = 150;
      local sizeEstatistica = 420;

      local fieldEstatistica = createField(estatistica,5,5,sizeEstatistica,CenaBusca.font_data,CenaBusca.cor_line,false);
      line:addComponent(fieldEstatistica);

      local fieldEscola = createField(escola,fieldEstatistica:getPx() + fieldEstatistica:getLargura() + 10,5,sizeFields,CenaBusca.font_data,CenaBusca.cor_line,true);
      line:addComponent(fieldEscola);

      local fieldNacional = createField(nacional,fieldEscola:getPx() + fieldEscola:getLargura() + 10,5,sizeFields,CenaBusca.font_data,CenaBusca.cor_line,true);
      line:addComponent(fieldNacional);

      local fieldRegional = createField(regional,fieldNacional:getPx() + fieldNacional:getLargura() + 10,5,sizeFields,CenaBusca.font_data,CenaBusca.cor_line,true);
      line:addComponent(fieldRegional);

      local fieldEstadual = createField(estadual,fieldRegional:getPx() + fieldRegional:getLargura() + 10,5,sizeFields,CenaBusca.font_data,CenaBusca.cor_line,true);
      line:addComponent(fieldEstadual);

      local fieldMunicipal = createField(municipal,fieldEstadual:getPx() + fieldEstadual:getLargura() + 10,5,sizeFields,CenaBusca.font_data,CenaBusca.cor_line,true);
      line:addComponent(fieldMunicipal);

      table.insert(itens,line);
    end
  end
end

--Faz a comparação dos dados estatísticos da escola selecionada com as melhores e piores escolas em nível estadual, regional e nacional
function CenaBusca:getItensResultadoDetalhesCompararMelhoresPiores(itens)


  if(CenaBusca.listaNacionalMelhores.melhoresEscolas[1] ~=nil)then

    local estatisticasEscola = CenaBusca.politicoSelecionado:toEstatistica();
    for i,v in pairs(CenaBusca.colunas) do
      local estatistica = v.titulo;
      local escola = " - ";
      local nacional = CenaBusca:getEstatistica(CenaBusca.listaNacionalMelhores.melhoresEscolas[1][v.indice], v.isPercentual);
      local regional = " - ";
      local estadual = " - ";
      local municipal = " - ";

      if(estatisticasEscola[v.indice] ~= nil)then
        escola = estatisticasEscola[v.indice];
      end

      if(CenaBusca.listaRegionalMelhores.melhoresEscolas[1] ~= nil)then
        regional = CenaBusca:getEstatistica(CenaBusca.listaRegionalMelhores.melhoresEscolas[1][v.indice], v.isPercentual);
      end

      if(CenaBusca.listaEstadualMelhores.melhoresEscolas[1] ~= nil)then
        estadual = CenaBusca:getEstatistica(CenaBusca.listaEstadualMelhores.melhoresEscolas[1][v.indice], v.isPercentual);
      end


      local line = TConteiner.new();
      line:setLargura(1270);
      line:setAltura(40);

      local sizeFields = 184;--85;
      local sizeEstatistica = 450;--350;

      local fieldEstatistica = createField(estatistica,5,5,sizeEstatistica,CenaBusca.font_data,CenaBusca.cor_line,false);
      line:addComponent(fieldEstatistica);

      local fieldEscola = createField(escola,fieldEstatistica:getPx() + fieldEstatistica:getLargura() + 10,5,sizeFields + 5,CenaBusca.font_data,CenaBusca.cor_line,true);
      line:addComponent(fieldEscola);

      local fieldNacionalMelhores = createField(nacional,fieldEscola:getPx() + fieldEscola:getLargura() + 10,5,sizeFields,CenaBusca.font_data,CenaBusca.cor_line,true);
      line:addComponent(fieldNacionalMelhores);



      local fieldRegionalMelhores = createField(regional,fieldNacionalMelhores:getPx() + fieldNacionalMelhores:getLargura() + 10,5,sizeFields,CenaBusca.font_data,CenaBusca.cor_line,true);
      line:addComponent(fieldRegionalMelhores);



      local fieldEstadualMelhroes = createField(estadual,fieldRegionalMelhores:getPx() + fieldRegionalMelhores:getLargura() + 10,5,sizeFields,CenaBusca.font_data,CenaBusca.cor_line,true);
      line:addComponent(fieldEstadualMelhroes);




      table.insert(itens,line);
    end
  end

end

--Formata o dado estatístico em duas casas decimais após a vírgula
function CenaBusca:getEstatistica(estatistica, isPercentual)
  if(estatistica ~= nil and isPercentual)then
    estatistica = string.format("%.2f",tonumber(estatistica) * 100) .. "%";
  elseif(estatistica ~= nil)then
    estatistica = string.format("%.2f",tonumber(estatistica));
  end
  return estatistica;
end



function CenaBusca:getItensMenuDetalhesPolitico()

  local itensPrimitivos = {
    {'../media/icone.png'    ,'Gastos por Tipo',''},
    {'../media/icone.png' , 'Gastos por Empresa', ''},
    {'../media/icone.png'   ,'Projetos',''},
    {'../media/icone.png','Comissões',''},
  };

  local itens = {};

  local font_data= Fonte.new({nome='tiresias', tamanho=32,is_negrito = true});
  font_data.cor = Cor.new({r=255,g=94,b=94})


  for i,v in pairs(itensPrimitivos) do
    local src = v[1];
    local nome = v[2];
    local action = v[3];

    local image = TImage.new();
    image:setSrcArquivoExterno(src);

    local label = TLabel.new();
    label:setTexto(nome);
    label:setFonte(font_data);

    local icone = TIcon.new();
    icone:setTImage(image);
    icone:setTLabel(label);
    icone:setOrientacao(TIcon.TITULO_RIGHT);

    icone.action = function (self,evt)
    evt.rule_key = action;
    end

    table.insert(itens,icone);

  end

  return itens;

end

