BibliotecaAuxiliarScript.execute('framework.src.util.app.Scene')
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FramePesquisasResultados');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FrameCandidatos');
BibliotecaAuxiliarScript.execute('scene.CenaBusca.frames.FramePoliticos');
BibliotecaAuxiliarScript.execute('utils.Utils');


CenaBusca = Scene.new();
CenaBusca.id = 'CenaBusca';
CenaBusca.cor = Cor.new({r=255,g=255,b=255,alpha=255});
CenaBusca.font_label = Fonte.new({nome='tiresias', tamanho=20, is_negrito = true,cor = Cor.new({r=0,g=0,b=0})});
CenaBusca.font_data = Fonte.new({nome='tiresias', tamanho=20,is_negrito = true,cor = Cor.new({r=0,g=0,b=0})});
CenaBusca.font_header= Fonte.new({nome='tiresias', tamanho=20, is_negrito = true,cor = Cor.new({r=255,g=255,b=0})});
CenaBusca.cor_header = Cor.new({r=0,g=0,b=0,alpha=255});
CenaBusca.cor_line = Cor.new({r=255,g=255,b=0,alpha=30});

CenaBusca.painelConsultarPolitico = nil;
CenaBusca.painelResultados = nil;

CenaBusca.indiceRegiao = 1;

function CenaBusca:inicialize()

  CenaBusca:addFrame(FramePesquisasResultados,FramePesquisasResultados.id);
  CenaBusca:addFrame(FrameCandidatos,FrameCandidatos.id);
  CenaBusca:addFrame(FramePoliticos,FramePoliticos.id);


  FramePesquisasResultados:inicialize();
  FrameCandidatos:inicialize();
  FramePoliticos:inicialize();

end

--Seleciona a região
function CenaBusca:getDadosRegioes()
  local retorno = {};
  table.insert(retorno," - ");

  regioes = {"Norte", "Nordeste", "Sul", "Sudeste", "Centro-Oeste"};

  for i,v in pairs(regioes) do
    table.insert(retorno,v);
  end

  return retorno;
end

--Seleciona os Estados
function CenaBusca:getDadosEstados()
  local retorno = {};
  table.insert(retorno," - ");

  estados = {"AM", "PE", "PB", "RN", "CE"};

  for i,v in pairs(estados) do
    table.insert(retorno,v);
  end

  return retorno;
end


--Seleciona as cidades
function CenaBusca:getDadosCidades()
  local retorno = {};
  table.insert(retorno," - ");

  cidades = {"Recife", "Natal", "Fortaleza", "Aracaju", "Salvador"};

  for i,v in pairs(cidades) do
    table.insert(retorno,v);
  end

  return retorno;
end


--Seleciona os cargos
function CenaBusca:getDadosCargos()
  local retorno = {};
  table.insert(retorno," - ");

  cargos = {"Deputado", "Senador"};

  for i,v in pairs(cargos) do
    table.insert(retorno,v);
  end

  return retorno;
end

--Seleciona os Partidos
function CenaBusca:getDadosPartido()
  local retorno = {};
  table.insert(retorno," - ");

  partidos = {"PMDB", "PT", "DEM", "PP"};

  for i,v in pairs(partidos) do
    table.insert(retorno,v);
  end

  return retorno;
end


