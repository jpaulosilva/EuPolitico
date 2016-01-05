-- Imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TField');
BibliotecaAuxiliarScript.execute('framework.src.gui.TChoicer');


FrameConsultarCandidato = TFrame.new();
FrameConsultarCandidato.id = 'FrameConsultarCandidato';

--Inicializa a tela da busca simples
function FrameConsultarCandidato:inicialize()
  CenaBuscaCandidatos.frameCorrente = FrameConsultarCandidato;
  
  -- Alterar propriedades do FrameConsultarCandidato
  FrameConsultarCandidato:setLargura(1280);
  FrameConsultarCandidato:setAltura(720);
  FrameConsultarCandidato:setPx(0);
  FrameConsultarCandidato:setPy(0);
  FrameConsultarCandidato:setCorFundo(CenaBuscaCandidatos.cor);

  CenaBuscaCandidatos.painelConsultarCandidato = CenaBuscaCandidatos:buildPainelConsultarCandidato(FrameConsultarCandidato);
  CenaBuscaCandidatos.painelResultados = CenaBuscaCandidatos:buildPainelResultados(FrameConsultarCandidato);

  local acaoOk = nil;
  local acaoVerde = CenaBuscaCandidatos.labelAcao;
  if(#CenaBuscaCandidatos.resultado > 0)then
    acaoOk = "SELECIONAR";
  end
  
 
  FrameConsultarCandidato:addComponent(buildBackground(),1);
  FrameConsultarCandidato:addComponent(CenaBuscaCandidatos.painelConsultarCandidato,2);
  FrameConsultarCandidato:addComponent(CenaBuscaCandidatos.painelResultados,3);
  FrameConsultarCandidato:addComponent(buildPainelTV1_2(),4);
  FrameConsultarCandidato:addComponent(buildPainelLegendas("NAVEGAÇÃO",acaoOk,nil,"MENU",acaoVerde,nil,"BUSCA AVANÇADA"),5);

  if(CenaBuscaCandidatos.panelFoco == "painelResultados")then
    atualizarFoco(CenaBuscaCandidatos.painelResultados:getComponents(),CenaBuscaCandidatos.indexFoco,CenaBuscaCandidatos.indexFocoVisible);
    atualizarFoco(CenaBuscaCandidatos.painelConsultarCandidato:getComponents(),nil,nil);
  else
    atualizarFoco(CenaBuscaCandidatos.painelResultados:getComponents(),nil,nil);
    atualizarFoco(CenaBuscaCandidatos.painelConsultarCandidato:getComponents(),CenaBuscaCandidatos.indexFoco,CenaBuscaCandidatos.indexFocoVisible);
  end

end

--[[Controla a ação ao pressionar o botão verde (busca de candidatos, caso o foco esteja no painel de consulta ou 
limpar os resultados da busca, caso o foco esteja no painel de resultados de uma busca) e o botão azul (ir para a busca avançada]]--
function FrameConsultarCandidato:action(evt)
  if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoVerde(evt)) then

    if(CenaBuscaCandidatos.panelFoco == "painelConsultarCandidato")then
      CenaBuscaCandidatos:pesquisarCandidatos(FrameConsultarCandidato);
    elseif(CenaBuscaCandidatos.panelFoco == "painelResultados") then
      CenaBuscaCandidatos.indexFocoVisible = 1;
      CenaBuscaCandidatos.indexFoco = 2;
      CenaBuscaCandidatos.panelFoco = "painelConsultarCandidato";
      CenaBuscaCandidatos.labelAcao = "BUSCAR"
      CenaBuscaCandidatos.resultado = {};
      CenaBuscaCandidatos.candidatoSelecionado = nil;
      CenaBuscaCandidatos.indiceCandidatoMenu = 1;
      FrameConsultarCandidato.inicialize();
    end
  elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoAzul(evt)) then
    FrameConsultarCandidatoAvancado.inicialize();
    evt.rule_key = "acessarFrameConsultarCandidatoAvancado";
  end
end
