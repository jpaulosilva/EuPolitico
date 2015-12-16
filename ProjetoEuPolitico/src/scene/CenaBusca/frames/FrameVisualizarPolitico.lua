-- Imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TMenu');
BibliotecaAuxiliarScript.execute('data.ListaPoliticos');
BibliotecaAuxiliarScript.execute('data.Politico');
BibliotecaAuxiliarScript.execute('data.FiltroPolitico');
BibliotecaAuxiliarScript.execute('utils.Utils');


FrameVisualizarPolitico = TFrame.new();
FrameVisualizarPolitico.id = 'FrameVisualizarPolitico';

local font_label= Fonte.new({nome='tiresias', tamanho=20, is_negrito = true});
font_label.cor = Cor.new({r=255,g=255,b=0});

local font_data= Fonte.new({nome='tiresias', tamanho=20,is_negrito = true});
font_data.cor = Cor.new({r=255,g=255,b=255});

local font_logo= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
font_logo.cor = Cor.new({r=153,g=204,b=51});

local font_labelDados= Fonte.new({nome='tiresias', tamanho=16, is_negrito = true});
font_labelDados.cor = Cor.new({r=255,g=94,b=94});

local font_destaque= Fonte.new({nome='tiresias', tamanho=28, is_negrito = true});
font_destaque.cor = Cor.new({r=255,g=255,b=0});

--Cria tela de vizualiza��o
function FrameVisualizarPolitico:inicialize()

  -- Alterar propriedades do FrameVisualizarPolitico
  FrameVisualizarPolitico:setLargura(1280);
  FrameVisualizarPolitico:setAltura(720);
  FrameVisualizarPolitico:setPx(0);
  FrameVisualizarPolitico:setPy(0);
  FrameVisualizarPolitico:setCorFundo(CenaBusca.cor);


  --  FrameVisualizarEscolaComparar:setComponents({});

  if (CenaBusca.politicoSelecionado ~= nil and not CenaBusca.isCarregandoDetalhes) then


    FrameVisualizarPolitico:addComponent(FrameVisualizarPolitico:buildPainelDetalhes(),2);
    FrameVisualizarPolitico:addComponent(CenaBusca.tabelaEscolhida,4);


  else
    local labelCarregando = TLabel.new();
    labelCarregando:setTexto("Carregando...");
    labelCarregando:setFonte(font_logo);--CenaBusca.font_data);
    labelCarregando:update();
    labelCarregando:setPx((FrameVisualizarPolitico:getLargura() - labelCarregando:getLargura())/2);
    labelCarregando:setPy((FrameVisualizarPolitico:getAltura() - labelCarregando:getAltura())/2);

    FrameVisualizarPolitico:addComponent(labelCarregando,2);
  end

  FrameVisualizarPolitico:addComponent(buildBackground(),1);
  FrameVisualizarPolitico:addComponent(buildPainelLegendas(nil,nil,nil,"MENU","COMPARAR","VOLTAR",nil),3);

end

