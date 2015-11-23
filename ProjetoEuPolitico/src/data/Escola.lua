Escola = {};
Escola.nome = nil
Escola.regiao = nil;
Escola.estado = nil;
Escola.cidade = nil;
Escola.bairro = nil;
Escola.idebAI = nil;
Escola.idebAF = nil;
Escola.enemGeral = nil;
Escola.taxaEvasao = nil;
Escola.endereco = nil;

Escola.cod = nil
Escola.anoCenso = nil
Escola.situacaoFuncionamento = nil
Escola.situacaoCenso = nil
Escola.inicioAno = nil
Escola.fimAno = nil
Escola.codUf = nil
Escola.siglaUf = nil
Escola.codMunicipio = nil
Escola.codDistrito = nil
Escola.dependenciaAdministrativa = nil
Escola.tipoLocalizacao = nil
Escola.regulamentada = nil
Escola.aguaFiltrada = nil
Escola.aguaPublica = nil
Escola.aguaPocoArtesiano = nil
Escola.aguaCacimba = nil
Escola.aguaRio = nil
Escola.aguaInexistente = nil
Escola.energiaPublica = nil
Escola.energiaGerador = nil
Escola.energiaOutros = nil
Escola.energiaInexistente = nil
Escola.esgotoPublico = nil
Escola.esgotoFossa = nil
Escola.esgotoInexistente = nil
Escola.lixoColetaPeriodica = nil
Escola.lixoQueima = nil
Escola.lixoJogaOutraArea = nil
Escola.lixoRecicla = nil
Escola.lixoEnterra = nil
Escola.lixoOutros = nil
Escola.salaDiretoria = nil
Escola.salaProfessores = nil
Escola.laboratorioInformatica = nil
Escola.laboratorioCiencias = nil
Escola.atendimentoEspecial = nil
Escola.quadraCoberta = nil
Escola.quadraDescoberta = nil
Escola.cozinha = nil
Escola.biblioteca = nil
Escola.salaLeitura = nil
Escola.parqueInfantil = nil
Escola.bercario = nil
Escola.sanitarioForaPredio = nil
Escola.sanitarioDentroPredio = nil
Escola.sanitarioEducInfant = nil
Escola.sanitarioPNE = nil
Escola.dependenciasPNE = nil
Escola.secretaria = nil
Escola.banheiroChuveiro = nil
Escola.refeitorio = nil
Escola.despensa = nil
Escola.almoxarifado = nil
Escola.auditorio = nil
Escola.patioCoberto = nil
Escola.patioDescoberto = nil
Escola.alojamentoAluno = nil
Escola.alojamentoProfessor = nil
Escola.areaVerde = nil
Escola.lavanderia = nil
Escola.salasExistentes = nil
Escola.salasUtilizadas = nil
Escola.televisores = nil
Escola.videoCassetes = nil
Escola.dvds = nil
Escola.parabolicas = nil
Escola.copiadoras = nil
Escola.retroprojetores = nil
Escola.impressoras = nil
Escola.aparelhosSom = nil
Escola.datashows = nil
Escola.fax = nil
Escola.foto = nil
Escola.computadores = nil
Escola.computadoresAdm = nil
Escola.computadoresAlunos = nil
Escola.internet = nil
Escola.bandaLarga = nil
Escola.funcionarios = nil
Escola.alimentacao = nil
Escola.aee = nil
Escola.atividadeComplementar = nil
Escola.ensinoRegular = nil
Escola.regCreche = nil
Escola.regPreescola = nil
Escola.regFundamental8 = nil
Escola.regFundamental9 = nil
Escola.regMedioMedio = nil
Escola.regMedioIntegrado = nil
Escola.regMedioNormal = nil
Escola.regMedioProfissional = nil
Escola.ensinoEspecial = nil
Escola.espCreche = nil
Escola.espPreescola = nil
Escola.espFundamental8 = nil
Escola.espFundamental9 = nil
Escola.espMedioMedio = nil
Escola.espMedioIntegrado = nil
Escola.espMedioNormal = nil
Escola.espMedioProfissional = nil
Escola.espEjaFundamental = nil
Escola.espEjaMedio = nil
Escola.ensinoEja = nil
Escola.ejaFundamental = nil
Escola.ejaMedio = nil
Escola.ejaProjovem = nil
Escola.ciclos = nil
Escola.fimDeSemana = nil
Escola.pedagogiaAlternancia = nil
Escola.nomeMunicipio = nil
Escola.situacaoFuncionamentoTxt = nil
Escola.dependenciaAdministrativaTxt = nil
Escola.tipoLocalizacaoTxt = nil
Escola.regulamentadaTxt = nil