function CenaBusca:buildPainelConsultarPolitico(frame)

  -- Incluir componentes gráficos
  local painel= TPanel.new();
  painel:setLargura(630);
  painel:setAltura(385);
  painel:setPx(645);
  painel:setPy(5);
  painel:setCorFundo(Cor.new({r=200,g=255,b=255,alpha=255}));--{r=200,g=255,b=255,alpha=255}));

  local imageTeclado= TImage.new();
  imageTeclado:setSrcArquivoExterno("../media/teclado.png");
  imageTeclado:setPx(430);
  imageTeclado:setPy(40);
  painel:addComponent(imageTeclado,5);


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
  --fieldNome:setTexto(CenaBusca.filtro:getNome());
  fieldNome:setPx(pxComponent + labelField:getLargura() + 2);
  fieldNome:setPy(pyComponent);
  fieldNome:getTLabelTexto():setLargura(550);
  fieldNome:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=255}));
  fieldNome.indice = indiceComponente;

  painel:addComponent(labelField,labelField.indice);
  painel:addComponent(fieldNome,fieldNome.indice);



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
  --  --tchoicerRegiao:setOpcaoSelecionada(CenaBusca.indiceRegiao)
  --  --tchoicerRegiao:setInicioJanela(CenaBusca.indiceRegiao)
  tchoicerRegiao:setIsFoco(true);
  tchoicerRegiao:setPx(pxComponent);
  tchoicerRegiao:setPy(pyComponent);
  tchoicerRegiao:update();
  --  --CenaBusca.regiaoSelecionada = tchoicerRegiao:getItens()[tchoicerRegiao:getOpcaoSelecionada(CenaBusca.indiceRegiao)]:getTexto();
  --  --CenaBusca.filtro:setRegiao(CenaBusca.regiaoSelecionada);
  --  Filtro
  painel:addComponent(labelChoicerRegiao,labelChoicerRegiao.indice);
  painel:addComponent(tchoicerRegiao,tchoicerRegiao.indice);


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
  --  CenaBusca.estadoSelecionado = tchoicerEstado:getItens()[tchoicerEstado:getOpcaoSelecionada(CenaBusca.indiceEstado)]:getTexto();
  --  CenaBusca.filtro:setEstado(CenaBusca.estadoSelecionado);
  --
  --  CenaBusca.filtroEstadualMelhores:setEstado(CenaBusca.estadoSelecionado); --[[código adicionado]]--

  painel:addComponent(labelChoicerEstado,labelChoicerEstado.indice);
  painel:addComponent(tchoicerEstado,tchoicerEstado.indice);


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
  --  CenaBusca.cidadeSelecionada = tchoicerCidade:getItens()[CenaBusca.indiceCidade]:getTexto();
  --  if(CenaBusca.indiceCidade > 1)then
  --    CenaBusca.filtro:setCidade(Localizacoes.regioes[CenaBusca.regiaoSelecionada]:getEstados()[CenaBusca.estadoSelecionado]:getCidades()[CenaBusca.cidadeSelecionada]:getCodigo());
  --  else
  --    CenaBusca.filtro.cidadeAlterado = false;
  --  end

  painel:addComponent(labelChoicerCidade,labelChoicerCidade.indice);
  painel:addComponent(tchoicerCidade,tchoicerCidade.indice);



  --Choicer Cargo
  local pyComponent = pyComponent + tchoicerCidade:getAltura() + 2;
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
  tchoicerCargo:setIsFoco(true);
  tchoicerCargo:setPx(pxComponent);
  tchoicerCargo:setPy(pyComponent);
  tchoicerCargo:update();
  --  CenaBusca.cidadeSelecionada = tchoicerCidade:getItens()[CenaBusca.indiceCidade]:getTexto();
  --  if(CenaBusca.indiceCidade > 1)then
  --    CenaBusca.filtro:setCidade(Localizacoes.regioes[CenaBusca.regiaoSelecionada]:getEstados()[CenaBusca.estadoSelecionado]:getCidades()[CenaBusca.cidadeSelecionada]:getCodigo());
  --  else
  --    CenaBusca.filtro.cidadeAlterado = false;
  --  end

  painel:addComponent(labelChoicerCargo,labelChoicerCargo.indice);
  painel:addComponent(tchoicerCargo,tchoicerCargo.indice);


  --Choicer Partido
  local pyComponent = pyComponent + tchoicerCargo:getAltura() + 2;
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
  tchoicerPartido:addAllItens(CenaBusca:getDadosPartido());
  tchoicerPartido:setOrientacao(TChoicer.HORIZONTAL);
  tchoicerPartido:setOpcaoSelecionada(CenaBusca.indicePartido)
  tchoicerPartido:setInicioJanela(CenaBusca.indicePartido)
  tchoicerPartido:setIsFoco(true);
  tchoicerPartido:setPx(pxComponent);
  tchoicerPartido:setPy(pyComponent);
  tchoicerPartido:update();
  --  CenaBusca.cidadeSelecionada = tchoicerCidade:getItens()[CenaBusca.indiceCidade]:getTexto();
  --  if(CenaBusca.indiceCidade > 1)then
  --    CenaBusca.filtro:setCidade(Localizacoes.regioes[CenaBusca.regiaoSelecionada]:getEstados()[CenaBusca.estadoSelecionado]:getCidades()[CenaBusca.cidadeSelecionada]:getCodigo());
  --  else
  --    CenaBusca.filtro.cidadeAlterado = false;
  --  end

  painel:addComponent(labelChoicerPartido,labelChoicerPartido.indice);
  painel:addComponent(tchoicerPartido,tchoicerPartido.indice);

  return painel
end


function CenaBusca:buildPainelResultados(frame)

  local painelResultados= TPanel.new();
  painelResultados:setLargura(1270);
  painelResultados:setAltura(255);
  painelResultados:setPx(5);
  painelResultados:setPy(395);
  painelResultados:setCorFundo(Cor.new({r=200,g=255,b=255,alpha=255}));--{r=200,g=255,b=255,alpha=255}));
  painelResultados:setCorFoco({r=0,g=0,b=255,alpha=255});--{r=0,g=255,b=0,alpha=240});

  local font_logo= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_logo.cor = Cor.new({r=153,g=204,b=51,alpha=255});

  local pxComponent = 5;
  local pyComponent = 5;

  local line = TConteiner.new();
  line:setLargura(1270);
  line:setAltura(40);
  line:setPx((painelResultados:getLargura() - line:getLargura())/2);
  line:setPy(pyComponent);
  line:setCorFundo(Cor.new({r=200,g=255,b=255,alpha=255}));

  line:addComponent(createField("PARTIDO",0,5,100,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("CARGO",110,5,110,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("NOME",230,5,400,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("CIDADE",640,5,200,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("UF",850,5,70,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("IDADE",930,5,70,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("SEXO",1010,5,70,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("ESCOLARIDADE",1090,5,170,CenaBusca.font_header,CenaBusca.cor_header,true));

  painelResultados:addComponent(line,1);

  return painelResultados;
end