--[[Painel onde s�o mostrados todos os detalhes referentes � escola selecionada como endere�o, situa��o de funcionamento,

notas de enem e ideb, assim como apresenta sua infraestrutura b�sica e os tipos de depend�ncia presentes na escola]]--
function FrameVisualizarPolitico:buildPainelDetalhes(frame)
  -- Incluir componentes gr�ficos
  local panelDetalhesPolitico= TPanel.new();
  panelDetalhesPolitico:setLargura(1270);
  panelDetalhesPolitico:setAltura(645)--645);
  panelDetalhesPolitico:setPx(5);
  panelDetalhesPolitico:setPy(5);
  panelDetalhesPolitico:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}))--{r=200,g=255,b=255,alpha=255})); --{r=153,g=204,b=51,alpha=255}))



  local labelPolitico = TLabel.new();
  labelPolitico:setTexto("EU POL�TICO");
  labelPolitico:setFonte(font_destaque);
  labelPolitico:setPx(0);
  labelPolitico:setPy(0);
  panelDetalhesPolitico:addComponent(labelPolitico,1);



  local labelNome = TLabel.new();
  labelNome:setTexto("Nome:");
  labelNome:setFonte(font_label);

  local nome = tostring(CenaBusca.politicoSelecionado:getNomeCompleto());
  local fieldNome = TField.new();
  fieldNome:setFonte(font_data);
  fieldNome:setTLabel(labelNome);
  fieldNome:setIsEditable(false);
  fieldNome:setTexto(nome);
  fieldNome:setLimiteMax(20);
  fieldNome:setPx(5);
  fieldNome:setPy(40);
  fieldNome:getTLabelTexto():setLargura(400);
  fieldNome:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldNome,2);


  local labelFavorito = TLabel.new();
  labelFavorito:setTexto("Favorito:");
  labelFavorito:setFonte(font_label);

  local fieldFavorito = TField.new();
  fieldFavorito:setFonte(font_data);
  fieldFavorito:setTLabel(labelFavorito);
  fieldFavorito:setIsEditable(false);
  fieldFavorito:setLimiteMax(20);
  fieldFavorito:setPx(480);
  fieldFavorito:setPy(40);
  fieldFavorito:getTLabelTexto():setLargura(100);
  fieldFavorito:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldFavorito,3);


  local labelApelido = TLabel.new();
  labelApelido:setTexto("Apelido:");
  labelApelido:setFonte(font_label);

  local apelido = tostring(CenaBusca.politicoSelecionado:getNomeParlamentar());
  local fieldApelido = TField.new();
  fieldApelido:setFonte(font_data);
  fieldApelido:setTLabel(labelApelido);
  fieldApelido:setIsEditable(false);
  fieldApelido:setTexto(apelido);
  fieldApelido:setLimiteMax(20);
  fieldApelido:setPx(680);
  fieldApelido:setPy(40);
  fieldApelido:getTLabelTexto():setLargura(300);
  fieldApelido:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldApelido,4);



  local labelPartido = TLabel.new();
  labelPartido:setTexto("Partido:");
  labelPartido:setFonte(font_label);

  local partido = tostring(CenaBusca.politicoSelecionado:getPartido());
  local fieldPartido = TField.new();
  fieldPartido:setFonte(font_data);
  fieldPartido:setTLabel(labelPartido);
  fieldPartido:setIsEditable(false);
  fieldPartido:setTexto(partido);
  fieldPartido:setLimiteMax(20);
  fieldPartido:setPx(1070);
  fieldPartido:setPy(40);
  fieldPartido:getTLabelTexto():setLargura(110);
  fieldPartido:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldPartido,5);


  local labelCidade = TLabel.new();
  labelCidade:setTexto("Cidade:");
  labelCidade:setFonte(font_label);

  local fieldCidade = TField.new();
  fieldCidade:setFonte(font_data);
  fieldCidade:setTLabel(labelCidade);
  fieldCidade:setIsEditable(false);
  fieldCidade:setLimiteMax(20);
  fieldCidade:setPx(5);
  fieldCidade:setPy(80);
  fieldCidade:getTLabelTexto():setLargura(110);
  fieldCidade:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldCidade,6);


  local labelUF = TLabel.new();
  labelUF:setTexto("UF:");
  labelUF:setFonte(font_label);

  local uf = tostring(CenaBusca.politicoSelecionado:getUf());
  local fieldUF = TField.new();
  fieldUF:setFonte(font_data);
  fieldUF:setTLabel(labelUF);
  fieldUF:setIsEditable(false);
  fieldUF:setTexto(uf);
  fieldUF:setLimiteMax(20);
  fieldUF:setPx(5);
  fieldUF:setPy(120);
  fieldUF:getTLabelTexto():setLargura(110);
  fieldUF:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldUF,7);


  local labelCargo = TLabel.new();
  labelCargo:setTexto("Cargo:");
  labelCargo:setFonte(font_label);

  local cargo = tostring(CenaBusca.politicoSelecionado:getCargo());
  local fieldCargo = TField.new();
  fieldCargo:setFonte(font_data);
  fieldCargo:setTLabel(labelCargo);
  fieldCargo:setIsEditable(false);
  fieldCargo:setTexto(cargo);
  fieldCargo:setLimiteMax(20);
  fieldCargo:setPx(5);
  fieldCargo:setPy(160);
  fieldCargo:getTLabelTexto():setLargura(210);
  fieldCargo:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldCargo,8);


  local labelDataNascimento = TLabel.new();
  labelDataNascimento:setTexto("Data de Nascimento:");
  labelDataNascimento:setFonte(font_label);

  local dataNascimento = tostring(CenaBusca.politicoSelecionado:getNascimento());
  local fieldDataNascimento = TField.new();
  fieldDataNascimento:setFonte(font_data);
  fieldDataNascimento:setTLabel(labelDataNascimento);
  fieldDataNascimento:setIsEditable(false);
  fieldDataNascimento:setTexto(dataNascimento);
  fieldDataNascimento:setLimiteMax(20);
  fieldDataNascimento:setPx(5);
  fieldDataNascimento:setPy(200);
  fieldDataNascimento:getTLabelTexto():setLargura(110);
  fieldDataNascimento:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldDataNascimento,9);


  local labelSexo = TLabel.new();
  labelSexo:setTexto("Sexo:");
  labelSexo:setFonte(font_label);

  local sexo = tostring(CenaBusca.politicoSelecionado:getSexo());
  local fieldSexo = TField.new();
  fieldSexo:setFonte(font_data);
  fieldSexo:setTLabel(labelSexo);
  fieldSexo:setIsEditable(false);
  fieldSexo:setTexto(sexo);
  fieldSexo:setLimiteMax(20);
  fieldSexo:setPx(380);
  fieldSexo:setPy(80);
  fieldSexo:getTLabelTexto():setLargura(110);
  fieldSexo:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldSexo,10);


  local labelEscolaridade = TLabel.new();
  labelEscolaridade:setTexto("Escolaridade:");
  labelEscolaridade:setFonte(font_label);

  local fieldEscolaridade = TField.new();
  fieldEscolaridade:setFonte(font_data);
  fieldEscolaridade:setTLabel(labelEscolaridade);
  fieldEscolaridade:setIsEditable(false);
  fieldEscolaridade:setLimiteMax(20);
  fieldEscolaridade:setPx(380);
  fieldEscolaridade:setPy(120);
  fieldEscolaridade:getTLabelTexto():setLargura(110);
  fieldEscolaridade:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldEscolaridade,11);



  local labelNumeroMandatos = TLabel.new();
  labelNumeroMandatos:setTexto("N�mero de Mandatos:");
  labelNumeroMandatos:setFonte(font_label);

  local fieldNumeroMandatos = TField.new();
  fieldNumeroMandatos:setFonte(font_data);
  fieldNumeroMandatos:setTLabel(labelNumeroMandatos);
  fieldNumeroMandatos:setIsEditable(false);
  fieldNumeroMandatos:setLimiteMax(20);
  fieldNumeroMandatos:setPx(380);
  fieldNumeroMandatos:setPy(160);
  fieldNumeroMandatos:getTLabelTexto():setLargura(50);
  fieldNumeroMandatos:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldNumeroMandatos,12);


  local labelSituacao = TLabel.new();
  labelSituacao:setTexto("Situa��o:");
  labelSituacao:setFonte(font_label);

  local fieldSituacao = TField.new();
  fieldSituacao:setFonte(font_data);
  fieldSituacao:setTLabel(labelSituacao);
  fieldSituacao:setIsEditable(false);
  fieldSituacao:setLimiteMax(20);
  fieldSituacao:setPx(380);
  fieldSituacao:setPy(200);
  fieldSituacao:getTLabelTexto():setLargura(110);
  fieldSituacao:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldSituacao,13);


  local labelGastosTotais = TLabel.new();
  labelGastosTotais:setTexto("Gastos Totais:");
  labelGastosTotais:setFonte(font_label);

  local gastosTotais = tostring(CenaBusca.politicoSelecionado:getGastoTotal());
  local fieldGastosTotais = TField.new();
  fieldGastosTotais:setFonte(font_data);
  fieldGastosTotais:setTLabel(labelGastosTotais);
  fieldGastosTotais:setIsEditable(false);
  fieldGastosTotais:setTexto(gastosTotais);
  fieldGastosTotais:setLimiteMax(20);
  fieldGastosTotais:setPx(700);
  fieldGastosTotais:setPy(80);
  fieldGastosTotais:getTLabelTexto():setLargura(210);
  fieldGastosTotais:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldGastosTotais,14);


  local labelGastosDia = TLabel.new();
  labelGastosDia:setTexto("Gastos por Dia:");
  labelGastosDia:setFonte(font_label);

  local gastosDia = tostring(CenaBusca.politicoSelecionado:getGastoPorDia());
  local fieldGastosDia = TField.new();
  fieldGastosDia:setFonte(font_data);
  fieldGastosDia:setTLabel(labelGastosDia);
  fieldGastosDia:setIsEditable(false);
  fieldGastosDia:setLimiteMax(20);
  fieldGastosDia:setTexto(gastosDia);
  fieldGastosDia:setPx(700);
  fieldGastosDia:setPy(120);
  fieldGastosDia:getTLabelTexto():setLargura(200);
  fieldGastosDia:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldGastosDia,15);


  local labelAssiduidade = TLabel.new();
  labelAssiduidade:setTexto("Assiduidade:");
  labelAssiduidade:setFonte(font_label);

  local fieldAssiduidade = TField.new();
  fieldAssiduidade:setFonte(font_data);
  fieldAssiduidade:setTLabel(labelAssiduidade);
  fieldAssiduidade:setIsEditable(false);
  fieldAssiduidade:setLimiteMax(20);
  fieldAssiduidade:setPx(700);
  fieldAssiduidade:setPy(160);
  fieldAssiduidade:getTLabelTexto():setLargura(110);
  fieldAssiduidade:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldAssiduidade,16);


  local labelNumeroComissoes = TLabel.new();
  labelNumeroComissoes:setTexto("N� de comiss�es:");
  labelNumeroComissoes:setFonte(font_label);

  local fieldNumeroComissoes = TField.new();
  fieldNumeroComissoes:setFonte(font_data);
  fieldNumeroComissoes:setTLabel(labelNumeroComissoes);
  fieldNumeroComissoes:setIsEditable(false);
  fieldNumeroComissoes:setLimiteMax(20);
  fieldNumeroComissoes:setPx(700);
  fieldNumeroComissoes:setPy(200);
  fieldNumeroComissoes:getTLabelTexto():setLargura(110);
  fieldNumeroComissoes:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesPolitico:addComponent(fieldNumeroComissoes,17);


  local menu = TMenu.new();
  menu:addAllItens(CenaBusca:getItensMenuDetalhesPolitico(FrameVisualizarPolitico));
  menu:setOrientacao(TMenu.HORIZONTAL);
  menu:setTamanhoJanela(4);
  menu:setIsVisibleSetas(false);
  menu:setIsItensCentralizados(false);
  --  menu:setCorFoco(Cor.new({r=255,g=255,b=0,alpha=255}));
  menu:update();

  menu:setPx(50);
  menu:setPy(300);

  panelDetalhesPolitico:addComponent(menu,18);


  return panelDetalhesPolitico;

