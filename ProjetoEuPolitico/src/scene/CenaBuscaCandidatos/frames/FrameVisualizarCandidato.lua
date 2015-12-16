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

--  FrameVisualizarEscolaComparar:setComponents({});

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
  panelDetalhesCandidato:setAltura(300)--645);
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
  fieldNumeroMandatos:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldNumeroMandatos,11);
  
  
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
  fieldSituacao:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldSituacao,12);
  
  
  local labelTotalArrecadado = TLabel.new();
  labelTotalArrecadado:setTexto("Total Arrecadado:");
  labelTotalArrecadado:setFonte(font_label);
  
  local totalArrecadado = tostring(CenaBuscaCandidatos.candidatoSelecionado:getTotalArrecadado());
  local fieldTotalArrecadado = TField.new();
  fieldTotalArrecadado:setFonte(font_data);
  fieldTotalArrecadado:setTLabel(labelTotalArrecadado);
  fieldTotalArrecadado:setIsEditable(false);
  fieldTotalArrecadado:setTexto(totalArrecadado);
  fieldTotalArrecadado:setLimiteMax(20);
  fieldTotalArrecadado:setPx(800);
  fieldTotalArrecadado:setPy(80);
  fieldTotalArrecadado:getTLabelTexto():setLargura(210);
  fieldTotalArrecadado:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldTotalArrecadado,13);
  
  
  local labelTotalBens = TLabel.new();
  labelTotalBens:setTexto("Total Bens:");
  labelTotalBens:setFonte(font_label);
  
  local totalBens = tostring(CenaBuscaCandidatos.candidatoSelecionado:getTotalBens());
  local fieldTotalBens = TField.new();
  fieldTotalBens:setFonte(font_data);
  fieldTotalBens:setTLabel(labelTotalBens);
  fieldTotalBens:setIsEditable(false);
  fieldTotalBens:setLimiteMax(20);
  fieldTotalBens:setTexto(totalBens);
  fieldTotalBens:setPx(800);
  fieldTotalBens:setPy(120);
  fieldTotalBens:getTLabelTexto():setLargura(200);
  fieldTotalBens:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldTotalBens,14);
  
  
  local labelAssiduidade = TLabel.new();
  labelAssiduidade:setTexto("Assiduidade:");
  labelAssiduidade:setFonte(font_label);
  
  local fieldAssiduidade = TField.new();
  fieldAssiduidade:setFonte(font_data);
  fieldAssiduidade:setTLabel(labelAssiduidade);
  fieldAssiduidade:setIsEditable(false);
  fieldAssiduidade:setLimiteMax(20);
  fieldAssiduidade:setPx(800);
  fieldAssiduidade:setPy(160);
  fieldAssiduidade:getTLabelTexto():setLargura(110);
  fieldAssiduidade:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldAssiduidade,15);
  
  
  local labelNumeroComissoes = TLabel.new();
  labelNumeroComissoes:setTexto("Nº de comissões:");
  labelNumeroComissoes:setFonte(font_label);
  
  local fieldNumeroComissoes = TField.new();
  fieldNumeroComissoes:setFonte(font_data);
  fieldNumeroComissoes:setTLabel(labelNumeroComissoes);
  fieldNumeroComissoes:setIsEditable(false);
  fieldNumeroComissoes:setLimiteMax(20);
  fieldNumeroComissoes:setPx(800);
  fieldNumeroComissoes:setPy(200);
  fieldNumeroComissoes:getTLabelTexto():setLargura(110);
  fieldNumeroComissoes:getTLabelTexto():setCorFundo(Cor.new({r=255,g=255,b=255,alpha=0}));
  
  panelDetalhesCandidato:addComponent(fieldNumeroComissoes,16);
  

  return panelDetalhesCandidato;

end


function FrameVisualizarCandidato:getItensMenuDetalhesCandidato()

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



--  local menuDetalhes = TMenu.new();
--  menuDetalhes:addAllItens(FrameVisualizarCandidato:getItensMenuDetalhesCandidato());
--  menuDetalhes:setOrientacao(TMenu.HORIZONTAL);
--  menuDetalhes:setTamanhoJanela(4);
--  menuDetalhes:setIsVisibleSetas(false);
--  menuDetalhes:setIsItensCentralizados(false);
--  menuDetalhes:setCorFoco(Cor.new({r=255,g=255,b=0,alpha=255}));
--  menuDetalhes:update();
--
--  menuDetalhes:setPx(15)
--  menuDetalhes:setPy(400)
--  
--  FrameVisualizarCandidato:addComponent(menuDetalhes,17);


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
