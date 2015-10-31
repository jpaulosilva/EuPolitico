BibliotecaAuxiliarScript.execute('framework.src.gui.TComponent');

TAnimation = TComponent;

TAnimation.id = "TAnimation";
TAnimation.tComponent = nil;
TAnimation.indice = 0;
TAnimation.tempoUltimaExibicao = 0;
TAnimation.eventoLigado = false;

function TAnimation.__index(tabela,chave)
	return TAnimation[chave];
end


function TAnimation.new(obj)
	local retorno = obj or {};
	retorno = setmetatable(retorno,TAnimation);	
	
	TAnimation.indice = TAnimation.indice + 1;
	retorno.indice = TAnimation.indice; 
	retorno:setIsVisible(true);
	return retorno;
end

--~Funcões
function TAnimation:draw()
	
end

function TAnimation:iniciar()
	self.eventoLigado = true;
	BibliotecaAuxiliarEvento.lancarEvento({indiceAnimacao = self.indice});
end
 
function TAnimation:handler(evt)
	
	if(BibliotecaAuxiliarEvento.isEventoUsuario(evt) and evt.indiceAnimacao ~= nil and self.indice == evt.indiceAnimacao and self.eventoLigado) then
		local tempoAgora =  event.uptime();
	local diferencaTempo = tempoAgora - self.tempoUltimaExibicao;
	
	if(diferencaTempo > 2.5 or self.tempoUltimaExibicao == 0)then
		self:processar(evt);	
		self.tempoUltimaExibicao = tempoAgora;
		evt.changed = true;
	end
		BibliotecaAuxiliarEvento.lancarEvento({indiceAnimacao = self.indice});
	end
end



function TAnimation:processar(evt)
	error('TAnimation: Função processar não implementada!');
end
