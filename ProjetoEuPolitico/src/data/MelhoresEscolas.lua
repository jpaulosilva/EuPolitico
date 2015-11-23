MelhoresEscolas = {};

MelhoresEscolas.idebAnosIniciais = nil;
MelhoresEscolas.idebAnosFinais = nil;
MelhoresEscolas.enem = nil;
MelhoresEscolas.regiao = nil;
MelhoresEscolas.estado = nil;
MelhoresEscolas.regulamentadaSim = nil;
MelhoresEscolas.regulamentadaNao = nil;
MelhoresEscolas.regulamentadaTramitacao = nil;
MelhoresEscolas.dependenciaAdministrativaFederal = nil;
MelhoresEscolas.dependenciaAdministrativaEstadual = nil;
MelhoresEscolas.dependenciaAdministrativaMunicipal = nil;
MelhoresEscolas.dependenciaAdministrativaPrivada = nil;
MelhoresEscolas.situacaoFuncionamentoAtividade = nil;
MelhoresEscolas.situacaoFuncionamentoParalisada = nil;
MelhoresEscolas.situacaoFuncionamentoExtinta = nil;
MelhoresEscolas.situacaoFuncionamentoExtintaAnoAnterior = nil;
MelhoresEscolas.situacaoFuncionamentoAtividadeNaoInformado = nil;
MelhoresEscolas.tipoLocalizacaoUrbana = nil;
MelhoresEscolas.tipoLocalizacaoRural = nil;
MelhoresEscolas.aguaFiltrada = nil;
MelhoresEscolas.aguaPublica = nil;
MelhoresEscolas.aguaPocoArtesiano = nil;
MelhoresEscolas.aguaCacimba = nil;
MelhoresEscolas.aguaRio = nil;
MelhoresEscolas.aguaInexistente = nil;
MelhoresEscolas.energiaPublica = nil;
MelhoresEscolas.energiaGerador = nil;
MelhoresEscolas.energiaOutros = nil;
MelhoresEscolas.energiaInexistente = nil;
MelhoresEscolas.esgotoPublico = nil;
MelhoresEscolas.esgotoFossa = nil;
MelhoresEscolas.esgotoInexistente = nil;
MelhoresEscolas.lixoColetaPeriodica = nil;
MelhoresEscolas.lixoQueima = nil;
MelhoresEscolas.lixoJogaOutraArea = nil;
MelhoresEscolas.lixoRecicla = nil;
MelhoresEscolas.lixoEnterra = nil;
MelhoresEscolas.lixoOutros = nil;
MelhoresEscolas.laboratorioInformatica = nil;
MelhoresEscolas.laboratorioCiencias = nil;
MelhoresEscolas.biblioteca = nil;
MelhoresEscolas.auditorio = nil;
MelhoresEscolas.refeitorio = nil;
MelhoresEscolas.patioCoberto = nil;
MelhoresEscolas.patioDescoberto = nil;
MelhoresEscolas.parqueInfantil = nil;
MelhoresEscolas.bercario = nil;
MelhoresEscolas.quadraCoberta = nil;
MelhoresEscolas.quadraDescoberta = nil;
MelhoresEscolas.areaVerde = nil;
MelhoresEscolas.dependenciasPNE = nil;
MelhoresEscolas.ensinoEspecial = nil;
MelhoresEscolas.sanitarioDentroPredio = nil;
MelhoresEscolas.sanitarioForaPredio = nil;
MelhoresEscolas.sanitarioEducInfant = nil;
MelhoresEscolas.sanitarioPNE = nil;
MelhoresEscolas.banheiroChuveiro = nil;
MelhoresEscolas.almoxarifado = nil;
MelhoresEscolas.alojamentoAluno = nil;
MelhoresEscolas.alojamentoProfessor = nil;
MelhoresEscolas.salaDiretoria = nil;
MelhoresEscolas.salaLeitura = nil;
MelhoresEscolas.salaProfessores = nil;
MelhoresEscolas.secretaria = nil;
MelhoresEscolas.despensa = nil;
MelhoresEscolas.cozinha = nil;
MelhoresEscolas.lavanderia = nil;
MelhoresEscolas.atendimentoEspecial = nil;



