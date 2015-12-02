BibliotecaAuxiliarScript.execute('framework.src.util.app.Scene');
BibliotecaAuxiliarScript.execute('scene.CenaBuscaCandidatos.frames.FrameConsultarCandidato');
BibliotecaAuxiliarScript.execute('scene.CenaBuscaCandidatos.frames.FrameConsultarCandidatoAvancado');
BibliotecaAuxiliarScript.execute('scene.CenaBuscaCandidatos.frames.FrameVisualizarCandidato');
BibliotecaAuxiliarScript.execute('scene.CenaBuscaCandidatos.frames.FrameVisualizarEscolaComparar');
BibliotecaAuxiliarScript.execute('data.Localizacoes');
BibliotecaAuxiliarScript.execute('data.ListaCandidatos');
BibliotecaAuxiliarScript.execute('data.Candidato');
BibliotecaAuxiliarScript.execute('data.FiltroCandidato');
BibliotecaAuxiliarScript.execute('data.ListaEstatisticas');
BibliotecaAuxiliarScript.execute('data.Estatistica');
BibliotecaAuxiliarScript.execute('data.FiltroEstatisticasRegiao');
BibliotecaAuxiliarScript.execute('utils.Utils');

BibliotecaAuxiliarScript.execute('data.ListaMelhoresEscolas');
BibliotecaAuxiliarScript.execute('data.MelhoresEscolas');       --[[código adicionado]]--
BibliotecaAuxiliarScript.execute('data.FiltroMelhoresEscolas');

CenaBuscaCandidatos = Scene.new();
CenaBuscaCandidatos.id = 'CenaBuscaCandidatos';
CenaBuscaCandidatos.cor = Cor.new({r=255,g=255,b=255,alpha=255});
CenaBuscaCandidatos.font_label = Fonte.new({nome='tiresias', tamanho=20, is_negrito = true,cor = Cor.new({r=255,g=255,b=255})});
CenaBuscaCandidatos.font_header= Fonte.new({nome='tiresias', tamanho=20, is_negrito = true,cor = Cor.new({r=255,g=255,b=0})});
CenaBuscaCandidatos.font_data = Fonte.new({nome='tiresias', tamanho=20,is_negrito = false,cor = Cor.new({r=255,g=255,b=255})});
CenaBuscaCandidatos.cor_header = Cor.new({r=0,g=255,b=0,alpha=120});
CenaBuscaCandidatos.cor_line = Cor.new({r=0,g=255,b=0,alpha=30});

CenaBuscaCandidatos.lista = ListaCandidatos:new();
CenaBuscaCandidatos.filtro = FiltroCandidato:new();
CenaBuscaCandidatos.regiaoSelecionada = " - ";
CenaBuscaCandidatos.estadoSelecionado = " - ";
CenaBuscaCandidatos.cidadeSelecionada = " - ";
CenaBuscaCandidatos.cargoSelecionado = " - ";
CenaBuscaCandidatos.partidoSelecionado = " - ";
CenaBuscaCandidatos.indiceRegiao = 1;
CenaBuscaCandidatos.indiceEstado = 1;
CenaBuscaCandidatos.indiceCidade = 1;
CenaBuscaCandidatos.indiceCargo = 1;
CenaBuscaCandidatos.indicePartido = 1;
CenaBuscaCandidatos.resultado = {};
CenaBuscaCandidatos.candidatoSelecionado = nil;
CenaBuscaCandidatos.indiceEscolaMenu = 1;
CenaBuscaCandidatos.itensMenuAvancado = nil;
CenaBuscaCandidatos.painelConsultarCandidato = nil;
CenaBuscaCandidatos.painelResultados = nil;
CenaBuscaCandidatos.painelConsultarCandidatoAvancado = nil;
CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
CenaBuscaCandidatos.indexFocoVisible = 1;
CenaBuscaCandidatos.indexFoco = 2;
CenaBuscaCandidatos.labelAcao = "BUSCAR";
CenaBuscaCandidatos.indiceItemMenuAvancado = 1;
CenaBuscaCandidatos.indiceItemMenuAvancadoJanela = 1;
CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhado = 1;
CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhadoJanela = 1;
CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhadoJanelaInicio = 1;
CenaBuscaCandidatos.frameCorrente = nil;

CenaBuscaCandidatos.resultadoVisualizarEscolaComparar = {};
CenaBuscaCandidatos.isCarregandoPesquisaVisualizarEscolaComparar = false;

CenaBuscaCandidatos.filtroNacional = FiltroEstatisticasRegiao:new();
CenaBuscaCandidatos.filtroRegional = FiltroEstatisticasRegiao:new();
CenaBuscaCandidatos.filtroEstadual = FiltroEstatisticasRegiao:new();
CenaBuscaCandidatos.filtroMunicipal = FiltroEstatisticasRegiao:new();
CenaBuscaCandidatos.listaNacional = ListaEstatisticas:new();
CenaBuscaCandidatos.listaRegional = ListaEstatisticas:new();
CenaBuscaCandidatos.listaEstadual = ListaEstatisticas:new();
CenaBuscaCandidatos.listaMunicipal = ListaEstatisticas:new();


CenaBuscaCandidatos.filtroNacionalMelhores = FiltroMelhoresEscolas:new();
CenaBuscaCandidatos.filtroRegionalMelhores = FiltroMelhoresEscolas:new();
CenaBuscaCandidatos.filtroEstadualMelhores = FiltroMelhoresEscolas:new();  --[[código adicionado]]--
CenaBuscaCandidatos.listaNacionalMelhores = ListaMelhoresEscolas:new();
CenaBuscaCandidatos.listaRegionalMelhores = ListaMelhoresEscolas:new();
CenaBuscaCandidatos.listaEstadualMelhores = ListaMelhoresEscolas:new();


