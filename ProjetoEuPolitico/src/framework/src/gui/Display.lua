BibliotecaAuxiliarScript.execute('framework.src.util.gui.BibliotecaAuxiliarDesenho');

Display = {};

Display.buffer = BibliotecaAuxiliarDesenho.newImagem(canvas:attrSize());
Display.tempoUltimaExibicao = 0;
Display.currentFrame = nil;

function Display.show()
	local tempoAgora =  event.uptime();
	local diferencaTempo = tempoAgora - Display.tempoUltimaExibicao;
	
	if(Display.currentFrame ~= nil) then
		if(diferencaTempo > 0.2 or Display.tempoUltimaExibicao == 0)then
			--limpa tela
			BibliotecaAuxiliarDesenho.limparTela(Display.buffer,Cor.new());
			BibliotecaAuxiliarDesenho.limparTela(canvas,Cor.new());
			 
			--desenha frame corrente
			local canvas_draw = Display.currentFrame:draw();
			
			BibliotecaAuxiliarDesenho.desenharImagem(Display.currentFrame:getPx(),Display.currentFrame:getPy(),canvas_draw,Display.buffer);
				
			--mostra na tela.
			
		
			--BibliotecaAuxiliarDesenho.desenharTextoAlerta(200,200,'Testando',Display.buffer)
			BibliotecaAuxiliarDesenho.desenharImagem(0,0,Display.buffer,canvas);
			BibliotecaAuxiliarDesenho.mostrarTela(canvas);
			
			Display.tempoUltimaExibicao = tempoAgora;
		end
	end
end

function Display.setCurrentFrame(frame)
	currentFrame = frame;
end

module("Display",package.seeall);
