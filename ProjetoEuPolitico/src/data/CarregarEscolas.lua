BibliotecaAuxiliarScript.execute('utils.json');
BibliotecaAuxiliarScript.execute('utils.tcp');
BibliotecaAuxiliarScript.execute('utils.Webs');
BibliotecaAuxiliarScript.execute('data.Escola');


--Função para extrair dados no resultado da consulta
local function extractAPIdata(str)
  local escolas = {}
  local data = string.match(str,"%[%d+,%[{(.*)}%]%]")

  if data ~= nil then
    for linhaEscola in data:split("},{") do
      escola = Escola:new();
      --print(linhaEscola);
      for campo in linhaEscola:split(",") do
        chave,valor = string.match(campo,'"(.*)":(.*)')

        valor = string.match(valor,'"(.*)"') or valor --elimina aspas de alguns campos do servico web

        if chave == "regiao" then
          escola:setRegiao(valor);
        elseif chave == "cod" then
          escola:setCod(valor);
        elseif chave == "anoCenso" then
          escola:setAnoCenso(valor);
        elseif chave == "estado" then
          escola:setEstado(valor);
        elseif chave == "cidade" then
          escola:setCidade(valor);
        elseif chave == "nome" then
          escola:setNome(valor);
        elseif chave == "idebAI" then
          escola:setIdebAI(string.format("%.2f", valor) );
        elseif chave == "idebAF" then
          escola:setIdebAF(string.format("%.2f", valor) );
        elseif chave == "enemMediaGeral" then
          escola:setEnemGeral(string.format("%.2f", valor) );
        end

      end

      table.insert(escolas,escola)

    end
  end
  return escolas

end


