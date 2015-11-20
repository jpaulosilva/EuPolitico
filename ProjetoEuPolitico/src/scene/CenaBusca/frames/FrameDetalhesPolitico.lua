-- Imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');
BibliotecaAuxiliarScript.execute('utils.Utils');

FrameDetalhesPolitico = TFrame.new();
FrameDetalhesPolitico.id = 'FrameDetalhesPolitico';

function FrameDetalhesPolitico:inicialize()

   -- Alterar propriedades do FrameVisualizarEscola
  FrameDetalhesPolitico:setLargura(1280);
  FrameDetalhesPolitico:setAltura(720);
  FrameDetalhesPolitico:setPx(0);
  FrameDetalhesPolitico:setPy(0);
  FrameDetalhesPolitico:setCorFundo(CenaBusca.cor);
  
  FrameDetalhesPolitico.painelDetalhes = FrameDetalhesPolitico:buildPainelDetalhes(FrameDetalhesPolitico);
  FrameDetalhesPolitico.painelTabela = FrameDetalhesPolitico:buildPainelTabela(FrameDetalhesPolitico);
  
  FrameDetalhesPolitico:addComponent(FrameDetalhesPolitico.painelDetalhes,1);
  FrameDetalhesPolitico:addComponent(FrameDetalhesPolitico.painelTabela,2);
	
end


