BibliotecaAuxiliarScript.execute('framework.src.file.DAO');
BibliotecaAuxiliarScript.execute('framework.src.util.lua.BibliotecaAuxiliarEntradaSaida');


DAO_CSV = DAO.new();

function DAO_CSV:getDados(st_file_name)

  retorno={}
  
  for line in io.lines(st_file_name) do
    tabLine = tokenize(line,",")
    table.insert(retorno,tabLine);
  end

  return retorno;
end
