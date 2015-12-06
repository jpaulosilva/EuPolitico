-- Imports
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TPanel');
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
