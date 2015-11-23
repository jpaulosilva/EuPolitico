BibliotecaAuxiliarScript.execute('framework.src.util.gui.BibliotecaAuxiliarDesenho');

Display = {};
Display.tempoUltimaExibicao = 0;
Display.currentFrame = nil;

function Display.show()
	local tempoAgora =  event.uptime();
	local diferencaTempo = (tempoAgora - Display.tempoUltimaExibicao)/1000;
	
	if(Display.currentFrame ~= nil) then
		if(diferencaTempo > 0.1 or Display.tempoUltimaExibicao == 0)then
			--limpa tela
			Display.buffer = BibliotecaAuxiliarDesenho.newImagem(canvas:attrSize());
			BibliotecaAuxiliarDesenho.limparTela(canvas,Cor.new());

			--desenha frame corrente
			Display.currentFrame:draw(Display.buffer,0,0,canvas:attrSize());
		
			BibliotecaAuxiliarDesenho.desenharImagem(0,0,Display.buffer,canvas);
			BibliotecaAuxiliarDesenho.mostrarTela(canvas);
			
			Display.tempoUltimaExibicao = tempoAgora;
			Display.buffer = nil;
		end
	end
end

function Display.setCurrentFrame(frame)
	currentFrame = frame;
end

module("Display",package.seeall);