function Escola:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function Escola:getNome()
  return self.nome
end

function Escola:setNome(nome)
  self.nome = nome
end
function Escola:getEstado()
  return self.estado
end

function Escola:setEstado(estado)
  self.estado = estado;
end

function Escola:getCidade()
  return self.cidade
end

function Escola:setCidade(cidade)
  self.cidade = cidade;
end

function Escola:getBairro()
  return self.bairro
end

function Escola:setBairro(bairro)
  self.bairro = bairro;
end

function Escola:getRegiao()
  return self.regiao
end

function Escola:setRegiao(regiao)
  self.regiao = regiao
end

function Escola:getIdebAI()
  return self.idebAI;
end

function Escola:setIdebAI(idebAI)
  self.idebAI = idebAI;
end

function Escola:getIdebAF()
  return self.IdebAF;
end

function Escola:setIdebAF(IdebAF)
  self.IdebAF = IdebAF;
end

function Escola:getEnemGeral()
  return self.enemGeral;
end

function Escola:setEnemGeral(enemGeral)
  self.enemGeral = enemGeral;
end

function Escola:getTaxaEvasao()
  return self.taxaEvasao;
end

function Escola:setTaxaEvasao(taxaEvasao)
  self.taxaEvasao = taxaEvasao;
end

function Escola:getEndereco()
  return self.endereco;
end

function Escola:setEndereco(endereco)
  self.endereco = endereco;
end

function Escola:getCod()
  return self.cod
end

function Escola:setCod(cod)
  self.cod = cod
end

function Escola:getAnoCenso()
  return self.anoCenso
end

function Escola:setAnoCenso(anoCenso)
  self.anoCenso = anoCenso
end

function Escola:getSituacaoFuncionamento()
  return self.situacaoFuncionamento
end

function Escola:setSituacaoFuncionamento(situacao)
  self.situacaoFuncionamento = situacao
end

function Escola:getSituacaoCenso()
  return self.situacaoCenso
end
function Escola:getInicioAno()
  return self.inicioAno
end
function Escola:getFimAno()
  return self.fimAno
end

function Escola:setInicioAno(valor)
  self.inicioAno = valor
end
function Escola:setFimAno(valor)
  self.fimAno = valor
end

function Escola:getCodUf()
  return self.codUf
end
function Escola:getSiglaUf()
  return self.siglaUf
end
function Escola:getCodMunicipio()
  return self.codMunicipio
end

function Escola:setCodMunicipio(valor)
  self.codMunicipio = valor
end

function Escola:getCodDistrito()
  return self.codDistrito
end
function Escola:getDependenciaAdministrativa()
  return self.dependenciaAdministrativa
end

function Escola:setDependenciaAdministrativa(dependenciaAdministrativa)
	self.dependenciaAdministrativa = dependenciaAdministrativa;
end

function Escola:getTipoLocalizacao()
  return self.tipoLocalizacao
end

function Escola:setTipoLocalizacao(valor)
  self.tipoLocalizacao = valor
end

function Escola:getRegulamentada()
  return self.regulamentada
end

function Escola:setRegulamentada(valor)
  self.regulamentada = valor
end

function Escola:getAguaFiltrada()
  return self.aguaFiltrada
end

function Escola:setAguaFiltrada(aguaFiltrada)
  self.aguaFiltrada = aguaFiltrada
end


function Escola:getAguaPublica()
  return self.aguaPublica
end

function Escola:setAguaPublica(aguaPublica)
  self.aguaPublica = aguaPublica
