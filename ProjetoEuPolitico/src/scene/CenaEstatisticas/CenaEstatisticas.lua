BibliotecaAuxiliarScript.execute('framework.src.util.app.Scene');
BibliotecaAuxiliarScript.execute('scene.CenaEstatisticas.frames.FrameEstatisticas');
BibliotecaAuxiliarScript.execute('framework.src.gui.TIcon');
BibliotecaAuxiliarScript.execute('framework.src.gui.TImage');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('data.Localizacoes');
--BibliotecaAuxiliarScript.execute('data.ListaEstatisticas');
--BibliotecaAuxiliarScript.execute('data.Estatistica');
--BibliotecaAuxiliarScript.execute('data.FiltroEstatisticasRegiao');
BibliotecaAuxiliarScript.execute('utils.Utils');


--BibliotecaAuxiliarScript.execute('data.ListaMelhoresEscolas');
--BibliotecaAuxiliarScript.execute('data.MelhoresEscolas');       --[[código adicionado]]--
--BibliotecaAuxiliarScript.execute('data.FiltroMelhoresEscolas');


CenaEstatisticas = Scene.new();
CenaEstatisticas.id = 'CenaEstatisticas';
CenaEstatisticas.cor = Cor.new({r=255,g=255,b=255,alpha=0});
CenaEstatisticas.font_label = Fonte.new({nome='tiresias', tamanho=20, is_negrito = true,cor = Cor.new({r=255,g=255,b=255})});
CenaEstatisticas.font_header= Fonte.new({nome='tiresias', tamanho=20, is_negrito = true,cor = Cor.new({r=255,g=255,b=0})});
CenaEstatisticas.font_data= Fonte.new({nome='tiresias', tamanho=20,is_negrito = false,cor = Cor.new({r=255,g=255,b=255})});
CenaEstatisticas.cor_header = Cor.new({r=0,g=255,b=0,alpha=120});
CenaEstatisticas.cor_line = Cor.new({r=0,g=255,b=0,alpha=30});

CenaEstatisticas.regiaoSelecionada = " - ";
CenaEstatisticas.estadoSelecionado = " - ";
CenaEstatisticas.cidadeSelecionada = " - ";
CenaEstatisticas.indiceRegiao = 1;
CenaEstatisticas.indiceEstado = 1;
CenaEstatisticas.indiceCidade = 1;
CenaEstatisticas.indiceMenu = 1;
--CenaEstatisticas.filtroNacional = FiltroEstatisticasRegiao:new();
--CenaEstatisticas.filtroRegional = FiltroEstatisticasRegiao:new();
--CenaEstatisticas.filtroEstadual = FiltroEstatisticasRegiao:new();
--CenaEstatisticas.filtroMunicipal = FiltroEstatisticasRegiao:new();
--CenaEstatisticas.listaNacional = ListaEstatisticas:new();
--CenaEstatisticas.listaRegional = ListaEstatisticas:new();
--CenaEstatisticas.listaEstadual = ListaEstatisticas:new();
--CenaEstatisticas.listaMunicipal = ListaEstatisticas:new();
--
--
--CenaEstatisticas.filtroNacionalMelhores = FiltroMelhoresEscolas:new();
--CenaEstatisticas.filtroRegionalMelhores = FiltroMelhoresEscolas:new();
--CenaEstatisticas.filtroEstadualMelhores = FiltroMelhoresEscolas:new();  --[[código adicionado]]--
--CenaEstatisticas.listaNacionalMelhores = ListaMelhoresEscolas:new();
--CenaEstatisticas.listaRegionalMelhores = ListaMelhoresEscolas:new();
--CenaEstatisticas.listaEstadualMelhores = ListaMelhoresEscolas:new();

CenaEstatisticas.painelConsulta = nil;
CenaEstatisticas.painelResultados = nil;
CenaEstatisticas.panelFoco = "painelConsulta";


function CenaEstatisticas:inicialize()

  CenaEstatisticas:addFrame(FrameEstatisticas,FrameEstatisticas.id);
  FrameEstatisticas:inicialize();

--  CenaEstatisticas.filtroNacional:setTipoLocal("NAC");
--  CenaEstatisticas.filtroRegional:setTipoLocal("REG");
--  CenaEstatisticas.filtroEstadual:setTipoLocal("EST");
--  CenaEstatisticas.filtroMunicipal:setTipoLocal("MUN");
--  
--  
--  CenaEstatisticas.filtroNacionalMelhores:setTipoLocal("NAC");
--  CenaEstatisticas.filtroRegionalMelhores:setTipoLocal("REG");  --[[código adicionado]]--
--  CenaEstatisticas.filtroEstadualMelhores:setTipoLocal("EST");
  

