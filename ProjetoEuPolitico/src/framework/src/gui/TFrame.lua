BibliotecaAuxiliarScript.execute('framework.src.util.gui.BibliotecaAuxiliarDesenho');

TFrame = {};

--~Atributos
TFrame.id = "TFrame";
TFrame.corFundo =  nil;
TFrame.buffer =  nil;
TFrame.largura =  0;
TFrame.altura =  0;
TFrame.px =  0;
TFrame.py =  0;
TFrame.components =  nil;

TFrame.isAttCorFundoAlterado =  false;
TFrame.isAttBufferAlterado =  false;
TFrame.isAttLarguraAlterado =  false;
TFrame.isAttAlturaAlterado =  false;
TFrame.isAttPxAlterado =  false;
TFrame.isAttPyAlterado =  false;
TFrame.isAttComponentsAlterado =  false;



function TFrame.__index(tabela,chave)
  return TFrame[chave];
end

function TFrame.new(o)
  local retorno = o or {};
  retorno = setmetatable(retorno,TFrame);
  retorno.components = {};
  retorno.corFundo = Cor.new({r=0,g=0,b=0});

  return retorno;
end

function TFrame:draw(source,x,y,largura,altura)
  BibliotecaAuxiliarDesenho.setCor(self.corFundo,source);
  BibliotecaAuxiliarDesenho.desenharRetangulo('fill',x+self.px,y+self.py,self.largura,self.altura,source);
  
  for i,v in pairs(self.components) do
    if(v:getIsVisible()== false)then
      v:draw(source,self.px,self.py,self.largura,self.altura);
    end
  end
end

function TFrame:addComponent(component,indice)
  if(component ~= nil) then
    component:update();

    if(indice ~= nil) then
      self.components[indice] = component;
    end
  end
end


function TFrame:handler(evt)

  for i,v in pairs(self.components) do

    if(v:getIsFoco()== true)then
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

  if(self.action ~= nil)then
    self:action(evt);
  end
end



--~Gets
function TFrame:getCorFundo()
  return self.corFundo;
end

function TFrame:getBuffer()
  return self.buffer;
end

function TFrame:getLargura()
  return self.largura;
end

function TFrame:getAltura()
  return self.altura;
end

function TFrame:getPx()
  return self.px;
end

function TFrame:getPy()
  return self.py;
end

function TFrame:getComponents()
  return self.components;
end


--~Sets
function TFrame:setCorFundo(corFundo)
  self.corFundo = corFundo;
  self.isAttCorFundoAlterado = true;
end

function TFrame:setBuffer(buffer)
  self.buffer = buffer;
  self.isAttBufferAlterado = true;
end

function TFrame:setLargura(largura)
  self.largura = largura;
  self.isAttLarguraAlterado = true;
end

function TFrame:setAltura(altura)
  self.altura = altura;
  self.isAttAlturaAlterado = true;
end

function TFrame:setPx(px)
  self.px = px;
  self.isAttPxAlterado = true;
end

function TFrame:setPy(py)
  self.py = py;
  self.isAttPyAlterado = true;
end

function TFrame:setComponents(components)
  self.components = components;
  self.isAttComponentsAlterado = true;
end

function TFrame:limpar()
  for i,v in pairs(self.components) do
    v:limpar();
  end

  self.components = {};
  self.corFundo = Cor.new({r=0,g=0,b=0});
  self.corFundo =  nil;
  self.buffer =  nil;
  self.largura =  0;
  self.altura =  0;
  self.px =  0;
  self.py =  0;

  self.isAttCorFundoAlterado =  false;
  self.isAttBufferAlterado =  false;
  self.isAttLarguraAlterado =  false;
  self.isAttAlturaAlterado =  false;
  self.isAttPxAlterado =  false;
  self.isAttPyAlterado =  false;
  self.isAttComponentsAlterado =  false;
  collectgarbage('collect');
end



package.seeall(TFrame);
module("TFrame");
