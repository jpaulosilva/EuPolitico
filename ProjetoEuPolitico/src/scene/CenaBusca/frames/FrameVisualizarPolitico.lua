-- Imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');
BibliotecaAuxiliarScript.execute('data.ListaDeputados');
BibliotecaAuxiliarScript.execute('data.Politico');
BibliotecaAuxiliarScript.execute('data.FiltroPolitico');


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

--Cria tela de vizualização
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

--[[Painel onde são mostrados todos os detalhes referentes à escola selecionada como endereço, situação de funcionamento,
notas de enem e ideb, assim como apresenta sua infraestrutura básica e os tipos de dependência presentes na escola]]--
function FrameVisualizarPolitico:buildPainelDetalhes()
  -- Incluir componentes gráficos
  local panelDetalhesPolitico= TPanel.new();
  panelDetalhesPolitico:setLargura(1270);
  panelDetalhesPolitico:setAltura(645);
  panelDetalhesPolitico:setPx(5);
  panelDetalhesPolitico:setPy(5);
  panelDetalhesPolitico:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}))--{r=200,g=255,b=255,alpha=255})); --{r=153,g=204,b=51,alpha=255}))



  local labelEscola = TLabel.new();
  labelEscola:setTexto("EU POLÍTICO");
  labelEscola:setFonte(font_destaque);
  labelEscola:setPx(0);
  labelEscola:setPy(0);
  panelDetalhesPolitico:addComponent(labelEscola,1);




--  local labelCod = TLabel.new();
--  labelCod:setTexto("Código:");
--  labelCod:setFonte(font_label);
--
--  local cod = tostring(CenaBusca.politicoSelecionado:getCod());
--  local fieldCod = TField.new();
--  fieldCod:setFonte(font_data);
--  fieldCod:setTLabel(labelCod);
--  fieldCod:setIsEditable(false);
--  fieldCod:setTexto(cod);
--  fieldCod:setPx(1000);
--  fieldCod:setPy(0);
--  fieldCod:getTLabelTexto():setLargura(300);
--  fieldCod:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldCod,2);



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
  
  local cargo = tostring(CenaBusca.politicoSelecionado:getPartido());
  local fieldCargo = TField.new();
  fieldCargo:setFonte(font_data);
  fieldCargo:setTLabel(labelCargo);
  fieldCargo:setIsEditable(false);
  fieldCargo:setTexto(cargo);
  fieldCargo:setLimiteMax(20);
  fieldCargo:setPx(5);
  fieldCargo:setPy(160);
  fieldCargo:getTLabelTexto():setLargura(110);
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
  labelNumeroMandatos:setTexto("Número de Mandatos:");
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
  labelSituacao:setTexto("Situação:");
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
  labelNumeroComissoes:setTexto("Nº de comissões:");
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
  
  
  
--  local menuDetalhes = TMenu.new();
--  menuDetalhes:addAllItens(CenaBusca:getItensMenuDetalhesPolitico());
--  menuDetalhes:setOrientacao(TMenu.HORIZONTAL);
--  menuDetalhes:setTamanhoJanela(4);
--  menuDetalhes:setIsVisibleSetas(false);
--  menuDetalhes:setIsItensCentralizados(false);
--  menuDetalhes:setCorFoco(Cor.new({r=255,g=255,b=0,alpha=255}));
--  menuDetalhes:update();
--
--  menuDetalhes:setPx(15)
--  menuDetalhes:setPy(300)
--  
--  panelDetalhesPolitico:addComponent(menuDetalhes,18);
  


  return panelDetalhesPolitico;

end



--Controla a ação ao pressionar o botão amarelo (voltar) e o botão verde (tela de comparação com os dados estatísticos) 
function FrameVisualizarPolitico:action(evt)
  if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoAmarelo(evt)) then

    if(CenaBusca.frameCorrente == FrameConsultarEscola)then
      evt.rule_key = "acessarFrameConsultarEscola";
    elseif(CenaBusca.frameCorrente == FrameConsultarEscolaAvancado)then
      evt.rule_key = "acessarFrameConsultarEscolaAvancado";
    end
  elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoVerde(evt)) then
    CenaBusca.filtroNacional:setTipoLocal("NAC");
    CenaBusca.filtroRegional:setRegiaoGeografica(CenaBusca.politicoSelecionado:getRegiao());
    CenaBusca.filtroEstadual:setEstado(CenaBusca.politicoSelecionado:getEstado());
    CenaBusca.filtroMunicipal:setCidade(CenaBusca.politicoSelecionado:getCodMunicipio());

    CenaBusca:pesquisarVisualizarEscolaComparar();
    evt.rule_key = "acessarFrameVisualizarEscolaComparar";
  end
end
