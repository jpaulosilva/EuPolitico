BibliotecaAuxiliarScript.execute('utils.json');
BibliotecaAuxiliarScript.execute('utils.tcp');
BibliotecaAuxiliarScript.execute('utils.Webs');
BibliotecaAuxiliarScript.execute('data.Politico');
BibliotecaAuxiliarScript.execute('data.FiltroPolitico');
--[[A busca de candidatos est� sendo feita apenas na busca avan�ada, sendo necess�rio
setar a Regi�o, o Estado, o cargo e o sexo]]

-- Fun��o para tratar os dados brutos dos candidatos e setar na entidade de retorno
local function extrairCandidatos(str)

  local candidatos = {};
  local candidatosSelecionados = '';

  local data = string.match(str,"%[{(.*)}%]")

  if data ~= nil then

    print(data)

    for linhaCandidato in data:split("},{") do

      local candidato = Candidato:new();
      print("****************************************************************")

      print(linhaCandidato);

      print("*****************************************************************")

      for campo in linhaCandidato:split(',') do

        print(campo);

        chave,valor = string.match(campo,'"(.*)":(.*)')

        valor = string.match(valor,'"(.*)"') or valor --Elimina aspas

       
       
        --Busca avan�ada sendo filtrado os candidatos pelo par�metro 'sexo' 
        if chave == "sexo" and valor == CenaBuscaCandidatos.filtro:getSexo()then
        
          --[[A 'linha candidato' que contiver a chave e valor passados como par�metro
          ser�o concatenadas numa nova string chamada 'candidatos selecionados']]
          candidatosSelecionados = candidatosSelecionados..'},{'..linhaCandidato
        end

      end
    end
    
    
     --[[Aqui � feita a quebra da string 'candidatos selecionados' para que seus valores
    sejam setados na entidade de retorno]]

    if candidatosSelecionados ~= "" then

      

      local candidatosFiltrados = string.match(candidatosSelecionados,",{(.*)");


      for objetoCandidato in candidatosFiltrados:split("},{") do

        local candidato = Candidato:new();

        print(objetoCandidato);

        for keyValue in objetoCandidato:split(",") do

          print(keyValue);

          chave,valor = string.match(keyValue,'"(.*)":(.*)')

          valor = string.match(valor,'"(.*)"') or valor --Elimina aspas

          if chave == "id" then
            candidato:setId(valor);
          elseif chave == "regiao" then
            candidato:setRegiao(valor);
          elseif chave == "cidade" then
            candidato:setCidade(valor);
          elseif chave == "uf" then
            candidato:setUf(valor);
          elseif chave == "nomeParlamentar" then
            candidato:setNomeParlamentar(valor);
          elseif chave == "nomeCompleto" then
            candidato:setNomeCompleto(valor);

          elseif chave == "numero" then
            candidato:setNumero(valor);
          elseif chave == "nomeSitCandidatura" then
            candidato:setNomeSitCandidatura(valor);
          elseif chave == "siglaPartido" then
            candidato:setSiglaPartido(valor);
          elseif chave == "nomePartido" then
            candidato:setNomePartido(valor);
          elseif chave == "nomeLegenda" then
            candidato:setNomeLegenda(valor);
          elseif chave == "codLegenda" then
            candidato:setCodLegenda(valor);
          elseif chave == "composicaoLegenda" then
            candidato:setComposicaoLegenda(valor);
          elseif chave == "sexo" then
            candidato:setSexo(valor);
          elseif chave == "nomeRaca" then
            candidato:setNomeRaca(valor);
          elseif chave == "nomeOcupacao" then
            candidato:setNomeOcupacao(valor);
          elseif chave == "nomeEscolaridade" then
            candidato:setNomeEscolaridade(valor);
          elseif chave == "municipioNascimento" then
            candidato:setMunicipioNascimento(valor);
          elseif chave == "estadoNascimento" then
            candidato:setEstadoNascimento(valor);
          elseif chave == "totalBens" then
            candidato:setTotalBens(valor);
          elseif chave == "totalArrecadado" then
            candidato:setTotalArrecadado(valor);
          elseif chave == "ehParlamentarAtual" then
            candidato:setEhParlamentarAtual(valor);
          elseif chave == "cargoParlamentarAtual" then
            candidato:setCargoParlamentarAtual(valor);
          elseif chave == "codParlamentarAtual" then
            candidato:setCodParlamentarAtual(valor);
          end


        end
        table.insert(candidatos,candidato);

      end
    end
  end

  return candidatos;