--  CenaEstatisticas.colunas = {
--    {indice="enem", titulo = "Enem", isPercentual=false},
--    {indice="idebAnosIniciais", titulo = "IDEB A.I.", isPercentual=false},
--    {indice="idebAnosFinais", titulo = "IDEB A.F.", isPercentual=false},
--    {indice="regulamentadaSim", titulo = "Regulamentada(Sim)", isPercentual=true},
--    {indice="regulamentadaNao", titulo = "Regulamentada(Não)", isPercentual=true},
--    {indice="regulamentadaTramitacao", titulo = "Regulamentada(Tramitação)", isPercentual=true},
--    {indice="dependenciaAdministrativaFederal", titulo = "Dependência Adm.(Federal)", isPercentual=true},
--    {indice="dependenciaAdministrativaEstadual", titulo = "Dependência Adm.(Estadual)", isPercentual=true},
--    {indice="dependenciaAdministrativaMunicipal", titulo = "Dependência Adm.(Municipal)", isPercentual=true},
--    {indice="dependenciaAdministrativaPrivada", titulo = "Dependência Adm.(Privada)", isPercentual=true},
--    {indice="situacaoFuncionamentoAtividade", titulo = "Situação Func.(Em Atividade)", isPercentual=true},
--    {indice="situacaoFuncionamentoParalisada", titulo = "Situação Func.(Paralisada)", isPercentual=true},
--    {indice="situacaoFuncionamentoExtinta", titulo = "Situação Func.(Extinta)", isPercentual=true},
--    {indice="situacaoFuncionamentoExtintaAnoAnterior", titulo = "Situação Func.(Ext. Ano Ant.)", isPercentual=true},
--    {indice="situacaoFuncionamentoAtividadeNaoInformado", titulo = "Situação Func.(Não Informado)", isPercentual=true},
--    {indice="tipoLocalizacaoUrbana", titulo = "Tipo Loc. (Urbana)", isPercentual=true},
--    {indice="tipoLocalizacaoRural", titulo = "Tipo Loc. (Rural)", isPercentual=true},
--    {indice="aguaFiltrada", titulo = "Água(Filtrada)", isPercentual=true},
--    {indice="aguaPublica", titulo = "Água(Pública)", isPercentual=true},
--    {indice="aguaPocoArtesiano", titulo = "Água(Poço Artesiano)", isPercentual=true},
--    {indice="aguaCacimba", titulo = "Água(Cacimba)", isPercentual=true},
--    {indice="aguaRio", titulo = "Água(Rio)", isPercentual=true},
--    {indice="aguaInexistente", titulo = "Água(Inexistente)", isPercentual=true},
--    {indice="energiaPublica", titulo = "Energia(Pública)", isPercentual=true},
--    {indice="energiaGerador", titulo = "Energia(Gerador)", isPercentual=true},
--    {indice="energiaOutros", titulo = "Energia(Outros)", isPercentual=true},
--    {indice="energiaInexistente", titulo = "Energia(Inexistente)", isPercentual=true},
--    {indice="esgotoPublico", titulo = "Esgoto(Público)", isPercentual=true},
--    {indice="esgotoFossa", titulo = "Esgoto(Fossa)", isPercentual=true},
--    {indice="esgotoInexistente", titulo = "Esgoto(Inexistente)", isPercentual=true},
--    {indice="lixoColetaPeriodica", titulo = "Lixo(Coleta Periódica)", isPercentual=true},
--    {indice="lixoQueima", titulo = "Lixo(Queima)", isPercentual=true},
--    {indice="lixoJogaOutraArea", titulo = "Lixo(Joga em Outra Área)", isPercentual=true},
--    {indice="lixoRecicla", titulo = "Lixo(Recicla)", isPercentual=true},
--    {indice="lixoEnterra", titulo = "Lixo(Enterra)", isPercentual=true},
--    {indice="lixoOutros", titulo = "Lixo(Outros)", isPercentual=true},
--    {indice="laboratorioInformatica", titulo = "Laboratorio de Informática", isPercentual=true},
--    {indice="laboratorioCiencias", titulo = "Laboratorio de Ciências", isPercentual=true},
--    {indice="biblioteca", titulo = "Biblioteca", isPercentual=true},
--    {indice="auditorio", titulo = "Auditório", isPercentual=true},
--    {indice="refeitorio", titulo = "Refeitório", isPercentual=true},
--    {indice="patioCoberto", titulo = "Pátio Coberto", isPercentual=true},
--    {indice="patioDescoberto", titulo = "Pátio Descoberto", isPercentual=true},
--    {indice="parqueInfantil", titulo = "Parque Infantil", isPercentual=true},
--    {indice="bercario", titulo = "Berçario", isPercentual=true},
--    {indice="quadraCoberta", titulo = "Quadra Coberta", isPercentual=true},
--    {indice="quadraDescoberta", titulo = "Quadra Descoberta", isPercentual=true},
--    {indice="areaVerde", titulo = "Área Verde", isPercentual=true},
--    {indice="dependenciasPNE", titulo = "Dependências PNE", isPercentual=true},
--    {indice="ensinoEspecial", titulo = "Ensino Especial", isPercentual=true},
--    {indice="sanitarioDentroPredio", titulo = "Sanitário (Dentro do Prédio)", isPercentual=true},
--    {indice="sanitarioForaPredio", titulo = "Sanitário (Fora do Prédio)", isPercentual=true},
--    {indice="sanitarioEducInfant", titulo = "Sanitário (Educação Infantil)", isPercentual=true},
--    {indice="sanitarioPNE", titulo = "Sanitário (PNE)", isPercentual=true},
--    {indice="banheiroChuveiro", titulo = "Banheiro com Chuveiro", isPercentual=true},
--    {indice="almoxarifado", titulo = "Almoxarifado", isPercentual=true},
--    {indice="alojamentoAluno", titulo = "Alojamento Alunos", isPercentual=true},
--    {indice="alojamentoProfessor", titulo = "Alojamento Professores", isPercentual=true},
--    {indice="salaDiretoria", titulo = "Sala Diretoria", isPercentual=true},
--    {indice="salaLeitura", titulo = "Sala Leitura", isPercentual=true},
--    {indice="salaProfessores", titulo = "Sala Professores", isPercentual=true},
--    {indice="secretaria", titulo = "Secretaria", isPercentual=true},
--    {indice="despensa", titulo = "Despensa", isPercentual=true},
--    {indice="cozinha", titulo = "Cozinha", isPercentual=true},
--    {indice="lavanderia", titulo = "Lavanderia", isPercentual=true},
--    {indice="atendimentoEspecial", titulo = "Atendimento Especial", isPercentual=true}
--  };
--



