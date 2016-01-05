-- Imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TIcon');
BibliotecaAuxiliarScript.execute('framework.src.gui.TMenu');
BibliotecaAuxiliarScript.execute('framework.src.gui.TImage');
BibliotecaAuxiliarScript.execute('data.ListaCandidatos');
BibliotecaAuxiliarScript.execute('data.Candidato');
BibliotecaAuxiliarScript.execute('data.FiltroCandidato');


FrameVisualizarCandidato = TFrame.new();
FrameVisualizarCandidato.id = 'FrameVisualizarCandidato';

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
function FrameVisualizarCandidato:inicialize()

  -- Alterar propriedades do FrameVisualizarCandidato
  FrameVisualizarCandidato:setLargura(1280);
  FrameVisualizarCandidato:setAltura(720);
  FrameVisualizarCandidato:setPx(0);
  FrameVisualizarCandidato:setPy(0);
  FrameVisualizarCandidato:setCorFundo(CenaBuscaCandidatos.cor);


  if (CenaBuscaCandidatos.candidatoSelecionado ~= nil and not CenaBuscaCandidatos.isCarregandoDetalhes) then


    FrameVisualizarCandidato:addComponent(FrameVisualizarCandidato:buildPainelDetalhes(),2);
    FrameVisualizarCandidato:addComponent(CenaBuscaCandidatos.tabelaEscolhida,4);
  

  else
    local labelCarregando = TLabel.new();
    labelCarregando:setTexto("Carregando...");
    labelCarregando:setFonte(font_logo);--CenaBuscaCandidatos.font_data);
    labelCarregando:update();
    labelCarregando:setPx((FrameVisualizarCandidato:getLargura() - labelCarregando:getLargura())/2);
    labelCarregando:setPy((FrameVisualizarCandidato:getAltura() - labelCarregando:getAltura())/2);

    FrameVisualizarCandidato:addComponent(labelCarregando,2);
  end

  FrameVisualizarCandidato:addComponent(buildBackground(),1);
  FrameVisualizarCandidato:addComponent(buildPainelLegendas(nil,nil,nil,"MENU","COMPARAR","VOLTAR",nil),3);

end

--[[Painel onde são mostrados todos os detalhes referentes ao candidato selecionado]]--
function FrameVisualizarCandidato:buildPainelDetalhes()
  -- Incluir componentes gráficos
  local panelDetalhesCandidato= TPanel.new();
  panelDetalhesCandidato:setLargura(1270);
  panelDetalhesCandidato:setAltura(645);
  panelDetalhesCandidato:setPx(5);
  panelDetalhesCandidato:setPy(5);
  panelDetalhesCandidato:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));



  local labelCandidato = TLabel.new();
  labelCandidato:setTexto("EU POLÍTICO");
  labelCandidato:setFonte(font_destaque);
  labelCandidato:setPx(0);
  labelCandidato:setPy(0);
  panelDetalhesCandidato:addComponent(labelCandidato,1);


  local labelNome = TLabel.new();
  labelNome:setTexto("Nome:");
  labelNome:setFonte(font_label);

  local nome = tostring(CenaBuscaCandidatos.candidatoSelecionado:getNomeCompleto());
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

  panelDetalhesCandidato:addComponent(fieldNome,2);
  
  
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
  
  panelDetalhesCandidato:addComponent(fieldFavorito,3);
  
  
  local labelApelido = TLabel.new();
  labelApelido:setTexto("Apelido:");
  labelApelido:setFonte(font_label);
  
  local apelido = tostring(CenaBuscaCandidatos.candidatoSelecionado:getNomeParlamentar());
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
  
  panelDetalhesCandidato:addComponent(fieldApelido,3);
  
  
  
  local labelPartido = TLabel.new();
  labelPartido:setTexto("Partido:");
  labelPartido:setFonte(font_label);
  
  local partido = tostring(CenaBuscaCandidatos.candidatoSelecionado:getSiglaPartido());
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
  
  panelDetalhesCandidato:addComponent(fieldPartido,4);
  
  
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
  fieldCidade:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldCidade,5);
  
  
  local labelUF = TLabel.new();
  labelUF:setTexto("UF:");
  labelUF:setFonte(font_label);
  
  local uf = tostring(CenaBuscaCandidatos.candidatoSelecionado:getUf());
  local fieldUF = TField.new();
  fieldUF:setFonte(font_data);
  fieldUF:setTLabel(labelUF);
  fieldUF:setIsEditable(false);
  fieldUF:setTexto(uf);
  fieldUF:setLimiteMax(20);
  fieldUF:setPx(5);
  fieldUF:setPy(120);
  fieldUF:getTLabelTexto():setLargura(110);
  fieldUF:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldUF,6);
  
  
  local labelCargo = TLabel.new();
  labelCargo:setTexto("Cargo Atual:");
  labelCargo:setFonte(font_label);
  
  local cargo = tostring(CenaBuscaCandidatos.candidatoSelecionado:getCargoParlamentarAtual());
  local fieldCargo = TField.new();
  fieldCargo:setFonte(font_data);
  fieldCargo:setTLabel(labelCargo);
  fieldCargo:setIsEditable(false);
  fieldCargo:setTexto(cargo);
  fieldCargo:setLimiteMax(20);
  fieldCargo:setPx(5);
  fieldCargo:setPy(160);
  fieldCargo:getTLabelTexto():setLargura(210);
  fieldCargo:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldCargo,7);
  
  
  local labelDataNascimento = TLabel.new();
  labelDataNascimento:setTexto("Data de Nascimento:");
  labelDataNascimento:setFonte(font_label);
  
