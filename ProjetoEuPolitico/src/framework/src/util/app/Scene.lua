BibliotecaAuxiliarScript.execute('framework.src.util.event.BibliotecaAuxiliarEvento');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Foco');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Fonte');

Scene = {};

Scene.collection_frame = nil;
Scene.current_frame = nil;
Scene.is_sleep = false;

Scene.__index = function(tabela,chave)
  return Scene[chave];
end

Scene.new = function()
  local retorno = {};
  retorno = setmetatable(retorno,Scene);
  retorno.collection_frame = {};
  return retorno;
end

function Scene:addFrame(frame,id)
  if(id ~= nil and self.collection_frame[id] == nil) then
    self.collection_frame[id] = frame;
    if(self.current_frame  == nil)then
      self.current_frame = frame;
    end
  end
end

function Scene:handler(evt)
  if((BibliotecaAuxiliarEvento.isEventoStart(evt) or BibliotecaAuxiliarEvento.isEventoControle(evt) or BibliotecaAuxiliarEvento.isEventoUsuario(evt)) and self.current_frame ~= nil) then
    self.current_frame:handler(evt);
  end
end


function Scene:setFrameCorrente(id_frame_corrente)
  if(self.collection_frame[id_frame_corrente] ~= nil)then
    self.current_frame = self.collection_frame[id_frame_corrente];
  end
end

module("Scene",package.seeall);


function Scene:limpar(frameCorrente)
  for i,v in pairs(self.collection_frame) do
    if(v ~= frameCorrente)then
      v:limpar();
    end
  end
end
