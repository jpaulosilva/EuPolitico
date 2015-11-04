BibliotecaAuxiliarScript.execute('framework.src.util.app.Scene')
BibliotecaAuxiliarScript.execute('scene.CenaPrincipal.frames.FrameInteracao');
BibliotecaAuxiliarScript.execute('scene.CenaPrincipal.frames.FramePrincipal');
BibliotecaAuxiliarScript.execute('framework.src.gui.TIcon');
BibliotecaAuxiliarScript.execute('framework.src.gui.TImage');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');

CenaPrincipal = Scene.new();
CenaPrincipal.id = 'CenaPrincipal';
CenaPrincipal.cor = Cor.new({r=255,g=255,b=255,alpha=255});

function CenaPrincipal:inicialize()

  CenaPrincipal:addFrame(FramePrincipal,FramePrincipal.id);
  CenaPrincipal:addFrame(FrameInteracao,FrameInteracao.id);
  
  FrameInteracao:inicialize();
  FramePrincipal:inicialize();
	
end


--Método responsável por carregar os itens do Menu Principal 
function CenaPrincipal:getItensMenu()

  local itensPrimitivos = {
    {'../media/icone.png'    ,'Pesquisas e Resultados','acessarFramePesquisasResultados'},
    {'../media/icone.png' , 'Políticos em Mandato  ', 'acessarFramePoliticos'},
    {'../media/icone.png'   ,'Candidatos            ','acessarFrameCandidatos'},
    {'../media/icone.png','Estatísticas          ','acessarFrameEstatisticas'},
    {'../media/icone.png'     ,'Atualizações          ','acessarFrameAtualizacoes'}
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