end
function Escola:getAguaPocoArtesiano()
  return self.aguaPocoArtesiano
end

function Escola:setAguaPocoArtesiano(aguaPocoArtesiano)
  self.aguaPocoArtesiano = aguaPocoArtesiano
end

function Escola:getAguaCacimba()
  return self.aguaCacimba
end

function Escola:setAguaCacimba(aguaCacimba)
  self.aguaCacimba = aguaCacimba
end

function Escola:getAguaRio()
  return self.aguaRio
end

function Escola:setAguaRio(aguaRio)
  self.aguaRio = aguaRio
end

function Escola:getAguaInexistente()
  return self.aguaInexistente
end

function Escola:setAguaInexistente(aguaInexistente)
  self.aguaInexistente = aguaInexistente
end

function Escola:getEnergiaPublica()
  return self.energiaPublica
end

function Escola:setEnergiaPublica(energiaPublica)
  self.energiaPublica = energiaPublica
end

function Escola:getEnergiaGerador()
  return self.energiaGerador
end

function Escola:setEnergiaGerador(energiaGerador)
  self.energiaGerador = energiaGerador
end

function Escola:getEnergiaOutros()
  return self.energiaOutros
end

function Escola:setEnergiaOutros(energiaOutros)
  self.energiaOutros = energiaOutros
end

function Escola:getEnergiaInexistente()
  return self.energiaInexistente
end

function Escola:setEnergiaInexistente(energiaInexistente)
  self.energiaInexistente = energiaInexistente
end

function Escola:getEsgotoPublico()
  return self.esgotoPublico
end

function Escola:setEsgotoPublico(esgotoPublico)
  self.esgotoPublico = esgotoPublico
end

function Escola:getEsgotoFossa()
  return self.esgotoFossa
end

function Escola:setEsgotoFossa(esgotoFossa)
  self.esgotoFossa = esgotoFossa
end

function Escola:getEsgotoInexistente()
  return self.esgotoInexistente
end

function Escola:setEsgotoInexistente(esgotoInexistente)
  self.esgotoInexistenete = esgotoInexistente
end

function Escola:getLixoColetaPeriodica()
  return self.lixoColetaPeriodica
end

function Escola:setLixoColetaPeriodica(lixoColetaPeriodica)
  self.lixoColetaPeriodica = lixoColetaPeriodica
end

function Escola:getLixoQueima()
  return self.lixoQueima
end

function Escola:setLixoQueima(lixoQueima)
  self.lixoQueima = lixoQueima
end

function Escola:getLixoJogaOutraArea()
  return self.lixoJogaOutraArea
end

function Escola:setLixoJogaOutraArea(lixoJogaOutraArea)
  self.lixoJogaOutraArea = lixoJogaOutraArea
end

function Escola:getLixoRecicla()
  return self.lixoRecicla
end

function Escola:setLixoRecicla(lixoRecicla)
  self.lixoRecicla = lixoRecicla
end

function Escola:getLixoEnterra()
  return self.lixoEnterra
end

function Escola:setLixoEnterra(lixoEnterra)
  self.lixoEnterra = lixoEnterra
end

function Escola:getLixoOutros()
  return self.lixoOutros
end

function Escola:setLixoOutros(lixoOutros)
  self.lixoOutros = lixoOutros
end


function Escola:getSalaDiretoria()
  return self.salaDiretoria
end

function Escola:setSalaDiretoria(salaDiretoria)
  self.salaDiretoria = salaDiretoria
end

function Escola:getSalaProfessores()
  return self.salaProfessores
end

function Escola:setSalaProfessores(salaProfessores)
  self.salaProfessores = salaProfessores
end

function Escola:getLaboratorioInformatica()
  return self.laboratorioInformatica
end

function Escola:setLaboratorioInformatica(laboratorioInformatica)
  self.laboratorioInformatica = laboratorioInformatica
end

function Escola:getLaboratorioCiencias()
  return self.laboratorioCiencias
end

function Escola:setLaboratorioCiencias(laboratorioCiencias)
  self.laboratorioCiencias = laboratorioCiencias
end

