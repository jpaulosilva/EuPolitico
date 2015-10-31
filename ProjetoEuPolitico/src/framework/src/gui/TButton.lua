TButton = {};

--~Atributos 
TButton.id = "TButton";
TButton.tIcone =  nil;

TButton.isAttTIconeAlterado =  false;

function TButton:__index(tabela,chave)
	return TButton[chave];
end


function TButton:new(obj)
--~ Função new()
end

--~Funcões 
function TButton:draw()
--~ Função draw()
end

function TButton:handler(evt)
--~ Função handler()
end

function TButton:update()
--~ Função atualizar()
end


--~Gets 
function TButton:getTIcone()
	return self.tIcone;
end


--~Sets 
function TButton:setTIcone(tIcone)
	self.tIcone = tIcone;
	self.isAttTIconeAlterado = true;
end