function MelhoresEscolas:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function MelhoresEscolas:getIdebAnosIniciais()
  return self.idebAnosIniciais;
end

function MelhoresEscolas:setIdebAnosIniciais(idebAnosIniciais)
  self.idebAnosIniciais = idebAnosIniciais;
end

function MelhoresEscolas:getIdebAnosFinais()
  return self.idebAnosFinais;
end

function MelhoresEscolas:setIdebAnosFinais(idebAnosFinais)
  self.idebAnosFinais = idebAnosFinais;
end

function MelhoresEscolas:getEnem()
  return self.enem;
end

function MelhoresEscolas:setEnem(enem)
  self.enem = enem;
end

function MelhoresEscolas:getRegiao()
  return self.regiao;
end

function MelhoresEscolas:setRegiao(regiao)
  self.regiao = regiao;
end

function MelhoresEscolas:getEstado()
  return self.estado;
end

function MelhoresEscolas:setEstado(estado)
  self.estado = estado;
end


function MelhoresEscolas:getRegulamentadaSim()
  return self.regulamentadaSim
end

function MelhoresEscolas:setRegulamentadaSim(regulamentadaSim)
  self.regulamentadaSim = regulamentadaSim;
end

function MelhoresEscolas:getRegulamentadaNao()
  return self.regulamentadaNao
end

function MelhoresEscolas:setRegulamentadaNao(regulamentadaNao)
  self.regulamentadaNao = regulamentadaNao;
end



function MelhoresEscolas:getRegulamentadaTramitacao()
  return self.regulamentadaTramitacao
end

function MelhoresEscolas:setRegulamentadaTramitacao(regulamentadaTramitacao)
  self.regulamentadaTramitacao = regulamentadaTramitacao;
end



function MelhoresEscolas:getDependenciaAdministrativaFederal()
  return self.dependenciaAdministrativaFederal;
end

function MelhoresEscolas:setDependenciaAdministrativaFederal(dependenciaAdministrativaFederal)
  self.dependenciaAdministrativaFederal = dependenciaAdministrativaFederal;
end


function MelhoresEscolas:getDependenciaAdministrativaEstadual()
  return self.dependenciaAdministrativaEstadual;
end

function MelhoresEscolas:setDependenciaAdministrativaEstadual(dependenciaAdministrativaEstadual)
  self.dependenciaAdministrativaEstadual = dependenciaAdministrativaEstadual;
end


function MelhoresEscolas:getDependenciaAdministrativaMunicipal()
  return self.dependenciaAdministrativaMunicipal;
end

function MelhoresEscolas:setDependenciaAdministrativaMunicipal(dependenciaAdministrativaMunicipal)
  self.dependenciaAdministrativaMunicipal = dependenciaAdministrativaMunicipal;
end


function MelhoresEscolas:getDependenciaAdministrativaPrivada()
  return self.dependenciaAdministrativaPrivada;
end

function MelhoresEscolas:setDependenciaAdministrativaPrivada(dependenciaAdministrativaPrivada)
  self.dependenciaAdministrativaPrivada = dependenciaAdministrativaPrivada;
end


function MelhoresEscolas:getSituacaoFuncionamentoAtividade()
  return self.situacaoFuncionamentoAtividade;
end

function MelhoresEscolas:setSituacaoFuncionamentoAtividade(situacaoFuncionamentoAtividade)
  self.situacaoFuncionamentoAtividade = situacaoFuncionamentoAtividade;
end

function MelhoresEscolas:getSituacaoFuncionamentoParalisada()
  return self.situacaoFuncionamentoParalisada;
end

function MelhoresEscolas:setSituacaoFuncionamentoParalisada(situacaoFuncionamentoParalisada)
  self.situacaoFuncionamentoParalisada = situacaoFuncionamentoParalisada;
end


function MelhoresEscolas:getSituacaoFuncionamentoExtinta()
  return self.situacaoFuncionamentoExtinta;
end

function MelhoresEscolas:setSituacaoFuncionamentoExtinta(situacaoFuncionamentoExtinta)
  self.situacaoFuncionamentoExtinta = situacaoFuncionamentoExtinta;
