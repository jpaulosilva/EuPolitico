TButton = {};

--~Atributos 
TButton.id = "TButton";
TButton.tIcone =  nil;

TButton.isAttTIconeAlterado =  false;

function TButton:__index(tabela,chave)
	return TButton[chave];
end


function TButton:new(obj)
--~ Fun��o new()
end

--~Func�es 
function TButton:draw()
--~ Fun��o draw()
end

function TButton:handler(evt)
--~ Fun��o handler()
end

function TButton:update()
--~ Fun��o atualizar()
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

