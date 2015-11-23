-- Imports
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('data.BuscarCEP');
BibliotecaAuxiliarScript.execute('data.Localizacoes');


FrameCEP = TFrame.new();
FrameCEP.id = 'FrameCEP';
FrameCEP.estado = "";
FrameCEP.cidade = "";
FrameCEP.isCarregandoCEP = false;
FrameCEP.cepNaoEncontrado = false;


local font_label= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
font_label.cor = Cor.new({r=255,g=94,b=94});

local font_logo= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
font_logo.cor = Cor.new({r=153,g=204,b=51});

--Inicializa a tela para busca por CEP
function FrameCEP:inicialize()
  -- Alterar propriedades do FrameCEP
  FrameCEP:setLargura(1280); --320
  FrameCEP:setAltura(720);
  FrameCEP:setPx(0);
  FrameCEP:setPy(0);
  FrameCEP:setCorFundo(CenaPrincipal.cor);

  local panelCEP= TPanel.new();
  panelCEP:setLargura(500);
  panelCEP:setAltura(350);
  panelCEP:setPx(10);
  panelCEP:setPy(100);
  panelCEP:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  local digiteCEP = TLabel.new();
  digiteCEP:setTexto("Digite um C.E.P");
  digiteCEP:setFonte(CenaBusca.font_label);
  digiteCEP:update();
  digiteCEP:setPx((panelCEP:getLargura() - digiteCEP:getLargura())/2);
  digiteCEP:setPy(10);
  panelCEP:addComponent(digiteCEP,6);
  

  --Field CEP
  local labelFieldCEP = TLabel.new();

  labelFieldCEP:setTexto("CEP:");
  labelFieldCEP:setFonte(CenaBusca.font_label);
  labelFieldCEP:setIsFocoVisible(true);
  labelFieldCEP:setCorFoco(Cor.new({r=0,g=255,b=0,alpha=240}));
  labelFieldCEP:update();


  local fieldCEP = TField.new();
  fieldCEP:setTLabel(labelFieldCEP);
  fieldCEP:setFonte(CenaBusca.font_data);
  fieldCEP:setIsEditable(true);
  fieldCEP:setIsAlfanumerico(false);
  fieldCEP:setPx(0);
  fieldCEP:setPy(100);
  fieldCEP:getTLabelTexto():setLargura(430);
  fieldCEP:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));


--Função para manipular o conteúdo no campo CEP
  fieldCEP.afterHandler = function (self,evt)

    if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoOk(evt) and FrameCEP.estado == "" and FrameCEP.cidade == "") then
      FrameCEP.cepNaoEncontrado = false;
      FrameCEP.isCarregandoCEP = true;
      
      callback = function(table,status)

        if(status == 1) then
          FrameCEP.isCarregandoCEP = false;
          FrameCEP.estado = table.uf;
          FrameCEP.cidade = table.cidade
          FrameCEP.inicialize();
          Display.show();
        else
          FrameCEP.isCarregandoCEP = false;
        -- Colocar mensagem de cep não encontrado
          
          FrameCEP.cepNaoEncontrado = true;
          FrameCEP.inicialize();
          Display.show();
          
        end
      end

      cep = fieldCEP:getTexto();
      buscaCEP(cep, callback);
      FrameCEP.inicialize();
      
    elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoVerde(evt) and FrameCEP.estado ~= "" and FrameCEP.cidade ~= "") then

      CenaBusca:clear();
      local estadoEncontrado;
      local cidadeEncontrado;

      --Buscar índice região e estado
      for r,regiao in pairs(Localizacoes.nomesRegioes) do

        for e,estado in pairs(Localizacoes.regioes[regiao].nomesEstados) do

          if(FrameCEP.estado == estado)then
            CenaBusca.indiceRegiao = r + 1;
            CenaBusca.indiceEstado = e + 1;
            estadoEncontrado = Localizacoes.regioes[regiao].estados[estado];
            break;
          end
        end

        if(estadoEncontrado == nil)then
          CenaBusca.indiceEstado = 1;
        else
          break;
        end

      end

      --Buscar índice cidade
      Localizacoes:carregaCidades(estadoEncontrado);
      for i,cidade in pairs(estadoEncontrado.nomesCidades) do
        if(string.upper(FrameCEP.cidade) == cidade)then
          CenaBusca.indiceCidade = i + 1;
        end

      end

      evt.rule_key = "acessarCenaBusca";
    end

  end



  local labelEstado = TLabel.new();
  labelEstado:setTexto("Estado:");
  labelEstado:setFonte(CenaBusca.font_label);
  labelEstado:update();


  local fieldEstado = TField.new();

  fieldEstado:setFonte(CenaBusca.font_data);
  fieldEstado:setTLabel(labelEstado);
  fieldEstado:setIsEditable(false);
  fieldEstado:setTexto(FrameCEP.estado)
  fieldEstado:setPx(0);
  fieldEstado:setPy(150);
  fieldEstado:getTLabelTexto():setLargura(405);
  fieldEstado:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  fieldEstado:setIsFoco(false);

  local labelCidade = TLabel.new();

  labelCidade:setTexto("Cidade:");
  labelCidade:setFonte(CenaBusca.font_label);

  labelCidade:update();


  local fieldCidade = TField.new();

  fieldCidade:setFonte(CenaBusca.font_data);
  fieldCidade:setTLabel(labelCidade);
  fieldCidade:setIsEditable(false);
  fieldCidade:setTexto(FrameCEP.cidade)
  fieldCidade:setPx(0);
  fieldCidade:setPy(200);
  fieldCidade:getTLabelTexto():setLargura(408);
  fieldCidade:getTLabelTexto():setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  fieldCidade:setIsFoco(false);

  panelCEP:addComponent(fieldCEP,1);
  panelCEP:addComponent(fieldEstado,2);
  panelCEP:addComponent(fieldCidade,3);


  if(FrameCEP.isCarregandoCEP)then
    local labelCarregando = TLabel.new();
    labelCarregando:setTexto("Carregando...");
    labelCarregando:setFonte(CenaBusca.font_data);
    labelCarregando:update();
    labelCarregando:setPx((panelCEP:getLargura() - labelCarregando:getLargura())/2);
    labelCarregando:setPy(250);

    panelCEP:addComponent(labelCarregando,4);
  end
  
  if (FrameCEP.cepNaoEncontrado) then
    local labelCepNaoEncontrado = TLabel.new();
    labelCepNaoEncontrado:setTexto("CEP Não Encontrado!");
    labelCepNaoEncontrado:setFonte(CenaBusca.font_data);
    labelCepNaoEncontrado:update();
    labelCepNaoEncontrado:setPx((panelCEP:getLargura() - labelCepNaoEncontrado:getLargura())/2);
    labelCepNaoEncontrado:setPy(250);

    panelCEP:addComponent(labelCepNaoEncontrado,5);
  end
  
  
  --Imagem exemplo TV
  local imageTV = TImage.new();
  imageTV:setSrcArquivoExterno("../media/imagem_exemplo_tv_623x350.png")
  imageTV:setPx(550);
  imageTV:setPy(100);

  --**************************************************Legendas*****************************************************

