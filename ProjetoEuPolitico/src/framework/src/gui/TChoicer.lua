BibliotecaAuxiliarScript.execute('framework.src.gui.TMenu');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.BibliotecaAuxiliarDesenho');
BibliotecaAuxiliarScript.execute('framework.src.util.event.BibliotecaAuxiliarEvento');
BibliotecaAuxiliarScript.execute('framework.src.util.lua.BibliotecaAuxiliarTabela');
BibliotecaAuxiliarScript.execute('framework.src.util.lua.BibliotecaAuxiliarMath');

TChoicer = TMenu.new();

--~Atributos 
TChoicer.id = "TChoicer";
TChoicer.fonte =  nil;

TChoicer.isAttFonteAlterado =  false;

function TChoicer.__index(tabela,chave)
	return TChoicer[chave];
end

function TChoicer.new(obj)
	local retorno = obj or {};
	retorno = setmetatable(retorno,TChoicer);
	
	retorno.itens = {};
	
	retorno.fonte = Fonte.new({nome='tiresias', tamanho=16});
	retorno.fonte.cor = Cor.new({r=0,g=0,b=0});
	
	retorno:setTamanhoJanela(1);
	retorno:setIsFocoVisible(false);
		
	return retorno;
end



function TChoicer:addItem(item)
	local label = TLabel.new();
	label:setTexto(item);
	label:setFonte(self.fonte);
	
	label:update();
	
	table.insert(self.itens,label);
	self.isAttItensAlterado = true;
	
end

function TChoicer:addAllItens(itens)
	for i,v in pairs(itens) do
		self:addItem(v);
	end	
end

function TChoicer:getItem()
	return self.itens[self.opcaoSelecionada]:getTexto();
end

--~Gets 
function TChoicer:getFonte()
	return self.fonte;
end


--~Sets 
function TChoicer:setFonte(fonte)
	self.fonte = fonte;
	self.changed = true;
	self.isAttFonteAlterado = true;
end