--  local dataNascimento = tostring(CenaBuscaCandidatos.candidatoSelecionado:getNascimento());
  local fieldDataNascimento = TField.new();
  fieldDataNascimento:setFonte(font_data);
  fieldDataNascimento:setTLabel(labelDataNascimento);
  fieldDataNascimento:setIsEditable(false);
--  fieldDataNascimento:setTexto(dataNascimento);
  fieldDataNascimento:setLimiteMax(20);
  fieldDataNascimento:setPx(5);
  fieldDataNascimento:setPy(200);
  fieldDataNascimento:getTLabelTexto():setLargura(110);
  fieldDataNascimento:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldDataNascimento,8);


  local labelSexo = TLabel.new();
  labelSexo:setTexto("Sexo:");
  labelSexo:setFonte(font_label);
  
  local sexo = tostring(CenaBuscaCandidatos.candidatoSelecionado:getSexo());
  local fieldSexo = TField.new();
  fieldSexo:setFonte(font_data);
  fieldSexo:setTLabel(labelSexo);
  fieldSexo:setIsEditable(false);
  fieldSexo:setTexto(sexo);
  fieldSexo:setLimiteMax(20);
  fieldSexo:setPx(380);
  fieldSexo:setPy(80);
  fieldSexo:getTLabelTexto():setLargura(110);
  fieldSexo:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldSexo,9);
  
  
  local labelEscolaridade = TLabel.new();
  labelEscolaridade:setTexto("Escolaridade:");
  labelEscolaridade:setFonte(font_label);
  
  local escolaridade = tostring(CenaBuscaCandidatos.candidatoSelecionado:getNomeEscolaridade());
  local fieldEscolaridade = TField.new();
  fieldEscolaridade:setFonte(font_data);
  fieldEscolaridade:setTLabel(labelEscolaridade);
  fieldEscolaridade:setIsEditable(false);
  fieldEscolaridade:setLimiteMax(20);
  fieldEscolaridade:setTexto(escolaridade);
  fieldEscolaridade:setPx(380);
  fieldEscolaridade:setPy(120);
  fieldEscolaridade:getTLabelTexto():setLargura(310);
  fieldEscolaridade:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldEscolaridade,10);
  
  
  
  local labelOcupacao = TLabel.new();
  labelOcupacao:setTexto("Ocupação:");
  labelOcupacao:setFonte(font_label);
  
  local ocupacao = tostring(CenaBuscaCandidatos.candidatoSelecionado:getNomeOcupacao());
  local fieldOcupacao = TField.new();
  fieldOcupacao:setFonte(font_data);
  fieldOcupacao:setTLabel(labelOcupacao);
  fieldOcupacao:setIsEditable(false);
  fieldOcupacao:setLimiteMax(20);
  fieldOcupacao:setTexto(ocupacao);
  fieldOcupacao:setPx(380);
  fieldOcupacao:setPy(160);
  fieldOcupacao:getTLabelTexto():setLargura(310);
  fieldOcupacao:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldOcupacao,11);
  
  
  local labelReeleicao = TLabel.new();
  labelReeleicao:setTexto("Cand. Reeleição:");
  labelReeleicao:setFonte(font_label);
  
  local fieldReeleicao = TField.new();
  fieldReeleicao:setFonte(font_data);
  fieldReeleicao:setTLabel(labelReeleicao);
  fieldReeleicao:setIsEditable(false);
  fieldReeleicao:setLimiteMax(20);
  fieldReeleicao:setPx(380);
  fieldReeleicao:setPy(200);
  fieldReeleicao:getTLabelTexto():setLargura(110);
  fieldReeleicao:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldReeleicao,12);
  
  
  local labelTotalBensDeclarados = TLabel.new();
  labelTotalBensDeclarados:setTexto("Total Bens Declarados:");
  labelTotalBensDeclarados:setFonte(font_label);
  
  local totalBensDeclarados = tostring(CenaBuscaCandidatos.candidatoSelecionado:getTotalBens());
  local fieldTotalBensDeclarados = TField.new();
  fieldTotalBensDeclarados:setFonte(font_data);
  fieldTotalBensDeclarados:setTLabel(labelTotalBensDeclarados);
  fieldTotalBensDeclarados:setIsEditable(false);
  fieldTotalBensDeclarados:setTexto(totalBensDeclarados);
  fieldTotalBensDeclarados:setLimiteMax(20);
  fieldTotalBensDeclarados:setPx(800);
  fieldTotalBensDeclarados:setPy(80);
  fieldTotalBensDeclarados:getTLabelTexto():setLargura(210);
  fieldTotalBensDeclarados:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldTotalBensDeclarados,13);
  
  
  local labelDoacoes = TLabel.new();
  labelDoacoes:setTexto("Doações:");
  labelDoacoes:setFonte(font_label);
  
  local doacoes = tostring(CenaBuscaCandidatos.candidatoSelecionado:getTotalArrecadado());
  local fieldDoacoes = TField.new();
  fieldDoacoes:setFonte(font_data);
  fieldDoacoes:setTLabel(labelDoacoes);
  fieldDoacoes:setIsEditable(false);
  fieldDoacoes:setLimiteMax(20);
  fieldDoacoes:setTexto(doacoes);
  fieldDoacoes:setPx(800);
  fieldDoacoes:setPy(120);
  fieldDoacoes:getTLabelTexto():setLargura(200);
  fieldDoacoes:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldDoacoes,14);
  
  
  local labelGastos = TLabel.new();
  labelGastos:setTexto("Total de Gastos:");
  labelGastos:setFonte(font_label);
  
  local fieldGastos = TField.new();
  fieldGastos:setFonte(font_data);
  fieldGastos:setTLabel(labelGastos);
  fieldGastos:setIsEditable(false);
  fieldGastos:setLimiteMax(20);
  fieldGastos:setPx(800);
  fieldGastos:setPy(160);
  fieldGastos:getTLabelTexto():setLargura(110);
  fieldGastos:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldGastos,15);
  
  
  local labelNumeroPropostas = TLabel.new();
  labelNumeroPropostas:setTexto("Nº de Propostas:");
  labelNumeroPropostas:setFonte(font_label);
  
  local fieldNumeroPropostas = TField.new();
  fieldNumeroPropostas:setFonte(font_data);
  fieldNumeroPropostas:setTLabel(labelNumeroPropostas);
  fieldNumeroPropostas:setIsEditable(false);
  fieldNumeroPropostas:setLimiteMax(20);
  fieldNumeroPropostas:setPx(800);
  fieldNumeroPropostas:setPy(200);
  fieldNumeroPropostas:getTLabelTexto():setLargura(110);
  fieldNumeroPropostas:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldNumeroPropostas,16);
  
  --Menu na tela de detalhes
  local menu = TMenu.new();
  menu:addAllItens(CenaBuscaCandidatos:getItensMenuDetalhesCandidato(FrameVisualizarCandidato));
  menu:setOrientacao(TMenu.HORIZONTAL);
  menu:setTamanhoJanela(3);
  menu:setIsVisibleSetas(false);
  menu:setIsItensCentralizados(false);
  --  menu:setCorFoco(Cor.new({r=255,g=255,b=0,alpha=255}));
  menu:update();

  menu:setPx((panelDetalhesCandidato:getLargura() - menu:getLargura())/2);
  menu:setPy(300)
  
  panelDetalhesCandidato:addComponent(menu,17);
  

  return panelDetalhesCandidato;

end




--Controla a ação ao pressionar o botão amarelo (voltar) 
function FrameVisualizarCandidato:action(evt)
  if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoAmarelo(evt)) then

    if(CenaBuscaCandidatos.frameCorrente == FrameConsultarCandidato)then
      evt.rule_key = "acessarFrameConsultarCandidato";
    elseif(CenaBuscaCandidatos.frameCorrente == FrameConsultarCandidatoAvancado)then
      evt.rule_key = "acessarFrameConsultarCandidatoAvancado";
    end

  end
end
