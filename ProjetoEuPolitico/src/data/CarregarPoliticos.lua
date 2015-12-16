BibliotecaAuxiliarScript.execute('utils.json');
BibliotecaAuxiliarScript.execute('utils.tcp');
BibliotecaAuxiliarScript.execute('utils.Webs');
BibliotecaAuxiliarScript.execute('data.Politico');
BibliotecaAuxiliarScript.execute('data.FiltroPolitico');


-- Função para tratar os dados brutos
local function extrairPoliticos(str)

  local politicos = {};
  local politicosSelecionados = '';

  local data = string.match(str,"{(.*)}")


  if data ~= nil then

    --print(data)

    for linhaPolitico in data:split("},{") do

      print(linhaPolitico);


      for campo in linhaPolitico:split(",") do

        print(campo);

        chave,valor = string.match(campo,'"(.*)":(.*)')

        valor = string.match(valor,'"(.*)"') or valor --Elimina aspas

        --        print("CHAVE -> "..chave);
        --        print("VALOR -> "..valor);
        --
        --        print("VALOR PEGO NO FILTRO: "..CenaBusca.filtro:getPartido());


        if chave == "partido" and valor == CenaBusca.filtro:getPartido()then
          politicosSelecionados = politicosSelecionados..'},{'..linhaPolitico
        end

      end


      print("************************************************")

    end

    if politicosSelecionados ~= "" then


      local politicosFiltrados = string.match(politicosSelecionados,",{(.*)");

      print("LISTA POLITICOS FILTRADOS: "..politicosFiltrados);

      for objetoPolitico in politicosFiltrados:split("},{") do

        local politico = Politico:new();

        print(objetoPolitico);

        for keyValue in objetoPolitico:split(",") do

          print(keyValue);

          chave,valor = string.match(keyValue,'"(.*)":(.*)')

          valor = string.match(valor,'"(.*)"') or valor --Elimina aspas


          if chave == "id" then
            politico:setId(valor);
          elseif chave == "regiao" then
            politico:setRegiao(valor);
          elseif chave == "cidade" then
            politico:setCidade(valor);
          elseif chave == "uf" then
            politico:setUf(valor);
          elseif chave == "nomeParlamentar" then
            politico:setNomeParlamentar(valor);
          elseif chave == "nomeCompleto" then
            politico:setNomeCompleto(valor);
          elseif chave == "cargo" then
            politico:setCargo(valor);
          elseif chave == "partido" then
            politico:setPartido(valor);
          elseif chave == "mandato" then
            politico:setMandato(valor);
          elseif chave == "sexo" then
            politico:setSexo(valor);
          elseif chave == "telefone" then
            politico:setTelefone(valor);
          elseif chave == "email" then
            politico:setEmail(valor);
          elseif chave == "nascimento" then
            politico:setNascimento(valor);
          elseif chave == "gastoTotal" then
            politico:setGastoTotal(valor);
          elseif chave == "gastoPorDia" then
            politico:setGastoPorDia(valor);
          end

        end

        table.insert(politicos,politico);

      end

    end

  end

  return politicos;

end




-- Função que busca os dados politicos da web
function carregaPoliticosWeb(f_callback,parametros)

  local url;

  local politicos = {};

  local status = -1;

  print("***Buscando politicos***")


  if (CenaBusca.filtro:getCargo() == "Senador") then
    url = 'http://www.meucongressonacional.com/api/001/senador';
  else
    url = 'http://www.meucongressonacional.com/api/001/deputado';
  end



  local criterio_busca = parametros;

  local dados = webs_get(url,{});

  if (dados ~= nil and dados ~= 0) then

    print("Endereço encontrado!")

    politicos = extrairPoliticos(dados);

    if #politicos ~= 0 then

      print("Tabela com "..#politicos.." encontradas")

      status = 1;

    else
      print("Tabela vazia!")

    end

  else
    print("Endereço não encontrado!")

  end



  f_callback(politicos,status);


end

--Carregar detalhes politicos
local function extrairDetalhesPolitico(str,politico)

  local data = string.match(str,"{(.*)}")

  print("DATA %$%$%$%$%$%$%$ "..data);


  for campo in data:split(",") do
    chave,valor = string.match(campo,'"(.*)":(.*)')

    if(valor ~= nil) then
      valor = string.match(valor,'"(.*)"') or valor

      if chave == "id" then
        politico:setId(valor);
      elseif chave == "regiao" then
        politico:setRegiao(valor);
      elseif chave == "cidade" then
        politico:setCidade(valor);
      elseif chave == "uf" then
        politico:setUf(valor);
      elseif chave == "nomeParlamentar" then
        politico:setNomeParlamentar(valor);
      elseif chave == "nomeCompleto" then
        politico:setNomeCompleto(valor);
      elseif chave == "cargo" then
        politico:setCargo(valor);
      elseif chave == "partido" then
        politico:setPartido(valor);
      elseif chave == "mandato" then
        politico:setMandato(valor);
      elseif chave == "sexo" then
        politico:setSexo(valor);
      elseif chave == "telefone" then
        politico:setTelefone(valor);
      elseif chave == "email" then
        politico:setEmail(valor);
      elseif chave == "nascimento" then
        politico:setNascimento(valor);
      elseif chave == "gastoTotal" then
        politico:setGastoTotal(valor);
      elseif chave == "gastoPorDia" then
        politico:setGastoPorDia(valor);
      end
    end
  end

end


function carregaDetalhesPolitico(f_callback, politico)

  local url;

  if (CenaBusca.filtro:getCargo() == "Senador") then
    url = 'http://meucongressonacional.com/api/001/senador/'..politico:getId();
  else
    url = 'http://meucongressonacional.com/api/001/deputado/'..politico:getId();
  end



  print("ID POLÍTICO: "..politico:getId());


  local dados = webs_get(url,{});

  if (dados ~= nil and dados ~= 0) then

    print('Endereco encontrado!')
    extrairDetalhesPolitico(dados, politico);

  else

    print('Endereco não encontrado: '..url)

  end

  f_callback(politico);

end



