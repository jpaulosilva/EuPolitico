BibliotecaAuxiliarScript.execute('utils.json');
BibliotecaAuxiliarScript.execute('utils.tcp');
BibliotecaAuxiliarScript.execute('utils.Webs');
BibliotecaAuxiliarScript.execute('data.Estatistica');


-- Fun��o para tratar os dados brutos
local function extrairEstatisticas(str)

  local estatisticas = {};

  local data = string.match(str,"{(.*)}")


  if data ~= nil then

    local estatistica = Estatistica:new();

--    print(data)

    for campo in data:split(",") do

--      print(campo);

      chave,valor = string.match(campo,'"(.*)":(.*)')

      valor = string.match(valor,'"(.*)"') or valor --Elimina aspas

      
      

    end

    table.insert(estatisticas,estatistica)


  end

  return estatisticas;

end




-- Fun��o que busca os dados estatisticos da web
function carregaEstatisticasWeb(f_callback,parametros)

  local estatisticas = {};

  local status = -1;

  print("***Buscando Estat�sticas***")

  local url = ""

  local criterio_busca = parametros;

  local dados = webs_get(url,criterio_busca);

  if (dados ~= nil and dados ~= 0) then

    print("Endere�o encontrado!")

    estatisticas = extrairEstatisticas(dados);

    if #estatisticas ~= 0 then

--      print("Tabela com "..#estatisticas.." encontradas")

      status = 1;

    else
      print("Tabela vazia!")

    end

  else
    print("Endere�o n�o encontrado!")

  end



  f_callback(estatisticas,status);


end
