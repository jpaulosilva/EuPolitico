BibliotecaAuxiliarScript.execute('framework.src.gui.TComponent');
BibliotecaAuxiliarScript.execute('framework.src.gui.TMenuItem');

TConteiner = TMenuItem.new();

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

function TConteiner:draw(source,x,y,largura,altura)
	if(self.isFoco and self.isFocoVisible) then
		BibliotecaAuxiliarDesenho.setCor(Cor.new({r=0,g=255,b=0}),source);
    BibliotecaAuxiliarDesenho.desenharRetangulo('fill',x + self.px,y + self.py,self.largura,self.altura,source);
    BibliotecaAuxiliarDesenho.setCor(self.corFundo,source);
    BibliotecaAuxiliarDesenho.desenharRetangulo('fill',x + self.px + self.margemEsquerda,y + self.py + self.margemSuperior,self.largura-(self.margemEsquerda+self.margemDireita),self.altura-(self.margemInferior+self.margemSuperior),source);

	else
    BibliotecaAuxiliarDesenho.setCor(self.corFundo,source);
    BibliotecaAuxiliarDesenho.desenharRetangulo('fill',x + self.px,y + self.py,self.largura,self.altura,source);
	end		
	
	
	for i,v in pairs(self.components) do
		
		if(v.isVisible ~= nil and v.isVisible == false)then
		  v:draw(source,x + self.px,y + self.py,self.largura,self.altura);
		end
	end

end

function TConteiner:handler(evt)
	for i,v in pairs(self.components) do
		if(v.isFoco ~= nil and v.isFoco == true)then
			if(v.handler ~= nil)then
				if(v.beforeHandler ~= nil)then
					v:beforeHandler(evt);
				end
				
				v:handler(evt);
				
				if(v.afterHandler ~= nil)then
					v:afterHandler(evt);
				end
			end
		end
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

