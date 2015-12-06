BibliotecaAuxiliarScript.execute('framework.src.util.app.Scene');
BibliotecaAuxiliarScript.execute('scene.CenaBuscaCandidatos.frames.FrameConsultarCandidato');
BibliotecaAuxiliarScript.execute('scene.CenaBuscaCandidatos.frames.FrameConsultarCandidatoAvancado');
BibliotecaAuxiliarScript.execute('scene.CenaBuscaCandidatos.frames.FrameVisualizarCandidato');
BibliotecaAuxiliarScript.execute('data.Localizacoes');
BibliotecaAuxiliarScript.execute('data.ListaCandidatos');
BibliotecaAuxiliarScript.execute('data.Candidato');
BibliotecaAuxiliarScript.execute('data.FiltroCandidato');
BibliotecaAuxiliarScript.execute('utils.Utils');
BibliotecaAuxiliarScript.execute('data.CarregarCandidatos');

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
CenaBuscaCandidatos.indiceCandidatoMenu = 1;
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


function CenaBuscaCandidatos:inicialize()

  CenaBuscaCandidatos:addFrame(FrameConsultarCandidato,FrameConsultarCandidato.id);
  CenaBuscaCandidatos:addFrame(FrameConsultarCandidatoAvancado,FrameConsultarCandidatoAvancado.id);
  CenaBuscaCandidatos:addFrame(FrameVisualizarCandidato,FrameVisualizarCandidato.id);


  FrameConsultarCandidato:inicialize();
  FrameConsultarCandidatoAvancado:inicialize();
  FrameVisualizarCandidato:inicialize();

  CenaBuscaCandidatos.resultado = CenaBuscaCandidatos.lista:getCandidatos();


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
          print("Criou corrotina!!!!!!!");

          local f_callback = function(candidatoModificado)
            CenaBuscaCandidatos.candidatoSelecionado = candidatoModificado;
            FrameVisualizarCandidato:inicialize();
            CenaBuscaCandidatos.isCarregandoDetalhes = false;
            print("F_CALLBACK CHAMADA");

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


--Função filtro para pesquisar candidatos
function CenaBuscaCandidatos:pesquisarCandidatos(frame)

  CenaBuscaCandidatos.isCarregandoPesquisa = true;

  CenaBuscaCandidatos.isNenhumResultado = false;

  frame:inicialize();
  local APP = coroutine.create (

      function ()


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
  CenaBuscaCandidatos.cargoSelecionado = " - ";
  CenaBuscaCandidatos.partidoSelecionado = " - ";
  CenaBuscaCandidatos.indiceRegiao = 1;
  CenaBuscaCandidatos.indiceEstado = 1;
  CenaBuscaCandidatos.indiceCidade = 1;
  CenaBuscaCandidatos.indiceCargo = 1;
  CenaBuscaCandidatos.indicePartido = 1;

  CenaBuscaCandidatos.resultado = {};
  CenaBuscaCandidatos.candidatoSelecionado = nil;
  CenaBuscaCandidatos.indiceCandidatoMenu = 1;
end



--Constrói o painel no qual os dados são inseridos para busca de candidatos
function CenaBuscaCandidatos:buildPainelConsultarCandidato(frame)
  -- Incluir componentes gráficos
  local panel= TPanel.new();
  panel:setLargura(630);
  panel:setAltura(385);
  panel:setPx(645);
  panel:setPy(5);
  panel:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));



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

--Constrói o painel no qual os dados são inseridos para busca avançada de candidatos
function CenaBuscaCandidatos:buildPainelConsultarCandidatoAvancado(frame)
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
function CenaBuscaCandidatos:getEstatistica(estatistica, isPercentual)
  if(estatistica ~= nil and isPercentual)then
    estatistica = string.format("%.2f",tonumber(estatistica) * 100) .. "%";
  elseif(estatistica ~= nil)then
    estatistica = string.format("%.2f",tonumber(estatistica));
  end
  return estatistica;
end


