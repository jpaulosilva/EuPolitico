-- Imports
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.gui.TMenu');


FrameVisualizarEscolaComparar = TFrame.new();
FrameVisualizarEscolaComparar.id = 'FrameVisualizarEscolaComparar';
FrameVisualizarEscolaComparar.mostrarPioresMelhores = false;
FrameVisualizarEscolaComparar.mostrarPioresMelhoresChanged = false;

--Inicializa a tela de comparação de escolas
function FrameVisualizarEscolaComparar:inicialize()

  -- Alterar propriedades do FrameVisualizarEscolaComparar
  FrameVisualizarEscolaComparar:setLargura(1280); --320
  FrameVisualizarEscolaComparar:setAltura(720);
  FrameVisualizarEscolaComparar:setPx(0);
  FrameVisualizarEscolaComparar:setPy(0);
  FrameVisualizarEscolaComparar:setCorFundo(CenaBusca.cor);

  if(CenaBusca.escolaSelecionada ~= nil)then
    local acaoAzul = "MELHORES";

    if(FrameVisualizarEscolaComparar.mostrarPioresMelhores)then
      acaoAzul = nil;
    end

    FrameVisualizarEscolaComparar:addComponent(buildBackground(),1);
    FrameVisualizarEscolaComparar:addComponent(FrameVisualizarEscolaComparar:buildPainelVisualizarEscolaCompararCabecalho(),2);
    FrameVisualizarEscolaComparar:addComponent(FrameVisualizarEscolaComparar:buildPainelVisualizarEscolaCompararDetalhes(),3);
    FrameVisualizarEscolaComparar:addComponent(buildPainelLegendas("NAVEGAÇÃO",nil,nil,"MENU",nil,"VOLTAR",acaoAzul),4);
    FrameVisualizarEscolaComparar:addComponent(buildPainelTV1_4(),5);
  end

end

--[[Contrói o painel na tela de comparação de dados estatístcos, onde é mostrado o nome da escola selecionada
juntamente com a respectiva região, estado e cidade a qual ela pertence]]--
function FrameVisualizarEscolaComparar:buildPainelVisualizarEscolaCompararCabecalho()
  local panel= TPanel.new();
  panel:setLargura(950);
  panel:setAltura(170);
  panel:setPx(320);
  panel:setPy(5);
  panel:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));--{r=200,g=255,b=255,alpha=255}));

  local dados = {
    {label="Região:", field=CenaBusca.escolaSelecionada:getRegiao()},
    {label="Estado:", field=CenaBusca.escolaSelecionada:getEstado()},
    {label="Cidade:", field=CenaBusca.escolaSelecionada:getCidade()},
    {label="Escola:", field=CenaBusca.escolaSelecionada:getNome()},
  };

  local itensMenu = {};

  for i,v in pairs(dados) do
    local nomeLabel = v.label;
    local nomeField = v.field;

    local label = TLabel.new();
    label:setTexto(nomeLabel);
    label:setFonte(CenaBusca.font_label);
    label:update();

    local field = TField.new();
    field:setFonte(CenaBusca.font_data);
    field:setIsEditable(false);
    field:setTexto(nomeField);
    field:getTLabelTexto():setLargura(750);
    field:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
    field:update();

    local icone = TIcon.new();
    icone:setTImage(field);
    icone:setTLabel(label);
    icone:setOrientacao(TIcon.TITULO_LEFT);

    table.insert(itensMenu,icone);
  end

  local menu = TMenu.new();
  menu:addAllItens(itensMenu);
  menu:setOrientacao(TMenu.VERTICAL);
  menu:setTamanhoJanela(4);
  menu:setIsVisibleSetas(false);
  menu:setIsFoco(false);
  menu:setIsFocoVisible(false);
  menu:setIsItensCentralizados(false);
  menu:update();

  menu:setPx(5)--(FrameVisualizarEscolaComparar:getLargura() - menu:getLargura())/2);
  menu:setPy(15);

  panel:addComponent(menu,1);

  return panel;
end

