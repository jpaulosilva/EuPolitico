BibliotecaAuxiliarScript.execute('framework.src.util.gui.BibliotecaAuxiliarDesenho');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Foco');

TComponent = {};

--~Atributos 
TComponent.id = "TComponent";
TComponent.corFundo =  nil;
TComponent.isVisible =  false;
TComponent.foco =  nil;
TComponent.corFoco = nil;
TComponent.altura =  nil;
TComponent.largura =  nil;
TComponent.px =  0;
TComponent.py =  0;
TComponent.isFoco =  true;
TComponent.isFocoVisible =  true;
TComponent.margemEsquerda =  2;
TComponent.margemSuperior =  2;
TComponent.margemInferior =  2;
TComponent.margemDireita =  2;

TComponent.isAttCorFundoAlterado =  false;
TComponent.isAttCorFocoAlterado =  false;
TComponent.isAttIsVisibleAlterado =  false;
TComponent.isAttFocoAlterado =  false;
TComponent.isAttAlturaAlterado =  false;
TComponent.isAttPxAlterado =  false;
TComponent.isAttPyAlterado =  false;
TComponent.isAttIsFocoAlterado =  false;
TComponent.isAttIsFocoVisibleAlterado =  false;
TComponent.isAttMargemEsquerdaAlterado =  false;
TComponent.isAttLarguraAlterado =  false;
TComponent.isAttMargemSuperiorAlterado =  false;
TComponent.isAttMargemInferiorAlterado =  false;
TComponent.isAttMargemDireitaAlterado =  false;

function TComponent.__index(tabela,chave)
	return TComponent[chave];
end


function TComponent.new(obj)
	local retorno = obj or {};
	retorno = setmetatable(retorno,TComponent);
	--inicializar as tabelas.
	retorno.corFundo =  Cor.new({r=0,g=0,b=0,alpha=0});
	retorno.foco =  Foco.new({st_estilo = Foco.QUADRADO});
	retorno.foco.cor = Cor.new({r=255,g=255,b=0});
	return retorno;
end

--~Funcoes 
function TComponent:draw()
	error('TComponent: Funcao draw nao implementada!');
end

function TComponent:handler(evt)
	error('TComponent: Funcao handler nao implementada!');
end

function TComponent:update()
	error('TComponent: Funcao update nao implementada!');
end


--~Gets 
function TComponent:getCorFundo()
	return self.corFundo;
end

function TComponent:getCorFoco()
	return self.foco.cor;
end


function TComponent:getIsVisible()
	return self.isVisible;
end

function TComponent:getFoco()
	return self.foco;
end

function TComponent:getAltura()
	return self.altura;
end

function TComponent:getPx()
	return self.px;
end

function TComponent:getIsFoco()
	return self.isFoco;
end

function TComponent:getIsFocoVisible()
	return self.isFocoVisible;
end

function TComponent:getMargemEsquerda()
	return self.margemEsquerda;
end

function TComponent:getPy()
	return self.py;
end

function TComponent:getLargura()
	return self.largura;
end

function TComponent:getMargemSuperior()
	return self.margemSuperior;
end

function TComponent:getMargemInferior()
	return self.margemInferior;
end

function TComponent:getMargemDireita()
	return self.margemDireita;
end


--~Sets 
function TComponent:setCorFundo(corFundo)
	self.corFundo = corFundo;
	self.changed = true;
	self.isAttCorFundoAlterado = true;
end

function TComponent:setCorFoco(corFoco)
	self.foco.cor = corFoco;
	self.changed = true;
	self.isAttCorFocoAlterado = true;
end

function TComponent:setIsVisible(isVisible)
	self.isVisible = isVisible;
	self.changed = true;
	self.isAttIsVisibleAlterado = true;
end

function TComponent:setFoco(foco)
	self.foco = foco;
	self.changed = true;
	self.isAttFocoAlterado = true;
end

function TComponent:setAltura(altura)
	self.altura = altura;
	self.changed = true;
	self.isAttAlturaAlterado = true;
end

function TComponent:setPx(px)
	self.px = px;
	self.changed = true;
	self.isAttPxAlterado = true;
end

function TComponent:setIsFoco(isFoco)
	self.isFoco = isFoco;
	self.changed = true;
	self.isAttIsFocoAlterado = true;
end

function TComponent:setIsFocoVisible(isFocoVisible)
	self.isFocoVisible = isFocoVisible;
	self.changed = true;
	self.isAttIsFocoVisibleAlterado = true;
end

function TComponent:setMargemEsquerda(margemEsquerda)
	self.margemEsquerda = margemEsquerda;
	self.changed = true;
	self.isAttMargemEsquerdaAlterado = true;
end

function TComponent:setPy(py)
	self.py = py;
	self.changed = true;
	self.isAttPyAlterado = true;
end

function TComponent:setLargura(largura)
	self.largura = largura;
	self.changed = true;
	self.isAttLarguraAlterado = true;
end

function TComponent:setMargemSuperior(margemSuperior)
	self.margemSuperior = margemSuperior;
	self.changed = true;
	self.isAttMargemSuperiorAlterado = true;
end

function TComponent:setMargemInferior(margemInferior)
	self.margemInferior = margemInferior;
	self.changed = true;
	self.isAttMargemInferiorAlterado = true;
end

function TComponent:setMargemDireita(margemDireita)
	self.margemDireita = margemDireita;
	self.changed = true;
	self.isAttMargemDireitaAlterado = true;
end

module("TComponent",package.seeall);