end

--Seleciona a região
function CenaEstatisticas:getDadosRegioes()
  local retorno = {};
  table.insert(retorno," - ");

  for i,v in pairs(Localizacoes.nomesRegioes) do
    table.insert(retorno,v);
  end

  return retorno;
end


--Seleciona os Estados
function CenaEstatisticas:getDadosEstados()
  local retorno = {};
  table.insert(retorno," - ");

  if(CenaEstatisticas.regiaoSelecionada ~= nil and CenaEstatisticas.regiaoSelecionada ~= " - ")then
    for i,v in pairs(Localizacoes.regioes[CenaEstatisticas.regiaoSelecionada].nomesEstados) do
      table.insert(retorno,v);
    end
  end

  return retorno;
end

--Seleciona as cidades
function CenaEstatisticas:getDadosCidades()
  local retorno = {};
  table.insert(retorno," - ");

  if(CenaEstatisticas.estadoSelecionado ~= nil and CenaEstatisticas.estadoSelecionado ~= " - ")then
    local estado = Localizacoes.regioes[CenaEstatisticas.regiaoSelecionada]:getEstados()[CenaEstatisticas.estadoSelecionado];
    Localizacoes:carregaCidades(estado);
    for i,v in pairs(estado.nomesCidades) do
      table.insert(retorno,v);
    end
  end

  return retorno;
end


--Função para pesquisar estatísticas
--function CenaEstatisticas:pesquisar()
--
--  CenaEstatisticas.isCarregandoPesquisa = true;
--  FrameEstatisticas:inicialize();
--  local APP = coroutine.create (
--
--      function ()
--
--        CenaEstatisticas.listaNacional:buscarEstatisticas(CenaEstatisticas.filtroNacional)
--
--        if(CenaEstatisticas.filtroRegional.regiaoGeografica ~= " - " and CenaEstatisticas.filtroRegional.regiaoGeograficaAlterado)then
--          CenaEstatisticas.listaRegional:buscarEstatisticas(CenaEstatisticas.filtroRegional)
--        end
--
--        if(CenaEstatisticas.filtroEstadual.estado ~= " - " and CenaEstatisticas.filtroEstadual.estadoAlterado)then
--          CenaEstatisticas.listaEstadual:buscarEstatisticas(CenaEstatisticas.filtroEstadual)
--        end
--
--        if(CenaEstatisticas.filtroMunicipal.cidade ~= " - " and CenaEstatisticas.filtroMunicipal.cidadeAlterado)then
--          CenaEstatisticas.listaMunicipal:buscarEstatisticas(CenaEstatisticas.filtroMunicipal)
--        end
--        
--        
--        
--           --[[código adicionado]]--
--        CenaEstatisticas.listaNacionalMelhores:buscarMelhoresEscolas(CenaEstatisticas.filtroNacionalMelhores)
-- 
--        if(CenaEstatisticas.filtroRegionalMelhores.regiaoGeografica ~= " - " and CenaEstatisticas.filtroRegionalMelhores.regiaoGeograficaAlterado)then
--          CenaEstatisticas.listaRegionalMelhores:buscarMelhoresEscolas(CenaEstatisticas.filtroRegionalMelhores)
--        end
--
--        if(CenaEstatisticas.filtroEstadualMelhores.estado ~= " - " and CenaEstatisticas.filtroEstadualMelhores.estadoAlterado)then
--          CenaEstatisticas.listaEstadualMelhores:buscarMelhoresEscolas(CenaEstatisticas.filtroEstadualMelhores)
--        end
--
--        
--        
--        --*****************************************************************************************************************
--
--
--        CenaEstatisticas.isCarregandoPesquisa = false;
--
--        CenaEstatisticas.panelFoco = "painelResultados";
--
--        FrameEstatisticas:inicialize();
--        Display.show();
--      end
--  )
--
--  coroutine.resume(APP)
--end