function CenaBuscaCandidatos:inicialize()

  CenaBuscaCandidatos.itensMenuAvancado = {
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

  CenaBuscaCandidatos:addFrame(FrameConsultarCandidato,FrameConsultarCandidato.id);
  CenaBuscaCandidatos:addFrame(FrameConsultarCandidatoAvancado,FrameConsultarCandidatoAvancado.id);
  CenaBuscaCandidatos:addFrame(FrameVisualizarPolitico,FrameVisualizarPolitico.id);
  CenaBuscaCandidatos:addFrame(FrameVisualizarEscolaComparar,FrameVisualizarEscolaComparar.id);
  

  FrameConsultarCandidato:inicialize();
  FrameConsultarCandidatoAvancado:inicialize();
  FrameVisualizarPolitico:inicialize();
  FrameVisualizarEscolaComparar:inicialize();
 

  CenaBuscaCandidatos.resultado = CenaBuscaCandidatos.lista:getCandidatos();


  CenaBuscaCandidatos.filtroNacional:setTipoLocal("NAC");
  CenaBuscaCandidatos.filtroRegional:setTipoLocal("REG");
  CenaBuscaCandidatos.filtroEstadual:setTipoLocal("EST");
  CenaBuscaCandidatos.filtroMunicipal:setTipoLocal("MUN");


  CenaBuscaCandidatos.filtroNacionalMelhores:setTipoLocal("NAC");
  CenaBuscaCandidatos.filtroRegionalMelhores:setTipoLocal("REG");  --[[código adicionado]]--
  CenaBuscaCandidatos.filtroEstadualMelhores:setTipoLocal("EST");

  CenaBuscaCandidatos.colunas = {
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
function CenaBuscaCandidatos:getDadosRegioes()
  local retorno = {};
  table.insert(retorno," - ");

  for i,v in pairs(Localizacoes.nomesRegioes) do
    table.insert(retorno,v);
  end

  return retorno;
end


--Seleciona os Estados
function CenaBuscaCandidatos:getDadosEstados()
  local retorno = {};
  table.insert(retorno," - ");

  if(CenaBuscaCandidatos.regiaoSelecionada ~= nil and CenaBuscaCandidatos.regiaoSelecionada ~= " - ")then
    for i,v in pairs(Localizacoes.regioes[CenaBuscaCandidatos.regiaoSelecionada].nomesEstados) do
      table.insert(retorno,v);
    end
  end

  return retorno;
end

--Seleciona as cidades
function CenaBuscaCandidatos:getDadosCidades()
  local retorno = {};
  table.insert(retorno," - ");

  if(CenaBuscaCandidatos.estadoSelecionado ~= nil and CenaBuscaCandidatos.estadoSelecionado ~= " - ")then
    local estado = Localizacoes.regioes[CenaBuscaCandidatos.regiaoSelecionada]:getEstados()[CenaBuscaCandidatos.estadoSelecionado];
    Localizacoes:carregaCidades(estado);
    for i,v in pairs(estado.nomesCidades) do
      table.insert(retorno,v);
    end
  end

  return retorno;
end

--Seleciona os cargos
function CenaBuscaCandidatos:getDadosCargos()
  local retorno = {};
  table.insert(retorno," - ");

  cargos = {"Presidente", "Governador", "Deputado Federal", "Senador", "Deputado Estadual" };
  for i,v in pairs(cargos) do
    table.insert(retorno,tostring(v));
  end


  return retorno;
end


--Seleciona índices do IDEB
function CenaBuscaCandidatos:getDadosPartidos()
  local retorno = {};
  table.insert(retorno," - ");

  partidos = {"PT", "PMDB", "DEM", "PP", "PR", "PSDB"}

  for i,v in pairs(partidos) do
    table.insert(retorno,tostring(v));
  end

  return retorno;
end

--Coloca os resultados da busca na tabela de resultados
function CenaBuscaCandidatos:getItensResultado(itens)


  for i,v in pairs(CenaBuscaCandidatos.resultado) do

    local partido = v:getSiglaPartido() or "-";
    local cargo = v:getNomeCargo() or "-";
    local nome = v:getNomeParlamentar() or "-";
    local cidade = v:getCidade() or "-";
    local estado = v:getEstado() or "-";
    local idade = v:getIdade() or "-";
    local sexo =  "-"; --v:getSexo() or
    local escolaridade =  "-"; --v:getNomeEscolaridade() or

    local line = TConteiner.new();
    line:setLargura(1270);
    line:setAltura(40);

    line:addComponent(createField(partido,0,5,100,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
    line:addComponent(createField(cargo,110,5,110,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
    line:addComponent(createField(nome,230,5,400,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
    line:addComponent(createField(cidade,640,5,200,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
    line:addComponent(createField(estado,850,5,70,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
    line:addComponent(createField(idade,930,5,70,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
    line:addComponent(createField(sexo,1010,5,70,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
    line:addComponent(createField(escolaridade,1090,5,170,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));

    line.action = function (self,evt)

      evt.rule_key = "acessarCenaVisualizarCandidato";
      CenaBuscaCandidatos.candidatoSelecionado = v;
      CenaBuscaCandidatos.isCarregandoDetalhes = true;

      FrameVisualizarCandidato:inicialize();
      print("FRAME VIZUALIZAR CANDIDATO!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
      
      local APP = coroutine.create (
        function ()

          local f_callback = function(candidatoModificado)
            CenaBuscaCandidatos.candidatoSelecionado = candidatoModificado;
            FrameVisualizarCandidato:inicialize();
            CenaBuscaCandidatos.isCarregandoDetalhes = false;

            FrameVisualizarCandidato:inicialize();
            print("FRAME VIZUALIZAR CANDIDATO!************************************")
            Display.show();
          end

          carregaDetalhesCandidato(f_callback,CenaBuscaCandidatos.candidatoSelecionado);
          print("CHAMOU CARREGA DETALHES CANDIDATO!!")
          
        end
      )

      coroutine.resume(APP)
    end

    table.insert(itens,line);

  end
end

function CenaBuscaCandidatos:updateFiltro(frame)
  local indiceRegulamentacao = 1;
  local indiceDepAdministrativa = 2;
  local indiceStatus = 3;
  local indiceLocalidade = 4;
  local indiceAgua = 5;
  local indiceEnergia = 6;
  local indiceEsgoto = 7;
  local indiceLixo = 8;
  local indiceDependencias = 9;

  CenaBuscaCandidatos.filtro:limparCaracteristicas();

  if(frame.id == FrameConsultarCandidatoAvancado.id)then

    for indice,opcaoSelecionada in pairs(CenaBuscaCandidatos.itensMenuAvancado[indiceRegulamentacao].mascara) do
      if(opcaoSelecionada)then
        CenaBuscaCandidatos.filtro:setRegulamentada(indice-1);
        break;
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBuscaCandidatos.itensMenuAvancado[indiceDepAdministrativa].mascara) do
      if(opcaoSelecionada)then
        CenaBuscaCandidatos.filtro:setDependenciasAdministrativas(indice);
        break;
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBuscaCandidatos.itensMenuAvancado[indiceStatus].mascara) do
      if(opcaoSelecionada)then
        CenaBuscaCandidatos.filtro:setSituacaoFuncionamento(indice);
        break;
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBuscaCandidatos.itensMenuAvancado[indiceLocalidade].mascara) do
      if(opcaoSelecionada)then
        CenaBuscaCandidatos.filtro:setLocalidade(indice);
        break;
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBuscaCandidatos.itensMenuAvancado[indiceAgua].mascara) do
      if(opcaoSelecionada)then
        if(indice == 1)then
          CenaBuscaCandidatos.filtro:setAguaFiltrada("true");
        elseif(indice == 2)then
          CenaBuscaCandidatos.filtro:setAguaPublica("true");
        elseif(indice == 3)then
          CenaBuscaCandidatos.filtro:setAguaPocoArtesiano("true");
        elseif(indice == 4)then
          CenaBuscaCandidatos.filtro:setAguaCacimba("true");
        elseif(indice == 5)then
          CenaBuscaCandidatos.filtro:setAguaRio("true");
        elseif(indice == 6)then
          CenaBuscaCandidatos.filtro:setAguaInexistente("true");
        end
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBuscaCandidatos.itensMenuAvancado[indiceEnergia].mascara) do
      if(opcaoSelecionada)then
        if(indice == 1)then
          CenaBuscaCandidatos.filtro:setEnergiaPublica("true");
        elseif(indice == 2)then
          CenaBuscaCandidatos.filtro:setEnergiaGerador("true");
        elseif(indice == 3)then
          CenaBuscaCandidatos.filtro:setEnergiaOutros("true");
        elseif(indice == 4)then
          CenaBuscaCandidatos.filtro:setEnergiaInexistente("true");
        end
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBuscaCandidatos.itensMenuAvancado[indiceEsgoto].mascara) do
      if(opcaoSelecionada)then
        if(indice == 1)then
          CenaBuscaCandidatos.filtro:setEsgotoPublico("true");
        elseif(indice == 2)then
          CenaBuscaCandidatos.filtro:setEsgotoFossa("true");
        elseif(indice == 3)then
          CenaBuscaCandidatos.filtro:setEsgotoInexistente("true");
        end
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBuscaCandidatos.itensMenuAvancado[indiceLixo].mascara) do
      if(opcaoSelecionada)then
        if(indice == 1)then
          CenaBuscaCandidatos.filtro:setLixoColetaPeriodica("true");
        elseif(indice == 2)then
          CenaBuscaCandidatos.filtro:setLixoQueima("true");
        elseif(indice == 3)then
          CenaBuscaCandidatos.filtro:setLixoJogaOutraArea("true");
        elseif(indice == 4)then
          CenaBuscaCandidatos.filtro:setLixoRecicla("true");
        elseif(indice == 5)then
          CenaBuscaCandidatos.filtro:setLixoEnterra("true");
        elseif(indice == 6)then
          CenaBuscaCandidatos.filtro:setLixoOutros("true");
        end
      end
    end

    for indice,opcaoSelecionada in pairs(CenaBuscaCandidatos.itensMenuAvancado[indiceDependencias].mascara) do
      if(opcaoSelecionada)then
        if(indice == 1)then
          CenaBuscaCandidatos.filtro:setLaboratorioInformatica("true");
        elseif(indice == 2)then
          CenaBuscaCandidatos.filtro:setLaboratorioCiencias("true");
        elseif(indice == 3)then
          CenaBuscaCandidatos.filtro:setBiblioteca("true");
        elseif(indice == 4)then
          CenaBuscaCandidatos.filtro:setAuditorio("true");
        elseif(indice == 5)then
          CenaBuscaCandidatos.filtro:setRefeitorio("true");
        elseif(indice == 6)then
          CenaBuscaCandidatos.filtro:setPatioCoberto("true");
        elseif(indice == 7)then
          CenaBuscaCandidatos.filtro:setPatioDescoberto("true");
        elseif(indice == 8)then
          CenaBuscaCandidatos.filtro:setParqueInfantil("true");
        elseif(indice == 9)then
          CenaBuscaCandidatos.filtro:setBercario("true");
        elseif(indice == 10)then
          CenaBuscaCandidatos.filtro:setQuadraCoberta("true");
        elseif(indice == 11)then
          CenaBuscaCandidatos.filtro:setQuadraDescoberta("true");
        elseif(indice == 12)then
          CenaBuscaCandidatos.filtro:setAreaVerde("true");
        elseif(indice == 13)then
          CenaBuscaCandidatos.filtro:setDependenciasPNE("true");
        elseif(indice == 14)then
        --            CenaBuscaCandidatos.filtro:setAtendimentoEspecial("true");
        elseif(indice == 15)then
          CenaBuscaCandidatos.filtro:setSanitarioDentroPredio("true");
        elseif(indice == 16)then
          CenaBuscaCandidatos.filtro:setSanitarioForaPredio("true");
        elseif(indice == 17)then
          CenaBuscaCandidatos.filtro:setBanheiroChuveiro("true");
        elseif(indice == 18)then
          CenaBuscaCandidatos.filtro:setAlmoxarifado("true");
        elseif(indice == 19)then
          CenaBuscaCandidatos.filtro:setAlojamentoAluno("true");
        elseif(indice == 20)then
          CenaBuscaCandidatos.filtro:setSalaDiretoria("true");
        elseif(indice == 21)then
          CenaBuscaCandidatos.filtro:setSalaLeitura("true");
        elseif(indice == 22)then
          CenaBuscaCandidatos.filtro:setSalaProfessores("true");
        elseif(indice == 23)then
          CenaBuscaCandidatos.filtro:setSecretaria("true");
        elseif(indice == 24)then
          CenaBuscaCandidatos.filtro:setDespensa("true");
        elseif(indice == 25)then
          CenaBuscaCandidatos.filtro:setCozinha("true");
        elseif(indice == 26)then
          CenaBuscaCandidatos.filtro:setLavanderia("true");
        end
      end
    end
  end

end

--Função filtro para pesquisar escolas por nome, estado, cidade, nota ENEM, ou IDEB
function CenaBuscaCandidatos:pesquisarCandidatos(frame)

  CenaBuscaCandidatos.isCarregandoPesquisa = true;

  CenaBuscaCandidatos.isNenhumResultado = false;

  frame:inicialize();
  local APP = coroutine.create (

      function ()

        --CenaBuscaCandidatos:updateFiltro(frame);

        if(CenaBuscaCandidatos.filtro.nomeParlamentar == "")then
          CenaBuscaCandidatos.filtro.nomeParlamentarAlterado = false;
        end

        if(CenaBuscaCandidatos.filtro.estado == " - ")then
          CenaBuscaCandidatos.filtro.estadoAlterado = false;
        end

        if(CenaBuscaCandidatos.filtro.cidade == " - ")then
          CenaBuscaCandidatos.filtro.cidadeAlterado = false;
        end

        if(CenaBuscaCandidatos.filtro.Nomecargo == " - ")then
          CenaBuscaCandidatos.filtro.cargoAlterado = false;
        end

        if(CenaBuscaCandidatos.filtro.nomePartido == " - ")then
          CenaBuscaCandidatos.filtro.partidoAlterado = false;
        end

--        if(CenaBuscaCandidatos.filtro.idebAnosIniciaisMin == " - ")then
--          CenaBuscaCandidatos.filtro.idebAnosIniciaisMinAlterado = false;
--        end
--
--        if(CenaBuscaCandidatos.filtro.idebAnosIniciaisMax == " - ")then
--          CenaBuscaCandidatos.filtro.idebAnosIniciaisMaxAlterado = false;
--        end
--
--        if(CenaBuscaCandidatos.filtro.idebAnosFinaisMin == " - ")then
--          CenaBuscaCandidatos.filtro.idebAnosFinaisMinAlterado = false;
--        end
--
--        if(CenaBuscaCandidatos.filtro.idebAnosFinaisMax == " - ")then
--          CenaBuscaCandidatos.filtro.idebAnosFinaisMaxAlterado = false;
--        end

        CenaBuscaCandidatos.lista:pesquisarCandidatos(CenaBuscaCandidatos.filtro);
        CenaBuscaCandidatos.isCarregandoPesquisa = false;

        CenaBuscaCandidatos.resultado = CenaBuscaCandidatos.lista:getCandidatos();

        if(#CenaBuscaCandidatos.resultado > 0)then
          CenaBuscaCandidatos.indexFocoVisible = 2
          CenaBuscaCandidatos.indexFoco = 2
          CenaBuscaCandidatos.panelFoco = "painelResultados";
          CenaBuscaCandidatos.labelAcao = "CAMPOS"

        else
          CenaBuscaCandidatos.isNenhumResultado = true;
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
function CenaBuscaCandidatos:clear()
  CenaBuscaCandidatos.lista = ListaCandidatos:new();
  CenaBuscaCandidatos.filtro = FiltroCandidato:new();
  CenaBuscaCandidatos.regiaoSelecionada = " - ";
  CenaBuscaCandidatos.estadoSelecionado = " - ";
  CenaBuscaCandidatos.cidadeSelecionada = " - ";
  CenaBuscaCandidatos.enemSelecionado = " - ";
  CenaBuscaCandidatos.indiceRegiao = 1;
  CenaBuscaCandidatos.indiceEstado = 1;
  CenaBuscaCandidatos.indiceCidade = 1;
  CenaBuscaCandidatos.indiceEnem = 1;
  CenaBuscaCandidatos.indiceIdebAnosIniciaisMin = 1;
  CenaBuscaCandidatos.indiceIdebAnosIniciaisMax = 1;
  CenaBuscaCandidatos.indiceIdebAnosFinaisMin = 1;
  CenaBuscaCandidatos.indiceIdebAnosFinaisMax = 1;
  CenaBuscaCandidatos.resultado = {};
  CenaBuscaCandidatos.candidatoSelecionado = nil;
  CenaBuscaCandidatos.indiceEscolaMenu = 1;
end

--Carrega itens para a busca avançada
function CenaBuscaCandidatos:getItensMenuAvancado(frame)

  local itens = {};

  for i,v in pairs(CenaBuscaCandidatos.itensMenuAvancado) do
    local src = v[1];
    local nome = v[2];

    local image = TImage.new();
    image:setSrcArquivoExterno(src);

    local label = TLabel.new();
    label:setTexto(nome);
    label:setFonte(CenaBuscaCandidatos.font_label);

    local icone = TIcon.new();
    icone:setTImage(image);
    icone:setTLabel(label);
    icone:setOrientacao(TIcon.TITULO_RIGHT);

    icone.handler = function (self,evt)
      if(BibliotecaAuxiliarEvento.isEventoControle(evt)) then

        if(BibliotecaAuxiliarEvento.isBotaoCima(evt) and CenaBuscaCandidatos.indiceItemMenuAvancado > 1)then
          CenaBuscaCandidatos.indiceItemMenuAvancado = CenaBuscaCandidatos.indiceItemMenuAvancado - 1;
          CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhado = 1;
          CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhadoJanelaInicio = 1;
          frame:inicialize();
        elseif(BibliotecaAuxiliarEvento.isBotaoBaixo(evt) and CenaBuscaCandidatos.indiceItemMenuAvancado < #CenaBuscaCandidatos.itensMenuAvancado)then
          CenaBuscaCandidatos.indiceItemMenuAvancado = CenaBuscaCandidatos.indiceItemMenuAvancado + 1;
          CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhado = 1;
          CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhadoJanelaInicio = 1;
          frame:inicialize();
        elseif(BibliotecaAuxiliarEvento.isBotaoDireita(evt)) then
          CenaBuscaCandidatos.indexFocoVisible = 3;
          CenaBuscaCandidatos.indexFoco = 3;
          CenaBuscaCandidatos.panelFoco = "painelConsultarCandidatoAvancado";
          frame:inicialize();
        end
      end
    end

    table.insert(itens,icone);

  end

  return itens;
end

--Detalha os itens da busca avançada
function CenaBuscaCandidatos:getItensMenuAvancadoDetalhes(frame,indiceItemSelecionado,menu)

  local itens = {};



  for i,v in pairs(CenaBuscaCandidatos.itensMenuAvancado[indiceItemSelecionado].detalhes) do
    local nome = v;

    if(CenaBuscaCandidatos.itensMenuAvancado[indiceItemSelecionado].mascara[i] == nil)then
      CenaBuscaCandidatos.itensMenuAvancado[indiceItemSelecionado].mascara[i] = false;
    end

    local image = TImage.new();
    if(CenaBuscaCandidatos.itensMenuAvancado[indiceItemSelecionado].mascara[i])then
      image:setSrcArquivoExterno("../media/check_habilitado.png");
    else
      image:setSrcArquivoExterno("../media/check_desabilitado.png");
    end

    local label = TLabel.new();
    label:setTexto(nome);
    label:setFonte(CenaBuscaCandidatos.font_label);

    local icone = TIcon.new();
    icone:setTImage(image);
    icone:setTLabel(label);
    icone:setOrientacao(TIcon.TITULO_RIGHT);

    icone.action = function (self,evt)
      CenaBuscaCandidatos.itensMenuAvancado[indiceItemSelecionado].mascara[i] = not CenaBuscaCandidatos.itensMenuAvancado[indiceItemSelecionado].mascara[i];

      if((not CenaBuscaCandidatos.itensMenuAvancado[indiceItemSelecionado].detalhesMultselect) and CenaBuscaCandidatos.itensMenuAvancado[indiceItemSelecionado].mascara[i])then
        for indiceItem,valorItem in pairs(CenaBuscaCandidatos.itensMenuAvancado[indiceItemSelecionado].detalhes) do
          if(indiceItem ~=i) then
            CenaBuscaCandidatos.itensMenuAvancado[indiceItemSelecionado].mascara[indiceItem] = false;
          end
        end
      end

      frame:inicialize();
    end

    icone.handler = function (self,evt)
      CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhado = menu:getOpcaoSelecionada();
      CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhadoJanela = menu:getOpcaoSelecionadaJanela();
      CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhadoJanelaInicio = menu:getInicioJanela();

      if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoEsquerda(evt)) then
        CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhado = 1;
        CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhadoJanela = 1;
        CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhadoJanelaInicio = 1;
        CenaBuscaCandidatos.indexFocoVisible = 1;
        CenaBuscaCandidatos.indexFoco = 1;
        CenaBuscaCandidatos.panelFoco = "painelConsultarCandidatoAvancado";
        frame:inicialize();
      end
    end

    table.insert(itens,icone);

  end

  return itens;
end

--Constrói o painel no qual os dados são inseridos para busca de escolas
function CenaBuscaCandidatos:buildPainelConsultarCandidato(frame)
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
  labelField:setFonte(CenaBuscaCandidatos.font_label);
  labelField:setPx(pxComponent);
  labelField:setPy(pyComponent);
  labelField:update();

  indiceComponente = indiceComponente + 1;

  if(CenaBuscaCandidatos.fieldNome == nil)then
    CenaBuscaCandidatos.fieldNome = TField.new();
  end

  local fieldNome = CenaBuscaCandidatos.fieldNome;

  fieldNome.indice = indiceComponente;

  fieldNome:setFonte(CenaBuscaCandidatos.font_data);
  fieldNome:setIsEditable(true);
  fieldNome:setTexto(CenaBuscaCandidatos.filtro:getNomeParlamentar());
  fieldNome:setPx(pxComponent + labelField:getLargura() + 2);
  fieldNome:setPy(pyComponent);
  fieldNome:getTLabelTexto():setLargura(550);
  fieldNome:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=90}));
  fieldNome.indice = indiceComponente;

  panel:addComponent(labelField,labelField.indice);
  panel:addComponent(fieldNome,fieldNome.indice);

  CenaBuscaCandidatos.filtro:setNomeParlamentar(fieldNome:getTexto());

  --Choicer Regiao
  local pyComponent = pyComponent + fieldNome:getAltura() + 2;
  pxComponent = 2;
  indiceComponente = indiceComponente + 1;

  local labelChoicerRegiao = TLabel.new();
  labelChoicerRegiao.indice = indiceComponente;
  labelChoicerRegiao:setTexto("Regiao:");
  labelChoicerRegiao:setFonte(CenaBuscaCandidatos.font_label);
  labelChoicerRegiao:setPx(pxComponent);
  labelChoicerRegiao:setPy(pyComponent);
  labelChoicerRegiao:update();

  pxComponent = labelChoicerRegiao:getLargura() + 2;
  indiceComponente = indiceComponente + 1;

  local tchoicerRegiao = TChoicer.new();
  tchoicerRegiao.indice = indiceComponente;
  tchoicerRegiao:setFonte(CenaBuscaCandidatos.font_data);
  tchoicerRegiao:addAllItens(CenaBuscaCandidatos:getDadosRegioes());
  tchoicerRegiao:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerRegiao:setOpcaoSelecionada(CenaBuscaCandidatos.indiceRegiao)
  tchoicerRegiao:setInicioJanela(CenaBuscaCandidatos.indiceRegiao)
  tchoicerRegiao:setIsFoco(true);
  tchoicerRegiao:setPx(pxComponent);
  tchoicerRegiao:setPy(pyComponent);
  tchoicerRegiao:update();
  CenaBuscaCandidatos.regiaoSelecionada = tchoicerRegiao:getItens()[tchoicerRegiao:getOpcaoSelecionada(CenaBuscaCandidatos.indiceRegiao)]:getTexto();
  CenaBuscaCandidatos.filtro:setRegiao(CenaBuscaCandidatos.regiaoSelecionada);

  CenaBuscaCandidatos.filtroRegionalMelhores:setRegiaoGeografica(CenaBuscaCandidatos.regiaoSelecionada); --[[código adicionado]]--

  panel:addComponent(labelChoicerRegiao,labelChoicerRegiao.indice);
  panel:addComponent(tchoicerRegiao,tchoicerRegiao.indice);

  --Choicer Estado
  local pyComponent = pyComponent + tchoicerRegiao:getAltura() + 2;
  pxComponent = 2;
  indiceComponente = indiceComponente + 1;

  local labelChoicerEstado = TLabel.new();
  labelChoicerEstado.indice = indiceComponente;
  labelChoicerEstado:setTexto("Estado:");
  labelChoicerEstado:setFonte(CenaBuscaCandidatos.font_label);
  labelChoicerEstado:setPx(pxComponent);
  labelChoicerEstado:setPy(pyComponent);
  labelChoicerEstado:update();

  pxComponent = labelChoicerEstado:getLargura() + 2;
  indiceComponente = indiceComponente + 1;

  local tchoicerEstado = TChoicer.new();
  tchoicerEstado.indice = indiceComponente;
  tchoicerEstado:setFonte(CenaBuscaCandidatos.font_data);
  tchoicerEstado:addAllItens(CenaBuscaCandidatos:getDadosEstados());
  tchoicerEstado:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerEstado:setOpcaoSelecionada(CenaBuscaCandidatos.indiceEstado)
  tchoicerEstado:setInicioJanela(CenaBuscaCandidatos.indiceEstado)
  tchoicerEstado:setIsFoco(true);
  tchoicerEstado:setPx(pxComponent);
  tchoicerEstado:setPy(pyComponent);
  tchoicerEstado:update();
  CenaBuscaCandidatos.estadoSelecionado = tchoicerEstado:getItens()[tchoicerEstado:getOpcaoSelecionada(CenaBuscaCandidatos.indiceEstado)]:getTexto();
  CenaBuscaCandidatos.filtro:setEstado(CenaBuscaCandidatos.estadoSelecionado);

  CenaBuscaCandidatos.filtroEstadualMelhores:setEstado(CenaBuscaCandidatos.estadoSelecionado); --[[código adicionado]]--

  panel:addComponent(labelChoicerEstado,labelChoicerEstado.indice);
  panel:addComponent(tchoicerEstado,tchoicerEstado.indice);

  --Choicer Cidade
  local pyComponent = pyComponent + tchoicerEstado:getAltura() + 2;
  pxComponent = 2;
  indiceComponente = indiceComponente + 1;

  local labelChoicerCidade = TLabel.new();
  labelChoicerCidade.indice = indiceComponente;
  labelChoicerCidade:setTexto("Cidade:");
  labelChoicerCidade:setFonte(CenaBuscaCandidatos.font_label);
  labelChoicerCidade:setPx(pxComponent);
  labelChoicerCidade:setPy(pyComponent);
  labelChoicerCidade:update();

  pxComponent = labelChoicerCidade:getLargura() + 2;
  indiceComponente = indiceComponente + 1;

  local tchoicerCidade = TChoicer.new();
  tchoicerCidade.indice = indiceComponente;
  tchoicerCidade:setFonte(CenaBuscaCandidatos.font_data);
  tchoicerCidade:addAllItens(CenaBuscaCandidatos:getDadosCidades());
  tchoicerCidade:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerCidade:setOpcaoSelecionada(CenaBuscaCandidatos.indiceCidade)
  tchoicerCidade:setInicioJanela(CenaBuscaCandidatos.indiceCidade)
  tchoicerCidade:setIsFoco(true);
  tchoicerCidade:setPx(pxComponent);
  tchoicerCidade:setPy(pyComponent);
  tchoicerCidade:update();
  CenaBuscaCandidatos.cidadeSelecionada = tchoicerCidade:getItens()[CenaBuscaCandidatos.indiceCidade]:getTexto();
  if(CenaBuscaCandidatos.indiceCidade > 1)then
    CenaBuscaCandidatos.filtro:setCidade(Localizacoes.regioes[CenaBuscaCandidatos.regiaoSelecionada]:getEstados()[CenaBuscaCandidatos.estadoSelecionado]:getCidades()[CenaBuscaCandidatos.cidadeSelecionada]:getCodigo());
  else
    CenaBuscaCandidatos.filtro.cidadeAlterado = false;
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
  labelChoicerCargo:setFonte(CenaBuscaCandidatos.font_label);
  labelChoicerCargo:setPx(pxComponent);
  labelChoicerCargo:setPy(pyComponent);
  labelChoicerCargo:update();

  pxComponent = labelChoicerCargo:getLargura() + 2;
  indiceComponente = indiceComponente + 1;

  local tchoicerCargo = TChoicer.new();
  tchoicerCargo.indice = indiceComponente;
  tchoicerCargo:setFonte(CenaBuscaCandidatos.font_data);
  tchoicerCargo:addAllItens(CenaBuscaCandidatos:getDadosCargos());
  tchoicerCargo:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerCargo:setOpcaoSelecionada(CenaBuscaCandidatos.indiceCargo)
  tchoicerCargo:setInicioJanela(CenaBuscaCandidatos.indiceCargo)
  tchoicerCargo:setPx(pxComponent);
  tchoicerCargo:setPy(pyComponent);
  tchoicerCargo:update();

  CenaBuscaCandidatos.cargoSelecionado = tchoicerCargo:getItens()[CenaBuscaCandidatos.indiceCargo]:getTexto();
  CenaBuscaCandidatos.filtro:setNomeCargo(CenaBuscaCandidatos.cargoSelecionado);

  panel:addComponent(labelChoicerCargo,labelChoicerCargo.indice);
  panel:addComponent(tchoicerCargo,tchoicerCargo.indice);



  --Choicer Partido
  pyComponent = pyComponent + tchoicerCargo:getAltura() + 2;
  pxComponent = 2;
  indiceComponente = indiceComponente + 1;

  local labelChoicerPartido = TLabel.new();
  labelChoicerPartido.indice = indiceComponente;
  labelChoicerPartido:setTexto("Partido:");
  labelChoicerPartido:setFonte(CenaBuscaCandidatos.font_label);
  labelChoicerPartido:setPx(pxComponent);
  labelChoicerPartido:setPy(pyComponent);
  labelChoicerPartido:update();

  pxComponent = labelChoicerPartido:getLargura() + 2;
  indiceComponente = indiceComponente + 1;

  local tchoicerPartido = TChoicer.new();
  tchoicerPartido.indice = indiceComponente;
  tchoicerPartido:setFonte(CenaBuscaCandidatos.font_data);
  tchoicerPartido:addAllItens(CenaBuscaCandidatos:getDadosPartidos());
  tchoicerPartido:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerPartido:setOpcaoSelecionada(CenaBuscaCandidatos.indicePartido)
  tchoicerPartido:setInicioJanela(CenaBuscaCandidatos.indicePartido)
  tchoicerPartido:setPx(pxComponent);
  tchoicerPartido:setPy(pyComponent);
  tchoicerPartido:update();

  CenaBuscaCandidatos.partidoSelecionado = tchoicerPartido:getItens()[CenaBuscaCandidatos.indicePartido]:getTexto();
  CenaBuscaCandidatos.filtro:setNomePartido(CenaBuscaCandidatos.partidoSelecionado);

  panel:addComponent(labelChoicerPartido,labelChoicerPartido.indice);
  panel:addComponent(tchoicerPartido,tchoicerPartido.indice);





  --Interações
  fieldNome.afterHandler = function (self,evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and (BibliotecaAuxiliarEvento.isBotaoNumerico(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))) then
      CenaBuscaCandidatos.filtro:setNomeParlamentar(self:getTexto());
      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoBaixo(evt)) then
      CenaBuscaCandidatos.indexFocoVisible = labelChoicerRegiao.indice;
      CenaBuscaCandidatos.indexFoco = tchoicerRegiao.indice;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
      frame.inicialize();
    end
  end

  tchoicerRegiao.afterHandler = function (self,evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and (BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))) then

      CenaBuscaCandidatos.indiceRegiao = tchoicerRegiao:getOpcaoSelecionada();
      CenaBuscaCandidatos.indiceEstado = 1;
      CenaBuscaCandidatos.indiceCidade = 1;
      CenaBuscaCandidatos.indiceBairro = 1;

      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoCima(evt)) then
      CenaBuscaCandidatos.indexFocoVisible = labelField.indice;
      CenaBuscaCandidatos.indexFoco = fieldNome.indice;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoBaixo(evt)) then
      CenaBuscaCandidatos.indexFocoVisible = labelChoicerEstado.indice;
      CenaBuscaCandidatos.indexFoco = tchoicerEstado.indice;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
      frame.inicialize();
    end
  end

  tchoicerEstado.afterHandler = function (self,evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and (BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))) then

      CenaBuscaCandidatos.indiceEstado = tchoicerEstado:getOpcaoSelecionada();
      CenaBuscaCandidatos.indiceCidade = 1;
      CenaBuscaCandidatos.indiceBairro = 1;

      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoCima(evt)) then
      CenaBuscaCandidatos.indexFocoVisible = labelChoicerRegiao.indice;
      CenaBuscaCandidatos.indexFoco = tchoicerRegiao.indice;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoBaixo(evt)) then
      CenaBuscaCandidatos.indexFocoVisible = labelChoicerCidade.indice;
      CenaBuscaCandidatos.indexFoco = tchoicerCidade.indice;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
      frame.inicialize();


    end
  end

  tchoicerCidade.afterHandler = function (self,evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and (BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))) then
      CenaBuscaCandidatos.indiceCidade = tchoicerCidade:getOpcaoSelecionada();
      CenaBuscaCandidatos.indiceBairro = 1;

      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoCima(evt)) then
      CenaBuscaCandidatos.indexFocoVisible = labelChoicerEstado.indice;
      CenaBuscaCandidatos.indexFoco = tchoicerEstado.indice;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
      frame.inicialize();


    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoBaixo(evt)) then
      CenaBuscaCandidatos.indexFocoVisible = labelChoicerCargo.indice;
      CenaBuscaCandidatos.indexFoco = tchoicerCargo.indice;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
      frame.inicialize();


    end
  end

  tchoicerCargo.afterHandler = function (self,evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and (BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))) then
      CenaBuscaCandidatos.indiceCargo = tchoicerCargo:getOpcaoSelecionada();
      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoCima(evt)) then
      CenaBuscaCandidatos.indexFocoVisible = labelChoicerCidade.indice;
      CenaBuscaCandidatos.indexFoco = tchoicerCidade.indice;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoBaixo(evt)) then
      CenaBuscaCandidatos.indexFocoVisible = labelChoicerPartido.indice;
      CenaBuscaCandidatos.indexFoco = tchoicerPartido.indice;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
      frame.inicialize();


    end
  end


  tchoicerPartido.afterHandler = function (self,evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and (BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt))) then
      CenaBuscaCandidatos.indicePartido = tchoicerPartido:getOpcaoSelecionada();
      frame.inicialize();

    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoCima(evt)) then
      CenaBuscaCandidatos.indexFocoVisible = labelChoicerCargo.indice;
      CenaBuscaCandidatos.indexFoco = tchoicerCargo.indice;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
      frame.inicialize();

   

    end
  end



  return panel;
