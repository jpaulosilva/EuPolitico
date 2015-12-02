-- Imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');
BibliotecaAuxiliarScript.execute('data.ListaEscolas');
BibliotecaAuxiliarScript.execute('data.Escola');
BibliotecaAuxiliarScript.execute('data.FiltroEscola');


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

  FrameVisualizarEscolaComparar:setComponents({});

  if (CenaBuscaCandidatos.candidatoSelecionado ~= nil and not CenaBuscaCandidatos.isCarregandoDetalhes) then


    FrameVisualizarCandidato:addComponent(FrameVisualizarCandidato:buildPainelDetalhes(),2);
  

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

--[[Painel onde são mostrados todos os detalhes referentes à escola selecionada como endereço, situação de funcionamento,
notas de enem e ideb, assim como apresenta sua infraestrutura básica e os tipos de dependência presentes na escola]]--
function FrameVisualizarCandidato:buildPainelDetalhes()
  -- Incluir componentes gráficos
  local panelDetalhesCandidato= TPanel.new();
  panelDetalhesCandidato:setLargura(1270);
  panelDetalhesCandidato:setAltura(645);
  panelDetalhesCandidato:setPx(5);
  panelDetalhesCandidato:setPy(5);
  panelDetalhesCandidato:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}))--{r=200,g=255,b=255,alpha=255})); --{r=153,g=204,b=51,alpha=255}))



  local labelCandidato = TLabel.new();
  labelCandidato:setTexto("EU POLÍTICO");
  labelCandidato:setFonte(font_destaque);
  labelCandidato:setPx(0);
  labelCandidato:setPy(0);
  panelDetalhesCandidato:addComponent(labelCandidato,1);




--  local labelCod = TLabel.new();
--  labelCod:setTexto("Código:");
--  labelCod:setFonte(font_label);
--
--  local cod = tostring(CenaBuscaCandidatos.candidatoSelecionado:getCod());
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

  local nome = tostring(CenaBuscaCandidatos.candidatoSelecionado:getNomeCompleto());
  local fieldNome = TField.new();
  fieldNome:setFonte(font_data);
  fieldNome:setTLabel(labelNome);
  fieldNome:setIsEditable(false);
  fieldNome:setTexto(nome);
  fieldNome:setLimiteMax(20);
  fieldNome:setPx(5);
  fieldNome:setPy(40);
  fieldNome:getTLabelTexto():setLargura(1250);
  fieldNome:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));

  panelDetalhesCandidato:addComponent(fieldNome,3);



