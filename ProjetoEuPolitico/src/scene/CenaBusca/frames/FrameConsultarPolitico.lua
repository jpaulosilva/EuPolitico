-- Imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TField');
BibliotecaAuxiliarScript.execute('framework.src.gui.TChoicer');


FrameConsultarPolitico = TFrame.new();
FrameConsultarPolitico.id = 'FrameConsultarPolitico';

--Inicializa a tela da busca simples
function FrameConsultarPolitico:inicialize()
  CenaBusca.frameCorrente = FrameConsultarPolitico;
  
  -- Alterar propriedades do FrameConsultarPolitico
  FrameConsultarPolitico:setLargura(1280);
  FrameConsultarPolitico:setAltura(720);
  FrameConsultarPolitico:setPx(0);
  FrameConsultarPolitico:setPy(0);
  FrameConsultarPolitico:setCorFundo(CenaBusca.cor);

  CenaBusca.painelConsultarPolitico = CenaBusca:buildPainelConsultarPolitico(FrameConsultarPolitico);
  CenaBusca.painelResultados = CenaBusca:buildPainelResultados(FrameConsultarPolitico);

  local acaoOk = nil;
  local acaoVerde = CenaBusca.labelAcao;
  if(#CenaBusca.resultado > 0)then
    acaoOk = "SELECIONAR";
  end
  
 
  FrameConsultarPolitico:addComponent(buildBackground(),1);
  FrameConsultarPolitico:addComponent(CenaBusca.painelConsultarPolitico,2);
  FrameConsultarPolitico:addComponent(CenaBusca.painelResultados,3);
  FrameConsultarPolitico:addComponent(buildPainelTV1_2(),4);
  FrameConsultarPolitico:addComponent(buildPainelLegendas("NAVEGAÇÃO",acaoOk,nil,"MENU",acaoVerde,nil,"BUSCA AVANÇADA"),5);

  if(CenaBusca.panelFoco == "painelResultados")then
    atualizarFoco(CenaBusca.painelResultados:getComponents(),CenaBusca.indexFoco,CenaBusca.indexFocoVisible);
    atualizarFoco(CenaBusca.painelConsultarPolitico:getComponents(),nil,nil);
  else
    atualizarFoco(CenaBusca.painelResultados:getComponents(),nil,nil);
    atualizarFoco(CenaBusca.painelConsultarPolitico:getComponents(),CenaBusca.indexFoco,CenaBusca.indexFocoVisible);
  end

end

--[[Controla a ação ao pressionar o botão verde (busca de escolas, caso o foco esteja no painel de consulta ou 
limpar os resultados da busca, caso o foco esteja no painel de resultados de uma busca) e o botão azul (ir para a busca avançada]]--
function FrameConsultarPolitico:action(evt)
  if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoVerde(evt)) then

    if(CenaBusca.panelFoco == "painelConsultarPolitico")then
      CenaBusca:pesquisarPoliticos(FrameConsultarPolitico);
    elseif(CenaBusca.panelFoco == "painelResultados") then
      CenaBusca.indexFocoVisible = 1;
      CenaBusca.indexFoco = 2;
      CenaBusca.panelFoco = "painelConsultarPolitico";
      CenaBusca.labelAcao = "BUSCAR"
      CenaBusca.resultado = {};
      CenaBusca.politicoSelecionado = nil;
      CenaBusca.indicePoliticoMenu = 1;
      FrameConsultarPolitico.inicialize();
    end
  elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isBotaoAzul(evt)) then
    FrameConsultarPoliticoAvancado.inicialize();
    evt.rule_key = "acessarFrameConsultarPoliticoAvancado";
  end
end