function Escola:getAtendimentoEspecial()
  return self.atendimentoEspecial
end

function Escola:setAtendimentoEspecial(atendimentoEspecial)
  self.atendimentoEspecial = atendimentoEspecial
end

function Escola:getQuadraCoberta()
  return self.quadraCoberta
end

function Escola:setQuadraCoberta(quadraCoberta)
  self.quadraCoberta = quadraCoberta
end

function Escola:getQuadraDescoberta()
  return self.quadraDescoberta
end
function Escola:getCozinha()
  return self.cozinha
end

function Escola:setCozinha(cozinha)
  self.cozinha = cozinha
end

function Escola:getBiblioteca()
  return self.biblioteca
end

function Escola:setBiblioteca(biblioteca)
  self.biblioteca = biblioteca
end

function Escola:getSalaLeitura()
  return self.salaLeitura
end

function Escola:setSalaLeitura(salaLeitura)
  self.salaLeitura = salaLeitura
end

function Escola:getParqueInfantil()
  return self.parqueInfantil
end

function Escola:setParqueInfantil(parqueInfantil)
  self.parqueInfantil = parqueInfantil
end

function Escola:getBercario()
  return self.bercario
end

function Escola:setBercario(bercario)
  self.bercario = bercario
end

function Escola:getSanitarioForaPredio()
  return self.sanitarioForaPredio
end

function Escola:setSanitarioForaPredio(sanitarioForaPredio)
  self.sanitarioForaPredio = sanitarioForaPredio
end

function Escola:getSanitarioDentroPredio()
  return self.sanitarioDentroPredio
end

function Escola:setSanitarioDentroPredio(sanitarioDentroPredio)
  self.sanitarioDentroPredio = sanitarioDentroPredio
end

function Escola:getSanitarioEducInfant()
  return self.sanitarioEducInfant
end

function Escola:getSanitarioPNE()
  return self.sanitarioPNE
end

function Escola:setSanitarioPNE(sanitarioPNE)
  self.sanitarioPNE = sanitarioPNE
end

function Escola:getDependenciasPNE()
  return self.dependenciasPNE
end

function Escola:setDependenciasPNE(dependenciasPNE)
  self.dependenciasPNE = dependenciasPNE
end

function Escola:getSecretaria()
  return self.secretaria
end

function Escola:setSecretaria(secretaria)
  self.secretaria = secretaria
end

function Escola:getBanheiroChuveiro()
  return self.banheiroChuveiro
end

function Escola:setBanheiroChuveiro(banheiroChuveiro)
  self.banheiroChuveiro = banheiroChuveiro
end

function Escola:getRefeitorio()
  return self.refeitorio
end

function Escola:setRefeitorio(refeitorio)
  self.refeitorio = refeitorio
end

function Escola:getDespensa()
  return self.despensa
end

function Escola:setDespensa(despensa)
  self.despensa = despensa
end

function Escola:getAlmoxarifado()
  return self.almoxarifado
end

function Escola:setAlmoxarifado(almoxarifado)
  self.almoxarifado = almoxarifado
end

function Escola:getAuditorio()
  return self.auditorio
end

function Escola:setAuditorio(auditorio)
  self.auditorio = auditorio;
end

function Escola:getPatioCoberto()
  return self.patioCoberto
end

function Escola:setPatioCoberto(patioCoberto)
  self.patioCoberto = patioCoberto
end

function Escola:getPatioDescoberto()
  return self.patioDescoberto
end
function Escola:getAlojamentoAluno()
  return self.alojamentoAluno
end

function Escola:setAlojamentoAluno(alojamentoAluno)
  self.alojamentoAluno = alojamentoAluno
end

function Escola:getAlojamentoProfessor()
  return self.alojamentoProfessor
end
function Escola:getAreaVerde()
  return self.areaVerde
end

function Escola:setAreaVerde(areaVerde)
  self.areaVerde = areaVerde
end

function Escola:getLavanderia()
  return self.lavanderia
end

function Escola:setLavanderia(lavanderia)
  self.lavanderia = lavanderia
end

function Escola:getsalasExistentes()
  return self.salasExistentes
