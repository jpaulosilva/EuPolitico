BibliotecaAuxiliarScript.execute('framework.src.file.DAO');
BibliotecaAuxiliarScript.execute('framework.src.util.lua.BibliotecaAuxiliarEntradaSaida');
BibliotecaAuxiliarScript.execute('lib.xml.xml');
BibliotecaAuxiliarScript.execute('lib.xml.handler');

DAO_XML = DAO.new();

---Le o xml e imprime na saida da aplicacao
function DAO_XML:getDados(st_file_name)

	--Instância da estrutura que armazenará os dados do xml
	local tableXml = simpleTreeHandler()

    --Abre o arquivo XML
	local f, e = io.open(st_file_name, "r")
	if f then
	  --Armazena o conteudo do arquivo em uma string
	  local xmltext = f:read("*a")

	  --Instancia o objeto que irá converter o arquivo xml em table lua
	  local xmlparser = xmlParser(tableXml)
	  xmlparser:parse(xmltext)
	  --O tableXml agora e a nossa table lua contento os dados do xml

	  return tableXml.root;  
	else
	  error(e)
	end
end
