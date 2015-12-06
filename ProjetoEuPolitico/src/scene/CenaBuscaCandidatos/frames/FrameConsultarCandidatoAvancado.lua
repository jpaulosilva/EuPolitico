-- Imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TField');
BibliotecaAuxiliarScript.execute('framework.src.gui.TChoicer');
BibliotecaAuxiliarScript.execute('data.ListaCandidatos');
BibliotecaAuxiliarScript.execute('data.Candidato');
BibliotecaAuxiliarScript.execute('data.FiltroCandidato');

FrameConsultarCandidatoAvancado = TFrame.new();
FrameConsultarCandidatoAvancado.id = 'FrameConsultarCandidatoAvancado';

--Inicializa a tela da busca avançada
function FrameConsultarCandidatoAvancado:inicialize()
  CenaBuscaCandidatos.frameCorrente = FrameConsultarCandidatoAvancado;
  
  -- Alterar propriedades do FrameConsultarCandidatoAvancado
  FrameConsultarCandidatoAvancado:setLargura(1280);
  FrameConsultarCandidatoAvancado:setAltura(720);
  FrameConsultarCandidatoAvancado:setPx(0);
  FrameConsultarCandidatoAvancado:setPy(0);
  FrameConsultarCandidatoAvancado:setCorFundo(CenaBuscaCandidatos.cor);

  CenaBuscaCandidatos.painelConsultarCandidato = CenaBuscaCandidatos:buildPainelConsultarCandidato(FrameConsultarCandidatoAvancado);
  CenaBuscaCandidatos.painelResultados = CenaBuscaCandidatos:buildPainelResultados(FrameConsultarCandidatoAvancado);
  CenaBuscaCandidatos.painelConsultarCandidatoAvancado = CenaBuscaCandidatos:buildPainelConsultarCandidatoAvancado(FrameConsultarCandidatoAvancado);

  local acaoOk = nil;
  local acaoVerde = CenaBuscaCandidatos.labelAcao;
  
  if(#CenaBuscaCandidatos.resultado > 0)then
    acaoOk = "SELECIONAR";
  end
  
  FrameConsultarCandidatoAvancado:addComponent(buildBackground(),1);
  FrameConsultarCandidatoAvancado:addComponent(CenaBuscaCandidatos.painelConsultarCandidato,2);
  FrameConsultarCandidatoAvancado:addComponent(CenaBuscaCandidatos.painelConsultarCandidatoAvancado,3);
  FrameConsultarCandidatoAvancado:addComponent(CenaBuscaCandidatos.painelResultados,4);
  FrameConsultarCandidatoAvancado:addComponent(buildPainelLegendas("NAVEGAÇÃO",acaoOk,nil,"MENU",acaoVerde,"TROCAR","VOLTAR"),5);
  
  if(CenaBuscaCandidatos.panelFoco == "painelResultados")then
    atualizarFoco(CenaBuscaCandidatos.painelResultados:getComponents(),CenaBuscaCandidatos.indexFoco,CenaBuscaCandidatos.indexFocoVisible);
    atualizarFoco(CenaBuscaCandidatos.painelConsultarCandidato:getComponents(),nil,nil);
    atualizarFoco(CenaBuscaCandidatos.painelConsultarCandidatoAvancado:getComponents(),nil,nil);
  elseif(CenaBuscaCandidatos.panelFoco == "painelConsultarCandidato") then
    atualizarFoco(CenaBuscaCandidatos.painelResultados:getComponents(),nil,nil);
    atualizarFoco(CenaBuscaCandidatos.painelConsultarCandidato:getComponents(),CenaBuscaCandidatos.indexFoco,CenaBuscaCandidatos.indexFocoVisible);
    atualizarFoco(CenaBuscaCandidatos.painelConsultarCandidatoAvancado:getComponents(),nil,nil);
  elseif(CenaBuscaCandidatos.panelFoco == "painelConsultarCandidatoAvancado") then
    atualizarFoco(CenaBuscaCandidatos.painelResultados:getComponents(),nil,nil);
    atualizarFoco(CenaBuscaCandidatos.painelConsultarCandidato:getComponents(),nil,nil);
    atualizarFoco(CenaBuscaCandidatos.painelConsultarCandidatoAvancado:getComponents(),CenaBuscaCandidatos.indexFoco,CenaBuscaCandidatos.indexFocoVisible);
  end

end

--[[Controla a ação dos botões amarelo (muda o foco da busca simples para a avançada),
 verde (realiza a busca propriamente dita) e azul (abre o painel da busca avançada)]]--
function FrameConsultarCandidatoAvancado:action(evt)
  if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoAmarelo(evt)) then
    if(CenaBuscaCandidatos.panelFoco == "painelConsultarCandidato")then
      
      CenaBuscaCandidatos.indexFocoVisible = 1;
      CenaBuscaCandidatos.indexFoco = 1;
      CenaBuscaCandidatos.indiceItemMenuAvancado = 1;
      CenaBuscaCandidatos.indiceItemMenuAvancadoJanela = 1;
      CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhado = 1;
      CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhadoJanela = 1;
      CenaBuscaCandidatos.indiceItemMenuAvancadoDetalhadoJanelaInicio = 1;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidatoAvancado";
      FrameConsultarCandidatoAvancado.inicialize();
      
    elseif(CenaBuscaCandidatos.panelFoco == "painelConsultarCandidatoAvancado") then
      
      CenaBuscaCandidatos.indexFocoVisible = 1;
      CenaBuscaCandidatos.indexFoco = 2;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
      FrameConsultarCandidatoAvancado.inicialize();
      
    end
  elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoVerde(evt)) then

    if(CenaBuscaCandidatos.panelFoco == "painelConsultarCandidato" or CenaBuscaCandidatos.panelFoco == "painelConsultarCandidatoAvancado")then
      CenaBuscaCandidatos:pesquisarEscolas(FrameConsultarCandidatoAvancado);
      
    elseif(CenaBuscaCandidatos.panelFoco == "painelResultados") then
      CenaBuscaCandidatos.indexFocoVisible = 1;
      CenaBuscaCandidatos.indexFoco = 2;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
      CenaBuscaCandidatos.labelAcao = "BUSCAR"
      CenaBuscaCandidatos.resultado = {};
      CenaBuscaCandidatos.candidatoSelecionada = nil;
      CenaBuscaCandidatos.indiceCandidatoMenu = 1;
      FrameConsultarCandidatoAvancado.inicialize();
    end
  elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoAzul(evt)) then
    FrameConsultarEscola.inicialize();
    CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
    CenaBuscaCandidatos.indexFocoVisible = 1;
    CenaBuscaCandidatos.indexFoco = 2;
    evt.rule_key = "acessarFrameConsultarCandidato";
  end
end