end

--Função que constrói o painel onde é mostrado o resultado da busca
function CenaBuscaCandidatos:buildPainelResultados(frame)
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

  line:addComponent(createField("PARTIDO",0,5,100,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
  line:addComponent(createField("CARGO",110,5,110,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
  line:addComponent(createField("NOME",230,5,400,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
  line:addComponent(createField("CIDADE",640,5,200,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
  line:addComponent(createField("UF",850,5,70,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
  line:addComponent(createField("IDADE",930,5,70,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
  line:addComponent(createField("SEXO",1010,5,70,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));
  line:addComponent(createField("ESCOLARIDADE",1090,5,170,CenaBuscaCandidatos.font_header,CenaBuscaCandidatos.cor_header,true));

  pyComponent = pyComponent + line:getAltura() + 2;

  panelResultados:addComponent(line,1);

  local resultados = {};

  if(not CenaBuscaCandidatos.isCarregandoPesquisa and panelResultados.components[2] == nil)then
    CenaBuscaCandidatos:getItensResultado(resultados);
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

  if (CenaBuscaCandidatos.isCarregandoPesquisa)then
    panelResultados.components[2] = nil;
    local labelCarregando = TLabel.new();
    labelCarregando:setTexto("Carregando...");
    labelCarregando:setFonte(CenaBuscaCandidatos.font_data);
    labelCarregando:update();
    labelCarregando:setPx((panelResultados:getLargura() - labelCarregando:getLargura())/2);
    labelCarregando:setPy((panelResultados:getAltura() - labelCarregando:getAltura())/2);

    panelResultados:addComponent(labelCarregando,11);
  end


  if (CenaBuscaCandidatos.isNenhumResultado)then
    panelResultados.components[2] = nil;
    local labelNenhumResultado = TLabel.new();
    labelNenhumResultado:setTexto("Nenhum resultado encontrado!");
    labelNenhumResultado:setFonte(CenaBuscaCandidatos.font_data);
    labelNenhumResultado:update();
    labelNenhumResultado:setPx((panelResultados:getLargura() - labelNenhumResultado:getLargura())/2);
    labelNenhumResultado:setPy((panelResultados:getAltura() - labelNenhumResultado:getAltura())/2);

    panelResultados:addComponent(labelNenhumResultado,12);
  end


  return panelResultados;
end

--Constrói o painel no qual os dados são inseridos para busca avançada de escolas
function CenaBuscaCandidatos:buildPainelConsultarCandidatoAvancado(frame)
  -- Incluir componentes gráficos
  local panel= TPanel.new();
  panel:setLargura(630);
  panel:setAltura(385);
  panel:setPx(5);
  panel:setPy(5);
  panel:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));--{r=200,g=255,b=255,alpha=255}));

  local menuOpcoes = TMenu.new();
  menuOpcoes:addAllItens(CenaBuscaCandidatos:getItensMenuAvancado(frame));
  menuOpcoes:setOpcaoSelecionada(CenaBuscaCandidatos.indiceItemMenuAvancado);
  menuOpcoes:setOpcaoSelecionadaJanela(CenaBuscaCandidatos.indiceItemMenuAvancado);
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
  imageSeta:setPy(19 + (38 * (CenaBuscaCandidatos.indiceItemMenuAvancado-1)) + imageSeta:getAltura()/2 + 2);

  panel:addComponent(imageSeta,2)

  local menuDetalhes = TMenu.new();
  menuDetalhes:setOpcaoSelecionada(CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhado);
  menuDetalhes:setOpcaoSelecionadaJanela(CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhadoJanela);
  menuDetalhes:setInicioJanela(CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhadoJanelaInicio);
  local itens = CenaBuscaCandidatos:getItensMenuAvancadoDetalhes(frame,menuOpcoes:getOpcaoSelecionada(),menuDetalhes);
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
function CenaBuscaCandidatos:pesquisarVisualizarEscolaComparar()

  CenaBuscaCandidatos.isCarregandoPesquisaVisualizarEscolaComparar = true;

  FrameVisualizarEscolaComparar:inicialize();
  local APP = coroutine.create (

      function ()

        CenaBuscaCandidatos.listaNacional:buscarEstatisticas(CenaBuscaCandidatos.filtroNacional)

        if(CenaBuscaCandidatos.filtroRegional.regiaoGeografica ~= " - " and CenaBuscaCandidatos.filtroRegional.regiaoGeograficaAlterado)then
          CenaBuscaCandidatos.listaRegional:buscarEstatisticas(CenaBuscaCandidatos.filtroRegional)
        end

        if(CenaBuscaCandidatos.filtroEstadual.estado ~= " - " and CenaBuscaCandidatos.filtroEstadual.estadoAlterado)then
          CenaBuscaCandidatos.listaEstadual:buscarEstatisticas(CenaBuscaCandidatos.filtroEstadual)
        end

        if(CenaBuscaCandidatos.filtroMunicipal.cidade ~= " - " and CenaBuscaCandidatos.filtroMunicipal.cidadeAlterado)then
          CenaBuscaCandidatos.listaMunicipal:buscarEstatisticas(CenaBuscaCandidatos.filtroMunicipal)
        end


        --[[código adicionado]]--
        CenaBuscaCandidatos.listaNacionalMelhores:buscarMelhoresEscolas(CenaBuscaCandidatos.filtroNacionalMelhores)

        if(CenaBuscaCandidatos.filtroRegionalMelhores.regiaoGeografica ~= " - " and CenaBuscaCandidatos.filtroRegionalMelhores.regiaoGeograficaAlterado)then
          CenaBuscaCandidatos.listaRegionalMelhores:buscarMelhoresEscolas(CenaBuscaCandidatos.filtroRegionalMelhores)
        end

        if(CenaBuscaCandidatos.filtroEstadualMelhores.estado ~= " - " and CenaBuscaCandidatos.filtroEstadualMelhores.estadoAlterado)then
          CenaBuscaCandidatos.listaEstadualMelhores:buscarMelhoresEscolas(CenaBuscaCandidatos.filtroEstadualMelhores)
        end



        --*****************************************************************************************************************

        CenaBuscaCandidatos.isCarregandoPesquisaVisualizarEscolaComparar = false;

        FrameVisualizarEscolaComparar:inicialize();
        Display.show();
      end
  )

  coroutine.resume(APP)
end

--Faz a comparação de dados estatísticos da escola selecionada em nível municipal, estadual, regional e nacional
function CenaBuscaCandidatos:getItensResultadoDetalhesComparar(itens)


  if(CenaBuscaCandidatos.listaNacional.estatisticas[1] ~=nil)then

    local estatisticasEscola = CenaBuscaCandidatos.candidatoSelecionado:toEstatistica();

    for i,v in pairs(CenaBuscaCandidatos.colunas) do
      local estatistica = v.titulo;
      local escola = " - ";
      local nacional = CenaBuscaCandidatos:getEstatistica(CenaBuscaCandidatos.listaNacional.estatisticas[1][v.indice], v.isPercentual);
      local regional = " - ";
      local estadual = " - ";
      local municipal = " - ";

      if(estatisticasEscola[v.indice] ~= nil)then
        escola = estatisticasEscola[v.indice];
      end

      if(CenaBuscaCandidatos.listaRegional.estatisticas[1] ~= nil)then
        regional = CenaBuscaCandidatos:getEstatistica(CenaBuscaCandidatos.listaRegional.estatisticas[1][v.indice], v.isPercentual);
      end

      if(CenaBuscaCandidatos.listaEstadual.estatisticas[1] ~= nil)then
        estadual = CenaBuscaCandidatos:getEstatistica(CenaBuscaCandidatos.listaEstadual.estatisticas[1][v.indice], v.isPercentual);
      end

      if(CenaBuscaCandidatos.listaMunicipal.estatisticas[1] ~= nil)then
        municipal = CenaBuscaCandidatos:getEstatistica(CenaBuscaCandidatos.listaMunicipal.estatisticas[1][v.indice], v.isPercentual);
      end


      local line = TConteiner.new();
      line:setLargura(1270);
      line:setAltura(40);

      local sizeFields = 150;
      local sizeEstatistica = 420;

      local fieldEstatistica = createField(estatistica,5,5,sizeEstatistica,CenaBuscaCandidatos.font_data,CenaBuscaCandidatos.cor_line,false);
      line:addComponent(fieldEstatistica);

      local fieldEscola = createField(escola,fieldEstatistica:getPx() + fieldEstatistica:getLargura() + 10,5,sizeFields,CenaBuscaCandidatos.font_data,CenaBuscaCandidatos.cor_line,true);
      line:addComponent(fieldEscola);

      local fieldNacional = createField(nacional,fieldEscola:getPx() + fieldEscola:getLargura() + 10,5,sizeFields,CenaBuscaCandidatos.font_data,CenaBuscaCandidatos.cor_line,true);
      line:addComponent(fieldNacional);

      local fieldRegional = createField(regional,fieldNacional:getPx() + fieldNacional:getLargura() + 10,5,sizeFields,CenaBuscaCandidatos.font_data,CenaBuscaCandidatos.cor_line,true);
      line:addComponent(fieldRegional);

      local fieldEstadual = createField(estadual,fieldRegional:getPx() + fieldRegional:getLargura() + 10,5,sizeFields,CenaBuscaCandidatos.font_data,CenaBuscaCandidatos.cor_line,true);
      line:addComponent(fieldEstadual);

      local fieldMunicipal = createField(municipal,fieldEstadual:getPx() + fieldEstadual:getLargura() + 10,5,sizeFields,CenaBuscaCandidatos.font_data,CenaBuscaCandidatos.cor_line,true);
      line:addComponent(fieldMunicipal);

      table.insert(itens,line);
    end
  end
end

--Faz a comparação dos dados estatísticos da escola selecionada com as melhores e piores escolas em nível estadual, regional e nacional
function CenaBuscaCandidatos:getItensResultadoDetalhesCompararMelhoresPiores(itens)


  if(CenaBuscaCandidatos.listaNacionalMelhores.melhoresEscolas[1] ~=nil)then

    local estatisticasEscola = CenaBuscaCandidatos.candidatoSelecionado:toEstatistica();
    for i,v in pairs(CenaBuscaCandidatos.colunas) do
      local estatistica = v.titulo;
      local escola = " - ";
      local nacional = CenaBuscaCandidatos:getEstatistica(CenaBuscaCandidatos.listaNacionalMelhores.melhoresEscolas[1][v.indice], v.isPercentual);
      local regional = " - ";
      local estadual = " - ";
      local municipal = " - ";

      if(estatisticasEscola[v.indice] ~= nil)then
        escola = estatisticasEscola[v.indice];
      end

      if(CenaBuscaCandidatos.listaRegionalMelhores.melhoresEscolas[1] ~= nil)then
        regional = CenaBuscaCandidatos:getEstatistica(CenaBuscaCandidatos.listaRegionalMelhores.melhoresEscolas[1][v.indice], v.isPercentual);
      end

      if(CenaBuscaCandidatos.listaEstadualMelhores.melhoresEscolas[1] ~= nil)then
        estadual = CenaBuscaCandidatos:getEstatistica(CenaBuscaCandidatos.listaEstadualMelhores.melhoresEscolas[1][v.indice], v.isPercentual);
      end


      local line = TConteiner.new();
      line:setLargura(1270);
      line:setAltura(40);

      local sizeFields = 184;--85;
      local sizeEstatistica = 450;--350;

      local fieldEstatistica = createField(estatistica,5,5,sizeEstatistica,CenaBuscaCandidatos.font_data,CenaBuscaCandidatos.cor_line,false);
      line:addComponent(fieldEstatistica);

      local fieldEscola = createField(escola,fieldEstatistica:getPx() + fieldEstatistica:getLargura() + 10,5,sizeFields + 5,CenaBuscaCandidatos.font_data,CenaBuscaCandidatos.cor_line,true);
      line:addComponent(fieldEscola);

      local fieldNacionalMelhores = createField(nacional,fieldEscola:getPx() + fieldEscola:getLargura() + 10,5,sizeFields,CenaBuscaCandidatos.font_data,CenaBuscaCandidatos.cor_line,true);
      line:addComponent(fieldNacionalMelhores);



      local fieldRegionalMelhores = createField(regional,fieldNacionalMelhores:getPx() + fieldNacionalMelhores:getLargura() + 10,5,sizeFields,CenaBuscaCandidatos.font_data,CenaBuscaCandidatos.cor_line,true);
      line:addComponent(fieldRegionalMelhores);



      local fieldEstadualMelhroes = createField(estadual,fieldRegionalMelhores:getPx() + fieldRegionalMelhores:getLargura() + 10,5,sizeFields,CenaBuscaCandidatos.font_data,CenaBuscaCandidatos.cor_line,true);
      line:addComponent(fieldEstadualMelhroes);




      table.insert(itens,line);
    end
  end






end

--Formata o dado estatístico em duas casas decimais após a vírgula
function CenaBuscaCandidatos:getEstatistica(estatistica, isPercentual)
  if(estatistica ~= nil and isPercentual)then
    estatistica = string.format("%.2f",tonumber(estatistica) * 100) .. "%";
  elseif(estatistica ~= nil)then
    estatistica = string.format("%.2f",tonumber(estatistica));
  end
  return estatistica;
end



