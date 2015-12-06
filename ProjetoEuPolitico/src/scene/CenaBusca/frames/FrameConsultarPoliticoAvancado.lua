-- Imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TField');
BibliotecaAuxiliarScript.execute('framework.src.gui.TChoicer');
BibliotecaAuxiliarScript.execute('data.ListaDeputados');
BibliotecaAuxiliarScript.execute('data.Politico');
BibliotecaAuxiliarScript.execute('data.FiltroPolitico');

FrameConsultarPoliticoAvancado = TFrame.new();
FrameConsultarPoliticoAvancado.id = 'FrameConsultarPoliticoAvancado';

--Inicializa a tela da busca avançada
function FrameConsultarPoliticoAvancado:inicialize()
  CenaBusca.frameCorrente = FrameConsultarPoliticoAvancado;
  
  -- Alterar propriedades do FrameConsultarPoliticoAvancado
  FrameConsultarPoliticoAvancado:setLargura(1280);
  FrameConsultarPoliticoAvancado:setAltura(720);
  FrameConsultarPoliticoAvancado:setPx(0);
  FrameConsultarPoliticoAvancado:setPy(0);
  FrameConsultarPoliticoAvancado:setCorFundo(CenaBusca.cor);

  CenaBusca.painelConsultarPolitico = CenaBusca:buildPainelConsultarPolitico(FrameConsultarPoliticoAvancado);
  CenaBusca.painelResultados = CenaBusca:buildPainelResultados(FrameConsultarPoliticoAvancado);
  CenaBusca.painelConsultarPoliticoAvancado = CenaBusca:buildPainelConsultarPoliticoAvancado(FrameConsultarPoliticoAvancado);

  local acaoOk = nil;
  local acaoVerde = CenaBusca.labelAcao;
  
  if(#CenaBusca.resultado > 0)then
    acaoOk = "SELECIONAR";
  end
  
  FrameConsultarPoliticoAvancado:addComponent(buildBackground(),1);
  FrameConsultarPoliticoAvancado:addComponent(CenaBusca.painelConsultarPolitico,2);
  FrameConsultarPoliticoAvancado:addComponent(CenaBusca.painelConsultarPoliticoAvancado,3);
  FrameConsultarPoliticoAvancado:addComponent(CenaBusca.painelResultados,4);
  FrameConsultarPoliticoAvancado:addComponent(buildPainelLegendas("NAVEGAÇÃO",acaoOk,nil,"MENU",acaoVerde,"TROCAR","VOLTAR"),5);
  
  if(CenaBusca.panelFoco == "painelResultados")then
    atualizarFoco(CenaBusca.painelResultados:getComponents(),CenaBusca.indexFoco,CenaBusca.indexFocoVisible);
    atualizarFoco(CenaBusca.painelConsultarPolitico:getComponents(),nil,nil);
    atualizarFoco(CenaBusca.painelConsultarPoliticoAvancado:getComponents(),nil,nil);
  elseif(CenaBusca.panelFoco == "painelConsultarPolitico") then
    atualizarFoco(CenaBusca.painelResultados:getComponents(),nil,nil);
    atualizarFoco(CenaBusca.painelConsultarPolitico:getComponents(),CenaBusca.indexFoco,CenaBusca.indexFocoVisible);
    atualizarFoco(CenaBusca.painelConsultarPoliticoAvancado:getComponents(),nil,nil);
  elseif(CenaBusca.panelFoco == "painelConsultarPoliticoAvancado") then
    atualizarFoco(CenaBusca.painelResultados:getComponents(),nil,nil);
    atualizarFoco(CenaBusca.painelConsultarPolitico:getComponents(),nil,nil);
    atualizarFoco(CenaBusca.painelConsultarPoliticoAvancado:getComponents(),CenaBusca.indexFoco,CenaBusca.indexFocoVisible);
  end

end

--[[Controla a ação dos botões amarelo (muda o foco da busca simples para a avançada),
 verde (realiza a busca propriamente dita) e azul (abre o painel da busca avançada)]]--
function FrameConsultarPoliticoAvancado:action(evt)
  if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoAmarelo(evt)) then
    if(CenaBusca.panelFoco == "painelConsultarPolitico")then
      
      CenaBusca.indexFocoVisible = 1;
      CenaBusca.indexFoco = 1;
      CenaBusca.indiceItemMenuAvancado = 1;
      CenaBusca.indiceItemMenuAvancadoJanela = 1;
      CenaBusca.indiceItemMenuAvancadoDetalhado = 1;
      CenaBusca.indiceItemMenuAvancadoDetalhadoJanela = 1;
      CenaBusca.indiceItemMenuAvancadoDetalhadoJanelaInicio = 1;
      CenaBusca.panelFoco = "painelConsultarPoliticoAvancado";
      FrameConsultarPoliticoAvancado.inicialize();
      
    elseif(CenaBusca.panelFoco == "painelConsultarPoliticoAvancado") then
      
      CenaBusca.indexFocoVisible = 1;
      CenaBusca.indexFoco = 2;
      CenaBusca.panelFoco = "painelConsultarPolitico";
      FrameConsultarPoliticoAvancado.inicialize();
      
    end
  elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoVerde(evt)) then

    if(CenaBusca.panelFoco == "painelConsultarPolitico" or CenaBusca.panelFoco == "painelConsultarPoliticoAvancado")then
      CenaBusca:pesquisarEscolas(FrameConsultarPoliticoAvancado);
      
    elseif(CenaBusca.panelFoco == "painelResultados") then
      CenaBusca.indexFocoVisible = 1;
      CenaBusca.indexFoco = 2;
      CenaBusca.panelFoco = "painelConsultarPolitico";
      CenaBusca.labelAcao = "BUSCAR"
      CenaBusca.resultado = {};
      CenaBusca.escolaSelecionada = nil;
      CenaBusca.indiceEscolaMenu = 1;
      FrameConsultarPoliticoAvancado.inicialize();
    end
  elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoAzul(evt)) then
    FrameConsultarEscola.inicialize();
    CenaBusca.panelFoco = "painelConsultarPolitico";
    CenaBusca.indexFocoVisible = 1;
    CenaBusca.indexFoco = 2;
    evt.rule_key = "acessarFrameConsultarEscola";
  end
end
