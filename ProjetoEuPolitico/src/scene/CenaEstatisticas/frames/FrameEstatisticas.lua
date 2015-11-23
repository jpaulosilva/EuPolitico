-- Imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');


FrameEstatisticas = TFrame.new();
FrameEstatisticas.id = 'FrameEstatisticas';
FrameEstatisticas.showMelhoresPiores = false;

function FrameEstatisticas:inicialize()
  -- Alterar propriedades do FrameEstatisticas
  FrameEstatisticas:setLargura(1280); --320
  FrameEstatisticas:setAltura(720);
  FrameEstatisticas:setPx(0);
  FrameEstatisticas:setPy(0);
  FrameEstatisticas:setCorFundo(CenaPrincipal.cor);

  FrameEstatisticas:addComponent(panel,14);
  FrameEstatisticas:addComponent(panelResultados,15);

  local acaoVerde = "BUSCAR";
  local acaoAzul = "MELHORES";
  local acaoAmarelo = nil;
  if(FrameEstatisticas.mostrarPioresMelhores)then
    acaoVerde = nil;
    acaoAzul = nil;
    acaoAmarelo = "VOLTAR";
  end

  CenaEstatisticas.painelConsulta = CenaEstatisticas:buildPainelConsulta(FrameEstatisticas);
  CenaEstatisticas.painelResultados = CenaEstatisticas:buildPainelResultados(FrameEstatisticas);
  
  FrameEstatisticas:addComponent(buildBackground(),1);
  FrameEstatisticas:addComponent(CenaEstatisticas.painelConsulta,2);
  FrameEstatisticas:addComponent(CenaEstatisticas.painelResultados,3);
  FrameEstatisticas:addComponent(buildPainelTV1_4(),4);
  FrameEstatisticas:addComponent(buildPainelLegendas("NAVEGAÇÃO",nil,nil,"MENU",acaoVerde,acaoAmarelo,acaoAzul),5);

  if(CenaEstatisticas.panelFoco == "painelResultados")then
    atualizarFoco(CenaEstatisticas.painelResultados:getComponents(),2,2);
    atualizarFoco(CenaEstatisticas.painelConsulta:getComponents(),nil,nil);
  elseif(CenaEstatisticas.panelFoco == "painelConsulta") then
    atualizarFoco(CenaEstatisticas.painelResultados:getComponents(),nil,nil);
    atualizarFoco(CenaEstatisticas.painelConsulta:getComponents(),1,1);
  end


  --********************************************Legendas**************************************************

  --
  --  local font_logo= Fonte.new({nome='tiresias', tamanho=24, is_negrito = true});
  --  font_logo.cor = Cor.new({r=153,g=204,b=51});
  --
  --  local labelEducaInte = TLabel.new();
  --  labelEducaInte:setTexto("EDUCAÇÃO INTELIGENTE");
  --  labelEducaInte:setFonte(font_logo);
  --  labelEducaInte:setPx(200);
  --  labelEducaInte:setPy(680);


  --  FrameEstatisticas:addComponent(labelEducaInte,13);
  --  FrameEstatisticas:addComponent(panelTV,14);

end

function FrameEstatisticas:action(evt)
  if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoVerde(evt)) then

    if(CenaEstatisticas.panelFoco == "painelConsulta")then
      CenaEstatisticas:pesquisar();

    elseif(CenaEstatisticas.panelFoco == "painelResultados") then
      CenaEstatisticas.indexFocoVisible = 1;
      CenaEstatisticas.indexFoco = 1;
      CenaEstatisticas.panelFoco = "painelConsulta";
      CenaEstatisticas.listaNacional = ListaEstatisticas:new();
      CenaEstatisticas.listaRegional = ListaEstatisticas:new();
      CenaEstatisticas.listaEstadual = ListaEstatisticas:new();
      CenaEstatisticas.listaMunicipal = ListaEstatisticas:new();
      FrameEstatisticas.inicialize();
    end

  elseif(BibliotecaAuxiliarEvento.isBotaoAzul(evt) and not FrameEstatisticas.mostrarPioresMelhores) then

    FrameEstatisticas.mostrarPioresMelhores = true;
    FrameEstatisticas:inicialize();

  elseif(BibliotecaAuxiliarEvento.isBotaoAmarelo(evt) and FrameEstatisticas.mostrarPioresMelhores) then

    FrameEstatisticas.mostrarPioresMelhores = false;
    FrameEstatisticas:inicialize();

  end
end