--Coloca os resultados da busca na tabela de resultados
--function CenaEstatisticas:getItensResultado(itens)
--
--  if(CenaEstatisticas.listaNacional.estatisticas[1] ~=nil)then
--    for i,v in pairs(CenaEstatisticas.colunas) do
--      local estatistica = v.titulo;
--      local nacional = CenaEstatisticas:getEstatistica(CenaEstatisticas.listaNacional.estatisticas[1][v.indice], v.isPercentual);
--      local regional = " - ";
--      local estadual = " - ";
--      local municipal = " - ";
--
--      if(CenaEstatisticas.listaRegional.estatisticas[1] ~= nil)then
--        regional = CenaEstatisticas:getEstatistica(CenaEstatisticas.listaRegional.estatisticas[1][v.indice], v.isPercentual);
--      end
--
--      if(CenaEstatisticas.listaEstadual.estatisticas[1] ~= nil)then
--        estadual = CenaEstatisticas:getEstatistica(CenaEstatisticas.listaEstadual.estatisticas[1][v.indice], v.isPercentual);
--      end
--
--      if(CenaEstatisticas.listaMunicipal.estatisticas[1] ~= nil)then
--        municipal = CenaEstatisticas:getEstatistica(CenaEstatisticas.listaMunicipal.estatisticas[1][v.indice], v.isPercentual);
--      end
--
--      local line = TConteiner.new();
--      line:setLargura(1270);
--      line:setAltura(40);
--
--      local sizeFields = 160;
--      local sizeEstatistica = 520;
--
--      local fieldEstatistica = createField(estatistica,5,5,sizeEstatistica,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,false);
--      line:addComponent(fieldEstatistica);
--
--      local fieldNacional = createField(nacional,fieldEstatistica:getPx() + fieldEstatistica:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,true);
--      line:addComponent(fieldNacional);
--
--      local fieldRegional = createField(regional,fieldNacional:getPx() + fieldNacional:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,true);
--      line:addComponent(fieldRegional);
--
--      local fieldEstadual = createField(estadual,fieldRegional:getPx() + fieldRegional:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,true);
--      line:addComponent(fieldEstadual);
--
--      local fieldMunicipal = createField(municipal,fieldEstadual:getPx() + fieldEstadual:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,true);
--      line:addComponent(fieldMunicipal);
--
--      table.insert(itens,line);
--    end
--  end
--end

--function CenaEstatisticas:getItensResultadoMelhoresPiores(itens)