end



function MelhoresEscolas:getSituacaoFuncionamentoExtintaAnoAnterior()
  return self.situacaoFuncionamentoExtintaAnoAnterior;
end

function MelhoresEscolas:setSituacaoFuncionamentoExtintaAnoAnterior(situacaoFuncionamentoExtintaAnoAnterior)
  self.situacaoFuncionamentoExtintaAnoAnterior = situacaoFuncionamentoExtintaAnoAnterior;
end


function MelhoresEscolas:getSituacaoFuncionamentoNaoInformado()
  return self.situacaoFuncionamentoNaoInformado;
end

function MelhoresEscolas:setSituacaoFuncionamentoNaoInformado(situacaoFuncionamentoNaoInformado)
  self.situacaoFuncionamentoNaoInformado = situacaoFuncionamentoNaoInformado;
end


function MelhoresEscolas:getTipoLocalizacaoUrbana()
  return self.tipoLocalizacaoUrbana;
end

function MelhoresEscolas:setTipoLocalizacaoUrbana(tipoLocalizacaoUrbana)
  self.tipoLocalizacaoUrbana = tipoLocalizacaoUrbana;
end

function MelhoresEscolas:getTipoLocalizacaoRural()
  return self.tipoLocalizacaoRural;
end

function MelhoresEscolas:setTipoLocalizacaoRural(tipoLocalizacaoRural)
  self.tipoLocalizacaoRural = tipoLocalizacaoRural;
end


function MelhoresEscolas:getAguaFiltrada()
  return self.aguaFiltrada;
end

function MelhoresEscolas:setAguaFiltrada(aguaFiltrada)
  self.aguaFiltrada = aguaFiltrada;
end

function MelhoresEscolas:getAguaPublica()
  return self.aguaPublica;
end

function MelhoresEscolas:setAguaPublica(aguaPublica)
  self.aguaPublica = aguaPublica;
end

function MelhoresEscolas:getAguaPocoArtesiano()
  return self.aguaPocoArtesiano;
end

function MelhoresEscolas:setAguaPocoArtesiano(aguaPocoArtesiano)
  self.aguaPocoArtesiano = aguaPocoArtesiano;
end


function MelhoresEscolas:getAguaCacimba()
  return self.aguaCacimba;
end

function MelhoresEscolas:setAguaCacimba(aguaCacimba)
  self.aguaCacimba = aguaCacimba;
end


function MelhoresEscolas:getAguaRio()
  return self.aguaRio;
end

function MelhoresEscolas:setAguaRio(aguaRio)
  self.aguaRio = aguaRio;
end

function MelhoresEscolas:getAguaInexistente()
  return self.aguaInexistente;
end

function MelhoresEscolas:setAguaInexistente(aguaInexistente)
  self.aguaInexistente = aguaInexistente;
end

function MelhoresEscolas:getEnergiaPublica()
  return self.energiaPublica;
end

function MelhoresEscolas:setEnergiaPublica(energiaPublica)
  self.energiaPublica = energiaPublica;
end

function MelhoresEscolas:getEnergiaGerador()
  return self.energiaGerador;
end

function MelhoresEscolas:setEnergiaGerador(energiaGerador)
  self.energiaGerador = energiaGerador;
end

function MelhoresEscolas:getEnergiaOutros()
  return self.energiaOutros;
end

function MelhoresEscolas:setEnergiaOutros(energiaOutros)
  self.energiaOutros = energiaOutros;
end

function MelhoresEscolas:getEnergiaInexistente()
  return self.energiaInexistente;
end

function MelhoresEscolas:setEnergiaInexistente(energiaInexistente)
  self.energiaInexistente = energiaInexistente;
end

function MelhoresEscolas:getEsgotoPublico()
  return self.esgotoPublico;
end

function MelhoresEscolas:setEsgotoPublico(esgotoPublico)
  self.esgotoPublico = esgotoPublico;
end

function MelhoresEscolas:getEsgotoFossa()
  return self.esgotoFossa;
end

function MelhoresEscolas:setEsgotoFossa(esgotoFossa)
  self.esgotoFossa = esgotoFossa;