end


-- Fun��o que busca os dados de candidatos da web tendo como filtro o Estado e cargo do mesmo
function carregaCandidatosWeb(f_callback,parametros)

  local candidatos = {};

  local status = -1;

  print("***Buscando candidatos***")

  local dataTest = {160976}

  local url = 'http://meucongressonacional.com/api/001/candidatos/2014/'..tostring(CenaBuscaCandidatos.filtro:getNomeCargo())..'/'..tostring(CenaBuscaCandidatos.filtro:getEstado());

  local criterio_busca = parametros;

  local dados = webs_get(url,{});

  if (dados ~= nil and dados ~= 0) then

    print("Endere�o encontrado!")

    candidatos = extrairCandidatos(dados);

    if #candidatos ~= 0 then

      print("Tabela com "..#candidatos.." encontradas")

      status = 1;

    else
      print("Tabela vazia!")

    end

  else
    print("Endere�o n�o encontrado!")

  end


  f_callback(candidatos,status);


end

--[[Os detalhes do candidato s�o extra�dos e setados na entidade de retorno
para serem mostrados na tela de detalhes]]
local function extrairDetalhesCandidato(str,candidato)

  local data = string.match(str,"{(.*)}")

  for campo in data:split(",") do
    chave,valor = string.match(campo,'"(.*)":(.*)')

    valor = string.match(valor,'"(.*)"') or valor

    if chave == "id" then
      candidato:setId(valor);
    elseif chave == "regiao" then
      candidato:setRegiao(valor);
    elseif chave == "cidade" then
      candidato:setCidade(valor);
    elseif chave == "uf" then
      candidato:setUf(valor);
    elseif chave == "nomeParlamentar" then
      candidato:setNomeParlamentar(valor);
    elseif chave == "nomeCompleto" then
      candidato:setNomeCompleto(valor);
    elseif chave == "numero" then
      candidato:setNumero(valor);
    elseif chave == "nomeSitCandidatura" then
      candidato:setNomeSitCandidatura(valor);
    elseif chave == "siglaPartido" then
      candidato:setSiglaPartido(valor);
    elseif chave == "nomePartido" then
      candidato:setNomePartido(valor);
    elseif chave == "nomeLegenda" then
      candidato:setNomeLegenda(valor);
    elseif chave == "codLegenda" then
      candidato:setCodLegenda(valor);
    elseif chave == "composicaoLegenda" then
      candidato:setComposicaoLegenda(valor);
    elseif chave == "sexo" then
      candidato:setSexo(valor);
    elseif chave == "nomeRaca" then
      candidato:setNomeRaca(valor);
    elseif chave == "nomeOcupacao" then
      candidato:setNomeOcupacao(valor);
    elseif chave == "nomeEscolaridade" then
      candidato:setNomeEscolaridade(valor);
    elseif chave == "municipioNascimento" then
      candidato:setMunicipioNascimento(valor);
    elseif chave == "estadoNascimento" then
      candidato:setEstadoNascimento(valor);
    elseif chave == "totalBens" then
      candidato:setTotalBens(valor);
    elseif chave == "totalArrecadado" then
      candidato:setTotalArrecadado(valor);
    elseif chave == "ehParlamentarAtual" then
      candidato:setEhParlamentarAtual(valor);
    elseif chave == "cargoParlamentarAtual" then
      candidato:setCargoParlamentarAtual(valor);
    elseif chave == "codParlamentarAtual" then
      candidato:setCodParlamentarAtual(valor);
    end

  end

end

--[[Ap�s um candidato ser escolhido na tabela de resultados, esta fun��o carrega seus destalhes, sendo passado
 o seu ID]]
function carregaDetalhesCandidato(f_callback, candidato)

  local url = 'http://meucongressonacional.com/api/001/candidato/2014/'..candidato:getId();

  print("ID CANDIDATO: "..candidato:getId());


  local dados = webs_get(url,{});


  if (dados ~= nil and dados ~= 0) then

    print('Endereco encontrado!')

    --Extrair detalhes do candidato para entidade de retorno
    extrairDetalhesCandidato(dados, candidato);

  else

    print('Endereco n�o encontrado: '..url)

  end

  f_callback(candidato);

end


