BibliotecaAuxiliarScript.execute('utils.tcp');
BibliotecaAuxiliarScript.execute('utils.Webs');


-- Função para tratar os dados brutos
local function extrairComparacaoEscolas()



end




-- Função que busca os dados de escolas da web
function carregaComparacaoEscolasWeb(f_callback,parametros)

  local comparacaoEscolas = {};

  local status = -1;

  print("***Buscando Comparações***")

  local url = ""

  local criterio_busca = parametros;

  local dados = webs_post(url,criterio_busca);

  if (dados ~= nil and dados ~= 0) then

    print("Endereço encontrado!")

    comparacaoEscolas = extrairComparacaoEscolas(dados);

    if #comparacaoEscolas ~= 0 then

      print("Tabela com "..#comparacaoEscolas.." encontradas")

      status = 1;

    else
      print("Tabela vazia!")

    end

  else
    print("Endereço não encontrado!")

  end



  f_callback(comparacaoEscolas,status);


end