end

function MelhoresEscolas:getEsgotoInexistente()
  return self.esgotoInexistente;
end

function MelhoresEscolas:setEsgotoInexistente(esgotoInexistente)
  self.esgotoInexistente = esgotoInexistente;
end

function MelhoresEscolas:getLixoColetaPeriodica()
  return self.lixoColetaPeriodica;
end

function MelhoresEscolas:setLixoColetaPeriodica(lixoColetaPeriodica)
  self.lixoColetaPeriodica = lixoColetaPeriodica;
end

function MelhoresEscolas:getLixoQueima()
  return self.lixoQueima;
end

function MelhoresEscolas:setLixoQueima(lixoQueima)
  self.lixoQueima = lixoQueima;
end

function MelhoresEscolas:getLixoJogaOutraArea()
  return self.lixoJogaOutraArea;
end

function MelhoresEscolas:setLixoJogaOutraArea(lixoJogaOutraArea)
  self.lixoJogaOutraArea = lixoJogaOutraArea;
end

function MelhoresEscolas:getLixoRecicla()
  return self.lixoRecicla;
end

function MelhoresEscolas:setLixoRecicla(lixoRecicla)
  self.lixoRecicla = lixoRecicla;
end

function MelhoresEscolas:getLixoEnterra()
  return self.lixoEnterra
end

function MelhoresEscolas:setLixoEnterra(lixoEnterra)
  self.lixoEnterra = lixoEnterra;
end

function MelhoresEscolas:getLixoOutros()
  return self.lixoOutros
end

function MelhoresEscolas:setLixoOutros(lixoOutros)
  self.lixoOutros = lixoOutros;
end

function MelhoresEscolas:getLaboratorioInformatica()
  return self.laboratorioInformatica;
end

function MelhoresEscolas:setLaboratorioInformatica(laboratorioInformatica)
  self.laboratorioInformatica = laboratorioInformatica;
end

function MelhoresEscolas:getLaboratorioCiencias()
  return self.laboratorioCiencias;
end

function MelhoresEscolas:setLaboratorioCiencias(laboratorioCiencias)
  self.laboratorioCiencias = laboratorioCiencias;
end

function MelhoresEscolas:getBiblioteca()
  return self.biblioteca;
end

function MelhoresEscolas:setBiblioteca(biblioteca)
  self.biblioteca = biblioteca;
end

function MelhoresEscolas:getAuditorio()
  return self.auditorio;
end

function MelhoresEscolas:setAuditorio(auditorio)
  self.auditorio = auditorio;
end

function MelhoresEscolas:getRefeitorio()
  return self.refeitorio;
end

function MelhoresEscolas:setRefeitorio(refeitorio)
  self.refeitorio = refeitorio;
end

function MelhoresEscolas:getPatioCoberto()
  return self.patioCoberto;
end

function MelhoresEscolas:setPatioCoberto(patioCoberto)
  self.patioCoberto = patioCoberto;
end

function MelhoresEscolas:getPatioDescoberto()
  return self.patioDescoberto;
end

function MelhoresEscolas:setPatioDescoberto(patioDescoberto)
  self.patioDescoberto = patioDescoberto;
end

function MelhoresEscolas:getParqueInfantil()
  return self.parqueInfantil;
end

function MelhoresEscolas:setParqueInfantil(parqueInfantil)
  self.parqueInfantil = parqueInfantil;
end

function MelhoresEscolas:getBercario()
  return self.bercario;
end

function MelhoresEscolas:setBercario(bercario)
  self.bercario = bercario;
end

function MelhoresEscolas:getQuadraCoberta()
  return self.quadraCoberta;
end

function MelhoresEscolas:setQuadraCoberta(quadraCoberta)
  self.quadraCoberta = quadraCoberta;
end

function MelhoresEscolas:getQuadraDescoberta()
  return self.quadraDescoberta;
end

function MelhoresEscolas:setQuadraDescoberta(quadraDescoberta)
  self.quadraDescoberta = quadraDescoberta;
end

function MelhoresEscolas:getAreaVerde()
  return self.areaVerde;
end