end



--function FrameVisualizarPolitico:carregarTabelaGastosTipo(frame)
--
--  local panelTabelaGastosTipo= TPanel.new();
--  panelTabelaGastosTipo:setLargura(1270);
--  panelTabelaGastosTipo:setAltura(240)--645);
--  panelTabelaGastosTipo:setPx(5);
--  panelTabelaGastosTipo:setPy(410);
--  panelTabelaGastosTipo:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}))
--  
--  
--  local pxComponent = 5;
--  local pyComponent = 5;
--  
--  local line = TConteiner.new();
--  line:setLargura(1000);
--  line:setAltura(40);
--  line:setPx((panelTabelaGastosTipo:getLargura() - line:getLargura())/2);
--  line:setPy(pyComponent);
--  line:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=255}));
--
--  line:addComponent(createField("TIPO",0,5,400,CenaBusca.font_header,CenaBusca.cor_header,true));
--  line:addComponent(createField("VALOR",410,5,300,CenaBusca.font_header,CenaBusca.cor_header,true));
--  line:addComponent(createField("VALOR POR DIA",720,5,275,CenaBusca.font_header,CenaBusca.cor_header,true));
--  
--  panelTabelaGastosTipo:addComponent(line,19);
--
--  
--  return panelTabelaGastosTipo;
--  
--  
--end
--
--
--function FrameVisualizarPolitico:carregarTabelaGastosEmpresa(frame)
--
--  local panelTabelaGastosEmpresa= TPanel.new();
--  panelTabelaGastosEmpresa:setLargura(1270);
--  panelTabelaGastosEmpresa:setAltura(240)--645);
--  panelTabelaGastosEmpresa:setPx(5);
--  panelTabelaGastosEmpresa:setPy(410);
--  panelTabelaGastosEmpresa:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}))
--  
--  
--  local pxComponent = 5;
--  local pyComponent = 5;
--  
--  local line = TConteiner.new();
--  line:setLargura(1000);
--  line:setAltura(40);
--  line:setPx((panelTabelaGastosEmpresa:getLargura() - line:getLargura())/2);
--  line:setPy(pyComponent);
--  line:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=255}));
--
--  line:addComponent(createField("TIPO",0,5,400,CenaBusca.font_header,CenaBusca.cor_header,true));
--  line:addComponent(createField("EMPRESA",410,5,300,CenaBusca.font_header,CenaBusca.cor_header,true));
--  line:addComponent(createField("VALOR POR DIA",720,5,275,CenaBusca.font_header,CenaBusca.cor_header,true));
--  
--  panelTabelaGastosEmpresa:addComponent(line,19);
--
--  
--  return panelTabelaGastosEmpresa;
--  
--  
--end
--
--
--
--function FrameVisualizarPolitico:getItensMenuDetalhesPolitico(frame)
--
--  local itensPrimitivos = {
--    {'../media/ajuda.png'     ,'Gasto por Tipo', 1},
--    {'../media/quem_somos.png'    ,'Gasto por Empresas', 2},
--    {'../media/quem_somos.png' , 'Projetos', 3},
--    {'../media/indices.png'   ,'Comiss�es', 4}};
--
--
--  local itens = {};
--
--  local font_data= Fonte.new({nome='tiresias', tamanho=32,is_negrito = true});
--  font_data.cor = Cor.new({r=255,g=255,b=0})--{r=153,g=204,b=51});--{r=255,g=94,b=94});
--
--
--  for i,v in pairs(itensPrimitivos) do
--    local src = v[1];
--    local nome = v[2];
----    CenaBusca.action = v[3];
--
--    local image = TImage.new();
--    image:setSrcArquivoExterno(src);
--
--    local label = TLabel.new();
--    label:setTexto(nome);
--    label:setFonte(font_data);
--
--    local icone = TIcon.new();
--    icone:setTImage(image);
--    icone:setTLabel(label);
--    icone:setOrientacao(TIcon.TITULO_RIGHT);
--
--    icone.action = function (self,evt)
--    
--      if v[3] == 1 then
--
--         CenaBusca.tabelaEscolhida = FrameVisualizarPolitico:carregarTabelaGastosTipo();
--         frame.inicialize();
--         
--      end
--      if v[3] == 2 then
--      
--        CenaBusca.tabelaEscolhida = FrameVisualizarPolitico:carregarTabelaGastosEmpresa();
--        frame.inicialize();
--        
--      end
----      evt.rule_key = action;
--      
--    end
--
--    table.insert(itens,icone);
--
--  end
--
--  return itens;
--
--end





--Controla a a��o ao pressionar o bot�o amarelo (voltar) e o bot�o verde (tela de compara��o com os dados estat�sticos)
function FrameVisualizarPolitico:action(evt)
  if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoAmarelo(evt)) then

    CenaBusca.tabelaEscolhida = nil;

    if(CenaBusca.frameCorrente == FrameConsultarPolitico)then
      evt.rule_key = "acessarFrameConsultarPolitico";
    elseif(CenaBusca.frameCorrente == FrameConsultarPoliticoAvancado)then
      evt.rule_key = "acessarFrameConsultarPoliticoAvancado";
    end
  elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoVerde(evt)) then
    CenaBusca.filtroNacional:setTipoLocal("NAC");
    CenaBusca.filtroRegional:setRegiaoGeografica(CenaBusca.politicoSelecionado:getRegiao());
    CenaBusca.filtroEstadual:setEstado(CenaBusca.politicoSelecionado:getEstado());
    CenaBusca.filtroMunicipal:setCidade(CenaBusca.politicoSelecionado:getCodMunicipio());

--    CenaBusca:pesquisarVisualizarEscolaComparar();
--    evt.rule_key = "acessarFrameVisualizarEscolaComparar";
  end
end
