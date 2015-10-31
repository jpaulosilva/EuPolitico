

ObserverComponent =  {
currentFrame,

	inicialize = function(usedFrame)
		ObserverComponent.currentFrame = usedFrame;
		
		ObserverComponent.currentFrame:inicialize();
	end,
	
--Funcao que escuta o evento
	handler = function(evt)
		--Chama o run em modo protegido (nao sobe os erros!)
		if(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isEventoPress(evt)) then
			collectgarbage('collect');
			ObserverComponent.run(evt);
			
			Display.setCurrentFrame(ObserverComponent.currentFrame);
		elseif(BibliotecaAuxiliarEvento.isEventoControle(evt) and BibliotecaAuxiliarEvento.isEventoRelease(evt) and Display.currentFrame ~= nil) then
			Display.show();
		elseif(BibliotecaAuxiliarEvento.isEventoStart(evt)) then
			ObserverComponent.run(evt);
			
			Display.setCurrentFrame(ObserverComponent.currentFrame);
			Display.show();
		end
	end,

	run = function(evt)		
		
		ObserverComponent.currentFrame:handler(evt);
	end,
	
}

event.register(ObserverComponent.handler);

module("ObserverComponent",package.seeall);