--if(CenaEstatisticas.listaNacionalMelhores.melhoresEscolas[1] ~=nil)then
--    for i,v in pairs(CenaEstatisticas.colunas) do
--      local estatistica = v.titulo;
--      local nacional = CenaEstatisticas:getEstatistica(CenaEstatisticas.listaNacionalMelhores.melhoresEscolas[1][v.indice], v.isPercentual);
--      local regional = " - ";
--      local estadual = " - ";
--      local municipal = " - ";
--
--      if(CenaEstatisticas.listaRegionalMelhores.melhoresEscolas[1] ~= nil)then
--        regional = CenaEstatisticas:getEstatistica(CenaEstatisticas.listaRegionalMelhores.melhoresEscolas[1][v.indice], v.isPercentual);
--      end
--
--      if(CenaEstatisticas.listaEstadualMelhores.melhoresEscolas[1] ~= nil)then
--        estadual = CenaEstatisticas:getEstatistica(CenaEstatisticas.listaEstadualMelhores.melhoresEscolas[1][v.indice], v.isPercentual);
--      end
--
----      if(CenaEstatisticas.listaMunicipal.estatisticas[1] ~= nil)then
----        municipal = CenaEstatisticas:getEstatistica(CenaEstatisticas.listaMunicipal.estatisticas[1][v.indice], v.isPercentual);
----      end
--
--      local line = TConteiner.new();
--      line:setLargura(1270);
--      line:setAltura(40);
--
--      local sizeFields = 204;--95;
--      local sizeEstatistica = 520;--350;
--
--      local fieldEstatistica = createField(estatistica,5,5,sizeEstatistica,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,false);
--      line:addComponent(fieldEstatistica);
--
--      local fieldNacionalMelhores = createField(nacional,fieldEstatistica:getPx() + fieldEstatistica:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,true);
--      line:addComponent(fieldNacionalMelhores);
--
----      local fieldNacionalPiores = createField(" - ",fieldNacionalMelhores:getPx() + fieldNacionalMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,true);
----      line:addComponent(fieldNacionalPiores);
--
--      local fieldRegionalMelhores = createField(regional,fieldNacionalMelhores:getPx() + fieldNacionalMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,true);
--      line:addComponent(fieldRegionalMelhores);
--
----      local fieldRegionalPiores = createField(" - ",fieldRegionalMelhores:getPx() + fieldRegionalMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,true);
----      line:addComponent(fieldRegionalPiores);
--
--      local fieldEstadualMelhores = createField(estadual,fieldRegionalMelhores:getPx() + fieldRegionalMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,true);
--      line:addComponent(fieldEstadualMelhores);
--
----      local fieldEstadualPiores = createField(" - ",fieldEstadualMelhores:getPx() + fieldEstadualMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,true);
----      line:addComponent(fieldEstadualPiores);
--
----      local fieldMunicipalMelhores = createField(" - ",fieldEstadualMelhores:getPx() + fieldEstadualMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,true);
----      line:addComponent(fieldMunicipalMelhores);
----
----      local fieldMunicipalPiores = createField(municipal,fieldMunicipalMelhores:getPx() + fieldMunicipalMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_data,CenaEstatisticas.cor_line,true);
----      line:addComponent(fieldMunicipalPiores);
--
--
--      table.insert(itens,line);
--    end
--  end
--
--
--end

function CenaEstatisticas:getEstatistica(estatistica, isPercentual)
  if(estatistica ~= nil and isPercentual)then
    estatistica = string.format("%.2f",tonumber(estatistica) * 100) .. "%";
  elseif(estatistica ~= nil)then
    estatistica = string.format("%.2f",tonumber(estatistica));
  end
  return estatistica;
end

function CenaEstatisticas:buildPainelConsulta ()
  -- Incluir componentes gráficos
  local panel= TPanel.new();
  panel:setLargura(950);
  panel:setAltura(170);
  panel:setPx(320);
  panel:setPy(5);
  panel:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));--{r=200,g=255,b=255,alpha=255}));

  local itens = {};
  --Choicer Regiao
  local labelChoicerRegiao = TLabel.new();
  labelChoicerRegiao.indice = indiceComponente;
  labelChoicerRegiao:setTexto("Regiao:");
  labelChoicerRegiao:setFonte(CenaEstatisticas.font_label);
  labelChoicerRegiao:update();

  local tchoicerRegiao = TChoicer.new();
  tchoicerRegiao.indice = indiceComponente;
  tchoicerRegiao:setFonte(CenaEstatisticas.font_data);
  tchoicerRegiao:addAllItens(CenaEstatisticas:getDadosRegioes());
  tchoicerRegiao:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerRegiao:setOpcaoSelecionada(CenaEstatisticas.indiceRegiao)
  tchoicerRegiao:setInicioJanela(CenaEstatisticas.indiceRegiao)
  tchoicerRegiao:setIsFoco(true);
  tchoicerRegiao:update();
  CenaEstatisticas.regiaoSelecionada = tchoicerRegiao:getItens()[tchoicerRegiao:getOpcaoSelecionada(CenaEstatisticas.indiceRegiao)]:getTexto();
--  CenaEstatisticas.filtroRegional:setRegiaoGeografica(CenaEstatisticas.regiaoSelecionada);
  
