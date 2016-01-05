BibliotecaAuxiliarScript.execute('utils.json');
BibliotecaAuxiliarScript.execute('utils.tcp');
BibliotecaAuxiliarScript.execute('utils.Webs');
BibliotecaAuxiliarScript.execute('data.Politico');
BibliotecaAuxiliarScript.execute('data.FiltroPolitico');
--[[A busca de pol�ticos est� sendo feita apenas na busca avan�ada, sendo necess�rio
setar o cargo e o sexo]]

-- Fun��o para tratar os dados brutos com todos os pol�ticos
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

          --[[Aqui � onde o filtro � aplicado. Apenas um filtro por vez, ou seja,
          ou um para busca simples, ou um para busca avan�ada]]

          --Busca simples sendo filtrado pelo par�metro 'partido'
--        if chave == "partido" and valor == CenaBusca.filtro:getPartido()then
--          politicosSelecionados = politicosSelecionados..'},{'..linhaPolitico
--        end
          
          --Busca avan�ada sendo filtrado os pol�ticos pelo par�metro 'sexo'
          if chave == "sexo" and valor == CenaBusca.filtro:getSexo()then
          
          --[[A 'linha pol�tico' que contiver a chave e valor passados como par�metro
          ser�o concatenadas numa nova string chamada 'pol�ticos selecionados']]
          
            politicosSelecionados = politicosSelecionados..'},{'..linhaPolitico 
            
          end

      end


      print("************************************************")

    end
    
    --[[Aqui � feita a quebra da string 'pol�ticos selecionados' para que seus valores
    sejam setados na entidade de retorno]]

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




-- Fun��o que busca os dados de politicos da web
function carregaPoliticosWeb(f_callback,parametros)

  local url;

  local politicos = {};

  local status = -1;

  print("***Buscando politicos***")

  --[[De acordo com a op��o de cargo que estiver na interface a busca � feita por Senador ou Deputado.
  Aqui vem o resultado bruto com todos os pol�ticos, pois nenhum filtro � passado no corpo da URL]]
  if (CenaBusca.filtro:getCargo() == "Senador") then
    url = 'http://www.meucongressonacional.com/api/001/senador';
  else
    url = 'http://www.meucongressonacional.com/api/001/deputado';
  end



  local criterio_busca = parametros;

  local dados = webs_get(url,{});

  if (dados ~= nil and dados ~= 0) then

    print("Endere�o encontrado!")

    --Os dados brutos s�o extra�dos e � passado um filtro
    politicos = extrairPoliticos(dados);

    if #politicos ~= 0 then

      print("Tabela com "..#politicos.." encontradas")

      status = 1;

    else
      print("Tabela vazia!")

    end

  else
    print("Endere�o n�o encontrado!")

  end



  f_callback(politicos,status);


end

--[[Os detalhes do pol�tico s�o extra�dos e setados na entidade de retorno
para serem mostrados na tela de detalhes]]
local function extrairDetalhesPolitico(str,politico)

  local data = string.match(str,"{(.*)}")



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

--[[Ap�s um pol�tico ser escolhido na tabela de resultados, esta fun��o carrega seus destalhes, sendo passado
 o seu ID]]
function carregaDetalhesPolitico(f_callback, politico)

  local url;

  --De acordo com a op��o que estiver setada na interface a busca por detalhes de senador ou deputado � efetuada
  if (CenaBusca.filtro:getCargo() == "Senador") then
    url = 'http://meucongressonacional.com/api/001/senador/'..politico:getId();
  else
    url = 'http://meucongressonacional.com/api/001/deputado/'..politico:getId();
  end



  print("ID POL�TICO: "..politico:getId());


  local dados = webs_get(url,{});

  if (dados ~= nil and dados ~= 0) then

    print('Endereco encontrado!')
    extrairDetalhesPolitico(dados, politico);

  else

    print('Endereco n�o encontrado: '..url)

  end

  f_callback(politico);

end



