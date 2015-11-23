--- Define special sequences of characters.
-- For each pair (find, subs), the function will create a field named with
-- find which has the value of subs.
-- It also creates an index for the table, according to the order of insertion.
-- @param subs The replacement pattern.
-- @param find The pattern to find.

SystemProperties =
{
	PROJECT_PATH = ""
}

function inicialize() 
	getProjectPath();
	--executando a biblioteca auxiliar de scripts
	require('framework.src.util.app.BibliotecaAuxiliarScript');
	BibliotecaAuxiliarScript.addScriptExecuted('framework.src.util.app.BibliotecaAuxiliarScript.lua');
	
	--executando scripts necessarios para o framework
	BibliotecaAuxiliarScript.execute('framework.src.util.log.BibliotecaAuxiliarLog');
	
	BibliotecaAuxiliarScript.execute('framework.src.util.lua.BibliotecaAuxiliarEntradaSaida');
	BibliotecaAuxiliarScript.execute('framework.src.util.lua.BibliotecaAuxiliarMath');
	BibliotecaAuxiliarScript.execute('framework.src.util.lua.BibliotecaAuxiliarTabela');
	BibliotecaAuxiliarScript.execute('framework.src.util.lua.BibliotecaAuxiliarTexto');

	BibliotecaAuxiliarScript.execute('framework.src.util.event.BibliotecaAuxiliarEvento');
	BibliotecaAuxiliarScript.execute('framework.src.util.gui.BibliotecaAuxiliarDesenho');
	
	BibliotecaAuxiliarScript.execute('framework.src.gui.Display');
end

function getProjectPath()
	path = tokenize(package.path,";");
	for i,v in pairs(path)do
		if(string.find(v,"ProjetoEducacaoInteligente")~=nil)then
			local fim = string.find(v,"?");
			if(fim ~= nil)then
				fim = fim-1;
			end
			SystemProperties.PROJECT_PATH = string.sub(v,0,fim);
		end
	end
	package.cpath = package.cpath..";"..SystemProperties.PROJECT_PATH.."lib/?.dll"
end

tokenize = function (texto, token)

	if (texto ~= nil) then

		local retorno = {};
		local indiceInicio = 1;

		local indiceToken = string.find (texto, token,indiceInicio);

		while (indiceToken ~= nil)
		do
			valor = string.sub(texto, indiceInicio , indiceToken-1)
			table.insert(retorno,valor);

			indiceInicio = indiceToken+1;
			indiceToken = string.find (texto, token,indiceInicio);
		end

		table.insert(retorno,string.sub (texto, indiceInicio));

		return retorno;

	end

end

local isSemErro,msgErro = pcall(inicialize);

if(not isSemErro) then
	canvas:attrColor(0,0,0,255);
	canvas:drawRect('fill',0,0,canvas:attrSize());
	canvas:attrColor(255,0,0,255);
	canvas:drawText(0,100,tostring(msgErro));
	canvas:flush();
	canvas:attrColor(0,0,0,255);
end