--  CenaEstatisticas.filtroRegionalMelhores:setRegiaoGeografica(CenaEstatisticas.regiaoSelecionada); --[[código adicionado]]--

  local iconeRegiao = TIcon.new();
  iconeRegiao:setTImage(tchoicerRegiao);
  iconeRegiao:setTLabel(labelChoicerRegiao);
  iconeRegiao:setOrientacao(TIcon.TITULO_LEFT);

  iconeRegiao.afterHandler = function (self,evt)
    if(BibliotecaAuxiliarEvento.isEventoControle(evt)) then

      if(BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt)) then
        CenaEstatisticas.indiceRegiao = tchoicerRegiao:getOpcaoSelecionada(CenaEstatisticas.indiceRegiao);
        CenaEstatisticas.indiceMenu = 1;
        CenaEstatisticas.indiceEstado = 1;
        CenaEstatisticas.indiceCidade = 1;
        CenaEstatisticas.regiaoSelecionada = tchoicerRegiao:getItens()[CenaEstatisticas.indiceRegiao]:getTexto();
--        CenaEstatisticas.filtroRegional:setRegiaoGeografica(CenaEstatisticas.regiaoSelecionada);
        
--        CenaEstatisticas.filtroRegionalMelhores:setRegiaoGeografica(CenaEstatisticas.regiaoSelecionada); --[[código adicionado]]--

        FrameEstatisticas:inicialize();
      end
    end
  end

  table.insert(itens,iconeRegiao);

  --Choicer Estado
  local labelChoicerEstado = TLabel.new();
  labelChoicerEstado.indice = indiceComponente;
  labelChoicerEstado:setTexto("Estado:");
  labelChoicerEstado:setFonte(CenaEstatisticas.font_label);
  labelChoicerEstado:update();

  local tchoicerEstado = TChoicer.new();
  tchoicerEstado.indice = indiceComponente;
  tchoicerEstado:setFonte(CenaEstatisticas.font_data);
  tchoicerEstado:addAllItens(CenaEstatisticas:getDadosEstados());
  tchoicerEstado:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerEstado:setOpcaoSelecionada(CenaEstatisticas.indiceEstado)
  tchoicerEstado:setInicioJanela(CenaEstatisticas.indiceEstado)
  tchoicerEstado:setIsFoco(true);
  tchoicerEstado:update();
  CenaEstatisticas.cidadeSelecionado = tchoicerEstado:getItens()[tchoicerEstado:getOpcaoSelecionada(CenaEstatisticas.indiceEstado)]:getTexto();
--  CenaEstatisticas.filtroEstadual:setEstado(CenaEstatisticas.cidadeSelecionado);
--  
--  CenaEstatisticas.filtroEstadualMelhores:setEstado(CenaEstatisticas.cidadeSelecionado); --[[código adicionado]]--

  local iconeEstado = TIcon.new();
  iconeEstado:setTImage(tchoicerEstado);
  iconeEstado:setTLabel(labelChoicerEstado);
  iconeEstado:setOrientacao(TIcon.TITULO_LEFT);

  iconeEstado.afterHandler = function (self,evt)
    if(BibliotecaAuxiliarEvento.isEventoControle(evt)) then

      if(BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt)) then
        CenaEstatisticas.indiceEstado = tchoicerEstado:getOpcaoSelecionada(CenaEstatisticas.indiceEstado);
        CenaEstatisticas.indiceCidade = 1;
        CenaEstatisticas.indiceMenu = 2;
        CenaEstatisticas.estadoSelecionado = tchoicerEstado:getItens()[CenaEstatisticas.indiceEstado]:getTexto();
--        CenaEstatisticas.filtroEstadual:setEstado(CenaEstatisticas.estadoSelecionado);
--        
--        CenaEstatisticas.filtroEstadualMelhores:setEstado(CenaEstatisticas.estadoSelecionado); --[[código adicionado]]--

        FrameEstatisticas:inicialize();
      end
    end
  end

  table.insert(itens,iconeEstado);

  --Choicer Cidade
  local labelChoicerCidade = TLabel.new();
  labelChoicerCidade.indice = indiceComponente;
  labelChoicerCidade:setTexto("Cidade:");
  labelChoicerCidade:setFonte(CenaEstatisticas.font_label);
  labelChoicerCidade:update();

  local tchoicerCidade = TChoicer.new();
  tchoicerCidade.indice = indiceComponente;
  tchoicerCidade:setFonte(CenaEstatisticas.font_data);
  tchoicerCidade:addAllItens(CenaEstatisticas:getDadosCidades());
  tchoicerCidade:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerCidade:setOpcaoSelecionada(CenaEstatisticas.indiceCidade)
  tchoicerCidade:setInicioJanela(CenaEstatisticas.indiceCidade)
  tchoicerCidade:setIsFoco(true);
  tchoicerCidade:update();
  CenaEstatisticas.cidadeSelecionada = tchoicerCidade:getItens()[CenaEstatisticas.indiceCidade]:getTexto();