--Busca avançada de escolas
function carregaEscolasWeb(f_callback,parameters)



  --  local APP = coroutine.create (
  --
  --      function ()

  local escolas = {}

  local status = -1

  local dataTest = {estado="PE"}; --nome="douglas", cidade=codigo_da_cidade

  print('*** Buscando todas as escolas da Web')

  local url = 'http://educacao.dadosabertosbr.com/api/escolas/buscaavancada'

  local search_criteria = parameters or dataTest

  local dados = webs_post(url,search_criteria)

  if (dados ~= nil and dados ~= 0) then

    print('Endereco encontrado!')
    escolas = extractAPIdata(dados)
    if #escolas ~= 0 then
      --print('Tabela de escolas extraidas! qtd: '..#escolas)
      status = 1 --encontrado
    else
      print('Tabela de escolas vazia: ')
      --status = -1 --erro
    end

  else

    print('Endereco nao encontrado: '..url)

    --status = -1 --nao encontrado

  end

  f_callback(escolas,status)

  --      end
  --
  --  )
  --
  --  coroutine.resume(APP)

end


function carregaEscolasArquivo()

  local escolas = {}

  for line in io.lines("../../media/escolasTeste.txt") do



    --  for i,v in pairs(escolas) do

    --    jsonTest = json.encode(v)



    --  print('JSON encoded test is: ' .. jsonTest)

    --  print(type(jsonTest))



    -- Now JSON decode the json string

    result = json.decode(line)



    print ("The decoded table result:")



    for i,v in pairs(result) do

      for k, x in pairs (v) do

        --print(j,x)

        if k == "regiao" then

          escola = Escola:new();

          escola:setRegiao(x);

          print(escola:getRegiao())

        elseif k == "cod" then

          escola = Escola:new();

          escola:setCod(x);

          print(escola:getCod())

        elseif k == "anoCenso" then

          escola = Escola:new();

          escola:setAnoCenso(x);

          print(escola:getAnoCenso());

        elseif k == "estado" then

          escola = Escola:new();

          escola:setEstado(x);

          print(escola:getEstado());

        elseif k == "cidade" then

          escola = Escola:new();

          escola:setCidade(x);

          print(escola:getCidade());

        elseif k == "nome" then

          escola = Escola:new();

          escola:setNome(x);

          print(escola:getNome());

        end

      end

      table.insert(escolas,escola)

    end

  end

  return escolas

end

--Função para extrair dados para tela de detalhes da escola
local function extractDetalhesEscolaAPIdata(str,escola)

  local data = string.match(str,"{(.*)}")



  for campo in data:split(",") do
    chave,valor = string.match(campo,'"(.*)":(.*)')

    if(valor ~= nil) then
      valor = string.match(valor,'"(.*)"') or valor --elimina aspas de alguns campos do servico web

      if chave == "situacaoFuncionamento" then
        if(valor == "1") then
          escola:setSituacaoFuncionamento("Em Atividade");
        elseif(valor == "2") then
          escola:setSituacaoFuncionamento("Paralisada");
        elseif(valor == "3") then
          escola:setSituacaoFuncionamento("Extinta");
        elseif(valor == "4") then
          escola:setSituacaoFuncionamento("Extinta no ano anterior");
        end
      elseif chave == "regulamentada" then
        if(valor == "0") then
          escola:setRegulamentada("Não");
        elseif(valor == "1") then
          escola:setRegulamentada("Sim");
        elseif(valor == "2") then
          escola:setRegulamentada("Em tramitação");
        end
      elseif chave == "tipoLocalizacao" then
        if(valor == "1") then
          escola:setTipoLocalizacao("Urbana");
        elseif(valor == "2") then
          escola:setTipoLocalizacao("Rural");
        end

      elseif chave == "dependenciaAdministrativa" then
        if (valor == "1") then
          escola:setDependenciaAdministrativa("Federal");
        elseif (valor == "2") then
          escola:setDependenciaAdministrativa("Estadual");
        elseif (valor == "3") then
          escola:setDependenciaAdministrativa("Municipal");
        elseif (valor == "4") then
          escola:setDependenciaAdministrativa("Privada");
        end


      elseif chave == "endereco" then
        escola:setEndereco(valor);

      elseif chave == "aguaPublica" then
        escola:setAguaPublica(valor);
      elseif chave == "aguaPocoArtesiano" then
        escola:setAguaPocoArtesiano(valor);
      elseif chave == "aguaCacimba" then
        escola:setAguaCacimba(valor);
      elseif chave == "aguaInexistente" then
        escola:setAguaInexistente(valor);
      elseif chave == "energiaPublica" then
        escola:setEnergiaPublica(valor);
      elseif chave == "energiaGerador" then
        escola:setEnergiaGerador(valor);
      elseif chave == "energiaOutros" then
        escola:setEnergiaOutros(valor);
      elseif chave == "energiaInexistente" then
        escola:setEnergiaInexistente(valor);
      elseif chave == "esgotoPublico" then
        escola:setEsgotoPublico(valor);
      elseif chave == "esgotoFossa" then
        escola:setEsgotoFossa(valor);
      elseif chave == "esgotoInexistente" then
        escola:setEsgotoInexistente(valor);
      elseif chave == "lixoColetaPeriodica" then
        escola:setLixoColetaPeriodica(valor);
      elseif chave == "lixoQueima" then
        escola:setLixoQueima(valor);
      elseif chave == "lixoJogaOutraArea" then
        escola:setLixoJogaOutraArea(valor);
      elseif chave == "lixoRecicla" then
        escola:setLixoRecicla(valor);
      elseif chave == "lixoEnterra" then
        escola:setLixoEnterra(valor);
      elseif chave == "lixoOutros" then
        escola:setLixoOutros(valor);
      elseif chave == "aguaFiltrada" then
        escola:setAguaFiltrada(valor);

      elseif chave == "salaDiretoria" then
        escola:setSalaDiretoria(valor);
      elseif chave == "laboratorioInformatica" then
        escola:setLaboratorioInformatica(valor);
      elseif chave == "laboratorioCiencias" then
        escola:setLaboratorioCiencias(valor);
      elseif chave == "biblioteca" then
        escola:setBiblioteca(valor);
      elseif chave == "salaLeitura" then
        escola:setSalaLeitura(valor);
      elseif chave == "refeitorio" then
        escola:setRefeitorio(valor);
      elseif chave == "despensa" then
        escola:setDespensa(valor);
      elseif chave == "almoxarifado" then
        escola:setAlmoxarifado(valor);
      elseif chave == "auditorio" then
        escola:setAuditorio(valor);
      elseif chave == "patioCoberto" then
        escola:setPatioCoberto(valor);
      elseif chave == "areaVerde" then
        escola:setAreaVerde(valor);
      elseif chave == "lavanderia" then
        escola:setLavanderia(valor);
      elseif chave == "salaProfessores" then
        escola:setSalaProfessores(valor);
      elseif chave == "atendimentoEspecial" then
        escola:setAtendimentoEspecial(valor);
      elseif chave == "quadraCoberta" then
        escola:setQuadraCoberta(valor);
      elseif chave == "cozinha" then
        escola:setCozinha(valor);
      elseif chave == "parqueInfantil" then
        escola:setParqueInfantil(valor);
      elseif chave == "bercario" then
        escola:setBercario(valor);
      elseif chave == "sanitarioForaPredio" then
        escola:setSanitarioForaPredio(valor);
      elseif chave == "sanitarioDentroPredio" then
        escola:setSanitarioDentroPredio(valor);
      elseif chave == "sanitarioPNE" then
        escola:setSanitarioPNE(valor);
      elseif chave == "secretaria" then
        escola:setSecretaria(valor);
      elseif chave == "dependenciasPNE" then
        escola:setDependenciasPNE(valor);
      elseif chave == "banheiroChuveiro" then
        escola:setBanheiroChuveiro(valor);
      elseif chave == "alojamentoAluno" then
        escola:setAlojamentoAluno(valor);
      elseif chave == "inicioAno" then
        escola:setInicioAno(os.date("%d/%m/%y", string.match(valor,"(%d+)000")));
      elseif chave == "fimAno" then
        escola:setFimAno(os.date("%d/%m/%y", string.match(valor,"(%d+)000")));
      elseif chave == "codMunicipio" then
        escola:setCodMunicipio(valor);
      end
    end
  end

end

--Carrega detalhes das escolas vindos do serviço remoto
function carregaDetalhesEscola(f_callback,escola)


  --local APP = coroutine.create (

  --      function ()

  local url = 'http://educacao.dadosabertosbr.com/api/escola/'..escola:getCod()

  local dados = webs_get(url,{})

  if (dados ~= nil and dados ~= 0) then

    print('Endereco encontrado!')
    extractDetalhesEscolaAPIdata(dados,escola)

  else

    print('Endereco nao encontrado: '..url)

    --status = -1 --nao encontrado
  end



  f_callback(escola)

  --    end

  --)

  --coroutine.resume(APP)

end