end
function Escola:getSalasUtilizadas()
  return self.salasUtilizadas
end
function Escola:getTelevisores()
  return self.televisores
end
function Escola:getVideoCassetes()
  return self.videoCassetes
end
function Escola:getDvds()
  return self.dvds
end
function Escola:getParabolicas()
  return self.parabolicas
end
function Escola:getCopiadoras()
  return self.copiadoras
end
function Escola:getretroprojetores()
  return self.retroprojetores
end
function Escola:getImpressoras()
  return self.impressoras
end
function Escola:getAparelhosSom()
  return self.aparelhosSom
end
function Escola:getDatashows()
  return self.datashows
end
function Escola:getFax()
  return self.fax
end
function Escola:getFoto()
  return self.foto
end
function Escola:getcomputadores()
  return self.computadores
end
function Escola:getComputadoresAdm()
  return self.computadoresAdm
end
function Escola:getComputadoresAlunos()
  return self.computadoresAlunos
end
function Escola:getInternet()
  return self.internet
end
function Escola:getBandaLarga()
  return self.bandaLarga
end
function Escola:getFuncionarios()
  return self.funcionarios
end
function Escola:getAlimentacao()
  return self.alimentacao
end
function Escola:getAee()
  return self.aee
end
function Escola:getAtividadeComplementar()
  return self.atividadeComplementar
end
function Escola:getEnsinoRegular()
  return self.ensinoRegular
end
function Escola:getRegCreche()
  return self.regCreche
end
function Escola:getRegPrefunction()
  return self.regPrefunction
end
function Escola:getRegFundamental8()
  return self.regFundamental8
end
function Escola:getRegFundamental9()
  return self.regFundamental9
end
function Escola:getRegMedioMedio()
  return self.regMedioMedio
end
function Escola:getRegMedioIntegrado()
  return self.regMedioIntegrado
end
function Escola:getRegMedioNormal()
  return self.regMedioNormal
end
function Escola:getRegMedioProfissional()
  return self.regMedioProfissional
end
function Escola:getEnsinoEspecial()
  return self.ensinoEspecial
end
function Escola:getEspCreche()
  return self.espCreche
end
function Escola:getEspPrefunction()
  return self.espPrefunction
end
function Escola:getEspFundamental8()
  return self.espFundamental8
end
function Escola:getEspFundamental9()
  return self.espFundamental9
end
function Escola:getEspMedioMedio()
  return self.espMedioMedio
end
function Escola:getEspMedioIntegrado()
  return self.espMedioIntegrado
end
function Escola:getEspMedioNormal()
  return self.espMedioNormal
end
function Escola:getEspMedioProfissional()
  return self.espMedioProfissional
end
function Escola:getEspEjaFundamental()
  return self.espEjaFundamental
end
function Escola:getespEjaMedio()
  return self.espEjaMedio
end
function Escola:getensinoEja()
  return self.ensinoEja
end
function Escola:getejaFundamental()
  return self.ejaFundamental
end
function Escola:getEjaMedio()
  return self.ejaMedio
end
function Escola:getEjaProjovem()
  return self.ejaProjovem
end
function Escola:getCiclos()
  return self.ciclos
end
function Escola:getFimDeSemana()
  return self.fimDeSemana
end
function Escola:getPedagogiaAlternancia()
  return self.pedagogiaAlternancia
end
function Escola:getNomeMunicipio()
  return self.nomeMunicipio
end
function Escola:getSituacaoFuncionamentoTxt()
  return self.situacaoFuncionamentoTxt
end

function Escola:setSituacaoFuncionamentoTxt(situacaoFuncionamentoTxt)
  self.situacaoFuncionamentoTxt = situacaoFuncionamentoTxt
end

function Escola:getDependenciaAdministrativaTxt()
  return self.dependenciaAdministrativaTxt
end
function Escola:getTipoLocalizacaoTxt()
  return self.tipoLocalizacaoTxt
end

function Escola:setTipoLocalizacaoTxt(tipoLocalizacaoTxt)
  self.tipoLocalizacaoTxt = tipoLocalizacaoTxt