--  if(CenaEstatisticas.indiceCidade > 1)then
--    CenaEstatisticas.filtroMunicipal:setCidade(Localizacoes.regioes[CenaEstatisticas.regiaoSelecionada]:getEstados()[CenaEstatisticas.cidadeSelecionado]:getCidades()[CenaEstatisticas.cidadeSelecionada]:getCodigo());
--  else
--    CenaEstatisticas.filtroMunicipal.cidadeAlterado = false;
--  end

  local iconeCidade = TIcon.new();
  iconeCidade:setTImage(tchoicerCidade);
  iconeCidade:setTLabel(labelChoicerCidade);
  iconeCidade:setOrientacao(TIcon.TITULO_LEFT);

  iconeCidade.afterHandler = function (self,evt)
    if(BibliotecaAuxiliarEvento.isEventoControle(evt)) then

      if(BibliotecaAuxiliarEvento.isBotaoDireita(evt) or BibliotecaAuxiliarEvento.isBotaoEsquerda(evt)) then
        CenaEstatisticas.indiceCidade = tchoicerCidade:getOpcaoSelecionada(CenaEstatisticas.indiceCidade);
        CenaEstatisticas.indiceMenu = 3;
        CenaEstatisticas.cidadeSelecionada = tchoicerCidade:getItens()[CenaEstatisticas.indiceCidade]:getTexto();
--        CenaEstatisticas.filtroMunicipal:setCidade(CenaEstatisticas.cidadeSelecionada);

        FrameEstatisticas:inicialize();
      end
    end
  end

  table.insert(itens,iconeCidade);

  local menu = TMenu.new();
  menu:addAllItens(itens);
  menu:setOrientacao(TMenu.VERTICAL);
  menu:setOpcaoSelecionada(CenaEstatisticas.indiceMenu);
  menu:setOpcaoSelecionadaJanela(CenaEstatisticas.indiceMenu);
  menu:setTamanhoJanela(3);
  menu:setIsVisibleSetas(false);
  menu:setIsItensCentralizados(false);
  menu:update();

  menu:setPx(5)--(FrameEstatisticas:getLargura() - menu:getLargura())/2);
  menu:setPy(20)--(FrameEstatisticas:getAltura() - menu:getAltura())/2);

  panel:addComponent(menu,1);


  ----------------------------------------

  return panel;