function FrameDetalhesPolitico:buildPainelDetalhes(frame)

   -- Incluir componentes gráficos
  local painelDetalhes= TPanel.new();
  painelDetalhes:setLargura(1270);
  painelDetalhes:setAltura(385);
  painelDetalhes:setPx(5);
  painelDetalhes:setPy(5);
  painelDetalhes:setCorFundo(Cor.new({r=200,g=255,b=255,alpha=255}));--{r=200,g=255,b=255,alpha=255}));
  
  
  local labelNome = TLabel.new();
  labelNome:setTexto("Nome:");
  labelNome:setFonte(CenaBusca.font_label);
  
  local fieldNome = TField.new();
  fieldNome:setFonte(CenaBusca.font_data);
  fieldNome:setTLabel(labelNome);
  fieldNome:setIsEditable(false);
  fieldNome:setLimiteMax(20);
  fieldNome:setPx(5);
  fieldNome:setPy(5);
  fieldNome:getTLabelTexto():setLargura(400);
  fieldNome:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldNome,1);
  
  
  local labelFavorito = TLabel.new();
  labelFavorito:setTexto("Favorito:");
  labelFavorito:setFonte(CenaBusca.font_label);
  
  local fieldFavorito = TField.new();
  fieldFavorito:setFonte(CenaBusca.font_data);
  fieldFavorito:setTLabel(labelFavorito);
  fieldFavorito:setIsEditable(false);
  fieldFavorito:setLimiteMax(20);
  fieldFavorito:setPx(480);
  fieldFavorito:setPy(5);
  fieldFavorito:getTLabelTexto():setLargura(100);
  fieldFavorito:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldFavorito,2);
  
  
  local labelApelido = TLabel.new();
  labelApelido:setTexto("Apelido:");
  labelApelido:setFonte(CenaBusca.font_label);
  
  local fieldApelido = TField.new();
  fieldApelido:setFonte(CenaBusca.font_data);
  fieldApelido:setTLabel(labelApelido);
  fieldApelido:setIsEditable(false);
  fieldApelido:setLimiteMax(20);
  fieldApelido:setPx(680);
  fieldApelido:setPy(5);
  fieldApelido:getTLabelTexto():setLargura(300);
  fieldApelido:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldApelido,3);
  
  
  local labelPartido = TLabel.new();
  labelPartido:setTexto("Partido:");
  labelPartido:setFonte(CenaBusca.font_label);
  
  local fieldPartido = TField.new();
  fieldPartido:setFonte(CenaBusca.font_data);
  fieldPartido:setTLabel(labelPartido);
  fieldPartido:setIsEditable(false);
  fieldPartido:setLimiteMax(20);
  fieldPartido:setPx(1070);
  fieldPartido:setPy(5);
  fieldPartido:getTLabelTexto():setLargura(110);
  fieldPartido:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldPartido,4);
  
  
  local labelCidade = TLabel.new();
  labelCidade:setTexto("Cidade:");
  labelCidade:setFonte(CenaBusca.font_label);
  
  local fieldCidade = TField.new();
  fieldCidade:setFonte(CenaBusca.font_data);
  fieldCidade:setTLabel(labelCidade);
  fieldCidade:setIsEditable(false);
  fieldCidade:setLimiteMax(20);
  fieldCidade:setPx(5);
  fieldCidade:setPy(65);
  fieldCidade:getTLabelTexto():setLargura(110);
  fieldCidade:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldCidade,5);
  
  
  local labelUF = TLabel.new();
  labelUF:setTexto("UF:");
  labelUF:setFonte(CenaBusca.font_label);
  
  local fieldUF = TField.new();
  fieldUF:setFonte(CenaBusca.font_data);
  fieldUF:setTLabel(labelUF);
  fieldUF:setIsEditable(false);
  fieldUF:setLimiteMax(20);
  fieldUF:setPx(5);
  fieldUF:setPy(105);
  fieldUF:getTLabelTexto():setLargura(110);
  fieldUF:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldUF,6);
  
  
   local labelCargo = TLabel.new();
  labelCargo:setTexto("Cargo:");
  labelCargo:setFonte(CenaBusca.font_label);
  
  local fieldCargo = TField.new();
  fieldCargo:setFonte(CenaBusca.font_data);
  fieldCargo:setTLabel(labelCargo);
  fieldCargo:setIsEditable(false);
  fieldCargo:setLimiteMax(20);
  fieldCargo:setPx(5);
  fieldCargo:setPy(145);
  fieldCargo:getTLabelTexto():setLargura(110);
  fieldCargo:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldCargo,7);
  
  
  local labelDataNascimento = TLabel.new();
  labelDataNascimento:setTexto("Data de Nascimento:");
  labelDataNascimento:setFonte(CenaBusca.font_label);
  
  local fieldDataNascimento = TField.new();
  fieldDataNascimento:setFonte(CenaBusca.font_data);
  fieldDataNascimento:setTLabel(labelDataNascimento);
  fieldDataNascimento:setIsEditable(false);
  fieldDataNascimento:setLimiteMax(20);
  fieldDataNascimento:setPx(5);
  fieldDataNascimento:setPy(185);
  fieldDataNascimento:getTLabelTexto():setLargura(110);
  fieldDataNascimento:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldDataNascimento,8);
  
  
  local labelSexo = TLabel.new();
  labelSexo:setTexto("Sexo:");
  labelSexo:setFonte(CenaBusca.font_label);
  
  local fieldSexo = TField.new();
  fieldSexo:setFonte(CenaBusca.font_data);
  fieldSexo:setTLabel(labelSexo);
  fieldSexo:setIsEditable(false);
  fieldSexo:setLimiteMax(20);
  fieldSexo:setPx(380);
  fieldSexo:setPy(65);
  fieldSexo:getTLabelTexto():setLargura(110);
  fieldSexo:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldSexo,9);
  
  
   local labelEscolaridade = TLabel.new();
  labelEscolaridade:setTexto("Escolaridade:");
  labelEscolaridade:setFonte(CenaBusca.font_label);
  
  local fieldEscolaridade = TField.new();
  fieldEscolaridade:setFonte(CenaBusca.font_data);
  fieldEscolaridade:setTLabel(labelEscolaridade);
  fieldEscolaridade:setIsEditable(false);
  fieldEscolaridade:setLimiteMax(20);
  fieldEscolaridade:setPx(380);
  fieldEscolaridade:setPy(105);
  fieldEscolaridade:getTLabelTexto():setLargura(110);
  fieldEscolaridade:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldEscolaridade,10);
  
  
  local labelNumeroMandatos = TLabel.new();
  labelNumeroMandatos:setTexto("Número de Mandatos:");
  labelNumeroMandatos:setFonte(CenaBusca.font_label);
  
  local fieldNumeroMandatos = TField.new();
  fieldNumeroMandatos:setFonte(CenaBusca.font_data);
  fieldNumeroMandatos:setTLabel(labelNumeroMandatos);
  fieldNumeroMandatos:setIsEditable(false);
  fieldNumeroMandatos:setLimiteMax(20);
  fieldNumeroMandatos:setPx(380);
  fieldNumeroMandatos:setPy(145);
  fieldNumeroMandatos:getTLabelTexto():setLargura(50);
  fieldNumeroMandatos:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldNumeroMandatos,11);
  
  
  local labelSituacao = TLabel.new();
  labelSituacao:setTexto("Situação:");
  labelSituacao:setFonte(CenaBusca.font_label);
  
  local fieldSituacao = TField.new();
  fieldSituacao:setFonte(CenaBusca.font_data);
  fieldSituacao:setTLabel(labelSituacao);
  fieldSituacao:setIsEditable(false);
  fieldSituacao:setLimiteMax(20);
  fieldSituacao:setPx(380);
  fieldSituacao:setPy(185);
  fieldSituacao:getTLabelTexto():setLargura(110);
  fieldSituacao:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldSituacao,12);
  
  
  local labelGastosTotais = TLabel.new();
  labelGastosTotais:setTexto("Gastos Totais:");
  labelGastosTotais:setFonte(CenaBusca.font_label);
  
  local fieldGastosTotais = TField.new();
  fieldGastosTotais:setFonte(CenaBusca.font_data);
  fieldGastosTotais:setTLabel(labelGastosTotais);
  fieldGastosTotais:setIsEditable(false);
  fieldGastosTotais:setLimiteMax(20);
  fieldGastosTotais:setPx(700);
  fieldGastosTotais:setPy(65);
  fieldGastosTotais:getTLabelTexto():setLargura(110);
  fieldGastosTotais:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldGastosTotais,13);
  
  
  local labelGastosDia = TLabel.new();
  labelGastosDia:setTexto("Gastos por Dia:");
  labelGastosDia:setFonte(CenaBusca.font_label);
  
  local fieldGastosDia = TField.new();
  fieldGastosDia:setFonte(CenaBusca.font_data);
  fieldGastosDia:setTLabel(labelGastosDia);
  fieldGastosDia:setIsEditable(false);
  fieldGastosDia:setLimiteMax(20);
  fieldGastosDia:setPx(700);
  fieldGastosDia:setPy(105);
  fieldGastosDia:getTLabelTexto():setLargura(110);
  fieldGastosDia:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldGastosDia,14);
  
  
  local labelAssiduidade = TLabel.new();
  labelAssiduidade:setTexto("Assiduidade:");
  labelAssiduidade:setFonte(CenaBusca.font_label);
  
  local fieldAssiduidade = TField.new();
  fieldAssiduidade:setFonte(CenaBusca.font_data);
  fieldAssiduidade:setTLabel(labelAssiduidade);
  fieldAssiduidade:setIsEditable(false);
  fieldAssiduidade:setLimiteMax(20);
  fieldAssiduidade:setPx(700);
  fieldAssiduidade:setPy(145);
  fieldAssiduidade:getTLabelTexto():setLargura(110);
  fieldAssiduidade:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldAssiduidade,15);
  
  
  local labelNumeroComissoes = TLabel.new();
  labelNumeroComissoes:setTexto("Nº de comissões:");
  labelNumeroComissoes:setFonte(CenaBusca.font_label);
  
  local fieldNumeroComissoes = TField.new();
  fieldNumeroComissoes:setFonte(CenaBusca.font_data);
  fieldNumeroComissoes:setTLabel(labelNumeroComissoes);
  fieldNumeroComissoes:setIsEditable(false);
  fieldNumeroComissoes:setLimiteMax(20);
  fieldNumeroComissoes:setPx(700);
  fieldNumeroComissoes:setPy(185);
  fieldNumeroComissoes:getTLabelTexto():setLargura(110);
  fieldNumeroComissoes:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  painelDetalhes:addComponent(fieldNumeroComissoes,16);
  
  
  local menuDetalhes = TMenu.new();
  menuDetalhes:addAllItens(CenaBusca:getItensMenuDetalhesPolitico());
  menuDetalhes:setOrientacao(TMenu.HORIZONTAL);
  menuDetalhes:setTamanhoJanela(4);
  menuDetalhes:setIsVisibleSetas(false);
  menuDetalhes:setIsItensCentralizados(false);
  menuDetalhes:setCorFoco(Cor.new({r=255,g=255,b=0,alpha=255}));
  menuDetalhes:update();

  menuDetalhes:setPx(15)
  menuDetalhes:setPy(300)
  
  painelDetalhes:addComponent(menuDetalhes,17);
  
  
  
  return painelDetalhes;
  
end


function FrameDetalhesPolitico:buildPainelTabela(frame)

	local painelTabela= TPanel.new();
  painelTabela:setLargura(1270);
  painelTabela:setAltura(325);
  painelTabela:setPx(5);
  painelTabela:setPy(390);
  painelTabela:setCorFundo(Cor.new({r=200,g=255,b=255,alpha=255}));--{r=200,g=255,b=255,alpha=255}));
  
  local font_logo= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  font_logo.cor = Cor.new({r=153,g=204,b=51,alpha=255});

  local pxComponent = 5;
  local pyComponent = 5;

  local line = TConteiner.new();
  line:setLargura(1270);
  line:setAltura(40);
  line:setPx((painelTabela:getLargura() - line:getLargura())/2);
  line:setPy(pyComponent);
  line:setCorFundo(Cor.new({r=200,g=255,b=255,alpha=255}));

  line:addComponent(createField("TIPO",0,5,100,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("VALOR",110,5,110,CenaBusca.font_header,CenaBusca.cor_header,true));
  line:addComponent(createField("VALOR POR DIA",230,5,400,CenaBusca.font_header,CenaBusca.cor_header,true));
  
  painelTabela:addComponent(line,1);
  
  return painelTabela;
  
  
end