end

function Escola:getRegulamentadaTxt()
  return self.regulamentadaTxt
end

function Escola:setRegulamentadaTxt(regulamentadaTxt)
  self.regulamentadaTxt = regulamentadaTxt
end


function Escola:toEstatistica()

  local estatistica = Estatistica:new();

  estatistica:setIdebAnosIniciais(self:getIdebAI());
  estatistica:setIdebAnosFinais(self:getIdebAF());
  estatistica:setEnem(self:getEnemGeral())

  if(self:getRegulamentada() == "Não")then

    estatistica:setRegulamentadaNao("Sim");
    estatistica:setRegulamentadaSim(" - ");
    estatistica:setRegulamentadaTramitacao(" - ");

  elseif(self:getRegulamentada() == "Sim")then

    estatistica:setRegulamentadaNao(" - ");
    estatistica:setRegulamentadaSim("Sim");
    estatistica:setRegulamentadaTramitacao(" - ");

  elseif(self:getRegulamentada() == "Em tramitação")then

    estatistica:setRegulamentadaNao(" - ");
    estatistica:setRegulamentadaSim(" - ");
    estatistica:setRegulamentadaTramitacao("Sim");

  end

  if(self:getSituacaoFuncionamento() == "Em Atividade")then
    estatistica:setSituacaoFuncionamentoAtividade("Sim");
    estatistica:setSituacaoFuncionamentoParalisada(" - ");
    estatistica:setSituacaoFuncionamentoExtinta(" - ");
    estatistica:setSituacaoFuncionamentoExtintaAnoAnterior(" - ");
    estatistica:setSituacaoFuncionamentoNaoInformado(" - ");
  elseif(self:getSituacaoFuncionamento() == "Paralisada")then
    estatistica:setSituacaoFuncionamentoAtividade(" - ");
    estatistica:setSituacaoFuncionamentoParalisada("Sim");
    estatistica:setSituacaoFuncionamentoExtinta(" - ");
    estatistica:setSituacaoFuncionamentoExtintaAnoAnterior(" - ");
    estatistica:setSituacaoFuncionamentoNaoInformado(" - ");
  elseif(self:getSituacaoFuncionamento() == "Extinta")then
    estatistica:setSituacaoFuncionamentoAtividade(" - ");
    estatistica:setSituacaoFuncionamentoParalisada(" - ");
    estatistica:setSituacaoFuncionamentoExtinta("Sim");
    estatistica:setSituacaoFuncionamentoExtintaAnoAnterior(" - ");
    estatistica:setSituacaoFuncionamentoNaoInformado(" - ");
  elseif(self:getSituacaoFuncionamento() == "Extinta no ano anterior")then
    estatistica:setSituacaoFuncionamentoAtividade(" - ");
    estatistica:setSituacaoFuncionamentoParalisada(" - ");
    estatistica:setSituacaoFuncionamentoExtinta(" - ");
    estatistica:setSituacaoFuncionamentoExtintaAnoAnterior("Sim");
    estatistica:setSituacaoFuncionamentoNaoInformado(" - ");
  else
    estatistica:setSituacaoFuncionamentoAtividade(" - ");
    estatistica:setSituacaoFuncionamentoParalisada(" - ");
    estatistica:setSituacaoFuncionamentoExtinta(" - ");
    estatistica:setSituacaoFuncionamentoExtintaAnoAnterior(" - ");
    estatistica:setSituacaoFuncionamentoNaoInformado("Sim");
  end

  if(self:getDependenciaAdministrativa() == "Federal")then
    estatistica:setDependenciaAdministrativaFederal("Sim");
    estatistica:setDependenciaAdministrativaEstadual(" - ");
    estatistica:setDependenciaAdministrativaMunicipal(" - ");
    estatistica:setDependenciaAdministrativaPrivada(" - ");
  elseif(self:getDependenciaAdministrativa() == "Estadual")then
    estatistica:setDependenciaAdministrativaFederal(" - ");
    estatistica:setDependenciaAdministrativaEstadual("Sim");
    estatistica:setDependenciaAdministrativaMunicipal(" - ");
    estatistica:setDependenciaAdministrativaPrivada(" - ");
  elseif(self:getDependenciaAdministrativa() == "Municipal")then
    estatistica:setDependenciaAdministrativaFederal(" - ");
    estatistica:setDependenciaAdministrativaEstadual(" - ");
    estatistica:setDependenciaAdministrativaMunicipal("Sim");
    estatistica:setDependenciaAdministrativaPrivada(" - ");
  elseif(self:getDependenciaAdministrativa() == "Privada")then
    estatistica:setDependenciaAdministrativaFederal(" - ");
    estatistica:setDependenciaAdministrativaEstadual(" - ");
    estatistica:setDependenciaAdministrativaMunicipal(" - ");
    estatistica:setDependenciaAdministrativaPrivada("Sim");
  else
    estatistica:setDependenciaAdministrativaFederal(" - ");
    estatistica:setDependenciaAdministrativaEstadual(" - ");
    estatistica:setDependenciaAdministrativaMunicipal(" - ");
    estatistica:setDependenciaAdministrativaPrivada(" - ");
  end

  if(self:getTipoLocalizacao() == "Urbana")then
    estatistica:setTipoLocalizacaoUrbana("Sim");
    estatistica:setTipoLocalizacaoRural(" - ");
  elseif(self:getTipoLocalizacao() == "Rural")then
    estatistica:setTipoLocalizacaoUrbana(" - ");
    estatistica:setTipoLocalizacaoRural("Sim");
  end

  if(self:getAguaFiltrada())then estatistica:setAguaFiltrada("Sim") else estatistica:setAguaFiltrada("Não") end
  if(self:getAguaPublica())then estatistica:setAguaPublica("Sim") else estatistica:setAguaPublica("Não") end
  if(self:getAguaPocoArtesiano())then estatistica:setAguaPocoArtesiano("Sim") else estatistica:setAguaPocoArtesiano("Não") end
  if(self:getAguaCacimba())then estatistica:setAguaCacimba("Sim") else estatistica:setAguaCacimba("Não") end
  if(self:getAguaRio())then estatistica:setAguaRio("Sim") else estatistica:setAguaRio("Não") end
  if(self:getAguaInexistente())then estatistica:setAguaInexistente("Sim") else estatistica:setAguaInexistente("Não") end
  if(self:getEnergiaPublica())then estatistica:setEnergiaPublica("Sim") else estatistica:setEnergiaPublica("Não") end
  if(self:getEnergiaGerador())then estatistica:setEnergiaGerador("Sim") else estatistica:setEnergiaGerador("Não") end
  if(self:getEnergiaOutros())then estatistica:setEnergiaOutros("Sim") else estatistica:setEnergiaOutros("Não") end
  if(self:getEnergiaInexistente())then estatistica:setEnergiaInexistente("Sim") else estatistica:setEnergiaInexistente("Não") end
  if(self:getEsgotoPublico())then estatistica:setEsgotoPublico("Sim") else estatistica:setEsgotoPublico("Não") end
  if(self:getEsgotoFossa())then estatistica:setEsgotoFossa("Sim") else estatistica:setEsgotoFossa("Não") end
  if(self:getEsgotoInexistente())then estatistica:setEsgotoInexistente("Sim") else estatistica:setEsgotoInexistente("Não") end
  if(self:getLixoColetaPeriodica())then estatistica:setLixoColetaPeriodica("Sim") else estatistica:setLixoColetaPeriodica("Não") end
  if(self:getLixoQueima())then estatistica:setLixoQueima("Sim") else estatistica:setLixoQueima("Não") end
  if(self:getLixoJogaOutraArea())then estatistica:setLixoJogaOutraArea("Sim") else estatistica:setLixoJogaOutraArea("Não") end
  if(self:getLixoRecicla())then estatistica:setLixoRecicla("Sim") else estatistica:setLixoRecicla("Não") end
  if(self:getLixoEnterra())then estatistica:setLixoEnterra("Sim") else estatistica:setLixoEnterra("Não") end
  if(self:getLixoOutros())then estatistica:setLixoOutros("Sim") else estatistica:setLixoOutros("Não") end
  if(self:getSalaDiretoria())then estatistica:setSalaDiretoria("Sim") else estatistica:setSalaDiretoria("Não") end
  if(self:getSalaProfessores())then estatistica:setSalaProfessores("Sim") else estatistica:setSalaProfessores("Não") end
  if(self:getLaboratorioInformatica())then estatistica:setLaboratorioInformatica("Sim") else estatistica:setLaboratorioInformatica("Não") end
  if(self:getLaboratorioCiencias())then estatistica:setLaboratorioCiencias("Sim") else estatistica:setLaboratorioCiencias("Não") end
  if(self:getAtendimentoEspecial())then estatistica:setAtendimentoEspecial("Sim") else estatistica:setAtendimentoEspecial("Não") end
  if(self:getQuadraCoberta())then estatistica:setQuadraCoberta("Sim") else estatistica:setQuadraCoberta("Não") end
  if(self:getQuadraDescoberta())then estatistica:setQuadraDescoberta("Sim") else estatistica:setQuadraDescoberta("Não") end
  if(self:getCozinha())then estatistica:setCozinha("Sim") else estatistica:setCozinha("Não") end
  if(self:getBiblioteca())then estatistica:setBiblioteca("Sim") else estatistica:setBiblioteca("Não") end
  if(self:getSalaLeitura())then estatistica:setSalaLeitura("Sim") else estatistica:setSalaLeitura("Não") end
  if(self:getParqueInfantil())then estatistica:setParqueInfantil("Sim") else estatistica:setParqueInfantil("Não") end
  if(self:getBercario())then estatistica:setBercario("Sim") else estatistica:setBercario("Não") end
  if(self:getSanitarioForaPredio())then estatistica:setSanitarioForaPredio("Sim") else estatistica:setSanitarioForaPredio("Não") end
  if(self:getSanitarioDentroPredio())then estatistica:setSanitarioDentroPredio("Sim") else estatistica:setSanitarioDentroPredio("Não") end
  if(self:getSanitarioEducInfant())then estatistica:setSanitarioEducInfant("Sim") else estatistica:setSanitarioEducInfant("Não") end
  if(self:getSanitarioPNE())then estatistica:setSanitarioPNE("Sim") else estatistica:setSanitarioPNE("Não") end
  if(self:getDependenciasPNE())then estatistica:setDependenciasPNE("Sim") else estatistica:setDependenciasPNE("Não") end
  if(self:getSecretaria())then estatistica:setSecretaria("Sim") else estatistica:setSecretaria("Não") end
  if(self:getBanheiroChuveiro())then estatistica:setBanheiroChuveiro("Sim") else estatistica:setBanheiroChuveiro("Não") end
  if(self:getRefeitorio())then estatistica:setRefeitorio("Sim") else estatistica:setRefeitorio("Não") end
  if(self:getDespensa())then estatistica:setDespensa("Sim") else estatistica:setDespensa("Não") end
  if(self:getAlmoxarifado())then estatistica:setAlmoxarifado("Sim") else estatistica:setAlmoxarifado("Não") end
  if(self:getAuditorio())then estatistica:setAuditorio("Sim") else estatistica:setAuditorio("Não") end
  if(self:getPatioCoberto())then estatistica:setPatioCoberto("Sim") else estatistica:setPatioCoberto("Não") end
  if(self:getPatioDescoberto())then estatistica:setPatioDescoberto("Sim") else estatistica:setPatioDescoberto("Não") end
  if(self:getAlojamentoAluno())then estatistica:setAlojamentoAluno("Sim") else estatistica:setAlojamentoAluno("Não") end
  if(self:getAlojamentoProfessor())then estatistica:setAlojamentoProfessor("Sim") else estatistica:setAlojamentoProfessor("Não") end
  if(self:getAreaVerde())then estatistica:setAreaVerde("Sim") else estatistica:setAreaVerde("Não") end
  if(self:getLavanderia())then estatistica:setLavanderia("Sim") else estatistica:setLavanderia("Não") end
  
  return estatistica;
end
