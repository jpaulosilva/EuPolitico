BibliotecaAuxiliarScript.execute('framework.src.util.app.Scene');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FrameConsultarPolitico');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FrameConsultarPoliticoAvancado');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FrameVisualizarPolitico');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FramePesquisasResultados');
BibliotecaAuxiliarScript.execute('data.Localizacoes');
BibliotecaAuxiliarScript.execute('data.ListaDeputados');
BibliotecaAuxiliarScript.execute('data.Politico');
BibliotecaAuxiliarScript.execute('data.FiltroPolitico');
BibliotecaAuxiliarScript.execute('utils.Utils');


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
CenaBusca.indicePoliticoMenu = 1;
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


function CenaBusca:inicialize()

  CenaBusca:addFrame(FrameConsultarPolitico,FrameConsultarPolitico.id);
  CenaBusca:addFrame(FrameConsultarPoliticoAvancado,FrameConsultarPoliticoAvancado.id);
  CenaBusca:addFrame(FrameVisualizarPolitico,FrameVisualizarPolitico.id);
  CenaBusca:addFrame(FramePesquisasResultados,FramePesquisasResultados.id);


  FrameConsultarPolitico:inicialize();
  FrameConsultarPoliticoAvancado:inicialize();
  FrameVisualizarPolitico:inicialize();
  FramePesquisasResultados:inicialize();

  CenaBusca.resultado = CenaBusca.lista:getDeputados();


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
          print("Criou corrotina!!!!!!!");
          local f_callback = function(politicoModificado)
            CenaBusca.politicoSelecionado = politicoModificado;
            FrameVisualizarPolitico:inicialize();
            CenaBusca.isCarregandoDetalhes = false;
            print("F_CALLBACK CHAMADA");
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



--Função filtro para pesquisar políticos
function CenaBusca:pesquisarPoliticos(frame)

  CenaBusca.isCarregandoPesquisa = true;

  CenaBusca.isNenhumResultado = false;

  frame:inicialize();
  local APP = coroutine.create (

      function ()


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
  CenaBusca.indiceCargo = 1;
  CenaBusca.indicePartido = 1;

  CenaBusca.resultado = {};
  CenaBusca.politicoSelecionado = nil;
  CenaBusca.indicePoliticoMenu = 1;
end

--Constrói o painel no qual os dados são inseridos para busca de políticos
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
  fieldNome:setCorFoco(Cor.new({r=0,g=255,b=0,alpha=240}));

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
  panel:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));


  return panel;
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