--  local labelEducaInte = TLabel.new();
--  labelEducaInte:setTexto("EDUCAÇÃO INTELIGENTE");
--  labelEducaInte:setFonte(font_logo);
--  labelEducaInte:setPx(10);
--  labelEducaInte:setPy(680);
--
-- local labelBuscar = TLabel.new();
-- labelBuscar:setTexto("Pesquisar CEP");
-- labelBuscar:setFonte(CenaBusca.font_data);
--    
--  local imageBuscar = TImage.new();
--  imageBuscar:setSrcArquivoExterno("../media/legenda_ok.png");
--
--  local iconeBuscar = TIcon.new();
--  iconeBuscar:setTImage(imageBuscar);
--  iconeBuscar:setTLabel(labelBuscar);
--  iconeBuscar:setOrientacao(TIcon.TITULO_RIGHT);
--  iconeBuscar:setPx(430);
--  iconeBuscar:setPy(670);
--
--  local labelMenu = TLabel.new();
--  labelMenu:setTexto("MENU");
--  labelMenu:setFonte(CenaBusca.font_data);
--
--  local imageMenu= TImage.new();
--  imageMenu:setSrcArquivoExterno("../media/legenda_vermelho_30.png");
--
--
--  local iconeMenu= TIcon.new();
--  iconeMenu:setTImage(imageMenu);
--  iconeMenu:setTLabel(labelMenu);
--  iconeMenu:setOrientacao(TIcon.TITULO_RIGHT);
--  iconeMenu:setPx(1110);
--  iconeMenu:setPy(670);
--
--
--
--  local labelCep = TLabel.new();
--  labelCep:setTexto("Consultar Escola");
--  labelCep:setFonte(CenaBusca.font_data);
--
--  local imageCep= TImage.new();
--  imageCep:setSrcArquivoExterno("../media/legenda_verde_30.png");
--
--
--  local iconeCep= TIcon.new();
--  iconeCep:setTImage(imageCep);
--  iconeCep:setTLabel(labelCep);
--  iconeCep:setOrientacao(TIcon.TITULO_RIGHT);
--  iconeCep:setPx(850);
--  iconeCep:setPy(670);
--  
--  
--  local labelApagarCep = TLabel.new();
--  labelApagarCep:setTexto("Apagar")
--  labelApagarCep:setFonte(CenaBusca.font_data);
--  
--  local imageApagarCep = TImage.new();
--  imageApagarCep:setSrcArquivoExterno("../media/seta_left_black.png");
--  
--  local iconeApagarCep = TIcon.new();
--  iconeApagarCep:setTImage(imageApagarCep);
--  iconeApagarCep:setTLabel(labelApagarCep);
--  iconeApagarCep:setOrientacao(TIcon.TITULO_RIGHT);
--  iconeApagarCep:setPx(680);
--  iconeApagarCep:setPy(670);
 

  FrameCEP:addComponent(buildBackground(),1);
  FrameCEP:addComponent(panelCEP,2);
--  FrameCEP:addComponent(labelEducaInte,3);
--  FrameCEP:addComponent(iconeMenu,4);
----  FrameCEP:addComponent(buildPainelTV1_2(),5);
  FrameCEP:addComponent(imageTV,5);
--  FrameCEP:addComponent(iconeCep,6);
--  FrameCEP:addComponent(iconeBuscar,7);
--  FrameCEP:addComponent(iconeApagarCep,8);
    FrameCEP:addComponent(buildPainelLegendas(nil,"PESQUISAR CEP","APAGAR","MENU","CONSULTAR ESCOLA",nil,nil),9);
end
