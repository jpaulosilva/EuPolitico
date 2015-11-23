BibliotecaAuxiliarScript.execute('utils.json');
BibliotecaAuxiliarScript.execute('utils.tcp');
BibliotecaAuxiliarScript.execute('utils.Webs');
BibliotecaAuxiliarScript.execute('data.Estatistica');


-- Função para tratar os dados brutos
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

      
      if chave == "idebAI" then
        estatistica:setIdebAnosIniciais(valor);
      elseif chave == "idebAF" then
        estatistica:setIdebAnosFinais(valor);
      elseif chave == "enemMediaGeral" then
        estatistica:setEnem(valor)
      elseif chave == "regulamentadaSim" then
        estatistica:setRegulamentadaSim(valor);
      elseif chave == "regulamentadaNao" then
        estatistica:setRegulamentadaNao(valor);
      elseif chave == "regulamentadaTramitacao" then
        estatistica:setRegulamentadaTramitacao(valor);
      elseif chave == "situacaoFuncionamentoAtividade" then
        estatistica:setSituacaoFuncionamentoAtividade(valor);
      elseif chave == "situacaoFuncionamentoParalisada" then
        estatistica:setSituacaoFuncionamentoParalisada(valor);
      elseif chave == "situacaoFuncionamentoExtinta" then
        estatistica:setSituacaoFuncionamentoExtinta(valor);
      elseif chave == "situacaoFuncionamentoExtintaAnoAnterior" then
        estatistica:setSituacaoFuncionamentoExtintaAnoAnterior(valor);
      elseif chave == "situacaoFuncionamentoNaoInformado" then
        estatistica:setSituacaoFuncionamentoNaoInformado(valor);
      elseif chave == "dependenciaAdministrativaFederal" then
        estatistica:setDependenciaAdministrativaFederal(valor);
      elseif chave == "dependenciaAdministrativaEstadual" then
        estatistica:setDependenciaAdministrativaEstadual(valor);
      elseif chave == "dependenciaAdministrativaMunicipal" then
        estatistica:setDependenciaAdministrativaMunicipal(valor);
      elseif chave == "dependenciaAdministrativaPrivada" then
        estatistica:setDependenciaAdministrativaPrivada(valor);
      elseif chave == "tipoLocalizacaoUrbana" then
        estatistica:setTipoLocalizacaoUrbana(valor);
      elseif chave == "tipoLocalizacaoRural" then
        estatistica:setTipoLocalizacaoRural(valor);
      elseif chave == "aguaFiltrada" then
        estatistica:setAguaFiltrada(valor);
      elseif chave == "aguaPublica" then
        estatistica:setAguaPublica(valor);
      elseif chave == "aguaPocoArtesiano" then
        estatistica:setAguaPocoArtesiano(valor);
      elseif chave == "aguaCacimba" then
        estatistica:setAguaCacimba(valor);
      elseif chave == "aguaRio" then
        estatistica:setAguaRio(valor);
      elseif chave == "aguaInexistente" then
        estatistica:setAguaInexistente(valor);
      elseif chave == "energiaPublica" then
        estatistica:setEnergiaPublica(valor);
      elseif chave == "energiaGerador" then
        estatistica:setEnergiaGerador(valor);
      elseif chave == "energiaOutros" then
        estatistica:setEnergiaOutros(valor);
      elseif chave == "energiaInexistente" then
        estatistica:setEnergiaInexistente(valor);
      elseif chave == "esgotoPublico" then
        estatistica:setEsgotoPublico(valor);
      elseif chave == "esgotoFossa" then
        estatistica:setEsgotoFossa(valor);
      elseif chave == "esgotoInexistente" then
        estatistica:setEsgotoInexistente(valor);
      elseif chave == "lixoColetaPeriodica" then
        estatistica:setLixoColetaPeriodica(valor);
      elseif chave == "lixoQueima" then
        estatistica:setLixoQueima(valor);
      elseif chave == "lixoJogaOutraArea" then
        estatistica:setLixoJogaOutraArea(valor);
      elseif chave == "lixoRecicla" then
        estatistica:setLixoRecicla(valor);
      elseif chave == "lixoEnterra" then
        estatistica:setLixoEnterra(valor);
      elseif chave == "lixoOutros" then
        estatistica:setLixoOutros(valor);
      elseif chave == "salaDiretoria" then
        estatistica:setSalaDiretoria(valor);
      elseif chave == "salaProfessores" then
        estatistica:setSalaProfessores(valor);
      elseif chave == "laboratorioInformatica" then
        estatistica:setLaboratorioInformatica(valor);
      elseif chave == "laboratorioCiencias" then
        estatistica:setLaboratorioCiencias(valor);
      elseif chave == "atendimentoEspecial" then
        estatistica:setAtendimentoEspecial(valor);
      elseif chave == "quadraCoberta" then
        estatistica:setQuadraCoberta(valor);
      elseif chave == "quadraDescoberta" then
        estatistica:setQuadraDescoberta(valor);
      elseif chave == "cozinha" then
        estatistica:setCozinha(valor);
      elseif chave == "biblioteca" then
        estatistica:setBiblioteca(valor);
      elseif chave == "salaLeitura" then
        estatistica:setSalaLeitura(valor);
      elseif chave == "parqueInfantil" then
        estatistica:setParqueInfantil(valor);
      elseif chave == "bercario" then
        estatistica:setBercario(valor);
      elseif chave == "sanitarioForaPredio" then
        estatistica:setSanitarioForaPredio(valor);
      elseif chave == "sanitarioDentroPredio" then
        estatistica:setSanitarioDentroPredio(valor);
      elseif chave == "sanitarioEducInfant" then
        estatistica:setSanitarioEducInfant(valor);
      elseif chave == "sanitarioPNE" then
        estatistica:setSanitarioPNE(valor);
      elseif chave == "dependenciasPNE" then
        estatistica:setDependenciasPNE(valor);
      elseif chave == "secretaria" then
        estatistica:setSecretaria(valor);
      elseif chave == "banheiroChuveiro" then
        estatistica:setBanheiroChuveiro(valor);
      elseif chave == "refeitorio" then
        estatistica:setRefeitorio(valor);
      elseif chave == "despensa" then
        estatistica:setDespensa(valor);
      elseif chave == "almoxarifado" then
        estatistica:setAlmoxarifado(valor);
      elseif chave == "auditorio" then
        estatistica:setAuditorio(valor);
      elseif chave == "patioCoberto" then
        estatistica:setPatioCoberto(valor);
      elseif chave == "patioDescoberto" then
        estatistica:setPatioDescoberto(valor);
      elseif chave == "alojamentoAluno" then
        estatistica:setAlojamentoAluno(valor);
      elseif chave == "alojamentoProfessor" then
        estatistica:setAlojamentoProfessor(valor);
      elseif chave == "areaVerde" then
        estatistica:setAreaVerde(valor);
      elseif chave == "lavanderia" then
        estatistica:setLavanderia(valor);

      end

    end

    table.insert(estatisticas,estatistica)


  end

  return estatisticas;

end




-- Função que busca os dados estatisticos da web
function carregaEstatisticasWeb(f_callback,parametros)

  local estatisticas = {};

  local status = -1;

  print("***Buscando Estatísticas***")

  local url = "http://educacao.dadosabertosbr.com/api/estatisticas"

  local criterio_busca = parametros;

  local dados = webs_get(url,criterio_busca);

  if (dados ~= nil and dados ~= 0) then

    print("Endereço encontrado!")

    estatisticas = extrairEstatisticas(dados);

    if #estatisticas ~= 0 then

--      print("Tabela com "..#estatisticas.." encontradas")

      status = 1;

    else
      print("Tabela vazia!")

    end

  else
    print("Endereço não encontrado!")

  end



  f_callback(estatisticas,status);


end