function MelhoresEscolas:setAreaVerde(areaVerde)
  self.areaVerde = areaVerde;
end

function MelhoresEscolas:getDependenciasPNE()
  return self.dependenciasPNE;
end

function MelhoresEscolas:setDependenciasPNE(dependenciasPNE)
  self.dependenciasPNE = dependenciasPNE;
end

function MelhoresEscolas:getEnsinoEspecial()
  return self.ensinoEspecial;
end

function MelhoresEscolas:setEnsinoEspecial(ensinoEspecial)
  self.ensinoEspecial = ensinoEspecial;
end

function MelhoresEscolas:getSanitarioDentroPredio()
  return self.sanitarioDentroPredio;
end

function MelhoresEscolas:setSanitarioDentroPredio(sanitarioDentroPredio)
  self.sanitarioDentroPredio = sanitarioDentroPredio;
end

function MelhoresEscolas:getSanitarioForaPredio()
  return self.sanitarioForaPredio;
end

function MelhoresEscolas:setSanitarioForaPredio(sanitarioForaPredio)
  self.sanitarioForaPredio = sanitarioForaPredio;
end


function MelhoresEscolas:getSanitarioEducInfant()
  return self.sanitarioEducInfant;
end

function MelhoresEscolas:setSanitarioEducInfant(sanitarioEducInfant)
  self.sanitarioEducInfant = sanitarioEducInfant;
end



function MelhoresEscolas:getSanitarioPNE()
  return self.sanitarioPNE;
end

function MelhoresEscolas:setSanitarioPNE(sanitarioPNE)
  self.sanitarioPNE = sanitarioPNE;
end




function MelhoresEscolas:getBanheiroChuveiro()
  return self.banheiroChuveiro;
end

function MelhoresEscolas:setBanheiroChuveiro(banheiroChuveiro)
  self.banheiroChuveiro = banheiroChuveiro;
end

function MelhoresEscolas:getAlmoxarifado()
  return self.almoxarifado;
end

function MelhoresEscolas:setAlmoxarifado(almoxarifado)
  self.almoxarifado = almoxarifado;
end

function MelhoresEscolas:getAlojamentoAluno()
  return self.alojamentoAluno;
end

function MelhoresEscolas:setAlojamentoAluno(alojamentoAluno)
  self.alojamentoAluno = alojamentoAluno;
end

function MelhoresEscolas:getAlojamentoProfessor()
  return self.alojamentoProfessor;
end

function MelhoresEscolas:setAlojamentoProfessor(alojamentoProfessor)
  self.alojamentoProfessor = alojamentoProfessor;
end

function MelhoresEscolas:getSalaDiretoria()
  return self.salaDiretoria;
end

function MelhoresEscolas:setSalaDiretoria(salaDiretoria)
  self.salaDiretoria = salaDiretoria;
end

function MelhoresEscolas:getSalaLeitura()
  return self.salaLeitura;
end

function MelhoresEscolas:setSalaLeitura(salaLeitura)
  self.salaLeitura = salaLeitura;
end

function MelhoresEscolas:getSalaProfessores()
  return self.salaProfessores;
end

function MelhoresEscolas:setSalaProfessores(salaProfessores)
  self.salaProfessores = salaProfessores;
end

function MelhoresEscolas:getSecretaria()
  return self.secretaria;
end

function MelhoresEscolas:setSecretaria(secretaria)
  self.secretaria = secretaria;
end

function MelhoresEscolas:getDespensa()
  return self.despensa;
end

function MelhoresEscolas:setDespensa(despensa)
  self.despensa = despensa;
end

function MelhoresEscolas:getCozinha()
  return self.cozinha;
end

function MelhoresEscolas:setCozinha(cozinha)
  self.cozinha = cozinha;
end

function MelhoresEscolas:getLavanderia()
  return self.lavanderia;
end

function MelhoresEscolas:setLavanderia(lavanderia)
  self.lavanderia = lavanderia;
end

function MelhoresEscolas:getAtendimentoEspecial()
  return self.atendimentoEspecial;
end

function MelhoresEscolas:setAtendimentoEspecial(atendimentoEspecial)
  self.atendimentoEspecial = atendimentoEspecial;
end