end
function CenaEstatisticas:buildHeader(panelResultados,sizeFields,sizeEstatistica,pxComponent,pyComponent, showEstatistica)


  local line = TConteiner.new();
  line:setLargura(1270);
  line:setAltura(40);
  line:setPx((panelResultados:getLargura() - line:getLargura())/2);
  line:setPy(pyComponent);

  local fieldEstatistica = createField("ESTATÍSTICA",5,5,sizeEstatistica,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
  
  if(showEstatistica)then
    line:addComponent(fieldEstatistica)
  end

  local fieldNacional = createField("NACIONAL",fieldEstatistica:getPx() + fieldEstatistica:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
  line:addComponent(fieldNacional);

  local fieldRegional = createField("REGIONAL",fieldNacional:getPx() + fieldNacional:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
  line:addComponent(fieldRegional);

  local fieldEstadual = createField("ESTADUAL",fieldRegional:getPx() + fieldRegional:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
  line:addComponent(fieldEstadual);

  local fieldMunicipal = createField("MUNICIPAL",fieldEstadual:getPx() + fieldEstadual:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
  line:addComponent(fieldMunicipal);

  pyComponent = pyComponent + line:getAltura() + 2;

  panelResultados:addComponent(line,1);

  return pxComponent,pyComponent;
end


function CenaEstatisticas:buildHeaderMelhores(panelResultados,sizeFields,sizeEstatistica,pxComponent,pyComponent, showEstatistica)

  local line = TConteiner.new();
  line:setLargura(1270);
  line:setAltura(40);
  line:setPx((panelResultados:getLargura() - line:getLargura())/2);
  line:setPy(pyComponent);

  local fieldEstatistica = createField("ESTATÍSTICA",5,5,sizeEstatistica,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
  
  if(showEstatistica)then
    line:addComponent(fieldEstatistica)
  end

  local fieldNacional = createField("NACIONAL",fieldEstatistica:getPx() + fieldEstatistica:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
  line:addComponent(fieldNacional);

  local fieldRegional = createField("REGIONAL",fieldNacional:getPx() + fieldNacional:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
  line:addComponent(fieldRegional);

  local fieldEstadual = createField("ESTADUAL",fieldRegional:getPx() + fieldRegional:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
  line:addComponent(fieldEstadual);

  

  pyComponent = pyComponent + line:getAltura() + 2;

  panelResultados:addComponent(line,1);

  return pxComponent,pyComponent;
end

function CenaEstatisticas:buildHeaderMelhoresPiores(panelResultados,sizeFields,sizeEstatistica,pxComponent,pyComponent)
  local line = TConteiner.new();
  line:setLargura(1270);
  line:setAltura(40);
  line:setPx((panelResultados:getLargura() - line:getLargura())/2);
  line:setPy(pyComponent);

  local fieldEstatistica = createField("ESTATÍSTICA",5,5,sizeEstatistica,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
  line:addComponent(fieldEstatistica);
  
  local fieldNacionalMelhores = createField("MELHORES/ENEM",fieldEstatistica:getPx() + fieldEstatistica:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
  line:addComponent(fieldNacionalMelhores);

--  local fieldNacionalPiores = createField("P",fieldNacionalMelhores:getPx() + fieldNacionalMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
--  line:addComponent(fieldNacionalPiores);

  local fieldRegionalMelhores = createField("MELHORES/ENEM",fieldNacionalMelhores:getPx() + fieldNacionalMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
  line:addComponent(fieldRegionalMelhores);

--  local fieldRegionalPiores = createField("P",fieldRegionalMelhores:getPx() + fieldRegionalMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
--  line:addComponent(fieldRegionalPiores);

  local fieldEstadualMelhores = createField("MELHORES/ENEM",fieldRegionalMelhores:getPx() + fieldRegionalMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
  line:addComponent(fieldEstadualMelhores);

--  local fieldEstadualPiores = createField("P",fieldEstadualMelhores:getPx() + fieldEstadualMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
--  line:addComponent(fieldEstadualPiores);

--  local fieldMunicipalMelhores = createField("Melhores",fieldEstadualMelhores:getPx() + fieldEstadualMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
--  line:addComponent(fieldMunicipalMelhores);
--
--  local fieldMunicipalPiores = createField("P",fieldMunicipalMelhores:getPx() + fieldMunicipalMelhores:getLargura() + 10,5,sizeFields,CenaEstatisticas.font_header,CenaEstatisticas.cor_header,true);
--  line:addComponent(fieldMunicipalPiores);

  pyComponent = pyComponent + line:getAltura() + 2;

  panelResultados:addComponent(line,1);

  return pxComponent,pyComponent;
end

function CenaEstatisticas:buildPainelResultados()
  local panelResultados= TPanel.new();
  panelResultados:setLargura(1270);
  panelResultados:setAltura(470);
  panelResultados:setPx(5);
  panelResultados:setPy(180);
  panelResultados:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));--{r=200,g=255,b=255,alpha=255}));

  local sizeFields = 160;
  local sizeEstatistica = 520;

  local sizeFieldsMelhoresPiores = 204;--95;
  local sizeEstatisticaMelhoresPiores = 520;--350;

  local pxComponent = 5;
  local pyComponent = 5;


  local resultados = {};
  local tamanhoJanela = 10;
  if(FrameEstatisticas.mostrarPioresMelhores)then
    tamanhoJanela = 9;
--    CenaEstatisticas:getItensResultadoMelhoresPiores(resultados);

--    pxComponent,pyComponent = CenaEstatisticas:buildHeader(panelResultados,204,sizeEstatisticaMelhoresPiores,pxComponent,pyComponent,false);
    pxComponent,pyComponent = CenaEstatisticas:buildHeaderMelhores(panelResultados,204,sizeEstatisticaMelhoresPiores,pxComponent,pyComponent,false);
    pxComponent,pyComponent = CenaEstatisticas:buildHeaderMelhoresPiores(panelResultados,sizeFieldsMelhoresPiores,sizeEstatisticaMelhoresPiores,pxComponent,pyComponent);

  else

--    CenaEstatisticas:getItensResultado(resultados);
    pxComponent,pyComponent = CenaEstatisticas:buildHeader(panelResultados,sizeFields,sizeEstatistica,pxComponent,pyComponent,true);

  end

  if(#resultados > 0)then
    local menu = TMenu.new();
    menu:addAllItens(resultados);
    menu:setOrientacao(TMenu.VERTICAL);
    menu:setTamanhoJanela(tamanhoJanela);
    menu:setIsVisibleSetas(false);
    menu:update();
    menu:setPx((panelResultados:getLargura() - menu:getLargura())/2);
    menu:setPy(pyComponent);

    panelResultados:addComponent(menu,2);

  elseif (CenaEstatisticas.isCarregandoPesquisa)then
    local labelCarregando = TLabel.new();
    labelCarregando:setTexto("Carregando...");
    labelCarregando:setFonte(CenaEstatisticas.font_data);
    labelCarregando:update();
    labelCarregando:setPx((panelResultados:getLargura() - labelCarregando:getLargura())/2);
    labelCarregando:setPy((panelResultados:getAltura() - labelCarregando:getAltura())/2);

    panelResultados:addComponent(labelCarregando,11);
  end

  return panelResultados;
end
