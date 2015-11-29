BibliotecaAuxiliarScript.execute('utils.json');
BibliotecaAuxiliarScript.execute('utils.tcp');
BibliotecaAuxiliarScript.execute('utils.Webs');
BibliotecaAuxiliarScript.execute('data.Politico');
BibliotecaAuxiliarScript.execute('data.FiltroPolitico');


-- Função para tratar os dados brutos
local function extrairDeputados(str)

  local deputados = {};
  local deputadosSelecionados = '';

  local data = string.match(str,"{(.*)}")


  if data ~= nil then

    --print(data)

    for linhaDeputado in data:split("},{") do

      print(linhaDeputado);


      for campo in linhaDeputado:split(",") do

        print(campo);

        chave,valor = string.match(campo,'"(.*)":(.*)')

        valor = string.match(valor,'"(.*)"') or valor --Elimina aspas

        --        print("CHAVE -> "..chave);
        --        print("VALOR -> "..valor);
        --
        --        print("VALOR PEGO NO FILTRO: "..CenaBusca.filtro:getPartido());



        if chave == "partido" and valor == CenaBusca.filtro:getPartido() then

          print("ENTROU NA CHAVE PARTIDO!")

          deputadosSelecionados = deputadosSelecionados..'},{'..linhaDeputado

        end


      end



      print("************************************************")

    end

    if deputadosSelecionados ~= "" then


      local deputadosFiltrados = string.match(deputadosSelecionados,",{(.*)");

      print("LISTA DEPUTADOS FILTRADOS: "..deputadosFiltrados);

      for objetoDeputado in deputadosFiltrados:split("},{") do

        local deputado = Politico:new();

        print(objetoDeputado);

        for keyValue in objetoDeputado:split(",") do

          print(keyValue);

          chave,valor = string.match(keyValue,'"(.*)":(.*)')

          valor = string.match(valor,'"(.*)"') or valor --Elimina aspas


          if chave == "id" then
            deputado:setId(valor);
          elseif chave == "regiao" then
            deputado:setRegiao(valor);
          elseif chave == "cidade" then
            deputado:setCidade(valor);
          elseif chave == "uf" then
            deputado:setUf(valor);
          elseif chave == "nomeParlamentar" then
            deputado:setNomeParlamentar(valor);
          elseif chave == "nomeCompleto" then
            deputado:setNomeCompleto(valor);
          elseif chave == "cargo" then
            deputado:setCargo(valor);
          elseif chave == "partido" then
            deputado:setPartido(valor);
          elseif chave == "mandato" then
            deputado:setMandato(valor);
          elseif chave == "sexo" then
            deputado:setSexo(valor);
          elseif chave == "telefone" then
            deputado:setTelefone(valor);
          elseif chave == "email" then
            deputado:setEmail(valor);
          elseif chave == "nascimento" then
            deputado:setNascimento(valor);
          elseif chave == "gastoTotal" then
            deputado:setGastoTotal(valor);
          elseif chave == "gastoPorDia" then
            deputado:setGastoPorDia(valor);
          end

        end

        table.insert(deputados,deputado);

      end

    end

  end

  return deputados;

end




-- Função que busca os dados deputados da web
function carregaDeputadosWeb(f_callback,parametros)

  local deputados = {};

  local status = -1;

  print("***Buscando Deputados***")

  local dataTest = {160976}

  local url = 'http://www.meucongressonacional.com/api/001/deputado';

  local criterio_busca = parametros;

  local dados = webs_get(url,{});

  if (dados ~= nil and dados ~= 0) then

    print("Endereço encontrado!")

    deputados = extrairDeputados(dados);

    if #deputados ~= 0 then

      print("Tabela com "..#deputados.." encontradas")

      status = 1;

    else
      print("Tabela vazia!")

    end

  else
    print("Endereço não encontrado!")

  end



  f_callback(deputados,status);


end

--Carregar detalhes deputados
local function extrairDetalhesDeputado(str,deputado)

  local data = string.match(str,"{(.*)}")

  for campo in data:split(",") do
    chave,valor = string.match(campo,'"(.*)":(.*)')

    if(valor ~= nil) then
      valor = string.match(valor,'"(.*)"') or valor

      if chave == "id" then
        deputado:setId(valor);
      elseif chave == "regiao" then
        deputado:setRegiao(valor);
      elseif chave == "cidade" then
        deputado:setCidade(valor);
      elseif chave == "uf" then
        deputado:setUf(valor);
      elseif chave == "nomeParlamentar" then
        deputado:setNomeParlamentar(valor);
      elseif chave == "nomeCompleto" then
        deputado:setNomeCompleto(valor);
      elseif chave == "cargo" then
        deputado:setCargo(valor);
      elseif chave == "partido" then
        deputado:setPartido(valor);
      elseif chave == "mandato" then
        deputado:setMandato(valor);
      elseif chave == "sexo" then
        deputado:setSexo(valor);
      elseif chave == "telefone" then
        deputado:setTelefone(valor);
      elseif chave == "email" then
        deputado:setEmail(valor);
      elseif chave == "nascimento" then
        deputado:setNascimento(valor);
      elseif chave == "gastoTotal" then
        deputado:setGastoTotal(valor);
      elseif chave == "gastoPorDia" then
        deputado:setGastoPorDia(valor);
      end
    end
  end

end


function carregaDetalhesDeputado(f_callback, deputado)

  local url = 'http://meucongressonacional.com/api/001/deputado/'..deputado:getId();

  local dados = webs_get(url,{});

  if (dados ~= nil and dados ~= 0) then

    print('Endereco encontrado!')
    extrairDetalhesDeputado(dados, deputado);

  else

    print('Endereco não encontrado: '..url)

  end

  f_callback(deputado);

end

