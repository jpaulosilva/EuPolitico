BibliotecaAuxiliarScript.execute('utils.json');
BibliotecaAuxiliarScript.execute('utils.tcp');
BibliotecaAuxiliarScript.execute('utils.Webs');
BibliotecaAuxiliarScript.execute('data.MelhoresEscolas');


-- Função para tratar os dados brutos
local function extrairMelhoresEscolas(str)

  local estatisticasMelhoresEscolas = {};

  local data = string.match(str,"{(.*)}");
  

  if data ~= nil then

    local melhoresEscolas = MelhoresEscolas:new();

    print(data);

    for campo in data:split(",") do

      print(campo);

      chave,valor = string.match(campo,'"(.*)":(.*)')

      valor = string.match(valor,'"(.*)"') or valor --Elimina aspas


      if chave == "idebAI" then
        melhoresEscolas:setIdebAnosIniciais(valor);
      elseif chave == "idebAF" then
        melhoresEscolas:setIdebAnosFinais(valor);
      elseif chave == "enemMediaGeral" then
        melhoresEscolas:setEnem(valor)
      elseif chave == "regulamentadaSim" then
        melhoresEscolas:setRegulamentadaSim(valor);
      elseif chave == "regulamentadaNao" then
        melhoresEscolas:setRegulamentadaNao(valor);
      elseif chave == "regulamentadaTramitacao" then
        melhoresEscolas:setRegulamentadaTramitacao(valor);
      elseif chave == "situacaoFuncionamentoAtividade" then
        melhoresEscolas:setSituacaoFuncionamentoAtividade(valor);
      elseif chave == "situacaoFuncionamentoParalisada" then
        melhoresEscolas:setSituacaoFuncionamentoParalisada(valor);
      elseif chave == "situacaoFuncionamentoExtinta" then
        melhoresEscolas:setSituacaoFuncionamentoExtinta(valor);
      elseif chave == "situacaoFuncionamentoExtintaAnoAnterior" then
        melhoresEscolas:setSituacaoFuncionamentoExtintaAnoAnterior(valor);
      elseif chave == "situacaoFuncionamentoNaoInformado" then
        melhoresEscolas:setSituacaoFuncionamentoNaoInformado(valor);
      elseif chave == "dependenciaAdministrativaFederal" then
        melhoresEscolas:setDependenciaAdministrativaFederal(valor);
      elseif chave == "dependenciaAdministrativaEstadual" then
        melhoresEscolas:setDependenciaAdministrativaEstadual(valor);
      elseif chave == "dependenciaAdministrativaMunicipal" then
        melhoresEscolas:setDependenciaAdministrativaMunicipal(valor);
      elseif chave == "dependenciaAdministrativaPrivada" then
        melhoresEscolas:setDependenciaAdministrativaPrivada(valor);
      elseif chave == "tipoLocalizacaoUrbana" then
        melhoresEscolas:setTipoLocalizacaoUrbana(valor);
      elseif chave == "tipoLocalizacaoRural" then
        melhoresEscolas:setTipoLocalizacaoRural(valor);
      elseif chave == "aguaFiltrada" then
        melhoresEscolas:setAguaFiltrada(valor);
      elseif chave == "aguaPublica" then
        melhoresEscolas:setAguaPublica(valor);
      elseif chave == "aguaPocoArtesiano" then
        melhoresEscolas:setAguaPocoArtesiano(valor);
      elseif chave == "aguaCacimba" then
        melhoresEscolas:setAguaCacimba(valor);
      elseif chave == "aguaRio" then
        melhoresEscolas:setAguaRio(valor);
      elseif chave == "aguaInexistente" then
        melhoresEscolas:setAguaInexistente(valor);
      elseif chave == "energiaPublica" then
        melhoresEscolas:setEnergiaPublica(valor);
      elseif chave == "energiaGerador" then
        melhoresEscolas:setEnergiaGerador(valor);
      elseif chave == "energiaOutros" then
        melhoresEscolas:setEnergiaOutros(valor);
      elseif chave == "energiaInexistente" then
        melhoresEscolas:setEnergiaInexistente(valor);
      elseif chave == "esgotoPublico" then
        melhoresEscolas:setEsgotoPublico(valor);
      elseif chave == "esgotoFossa" then
        melhoresEscolas:setEsgotoFossa(valor);
      elseif chave == "esgotoInexistente" then
        melhoresEscolas:setEsgotoInexistente(valor);
      elseif chave == "lixoColetaPeriodica" then
        melhoresEscolas:setLixoColetaPeriodica(valor);
      elseif chave == "lixoQueima" then
        melhoresEscolas:setLixoQueima(valor);
      elseif chave == "lixoJogaOutraArea" then
        melhoresEscolas:setLixoJogaOutraArea(valor);
      elseif chave == "lixoRecicla" then
        melhoresEscolas:setLixoRecicla(valor);
      elseif chave == "lixoEnterra" then
        melhoresEscolas:setLixoEnterra(valor);
      elseif chave == "lixoOutros" then
        melhoresEscolas:setLixoOutros(valor);
      elseif chave == "salaDiretoria" then
        melhoresEscolas:setSalaDiretoria(valor);
      elseif chave == "salaProfessores" then
        melhoresEscolas:setSalaProfessores(valor);
      elseif chave == "laboratorioInformatica" then
        melhoresEscolas:setLaboratorioInformatica(valor);
      elseif chave == "laboratorioCiencias" then
        melhoresEscolas:setLaboratorioCiencias(valor);
      elseif chave == "atendimentoEspecial" then
        melhoresEscolas:setAtendimentoEspecial(valor);
      elseif chave == "quadraCoberta" then
        melhoresEscolas:setQuadraCoberta(valor);
      elseif chave == "quadraDescoberta" then
        melhoresEscolas:setQuadraDescoberta(valor);
      elseif chave == "cozinha" then
        melhoresEscolas:setCozinha(valor);
      elseif chave == "biblioteca" then
        melhoresEscolas:setBiblioteca(valor);
      elseif chave == "salaLeitura" then
        melhoresEscolas:setSalaLeitura(valor);
      elseif chave == "parqueInfantil" then
        melhoresEscolas:setParqueInfantil(valor);
      elseif chave == "bercario" then
        melhoresEscolas:setBercario(valor);
      elseif chave == "sanitarioForaPredio" then
        melhoresEscolas:setSanitarioForaPredio(valor);
      elseif chave == "sanitarioDentroPredio" then
        melhoresEscolas:setSanitarioDentroPredio(valor);
      elseif chave == "sanitarioEducInfant" then
        melhoresEscolas:setSanitarioEducInfant(valor);
      elseif chave == "sanitarioPNE" then
        melhoresEscolas:setSanitarioPNE(valor);
      elseif chave == "dependenciasPNE" then
        melhoresEscolas:setDependenciasPNE(valor);
      elseif chave == "secretaria" then
        melhoresEscolas:setSecretaria(valor);
      elseif chave == "banheiroChuveiro" then
        melhoresEscolas:setBanheiroChuveiro(valor);
      elseif chave == "refeitorio" then
        melhoresEscolas:setRefeitorio(valor);
      elseif chave == "despensa" then
        melhoresEscolas:setDespensa(valor);
      elseif chave == "almoxarifado" then
        melhoresEscolas:setAlmoxarifado(valor);
      elseif chave == "auditorio" then
        melhoresEscolas:setAuditorio(valor);
      elseif chave == "patioCoberto" then
        melhoresEscolas:setPatioCoberto(valor);
      elseif chave == "patioDescoberto" then
        melhoresEscolas:setPatioDescoberto(valor);
      elseif chave == "alojamentoAluno" then
        melhoresEscolas:setAlojamentoAluno(valor);
      elseif chave == "alojamentoProfessor" then
        melhoresEscolas:setAlojamentoProfessor(valor);
      elseif chave == "areaVerde" then
        melhoresEscolas:setAreaVerde(valor);
      elseif chave == "lavanderia" then
        melhoresEscolas:setLavanderia(valor);

      end
      
    end

    table.insert(estatisticasMelhoresEscolas,melhoresEscolas);

  end
  
  return estatisticasMelhoresEscolas;

end




-- Função que busca os dados das melhores escolas da web
function carregaMelhoresEscolasWeb(f_callback,parametros)

  local estatisticasMelhoresEscolas = {};

  local status = -1;

  print("***Buscando melhores escolas***")

  local url = "http://educacao.dadosabertosbr.com/api/estatisticas"

  local criterio_busca = parametros;

  local dados = webs_get(url,criterio_busca);

  if (dados ~= nil and dados ~= 0) then

    print("Endereço encontrado!")

    estatisticasMelhoresEscolas = extrairMelhoresEscolas(dados);

    if #estatisticasMelhoresEscolas ~= 0 then

      print("Tabela com "..#estatisticasMelhoresEscolas.." encontradas")

      status = 1;

    else
      print("Tabela vazia!")

    end

  else
    print("Endereço não encontrado!")

  end



  f_callback(estatisticasMelhoresEscolas,status);


end