--[[Constrói o cabeçalho do quadro comparativo de estatísticas da escola selecionada com os seguintes valores: "Estatística"
"Escola", "municipal", "estadual", "regional" e "nacional" ]]--
function FrameVisualizarEscolaComparar:buildHeader(panelResultados,sizeFields,sizeEstatistica,pxComponent,pyComponent, showEstatistica,sizeFieldEscola)

  local line = TConteiner.new();
  line:setLargura(1270);
  line:setAltura(40);
  line:setPx((panelResultados:getLargura() - line:getLargura())/2);
  line:setPy(pyComponent);

  local fieldEstatistica = createField("ESTATÍSTICA",5,5,sizeEstatistica,CenaBusca.font_header,CenaBusca.cor_header,true);
  local fieldEscola= createField("ESCOLA",fieldEstatistica:getPx() + fieldEstatistica:getLargura() + 10,5,sizeFieldEscola,CenaBusca.font_header,CenaBusca.cor_header,true);

  if(showEstatistica)then
    line:addComponent(fieldEstatistica)
    line:addComponent(fieldEscola);
  end

  local fieldNacional = createField("NACIONAL",fieldEscola:getPx() + fieldEscola:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
  line:addComponent(fieldNacional);

  local fieldRegional = createField("REGIONAL",fieldNacional:getPx() + fieldNacional:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
  line:addComponent(fieldRegional);

  local fieldEstadual = createField("ESTADUAL",fieldRegional:getPx() + fieldRegional:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
  line:addComponent(fieldEstadual);

  local fieldMunicipal = createField("MUNICIPAL",fieldEstadual:getPx() + fieldEstadual:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
  line:addComponent(fieldMunicipal);

  pyComponent = pyComponent + line:getAltura() + 2;

  panelResultados:addComponent(line,1);

  return pxComponent,pyComponent;
end


--[[Constrói o cabeçalho do quadro comparativo de estatísticas da escola selecionada com os seguintes valores: "Estatística"
"Escola", "estadual", "regional" e "nacional" ]]--
function FrameVisualizarEscolaComparar:buildHeaderMelhores(panelResultados,sizeFields,sizeEstatistica,pxComponent,pyComponent, showEstatistica,sizeFieldEscola)

  local line = TConteiner.new();
  line:setLargura(1270);
  line:setAltura(40);
  line:setPx((panelResultados:getLargura() - line:getLargura())/2);
  line:setPy(pyComponent);

  local fieldEstatistica = createField("ESTATÍSTICA",5,5,sizeEstatistica,CenaBusca.font_header,CenaBusca.cor_header,true);
  local fieldEscola= createField("ESCOLA",fieldEstatistica:getPx() + fieldEstatistica:getLargura() + 10,5,sizeFieldEscola,CenaBusca.font_header,CenaBusca.cor_header,true);

  if(showEstatistica)then
    line:addComponent(fieldEstatistica)
    line:addComponent(fieldEscola);
  end

  local fieldNacional = createField("NACIONAL",fieldEscola:getPx() + fieldEscola:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
  line:addComponent(fieldNacional);

  local fieldRegional = createField("REGIONAL",fieldNacional:getPx() + fieldNacional:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
  line:addComponent(fieldRegional);

  local fieldEstadual = createField("ESTADUAL",fieldRegional:getPx() + fieldRegional:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
  line:addComponent(fieldEstadual);



  pyComponent = pyComponent + line:getAltura() + 2;

  panelResultados:addComponent(line,1);

  return pxComponent,pyComponent;
end


--[[Constrói o cabeçalho do quadro comparativo de estatísticas das melhores e piores escolas, acrescentando o 
campo "M" (melhor) e "P" (pior) para os respectivos nívéis municipal, estadual, regional e nacional ]]--
function FrameVisualizarEscolaComparar:buildHeaderMelhoresPiores(panelResultados,sizeFields,sizeEstatistica,pxComponent,pyComponent)
  local line = TConteiner.new();
  line:setLargura(1270);
  line:setAltura(40);
  line:setPx((panelResultados:getLargura() - line:getLargura())/2);
  line:setPy(pyComponent);

  local fieldEstatistica = createField("ESTATÍSTICA",5,5,sizeEstatistica,CenaBusca.font_header,CenaBusca.cor_header,true);
  line:addComponent(fieldEstatistica);

  local fieldEscola = createField("ESCOLA",fieldEstatistica:getPx() + fieldEstatistica:getLargura() + 10,5,sizeFields  + 5 ,CenaBusca.font_header,CenaBusca.cor_header,true);
  line:addComponent(fieldEscola);

  local fieldNacionalMelhores = createField("MELHORES/ENEM",fieldEscola:getPx() + fieldEscola:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
  line:addComponent(fieldNacionalMelhores);

--  local fieldNacionalPiores = createField("P",fieldNacionalMelhores:getPx() + fieldNacionalMelhores:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
--  line:addComponent(fieldNacionalPiores);

  local fieldRegionalMelhores = createField("MELHORES/ENEM",fieldNacionalMelhores:getPx() + fieldNacionalMelhores:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
  line:addComponent(fieldRegionalMelhores);

--  local fieldRegionalPiores = createField("P",fieldRegionalMelhores:getPx() + fieldRegionalMelhores:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
--  line:addComponent(fieldRegionalPiores);

  local fieldEstadualMelhores = createField("MELHORES/ENEM",fieldRegionalMelhores:getPx() + fieldRegionalMelhores:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
  line:addComponent(fieldEstadualMelhores);

--  local fieldEstadualPiores = createField("P",fieldEstadualMelhores:getPx() + fieldEstadualMelhores:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
--  line:addComponent(fieldEstadualPiores);

--  local fieldMunicipalMelhores = createField("M",fieldEstadualPiores:getPx() + fieldEstadualPiores:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
--  line:addComponent(fieldMunicipalMelhores);
--
--  local fieldMunicipalPiores = createField("P",fieldMunicipalMelhores:getPx() + fieldMunicipalMelhores:getLargura() + 10,5,sizeFields,CenaBusca.font_header,CenaBusca.cor_header,true);
--  line:addComponent(fieldMunicipalPiores);

  pyComponent = pyComponent + line:getAltura() + 2;

  panelResultados:addComponent(line,1);

  return pxComponent,pyComponent;
end

--Painel central onde são mostrados os dados estatísticos
function FrameVisualizarEscolaComparar:buildPainelVisualizarEscolaCompararDetalhes()
  local panelResultados= TPanel.new();
  panelResultados:setLargura(1270);
  panelResultados:setAltura(470);
  panelResultados:setPx(5);
  panelResultados:setPy(180);
  panelResultados:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));--{r=200,g=255,b=255,alpha=255}));

  local sizeFields = 150;
  local sizeEstatistica = 420;

  local sizeFieldsMelhoresPiores = 184;--85;
  local sizeEstatisticaMelhoresPiores = 450;--350;

  local pxComponent = 5;
  local pyComponent = 5;

  if(not CenaBusca.isCarregandoPesquisaVisualizarEscolaComparar and (panelResultados.components[2] == nil or FrameVisualizarEscolaComparar.mostrarPioresMelhoresChanged))then
    local resultados = {};
    local tamanhoJanela = 10;

    if(FrameVisualizarEscolaComparar.mostrarPioresMelhores)then
      tamanhoJanela = 9;
      CenaBusca:getItensResultadoDetalhesCompararMelhoresPiores(resultados);

--      pxComponent,pyComponent = FrameVisualizarEscolaComparar:buildHeader(panelResultados,184,sizeEstatisticaMelhoresPiores,pxComponent,pyComponent,false,sizeFieldsMelhoresPiores + 5);
      pxComponent,pyComponent = FrameVisualizarEscolaComparar:buildHeaderMelhores(panelResultados,184,sizeEstatisticaMelhoresPiores,pxComponent,pyComponent,false,sizeFieldsMelhoresPiores + 5);
      pxComponent,pyComponent = FrameVisualizarEscolaComparar:buildHeaderMelhoresPiores(panelResultados,sizeFieldsMelhoresPiores,sizeEstatisticaMelhoresPiores,pxComponent,pyComponent);

    else

      CenaBusca:getItensResultadoDetalhesComparar(resultados);
      pxComponent,pyComponent = FrameVisualizarEscolaComparar:buildHeader(panelResultados,sizeFields,sizeEstatistica,pxComponent,pyComponent,true,sizeFields);

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
    end
  end

  if (CenaBusca.isCarregandoPesquisaVisualizarEscolaComparar)then
    panelResultados.components[2] = nil;
    local labelCarregando = TLabel.new();
    labelCarregando:setTexto("Carregando...");
    labelCarregando:setFonte(CenaBusca.font_data);
    labelCarregando:update();
    labelCarregando:setPx((panelResultados:getLargura() - labelCarregando:getLargura())/2);
    labelCarregando:setPy((panelResultados:getAltura() - labelCarregando:getAltura())/2);

    panelResultados:addComponent(labelCarregando,11);
  end

  return panelResultados;
end

--[[Inicializa o quadro comparativo com as melhores e piores escolas ao pressionar o botão azul]]--
function FrameVisualizarEscolaComparar:action(evt)
  if(BibliotecaAuxiliarEvento.isEventoControle(evt)) then

    if(BibliotecaAuxiliarEvento.isBotaoAzul(evt) and not FrameVisualizarEscolaComparar.mostrarPioresMelhores) then
      
      FrameVisualizarEscolaComparar.mostrarPioresMelhoresChanged = true;
      FrameVisualizarEscolaComparar.mostrarPioresMelhores = true;
      FrameVisualizarEscolaComparar:inicialize();
      FrameVisualizarEscolaComparar.mostrarPioresMelhoresChanged = false;
      
    elseif(BibliotecaAuxiliarEvento.isBotaoAmarelo(evt) and FrameVisualizarEscolaComparar.mostrarPioresMelhores) then
      
      FrameVisualizarEscolaComparar.mostrarPioresMelhoresChanged = true;
      FrameVisualizarEscolaComparar.mostrarPioresMelhores = false;
      FrameVisualizarEscolaComparar:inicialize();
      FrameVisualizarEscolaComparar.mostrarPioresMelhoresChanged = false;
      
    elseif(BibliotecaAuxiliarEvento.isBotaoAmarelo(evt) and not FrameVisualizarEscolaComparar.mostrarPioresMelhores) then

      evt.rule_key = "acessarCenaVisualizarEscola";

    end

  end
end