--  local labelRegiao = TLabel.new();
--  labelRegiao:setTexto("Região:");
--  labelRegiao:setFonte(font_label);
--
--  local regiao = tostring(CenaBuscaCandidatos.candidatoSelecionado:getRegiao());
--  local fieldRegiao = TField.new();
--  fieldRegiao:setFonte(font_data);
--  fieldRegiao:setTLabel(labelRegiao);
--  fieldRegiao:setIsEditable(false);
--  fieldRegiao:setTexto(regiao);
--  fieldRegiao:setPx(0);
--  fieldRegiao:setPy(120);
--  fieldRegiao:getTLabelTexto():setLargura(300);
--  fieldRegiao:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldRegiao,4);
--
--
--
--
--  local labelEstado = TLabel.new();
--  labelEstado:setTexto("Estado:");
--  labelEstado:setFonte(font_label);
--  
--
--  local estado = tostring(CenaBuscaCandidatos.candidatoSelecionado:getEstado());
--  local fieldEstado = TField.new();
--  fieldEstado:setFonte(font_data);
--  fieldEstado:setTLabel(labelEstado);
--  fieldEstado:setIsEditable(false);
--  fieldEstado:setTexto(estado);
--  fieldEstado:setPx(0);
--  fieldEstado:setPy(160);
--  fieldEstado:getTLabelTexto():setLargura(300);
--  fieldEstado:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldEstado,5);
--
--
--
--  local labelCidade = TLabel.new();
--  labelCidade:setTexto("Cidade:");
--  labelCidade:setFonte(font_label);
--
--  local cidade = tostring(CenaBuscaCandidatos.candidatoSelecionado:getCidade());
--  local fieldCidade = TField.new();
--  fieldCidade:setFonte(font_data);
--  fieldCidade:setTLabel(labelCidade);
--  fieldCidade:setIsEditable(false);
--  fieldCidade:setTexto(cidade);
--  fieldCidade:setPx(0);
--  fieldCidade:setPy(200);
--  fieldCidade:getTLabelTexto():setLargura(300);
--  fieldCidade:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldCidade,6);
--
--
--
--  local labelEndereco = TLabel.new();
--  labelEndereco:setTexto("Endereço:");
--  labelEndereco:setFonte(font_label);
--
--  local endereco = tostring(CenaBuscaCandidatos.candidatoSelecionado:getEndereco());
--  local fieldEndereco = TField.new();
--  fieldEndereco:setFonte(font_data);
--  fieldEndereco:setTLabel(labelEndereco);
--  fieldEndereco:setIsEditable(false);
--  fieldEndereco:setTexto(endereco);
--  fieldEndereco:setPx(0);
--  fieldEndereco:setPy(80);
--  fieldEndereco:getTLabelTexto():setLargura(1150);
--  fieldEndereco:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldEndereco,7);
--
--
--
--
--  local labelTipoLocalizacaoTxt = TLabel.new();
--  labelTipoLocalizacaoTxt:setTexto("Localização(zona):");
--  labelTipoLocalizacaoTxt:setFonte(font_label);
--
--  local tipoLocalizacaoTxt = tostring(CenaBuscaCandidatos.candidatoSelecionado:getTipoLocalizacao());
--  local fieldTipoLocalizacaoTxt = TField.new();
--  fieldTipoLocalizacaoTxt:setFonte(font_data);
--  fieldTipoLocalizacaoTxt:setTLabel(labelTipoLocalizacaoTxt);
--  fieldTipoLocalizacaoTxt:setIsEditable(false);
--  fieldTipoLocalizacaoTxt:setTexto(tipoLocalizacaoTxt);
--  fieldTipoLocalizacaoTxt:setPx(0);
--  fieldTipoLocalizacaoTxt:setPy(240);
--  fieldTipoLocalizacaoTxt:getTLabelTexto():setLargura(245);
--  fieldTipoLocalizacaoTxt:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldTipoLocalizacaoTxt,7);
--
--
--  local labelCod = TLabel.new();
--  labelCod:setTexto("Dependência Adm.:");
--  labelCod:setFonte(font_label);
--
--  local cod = tostring(CenaBuscaCandidatos.candidatoSelecionado:getDependenciaAdministrativa());
--  local fieldDependenciaAdm = TField.new();
--  fieldDependenciaAdm:setFonte(font_data);
--  fieldDependenciaAdm:setTLabel(labelCod);
--  fieldDependenciaAdm:setIsEditable(false);
--  fieldDependenciaAdm:setTexto(cod);
--  fieldDependenciaAdm:setPx(0);
--  fieldDependenciaAdm:setPy(280);
--  fieldDependenciaAdm:getTLabelTexto():setLargura(195);
--  fieldDependenciaAdm:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciaAdm,8);
--
--
--
--  local labelIdebAi = TLabel.new();
--  labelIdebAi:setTexto("IDEB anos iniciais:");
--  labelIdebAi:setFonte(font_label);
--
--  local idebAi = tostring(CenaBuscaCandidatos.candidatoSelecionado:getIdebAI());
--  local fieldIdebAi = TField.new();
--  fieldIdebAi:setFonte(font_data);
--  fieldIdebAi:setTLabel(labelIdebAi);
--  fieldIdebAi:setIsEditable(false);
--  fieldIdebAi:setTexto(idebAi);
--  fieldIdebAi:setPx(0);
--  fieldIdebAi:setPy(320);
--  fieldIdebAi:getTLabelTexto():setLargura(250);
--  fieldIdebAi:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldIdebAi,9);
--
--
--
--  local labelIdebAf = TLabel.new();
--  labelIdebAf:setTexto("IDEB anos finais:");
--  labelIdebAf:setFonte(font_label);
--
--  local idebAf = tostring(CenaBuscaCandidatos.candidatoSelecionado:getIdebAF());
--  local fieldIdebAf = TField.new();
--  fieldIdebAf:setFonte(font_data);
--  fieldIdebAf:setTLabel(labelIdebAf);
--  fieldIdebAf:setIsEditable(false);
--  fieldIdebAf:setTexto(idebAf);
--  fieldIdebAf:setPx(0);
--  fieldIdebAf:setPy(360);
--  fieldIdebAf:getTLabelTexto():setLargura(262);
--  fieldIdebAf:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldIdebAf,10);
--
--
--
--  local labelRegulamentada = TLabel.new();
--  labelRegulamentada:setTexto("Regulamentada:");
--  labelRegulamentada:setFonte(font_label);
--
--  local regulamentada = tostring(CenaBuscaCandidatos.candidatoSelecionado:getRegulamentada());
--  local fieldRegulamentada = TField.new();
--  fieldRegulamentada:setFonte(font_data);
--  fieldRegulamentada:setTLabel(labelRegulamentada);
--  fieldRegulamentada:setIsEditable(false);
--  fieldRegulamentada:setTexto(regulamentada);
--  fieldRegulamentada:setPx(0);
--  fieldRegulamentada:setPy(400);
--  fieldRegulamentada:getTLabelTexto():setLargura(272);
--  fieldRegulamentada:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldRegulamentada,11);
--
--
--  local labelSituacaoFuncionamento = TLabel.new();
--  labelSituacaoFuncionamento:setTexto("Situação:");
--  labelSituacaoFuncionamento:setFonte(font_label);
--
--  local situacaoFuncionamento = tostring(CenaBuscaCandidatos.candidatoSelecionado:getSituacaoFuncionamento());
--  local fieldSituacaoFuncionamento = TField.new();
--  fieldSituacaoFuncionamento:setFonte(font_data);
--  fieldSituacaoFuncionamento:setTLabel(labelSituacaoFuncionamento);
--  fieldSituacaoFuncionamento:setIsEditable(false);
--  fieldSituacaoFuncionamento:setTexto(situacaoFuncionamento);
--  fieldSituacaoFuncionamento:setPx(0);
--  fieldSituacaoFuncionamento:setPy(440);
--  fieldSituacaoFuncionamento:getTLabelTexto():setLargura(306);
--  fieldSituacaoFuncionamento:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldSituacaoFuncionamento,12);
--
--
--
--  local labelInicioAno = TLabel.new();
--  labelInicioAno:setTexto("Início do ano letivo:");
--  labelInicioAno:setFonte(font_label);
--
--  local inicioAno = tostring(CenaBuscaCandidatos.candidatoSelecionado:getInicioAno());
--  local fieldInicioAno = TField.new();
--  fieldInicioAno:setFonte(font_data);
--  fieldInicioAno:setTLabel(labelInicioAno);
--  fieldInicioAno:setIsEditable(false);
--  fieldInicioAno:setTexto(inicioAno);
--  fieldInicioAno:setPx(0);
--  fieldInicioAno:setPy(480);
--  fieldInicioAno:getTLabelTexto():setLargura(216);
--  fieldInicioAno:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldInicioAno,13);
--
--
--
--  local labelFimAno = TLabel.new();
--  labelFimAno:setTexto("Fim do ano letivo:");
--  labelFimAno:setFonte(font_label);
--
--  local fimAno = tostring(CenaBuscaCandidatos.candidatoSelecionado:getFimAno());
--  local fieldFimAno = TField.new();
--  fieldFimAno:setFonte(font_data);
--  fieldFimAno:setTLabel(labelFimAno);
--  fieldFimAno:setIsEditable(false);
--  fieldFimAno:setTexto(fimAno);
--  fieldFimAno:setPx(0);
--  fieldFimAno:setPy(520);
--  fieldFimAno:getTLabelTexto():setLargura(230);
--  fieldFimAno:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldFimAno,14);
--
--
--
--  local labelEnemGeral = TLabel.new();
--  labelEnemGeral:setTexto("Enem Geral:");
--  labelEnemGeral:setFonte(font_label);
--
--  local enemGeral = tostring(CenaBuscaCandidatos.candidatoSelecionado:getEnemGeral());
--  local fieldEnemGeral = TField.new();
--  fieldEnemGeral:setFonte(font_data);
--  fieldEnemGeral:setTLabel(labelEnemGeral);
--  fieldEnemGeral:setIsEditable(false);
--  fieldEnemGeral:setTexto(enemGeral);
--  fieldEnemGeral:setPx(0);
--  fieldEnemGeral:setPy(560);
--  fieldEnemGeral:getTLabelTexto():setLargura(278);
--  fieldEnemGeral:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldEnemGeral,15);
--
--
--
--
--  local labelInfraBasica = TLabel.new();
--  labelInfraBasica:setTexto("Infraestrutura Básica");
--  labelInfraBasica:setFonte(font_destaque);
--  labelInfraBasica:setPx(350);
--  labelInfraBasica:setPy(120);
--  panelDetalhesEscola:addComponent(labelInfraBasica,16);
--
--
--  local labelAbastecimetoAgua = TLabel.new();
--  labelAbastecimetoAgua:setTexto("Abastecimento de Água:");
--  labelAbastecimetoAgua:setFonte(font_label);
--  labelAbastecimetoAgua:setPx(350);
--  labelAbastecimetoAgua:setPy(160);
--  panelDetalhesEscola:addComponent(labelAbastecimetoAgua,17);
--
--
--  local aguaPublica = tostring(CenaBuscaCandidatos.candidatoSelecionado:getAguaPublica());
--  if aguaPublica == "true" then
--    aguaPublica = "Água pública";
--  else
--    aguaPublica = "";
--  end
--
--
--  local aguaPocoArtesiano = tostring(CenaBuscaCandidatos.candidatoSelecionado:getAguaPocoArtesiano());
--  if aguaPocoArtesiano == "true" then
--    aguaPocoArtesiano = "Poço artesiano";
--  else
--    aguaPocoArtesiano = "";
--  end
--
--
--  local aguaCacimba = tostring(CenaBuscaCandidatos.candidatoSelecionado:getAguaCacimba());
--  if aguaCacimba == "true" then
--    aguaCacimba = "Cacimba";
--  else
--    aguaCacimba = "";
--  end
--
--
--  local aguaRio = tostring(CenaBuscaCandidatos.candidatoSelecionado:getAguaCacimba());
--  if aguaRio == "true" then
--    aguaRio = "Rio";
--  else
--    aguaRio = "";
--  end
--
--
--  local aguaInexistente = tostring(CenaBuscaCandidatos.candidatoSelecionado:getAguaInexistente());
--  if aguaInexistente == "true" then
--    aguaInexistente = "Inexistente";
--  else
--    aguaInexistente = ""
--  end
--
--  local fieldAguaPublica = TField.new();
--  fieldAguaPublica:setFonte(font_data);
--  fieldAguaPublica:setIsEditable(false);
--  fieldAguaPublica:setTexto(aguaPublica.." "..aguaPocoArtesiano.." "..aguaCacimba.." "..aguaRio.." "..aguaInexistente);
--  fieldAguaPublica:setPx(350);
--  fieldAguaPublica:setPy(200);
--  fieldAguaPublica:getTLabelTexto():setLargura(300);
--  fieldAguaPublica:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldAguaPublica,18);
--
--
--
--  local labelEnergia = TLabel.new();
--  labelEnergia:setTexto("Energia:");
--  labelEnergia:setFonte(font_label);
--  labelEnergia:setPx(350);
--  labelEnergia:setPy(240);
--  panelDetalhesEscola:addComponent(labelEnergia,19);
--
--
--  local energiaPublica = tostring(CenaBuscaCandidatos.candidatoSelecionado:getEnergiaPublica());
--  if energiaPublica == "true" then
--    energiaPublica = "Energia pública";
--  else
--    energiaPublica = "";
--  end
--
--  local energiaGerador = tostring(CenaBuscaCandidatos.candidatoSelecionado:getEnergiaGerador());
--  if energiaGerador == "true" then
--    energiaGerador = "Energia gerador";
--  else
--    energiaGerador = "";
--  end
--
--
--  local energiaOutros = tostring(CenaBuscaCandidatos.candidatoSelecionado:getEnergiaGerador());
--  if energiaOutros == "true" then
--    energiaOutros = "Energia outros";
--  else
--    energiaOutros = "";
--  end
--
--
--  local energiaInexistente = tostring(CenaBuscaCandidatos.candidatoSelecionado:getEnergiaInexistente());
--  if energiaInexistente == "true" then
--    energiaInexistente = "Energia inexistente";
--  else
--    energiaInexistente = "";
--  end
--
--
--  local fieldEnergia = TField.new();
--  fieldEnergia:setFonte(font_data);
--  fieldEnergia:setIsEditable(false);
--  fieldEnergia:setTexto(energiaPublica.." "..energiaGerador.." "..energiaOutros.." "..energiaInexistente);
--  fieldEnergia:setPx(350);
--  fieldEnergia:setPy(280);
--  fieldEnergia:getTLabelTexto():setLargura(300);
--  fieldEnergia:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldEnergia,20);
--
--
--
--  local labelEsgoto = TLabel.new();
--  labelEsgoto:setTexto("Esgoto Sanitário:");
--  labelEsgoto:setFonte(font_label);
--  labelEsgoto:setPx(350);
--  labelEsgoto:setPy(320);
--  panelDetalhesEscola:addComponent(labelEsgoto,21);
--
--
--
--  local esgotoPublico = tostring(CenaBuscaCandidatos.candidatoSelecionado:getEsgotoPublico());
--  if esgotoPublico == "true" then
--    esgotoPublico = "Esgoto público";
--  else
--    esgotoPublico = "";
--  end
--
--
--
--  local esgotoFossa = tostring(CenaBuscaCandidatos.candidatoSelecionado:getEsgotoFossa());
--  if esgotoFossa == "true" then
--    esgotoFossa = "Fossa";
--  else
--    esgotoFossa = "";
--  end
--
--
--
--
--  local esgotoInexistente = tostring(CenaBuscaCandidatos.candidatoSelecionado:getEsgotoInexistente());
--  if esgotoInexistente == "true" then
--    esgotoInexistente = "Inexistente"
--  else
--    esgotoInexistente = ""
--  end
--
--
--
--  local fieldEsgoto = TField.new();
--  fieldEsgoto:setFonte(font_data);
--  fieldEsgoto:setIsEditable(false);
--  fieldEsgoto:setTexto(esgotoPublico.." "..esgotoFossa.." "..esgotoInexistente);
--  fieldEsgoto:setPx(350);
--  fieldEsgoto:setPy(360);
--  fieldEsgoto:getTLabelTexto():setLargura(300);
--  fieldEsgoto:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldEsgoto,22);
--
--
--
--  local labelDestinacaoLixo = TLabel.new();
--  labelDestinacaoLixo:setTexto("Destinação do lixo:");
--  labelDestinacaoLixo:setFonte(font_label);
--  labelDestinacaoLixo:setPx(350);
--  labelDestinacaoLixo:setPy(400);
--  panelDetalhesEscola:addComponent(labelDestinacaoLixo,23);
--
--
--
--  local lixoColetaPeriodica = tostring(CenaBuscaCandidatos.candidatoSelecionado:getLixoColetaPeriodica());
--  if lixoColetaPeriodica == "true" then
--    lixoColetaPeriodica = "Coleta periódica"
--  else
--    lixoColetaPeriodica = ""
--  end
--
--
--  local lixoQueima = tostring(CenaBuscaCandidatos.candidatoSelecionado:getLixoQueima());
--  if lixoQueima == "true" then
--    lixoQueima = "Queima"
--  else
--    lixoQueima = ""
--  end
--
--
--  local lixoJogaOutraArea = tostring(CenaBuscaCandidatos.candidatoSelecionado:getLixoJogaOutraArea());
--  if lixoJogaOutraArea == "true" then
--    lixoJogaOutraArea = "Joga em outra área"
--  else
--    lixoJogaOutraArea = ""
--  end
--
--
--
--
--  local lixoRecicla = tostring(CenaBuscaCandidatos.candidatoSelecionado:getLixoRecicla());
--  if lixoRecicla == "true" then
--    lixoRecicla = "Recicla"
--  else
--    lixoRecicla = ""
--  end
--
--
--
--  local lixoEnterra = tostring(CenaBuscaCandidatos.candidatoSelecionado:getLixoEnterra());
--  if lixoEnterra == "true" then
--    lixoEnterra = "Enterra"
--  else
--    lixoEnterra = ""
--  end
--
--
--
--  local lixoOutros = tostring(CenaBuscaCandidatos.candidatoSelecionado:getLixoOutros());
--  if lixoOutros == "true" then
--    lixoOutros= "Outros"
--  else
--    lixoOutros = ""
--  end
--
--
--
--  local fieldLixo = TField.new();
--  fieldLixo:setFonte(font_data);
--  fieldLixo:setIsEditable(false);
--  fieldLixo:setTexto(lixoColetaPeriodica.." "..lixoQueima.." "..lixoJogaOutraArea.." "..lixoRecicla.." "..lixoEnterra.." "..lixoOutros);
--  fieldLixo:setPx(350);
--  fieldLixo:setPy(440);
--  fieldLixo:getTLabelTexto():setLargura(300);
--  fieldLixo:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldLixo,24);
--
--
--
--
--
--  local labelAguaFiltrada = TLabel.new();
--  labelAguaFiltrada:setTexto("Água consumida pelos alunos:");
--  labelAguaFiltrada:setFonte(font_label);
--  labelAguaFiltrada:setPx(350);
--  labelAguaFiltrada:setPy(480);
--  panelDetalhesEscola:addComponent(labelAguaFiltrada,25);
--
--  local aguaFiltrada = tostring(CenaBuscaCandidatos.candidatoSelecionado:getAguaFiltrada());
--  if aguaFiltrada == "true" then
--    aguaFiltrada = "Filtrada"
--  else
--    if situacaoFuncionamento == "Paralisada" or situacaoFuncionamento == "Extinta" or situacaoFuncionamento == "Extinta no ano anterior" then
--      aguaFiltrada = ""
--    else
--      aguaFiltrada = "Não filtrada"
--    end
--  end
--
--
--  local fieldAguaConsumida = TField.new();
--  fieldAguaConsumida:setFonte(font_data);
--  fieldAguaConsumida:setIsEditable(false);
--  fieldAguaConsumida:setTexto(aguaFiltrada);
--  fieldAguaConsumida:setPx(350);
--  fieldAguaConsumida:setPy(520);
--  fieldAguaConsumida:getTLabelTexto():setLargura(300);
--  fieldAguaConsumida:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldAguaConsumida,26);
--
--
--
--  local labelDependencias = TLabel.new();
--  labelDependencias:setTexto("Dependências");
--  labelDependencias:setFonte(font_destaque);
--  labelDependencias:setPx(700);
--  labelDependencias:setPy(120);
--  panelDetalhesEscola:addComponent(labelDependencias,27);
--
--
--
--  local salaDiretoria = tostring(CenaBuscaCandidatos.candidatoSelecionado:getSalaDiretoria());
--  if salaDiretoria == "true" then
--    salaDiretoria = "Sala de Diretoria"
--  else
--    salaDiretoria = ""
--  end
--
--
--  local labInformatica = tostring(CenaBuscaCandidatos.candidatoSelecionado:getLaboratorioInformatica());
--  if labInformatica == "true" then
--    labInformatica = "Laboratório de informática";
--  else
--    labInformatica = "";
--  end
--
--
--
--  local biblioteca = tostring(CenaBuscaCandidatos.candidatoSelecionado:getBiblioteca());
--  if biblioteca == "true" then
--    biblioteca = "Biblioteca";
--  else
--    biblioteca = "";
--  end
--
--
--  local labCiencias = tostring(CenaBuscaCandidatos.candidatoSelecionado:getLaboratorioCiencias());
--  if labCiencias == "true" then
--    labCiencias = "Laboratório de ciências";
--  else
--    labCiencias = "";
--  end
--
--
--
--  local salaLeitura = tostring(CenaBuscaCandidatos.candidatoSelecionado:getSalaLeitura());
--  if salaLeitura == "true" then
--    salaLeitura = "Sala de leitura";
--  else
--    salaLeitura = "";
--  end
--
--
--
--  local despensa = tostring(CenaBuscaCandidatos.candidatoSelecionado:getDespensa());
--  if despensa == "true" then
--    despensa = "Despensa";
--  else
--    despensa = "";
--  end
--
--
--
--  local refeitorio = tostring(CenaBuscaCandidatos.candidatoSelecionado:getRefeitorio());
--  if refeitorio == "true" then
--    refeitorio = "Refeitório";
--  else
--    refeitorio = "";
--  end
--
--
--  local almoxarifado = tostring(CenaBuscaCandidatos.candidatoSelecionado:getAlmoxarifado());
--  if almoxarifado == "true" then
--    almoxarifado = "Almoxarifado";
--  else
--    almoxarifado = "";
--  end
--
--
--
--  local auditorio = tostring(CenaBuscaCandidatos.candidatoSelecionado:getAuditorio());
--  if auditorio == "true" then
--    auditorio = "Auditório";
--  else
--    auditorio = "";
--  end
--
--
--
--  local patioCoberto = tostring(CenaBuscaCandidatos.candidatoSelecionado:getPatioCoberto());
--  if patioCoberto == "true" then
--    patioCoberto = "Pátio coberto";
--  else
--    patioCoberto = "";
--  end
--
--
--
--  local areaVerde = tostring(CenaBuscaCandidatos.candidatoSelecionado:getAreaVerde());
--  if areaVerde == "true" then
--    areaVerde = "Área verde";
--  else
--    areaVerde = "";
--  end
--
--
--
--
--  local lavanderia = tostring(CenaBuscaCandidatos.candidatoSelecionado:getLavanderia());
--  if lavanderia == "true" then
--    lavanderia = "Lavanderia";
--  else
--    lavanderia = "";
--  end
--
--
--
--  local salaProfessores = tostring(CenaBuscaCandidatos.candidatoSelecionado:getSalaProfessores());
--  if salaProfessores == "true" then
--    salaProfessores = "Sala de professores";
--  else
--    salaProfessores = "";
--  end
--
--
--
--  local atendimentoEspecial = tostring(CenaBuscaCandidatos.candidatoSelecionado:getAtendimentoEspecial());
--  if atendimentoEspecial == "true" then
--    atendimentoEspecial = "Atendimento especial";
--  else
--    atendimentoEspecial = "";
--  end
--
--
--
--  local quadraCoberta = tostring(CenaBuscaCandidatos.candidatoSelecionado:getQuadraCoberta());
--  if quadraCoberta == "true" then
--    quadraCoberta = "Quadra coberta";
--  else
--    quadraCoberta = "";
--  end
--
--
--
--  local cozinha = tostring(CenaBuscaCandidatos.candidatoSelecionado:getCozinha());
--  if cozinha == "true" then
--    cozinha = "Cozinha";
--  else
--    cozinha = "";
--  end
--
--
--
--  local parqueInfantil = tostring(CenaBuscaCandidatos.candidatoSelecionado:getParqueInfantil());
--  if parqueInfantil == "true" then
--    parqueInfantil = "Parque infantil";
--  else
--    parqueInfantil = "";
--  end
--
--
--
--  local bercario = tostring(CenaBuscaCandidatos.candidatoSelecionado:getBercario());
--  if bercario == "true" then
--    bercario = "Berçário";
--  else
--    bercario = "";
--  end
--
--
--
--  local secretaria = tostring(CenaBuscaCandidatos.candidatoSelecionado:getSecretaria());
--  if secretaria == "true" then
--    secretaria = "Secretaria";
--  else
--    secretaria = "";
--  end
--
--
--
--  local sanitarioForaPredio = tostring(CenaBuscaCandidatos.candidatoSelecionado:getSanitarioForaPredio());
--  if sanitarioForaPredio == "true" then
--    sanitarioForaPredio = "Banheiro fora do prédio";
--  else
--    sanitarioForaPredio = "";
--  end
--
--
--
--  local sanitarioDentroPredio = tostring(CenaBuscaCandidatos.candidatoSelecionado:getSanitarioDentroPredio());
--  if sanitarioDentroPredio == "true" then
--    sanitarioDentroPredio = "Banheiro dentro do prédio";
--  else
--    sanitarioDentroPredio = "";
--  end
--
--
--
--  local dependenciasPNE = tostring(CenaBuscaCandidatos.candidatoSelecionado:getDependenciasPNE());
--  if dependenciasPNE == "true" then
--    dependenciasPNE = "Dep. para mobilidade reduzida";
--  else
--    dependenciasPNE = "";
--  end
--
--
--
--
--  local banheiroChuveiro = tostring(CenaBuscaCandidatos.candidatoSelecionado:getBanheiroChuveiro());
--  if banheiroChuveiro == "true" then
--    banheiroChuveiro = "Banheiro com chuveiro";
--  else
--    banheiroChuveiro = "";
--  end
--
--
--
--
--  local alojamentoAluno = tostring(CenaBuscaCandidatos.candidatoSelecionado:getAlojamentoAluno());
--  if alojamentoAluno == "true" then
--    alojamentoAluno = "Alojamento de aluno";
--  else
--    alojamentoAluno = "";
--  end
--
--
--  local itensDependencia = {salaDiretoria,labCiencias,labInformatica,biblioteca,salaLeitura,salaProfessores,secretaria,
--    bercario,parqueInfantil,cozinha,quadraCoberta,banheiroChuveiro,lavanderia,sanitarioDentroPredio,sanitarioForaPredio,
--    areaVerde,patioCoberto,auditorio,almoxarifado,refeitorio,despensa,alojamentoAluno,atendimentoEspecial,dependenciasPNE};
--
--  local dependenciasSelecionadas = {};
--  
--  for key, var in pairs(itensDependencia) do
--    if var ~= "" then
--       table.insert(dependenciasSelecionadas,var);
--    end
--  end
--  
--  
--  local fieldDependenciasLinha1 = TField.new();
--  fieldDependenciasLinha1:setFonte(font_data);
--  fieldDependenciasLinha1:setIsEditable(false);
--  fieldDependenciasLinha1:setTexto(dependenciasSelecionadas[1]);
--  fieldDependenciasLinha1:setPx(700);
--  fieldDependenciasLinha1:setPy(160);
--  fieldDependenciasLinha1:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha1:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha1,28);
--
--
--  local fieldDependenciasLinha2 = TField.new();
--  fieldDependenciasLinha2:setFonte(font_data);
--  fieldDependenciasLinha2:setIsEditable(false);
--  fieldDependenciasLinha2:setTexto(dependenciasSelecionadas[2]);
--  fieldDependenciasLinha2:setPx(700);
--  fieldDependenciasLinha2:setPy(200);
--  fieldDependenciasLinha2:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha2:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha2,29);
--
--
--
--  local fieldDependenciasLinha3 = TField.new();
--  fieldDependenciasLinha3:setFonte(font_data);
--  fieldDependenciasLinha3:setIsEditable(false);
--  fieldDependenciasLinha3:setTexto(dependenciasSelecionadas[3]);
--  fieldDependenciasLinha3:setPx(700);
--  fieldDependenciasLinha3:setPy(240);
--  fieldDependenciasLinha3:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha3:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha3,30);
--
--
--
--  local fieldDependenciasLinha4 = TField.new();
--  fieldDependenciasLinha4:setFonte(font_data);
--  fieldDependenciasLinha4:setIsEditable(false);
--  fieldDependenciasLinha4:setTexto(dependenciasSelecionadas[4]);
--  fieldDependenciasLinha4:setPx(700);
--  fieldDependenciasLinha4:setPy(280);
--  fieldDependenciasLinha4:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha4:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha4,31);
--
--
--
--  local fieldDependenciasLinha5 = TField.new();
--  fieldDependenciasLinha5:setFonte(font_data);
--  fieldDependenciasLinha5:setIsEditable(false);
--  fieldDependenciasLinha5:setTexto(dependenciasSelecionadas[5]);
--  fieldDependenciasLinha5:setPx(700);
--  fieldDependenciasLinha5:setPy(320);
--  fieldDependenciasLinha5:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha5:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha5,32);
--
--
--
--  local fieldDependenciasLinha6 = TField.new();
--  fieldDependenciasLinha6:setFonte(font_data);
--  fieldDependenciasLinha6:setIsEditable(false);
--  fieldDependenciasLinha6:setTexto(dependenciasSelecionadas[6]);
--  fieldDependenciasLinha6:setPx(700);
--  fieldDependenciasLinha6:setPy(360);
--  fieldDependenciasLinha6:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha6:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha6,33);
--
--
--
--  local fieldDependenciasLinha7 = TField.new();
--  fieldDependenciasLinha7:setFonte(font_data);
--  fieldDependenciasLinha7:setIsEditable(false);
--  fieldDependenciasLinha7:setTexto(dependenciasSelecionadas[7]);
--  fieldDependenciasLinha7:setPx(700);
--  fieldDependenciasLinha7:setPy(400);
--  fieldDependenciasLinha7:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha7:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha7,34);
--
--
--
--  local fieldDependenciasLinha8 = TField.new();
--  fieldDependenciasLinha8:setFonte(font_data);
--  fieldDependenciasLinha8:setIsEditable(false);
--  fieldDependenciasLinha8:setTexto(dependenciasSelecionadas[8]);
--  fieldDependenciasLinha8:setPx(700);
--  fieldDependenciasLinha8:setPy(440);
--  fieldDependenciasLinha8:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha8:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha8,35);
--
--
--
--  local fieldDependenciasLinha9 = TField.new();
--  fieldDependenciasLinha9:setFonte(font_data);
--  fieldDependenciasLinha9:setIsEditable(false);
--  fieldDependenciasLinha9:setTexto(dependenciasSelecionadas[9]);
--  fieldDependenciasLinha9:setPx(700);
--  fieldDependenciasLinha9:setPy(480);
--  fieldDependenciasLinha9:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha9:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha9,36);
--
--
--
--
--  local fieldDependenciasLinha10 = TField.new();
--  fieldDependenciasLinha10:setFonte(font_data);
--  fieldDependenciasLinha10:setIsEditable(false);
--  fieldDependenciasLinha10:setTexto(dependenciasSelecionadas[10]);
--  fieldDependenciasLinha10:setPx(700);
--  fieldDependenciasLinha10:setPy(520);
--  fieldDependenciasLinha10:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha10:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha10,37);
--  
--  
--  
--  local fieldDependenciasLinha11 = TField.new();
--  fieldDependenciasLinha11:setFonte(font_data);
--  fieldDependenciasLinha11:setIsEditable(false);
--  fieldDependenciasLinha11:setTexto(dependenciasSelecionadas[11]);
--  fieldDependenciasLinha11:setPx(700);
--  fieldDependenciasLinha11:setPy(560);
--  fieldDependenciasLinha11:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha11:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha11,38);
--  
--  
--  
--  local fieldDependenciasLinha12 = TField.new();
--  fieldDependenciasLinha12:setFonte(font_data);
--  fieldDependenciasLinha12:setIsEditable(false);
--  fieldDependenciasLinha12:setTexto(dependenciasSelecionadas[12]);
--  fieldDependenciasLinha12:setPx(700);
--  fieldDependenciasLinha12:setPy(600);
--  fieldDependenciasLinha12:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha12:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha12,39);
--  
--  
--  
--  
--  local fieldDependenciasLinha13 = TField.new();
--  fieldDependenciasLinha13:setFonte(font_data);
--  fieldDependenciasLinha13:setIsEditable(false);
--  fieldDependenciasLinha13:setTexto(dependenciasSelecionadas[13]);
--  fieldDependenciasLinha13:setPx(980);
--  fieldDependenciasLinha13:setPy(120);
--  fieldDependenciasLinha13:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha13:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha13,40);
--  
--  
--  local fieldDependenciasLinha14 = TField.new();
--  fieldDependenciasLinha14:setFonte(font_data);
--  fieldDependenciasLinha14:setIsEditable(false);
--  fieldDependenciasLinha14:setTexto(dependenciasSelecionadas[14]);
--  fieldDependenciasLinha14:setPx(980);
--  fieldDependenciasLinha14:setPy(160);
--  fieldDependenciasLinha14:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha14:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha14,41);
--  
--  
--  local fieldDependenciasLinha15 = TField.new();
--  fieldDependenciasLinha15:setFonte(font_data);
--  fieldDependenciasLinha15:setIsEditable(false);
--  fieldDependenciasLinha15:setTexto(dependenciasSelecionadas[15]);
--  fieldDependenciasLinha15:setPx(980);
--  fieldDependenciasLinha15:setPy(200);
--  fieldDependenciasLinha15:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha15:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha15,42);
--  
--  
--  local fieldDependenciasLinha16 = TField.new();
--  fieldDependenciasLinha16:setFonte(font_data);
--  fieldDependenciasLinha16:setIsEditable(false);
--  fieldDependenciasLinha16:setTexto(dependenciasSelecionadas[16]);
--  fieldDependenciasLinha16:setPx(980);
--  fieldDependenciasLinha16:setPy(240);
--  fieldDependenciasLinha16:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha16:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha16,43);
--  
--  
--  local fieldDependenciasLinha17 = TField.new();
--  fieldDependenciasLinha17:setFonte(font_data);
--  fieldDependenciasLinha17:setIsEditable(false);
--  fieldDependenciasLinha17:setTexto(dependenciasSelecionadas[17]);
--  fieldDependenciasLinha17:setPx(980);
--  fieldDependenciasLinha17:setPy(280);
--  fieldDependenciasLinha17:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha17:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha17,44);
--  
--  
--  local fieldDependenciasLinha18 = TField.new();
--  fieldDependenciasLinha18:setFonte(font_data);
--  fieldDependenciasLinha18:setIsEditable(false);
--  fieldDependenciasLinha18:setTexto(dependenciasSelecionadas[18]);
--  fieldDependenciasLinha18:setPx(980);
--  fieldDependenciasLinha18:setPy(320);
--  fieldDependenciasLinha18:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha18:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha18,45);
--  
--  
--  local fieldDependenciasLinha19 = TField.new();
--  fieldDependenciasLinha19:setFonte(font_data);
--  fieldDependenciasLinha19:setIsEditable(false);
--  fieldDependenciasLinha19:setTexto(dependenciasSelecionadas[19]);
--  fieldDependenciasLinha19:setPx(980);
--  fieldDependenciasLinha19:setPy(360);
--  fieldDependenciasLinha19:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha19:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha19,46);
--  
--  
--  local fieldDependenciasLinha20 = TField.new();
--  fieldDependenciasLinha20:setFonte(font_data);
--  fieldDependenciasLinha20:setIsEditable(false);
--  fieldDependenciasLinha20:setTexto(dependenciasSelecionadas[20]);
--  fieldDependenciasLinha20:setPx(980);
--  fieldDependenciasLinha20:setPy(400);
--  fieldDependenciasLinha20:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha20:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha20,47);
--  
--  
--  local fieldDependenciasLinha21 = TField.new();
--  fieldDependenciasLinha21:setFonte(font_data);
--  fieldDependenciasLinha21:setIsEditable(false);
--  fieldDependenciasLinha21:setTexto(dependenciasSelecionadas[21]);
--  fieldDependenciasLinha21:setPx(980);
--  fieldDependenciasLinha21:setPy(440);
--  fieldDependenciasLinha21:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha21:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha21,48);
--  
--  
--  local fieldDependenciasLinha22 = TField.new();
--  fieldDependenciasLinha22:setFonte(font_data);
--  fieldDependenciasLinha22:setIsEditable(false);
--  fieldDependenciasLinha22:setTexto(dependenciasSelecionadas[22]);
--  fieldDependenciasLinha22:setPx(980);
--  fieldDependenciasLinha22:setPy(480);
--  fieldDependenciasLinha22:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha22:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha22,49);
--  
--  
--  local fieldDependenciasLinha23 = TField.new();
--  fieldDependenciasLinha23:setFonte(font_data);
--  fieldDependenciasLinha23:setIsEditable(false);
--  fieldDependenciasLinha23:setTexto(dependenciasSelecionadas[23]);
--  fieldDependenciasLinha23:setPx(980);
--  fieldDependenciasLinha23:setPy(520);
--  fieldDependenciasLinha23:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha23:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha23,50);
--  
--  
--  local fieldDependenciasLinha24 = TField.new();
--  fieldDependenciasLinha24:setFonte(font_data);
--  fieldDependenciasLinha24:setIsEditable(false);
--  fieldDependenciasLinha24:setTexto(dependenciasSelecionadas[24]);
--  fieldDependenciasLinha24:setPx(980);
--  fieldDependenciasLinha24:setPy(560);
--  fieldDependenciasLinha24:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha24:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha24,51);
--  
--  
--  local fieldDependenciasLinha25 = TField.new();
--  fieldDependenciasLinha25:setFonte(font_data);
--  fieldDependenciasLinha25:setIsEditable(false);
--  fieldDependenciasLinha25:setTexto(dependenciasSelecionadas[25]);
--  fieldDependenciasLinha25:setPx(980);
--  fieldDependenciasLinha25:setPy(600);
--  fieldDependenciasLinha25:getTLabelTexto():setLargura(270);
--  fieldDependenciasLinha25:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
--  panelDetalhesEscola:addComponent(fieldDependenciasLinha25,52);
--



  return panelDetalhesCandidato;

