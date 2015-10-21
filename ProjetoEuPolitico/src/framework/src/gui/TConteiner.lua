BibliotecaAuxiliarScript.execute('framework.src.gui.TComponent');

TConteiner = TComponent.new();

--~Atributos 
TConteiner.id = "TConteiner";
TConteiner.components =  nil;

TConteiner.isAttComponentsAlterado =  false;

function TConteiner.__index(tabela,chave)
	return TConteiner[chave];
end


function TConteiner.new(obj)
	local retorno = o or {};
	retorno = setmetatable(retorno,TConteiner);
	retorno.components = {};
	return retorno;
end

function TConteiner:draw()
	local fundo = nil;
	
	if(self.isFoco and self.isFocoVisible) then
		local foco = BibliotecaAuxiliarDesenho.newImagem(self.largura,self.altura);
		BibliotecaAuxiliarDesenho.limparTela(foco,Cor.new({r=0,g=255,b=0}));
		local fundo_foco = BibliotecaAuxiliarDesenho.newImagem(self.largura-(self.margemEsquerda+self.margemDireita),self.altura-(self.margemInferior+self.margemSuperior));
		BibliotecaAuxiliarDesenho.limparTela(fundo_foco,self.corFundo);
		BibliotecaAuxiliarDesenho.desenharImagem(self.margemEsquerda,self.margemSuperior,fundo_foco,foco);
		
		fundo = foco;
	else
		local img = BibliotecaAuxiliarDesenho.newImagem(self.largura,self.altura);
		BibliotecaAuxiliarDesenho.limparTela(img,self.corFundo);
		fundo = img;
	end		
	
	
	for i,v in pairs(self.components) do
		
		if(v.isVisible ~= nil and v.isVisible == false)then
			BibliotecaAuxiliarDesenho.desenharImagem(v.px,v.py,v:draw(),fundo);	
		end
	end
	
	return fundo;
end

function TConteiner:handler(evt)
	
	if(self.beforeHandler ~= nil)then
		self:beforeHandler(evt);
	end
	
	for i,v in pairs(self.components) do
		if(v.isFoco ~= nil and v.isFoco == true)then
			if(v.handler ~= nil)then
				if(v.beforeHandler ~= nil)then
					v:beforeHandler(evt);
				end
				
				v:handler(evt);
				
				if(v.beforeHandler ~= nil)then
					v:beforeHandler(evt);
				end
			end
		end
	end
	
	if(self.beforeHandler ~= nil)then
		self:beforeHandler(evt);
	end
end

function TConteiner:update()
	for i,v in pairs(self.components) do
		v:update();
	end
end

--~Funcoes 

function TConteiner:addComponent(component,pos)
	component:update();
	self.changed = true;
	
	if(pos~=nil)then
		table.insert(self.components,pos,component);
	else
		table.insert(self.components,component);
	end
end

function TConteiner:addComponentAll(components)
	for i,v in pairs(components)do
		self:addComponent(v);
	end
end

function TConteiner:setComponent(component,pos)
	component:update();
	self.changed = true;
	table.insert(self.components,pos,component);
end


--~Gets 
function TConteiner:getComponents()
	return self.components;
end


--~Sets 
function TConteiner:setComponents(components)
	self.components = components;
	self.changed = true;
	self.isAttComponentsAlterado = true;
end

