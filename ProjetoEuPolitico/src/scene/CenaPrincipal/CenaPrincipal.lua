BibliotecaAuxiliarScript.execute('framework.src.util.app.Scene');
BibliotecaAuxiliarScript.execute('scene.CenaPrincipal.frames.FrameInteracao');
BibliotecaAuxiliarScript.execute('scene.CenaPrincipal.frames.FramePrincipal');
BibliotecaAuxiliarScript.execute('scene.CenaPrincipal.frames.FrameAjuda');
BibliotecaAuxiliarScript.execute('scene.CenaPrincipal.frames.FrameQuemSomos');
BibliotecaAuxiliarScript.execute('scene.CenaPrincipal.frames.FrameCEP');
BibliotecaAuxiliarScript.execute('framework.src.gui.TIcon');
BibliotecaAuxiliarScript.execute('framework.src.gui.TImage');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');

CenaPrincipal = Scene.new();
CenaPrincipal.id = 'CenaPrincipal';
CenaPrincipal.cor = Cor.new({r=255,g=255,b=255,alpha=0});

function CenaPrincipal:inicialize()
  
  CenaPrincipal:addFrame(FrameInteracao,FrameInteracao.id);
  CenaPrincipal:addFrame(FramePrincipal,FramePrincipal.id);
  CenaPrincipal:addFrame(FrameAjuda,FrameAjuda.id);
  CenaPrincipal:addFrame(FrameQuemSomos,FrameQuemSomos.id);
  CenaPrincipal:addFrame(FrameCEP,FrameCEP.id);

  FrameInteracao:inicialize();
  FramePrincipal:inicialize();
  FrameAjuda:inicialize();
  FrameQuemSomos:inicialize();
  FrameCEP:inicialize();

end

--Método responsável por carregar os itens do Menu Principal 
function CenaPrincipal:getItensMenu()

  local itensPrimitivos = {
    {'../media/ajuda.png'     ,'Pesquisas e Resultados','acessarFramePesquisasResultados'},
    {'../media/quem_somos.png'    ,'Políticos em Mandato','acessarCenaBusca'},
    {'../media/quem_somos.png' , 'Candidatos', 'acessarCenaBuscaCandidatos'},
    {'../media/indices.png'   ,'Estatísticas ','acessarCenaEstatisticas'},
    {'../media/quem_somos.png','Atualizações','acessarFrameAtualizacoes'}};


  local itens = {};

  local font_data= Fonte.new({nome='tiresias', tamanho=32,is_negrito = true});
  font_data.cor = Cor.new({r=255,g=255,b=0})--{r=153,g=204,b=51});--{r=255,g=94,b=94});


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