end



--Controla a ação ao pressionar o botão amarelo (voltar) e o botão verde (tela de comparação com os dados estatísticos) 
function FrameVisualizarCandidato:action(evt)
  if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoAmarelo(evt)) then

    if(CenaBuscaCandidatos.frameCorrente == FrameConsultarCandidato)then
      evt.rule_key = "acessarFrameConsultarCandidato";
    elseif(CenaBuscaCandidatos.frameCorrente == FrameConsultarCandidatoAvancado)then
      evt.rule_key = "acessarFrameConsultarCandidatoAvancado";
    end
  elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoVerde(evt)) then
    CenaBuscaCandidatos.filtroNacional:setTipoLocal("NAC");
    CenaBuscaCandidatos.filtroRegional:setRegiaoGeografica(CenaBuscaCandidatos.candidatoSelecionado:getRegiao());
    CenaBuscaCandidatos.filtroEstadual:setEstado(CenaBuscaCandidatos.candidatoSelecionado:getEstado());
    CenaBuscaCandidatos.filtroMunicipal:setCidade(CenaBuscaCandidatos.candidatoSelecionado:getCodMunicipio());

    CenaBuscaCandidatos:pesquisarVisualizarEscolaComparar();
    evt.rule_key = "acessarFrameVisualizarEscolaComparar";
  end
end
