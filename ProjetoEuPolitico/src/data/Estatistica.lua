Estatistica = {};
Estatistica.idebAnosIniciais = nil;
Estatistica.idebAnosFinais = nil;
Estatistica.enem = nil;
Estatistica.regiao = nil;
Estatistica.estado = nil;
Estatistica.cidade = nil;
Estatistica.regulamentadaSim = nil;
Estatistica.regulamentadaNao = nil;
Estatistica.regulamentadaTramitacao = nil;
Estatistica.dependenciaAdministrativaFederal = nil;
Estatistica.dependenciaAdministrativaEstadual = nil;
Estatistica.dependenciaAdministrativaMunicipal = nil;
Estatistica.dependenciaAdministrativaPrivada = nil;
Estatistica.situacaoFuncionamentoAtividade = nil;
Estatistica.situacaoFuncionamentoParalisada = nil;
Estatistica.situacaoFuncionamentoExtinta = nil;
Estatistica.situacaoFuncionamentoExtintaAnoAnterior = nil;
Estatistica.situacaoFuncionamentoAtividadeNaoInformado = nil;
Estatistica.tipoLocalizacaoUrbana = nil;
Estatistica.tipoLocalizacaoRural = nil;
Estatistica.aguaFiltrada = nil;
Estatistica.aguaPublica = nil;
Estatistica.aguaPocoArtesiano = nil;
Estatistica.aguaCacimba = nil;
Estatistica.aguaRio = nil;
Estatistica.aguaInexistente = nil;
Estatistica.energiaPublica = nil;
Estatistica.energiaGerador = nil;
Estatistica.energiaOutros = nil;
Estatistica.energiaInexistente = nil;
Estatistica.esgotoPublico = nil;
Estatistica.esgotoFossa = nil;
Estatistica.esgotoInexistente = nil;
Estatistica.lixoColetaPeriodica = nil;
Estatistica.lixoQueima = nil;
Estatistica.lixoJogaOutraArea = nil;
Estatistica.lixoRecicla = nil;
Estatistica.lixoEnterra = nil;
Estatistica.lixoOutros = nil;
Estatistica.laboratorioInformatica = nil;
Estatistica.laboratorioCiencias = nil;
Estatistica.biblioteca = nil;
Estatistica.auditorio = nil;
Estatistica.refeitorio = nil;
Estatistica.patioCoberto = nil;
Estatistica.patioDescoberto = nil;
Estatistica.parqueInfantil = nil;
Estatistica.bercario = nil;
Estatistica.quadraCoberta = nil;
Estatistica.quadraDescoberta = nil;
Estatistica.areaVerde = nil;
Estatistica.dependenciasPNE = nil;
Estatistica.ensinoEspecial = nil;
Estatistica.sanitarioDentroPredio = nil;
Estatistica.sanitarioForaPredio = nil;
Estatistica.sanitarioEducInfant = nil;
Estatistica.sanitarioPNE = nil;
Estatistica.banheiroChuveiro = nil;
Estatistica.almoxarifado = nil;
Estatistica.alojamentoAluno = nil;
Estatistica.alojamentoProfessor = nil;
Estatistica.salaDiretoria = nil;
Estatistica.salaLeitura = nil;
Estatistica.salaProfessores = nil;
Estatistica.secretaria = nil;
Estatistica.despensa = nil;
Estatistica.cozinha = nil;
Estatistica.lavanderia = nil;
Estatistica.atendimentoEspecial = nil;



function Estatistica:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

function Estatistica:getIdebAnosIniciais()
  return self.idebAnosIniciais;
end

function Estatistica:setIdebAnosIniciais(idebAnosIniciais)
  self.idebAnosIniciais = idebAnosIniciais;
end

function Estatistica:getIdebAnosFinais()
  return self.idebAnosFinais;
end

function Estatistica:setIdebAnosFinais(idebAnosFinais)
  self.idebAnosFinais = idebAnosFinais;
end

function Estatistica:getEnem()
  return self.enem;
end

function Estatistica:setEnem(enem)
  self.enem = enem;
end

function Estatistica:getRegiao()
  return self.regiao;
end

function Estatistica:setRegiao(regiao)
  self.regiao = regiao;
end

function Estatistica:getEstado()
  return self.estado;
end

function Estatistica:setEstado(estado)
  self.estado = estado;
end

function Estatistica:getCidade()
  return self.cidade;
end

function Estatistica:setCidade(cidade)
  self.cidade = cidade;
end

function Estatistica:getRegulamentadaSim()
  return self.regulamentadaSim
end

function Estatistica:setRegulamentadaSim(regulamentadaSim)
  self.regulamentadaSim = regulamentadaSim;
end

function Estatistica:getRegulamentadaNao()
  return self.regulamentadaNao
end

function Estatistica:setRegulamentadaNao(regulamentadaNao)
  self.regulamentadaNao = regulamentadaNao;
end



function Estatistica:getRegulamentadaTramitacao()
  return self.regulamentadaTramitacao
end

function Estatistica:setRegulamentadaTramitacao(regulamentadaTramitacao)
  self.regulamentadaTramitacao = regulamentadaTramitacao;
end



function Estatistica:getDependenciaAdministrativaFederal()
  return self.dependenciaAdministrativaFederal;
end

function Estatistica:setDependenciaAdministrativaFederal(dependenciaAdministrativaFederal)
  self.dependenciaAdministrativaFederal = dependenciaAdministrativaFederal;
end


function Estatistica:getDependenciaAdministrativaEstadual()
  return self.dependenciaAdministrativaEstadual;
end

function Estatistica:setDependenciaAdministrativaEstadual(dependenciaAdministrativaEstadual)
  self.dependenciaAdministrativaEstadual = dependenciaAdministrativaEstadual;
end


function Estatistica:getDependenciaAdministrativaMunicipal()
  return self.dependenciaAdministrativaMunicipal;
end

function Estatistica:setDependenciaAdministrativaMunicipal(dependenciaAdministrativaMunicipal)
  self.dependenciaAdministrativaMunicipal = dependenciaAdministrativaMunicipal;
end


function Estatistica:getDependenciaAdministrativaPrivada()
  return self.dependenciaAdministrativaPrivada;
end

function Estatistica:setDependenciaAdministrativaPrivada(dependenciaAdministrativaPrivada)
  self.dependenciaAdministrativaPrivada = dependenciaAdministrativaPrivada;
end


function Estatistica:getSituacaoFuncionamentoAtividade()
  return self.situacaoFuncionamentoAtividade;
end

function Estatistica:setSituacaoFuncionamentoAtividade(situacaoFuncionamentoAtividade)
  self.situacaoFuncionamentoAtividade = situacaoFuncionamentoAtividade;
end

function Estatistica:getSituacaoFuncionamentoParalisada()
  return self.situacaoFuncionamentoParalisada;
end

function Estatistica:setSituacaoFuncionamentoParalisada(situacaoFuncionamentoParalisada)
  self.situacaoFuncionamentoParalisada = situacaoFuncionamentoParalisada;
end


function Estatistica:getSituacaoFuncionamentoExtinta()
  return self.situacaoFuncionamentoExtinta;
end

function Estatistica:setSituacaoFuncionamentoExtinta(situacaoFuncionamentoExtinta)
  self.situacaoFuncionamentoExtinta = situacaoFuncionamentoExtinta;
end



function Estatistica:getSituacaoFuncionamentoExtintaAnoAnterior()
  return self.situacaoFuncionamentoExtintaAnoAnterior;
end

function Estatistica:setSituacaoFuncionamentoExtintaAnoAnterior(situacaoFuncionamentoExtintaAnoAnterior)
  self.situacaoFuncionamentoExtintaAnoAnterior = situacaoFuncionamentoExtintaAnoAnterior;
end


function Estatistica:getSituacaoFuncionamentoNaoInformado()
  return self.situacaoFuncionamentoNaoInformado;
end

function Estatistica:setSituacaoFuncionamentoNaoInformado(situacaoFuncionamentoNaoInformado)
  self.situacaoFuncionamentoNaoInformado = situacaoFuncionamentoNaoInformado;
end


function Estatistica:getTipoLocalizacaoUrbana()
  return self.tipoLocalizacaoUrbana;
end

function Estatistica:setTipoLocalizacaoUrbana(tipoLocalizacaoUrbana)
  self.tipoLocalizacaoUrbana = tipoLocalizacaoUrbana;
end

function Estatistica:getTipoLocalizacaoRural()
  return self.tipoLocalizacaoRural;
end

function Estatistica:setTipoLocalizacaoRural(tipoLocalizacaoRural)
  self.tipoLocalizacaoRural = tipoLocalizacaoRural;
end


function Estatistica:getAguaFiltrada()
  return self.aguaFiltrada;
end

function Estatistica:setAguaFiltrada(aguaFiltrada)
  self.aguaFiltrada = aguaFiltrada;
end

function Estatistica:getAguaPublica()
  return self.aguaPublica;
end

function Estatistica:setAguaPublica(aguaPublica)
  self.aguaPublica = aguaPublica;
end

function Estatistica:getAguaPocoArtesiano()
  return self.aguaPocoArtesiano;
end

function Estatistica:setAguaPocoArtesiano(aguaPocoArtesiano)
  self.aguaPocoArtesiano = aguaPocoArtesiano;
end


function Estatistica:getAguaCacimba()
  return self.aguaCacimba;
end

function Estatistica:setAguaCacimba(aguaCacimba)
  self.aguaCacimba = aguaCacimba;
end


function Estatistica:getAguaRio()
  return self.aguaRio;
end

function Estatistica:setAguaRio(aguaRio)
  self.aguaRio = aguaRio;
end

function Estatistica:getAguaInexistente()
  return self.aguaInexistente;
end

function Estatistica:setAguaInexistente(aguaInexistente)
  self.aguaInexistente = aguaInexistente;
end

function Estatistica:getEnergiaPublica()
  return self.energiaPublica;
end

function Estatistica:setEnergiaPublica(energiaPublica)
  self.energiaPublica = energiaPublica;
end

function Estatistica:getEnergiaGerador()
  return self.energiaGerador;
end

function Estatistica:setEnergiaGerador(energiaGerador)
  self.energiaGerador = energiaGerador;
end

function Estatistica:getEnergiaOutros()
  return self.energiaOutros;
end

function Estatistica:setEnergiaOutros(energiaOutros)
  self.energiaOutros = energiaOutros;
end

function Estatistica:getEnergiaInexistente()
  return self.energiaInexistente;
end

function Estatistica:setEnergiaInexistente(energiaInexistente)
  self.energiaInexistente = energiaInexistente;
end

function Estatistica:getEsgotoPublico()
  return self.esgotoPublico;
end

function Estatistica:setEsgotoPublico(esgotoPublico)
  self.esgotoPublico = esgotoPublico;
end

function Estatistica:getEsgotoFossa()
  return self.esgotoFossa;
end

function Estatistica:setEsgotoFossa(esgotoFossa)
  self.esgotoFossa = esgotoFossa;
end

function Estatistica:getEsgotoInexistente()
  return self.esgotoInexistente;
end

function Estatistica:setEsgotoInexistente(esgotoInexistente)
  self.esgotoInexistente = esgotoInexistente;
end

function Estatistica:getLixoColetaPeriodica()
  return self.lixoColetaPeriodica;
end

function Estatistica:setLixoColetaPeriodica(lixoColetaPeriodica)
  self.lixoColetaPeriodica = lixoColetaPeriodica;
end

function Estatistica:getLixoQueima()
  return self.lixoQueima;
end

function Estatistica:setLixoQueima(lixoQueima)
  self.lixoQueima = lixoQueima;
end

function Estatistica:getLixoJogaOutraArea()
  return self.lixoJogaOutraArea;
end

function Estatistica:setLixoJogaOutraArea(lixoJogaOutraArea)
  self.lixoJogaOutraArea = lixoJogaOutraArea;
end

function Estatistica:getLixoRecicla()
  return self.lixoRecicla;
end

function Estatistica:setLixoRecicla(lixoRecicla)
  self.lixoRecicla = lixoRecicla;
end

function Estatistica:getLixoEnterra()
  return self.lixoEnterra
end

function Estatistica:setLixoEnterra(lixoEnterra)
  self.lixoEnterra = lixoEnterra;
end

function Estatistica:getLixoOutros()
  return self.lixoOutros
end

function Estatistica:setLixoOutros(lixoOutros)
  self.lixoOutros = lixoOutros;
end

function Estatistica:getLaboratorioInformatica()
  return self.laboratorioInformatica;
end

function Estatistica:setLaboratorioInformatica(laboratorioInformatica)
  self.laboratorioInformatica = laboratorioInformatica;
end

function Estatistica:getLaboratorioCiencias()
  return self.laboratorioCiencias;
end

function Estatistica:setLaboratorioCiencias(laboratorioCiencias)
  self.laboratorioCiencias = laboratorioCiencias;
end

function Estatistica:getBiblioteca()
  return self.biblioteca;
end

function Estatistica:setBiblioteca(biblioteca)
  self.biblioteca = biblioteca;
end

function Estatistica:getAuditorio()
  return self.auditorio;
end

function Estatistica:setAuditorio(auditorio)
  self.auditorio = auditorio;
end

function Estatistica:getRefeitorio()
  return self.refeitorio;
end

function Estatistica:setRefeitorio(refeitorio)
  self.refeitorio = refeitorio;
end

function Estatistica:getPatioCoberto()
  return self.patioCoberto;
end

function Estatistica:setPatioCoberto(patioCoberto)
  self.patioCoberto = patioCoberto;
end

function Estatistica:getPatioDescoberto()
  return self.patioDescoberto;
end

function Estatistica:setPatioDescoberto(patioDescoberto)
  self.patioDescoberto = patioDescoberto;
end

function Estatistica:getParqueInfantil()
  return self.parqueInfantil;
end

function Estatistica:setParqueInfantil(parqueInfantil)
  self.parqueInfantil = parqueInfantil;
end

function Estatistica:getBercario()
  return self.bercario;
end

function Estatistica:setBercario(bercario)
  self.bercario = bercario;
end

function Estatistica:getQuadraCoberta()
  return self.quadraCoberta;
end

function Estatistica:setQuadraCoberta(quadraCoberta)
  self.quadraCoberta = quadraCoberta;
end

function Estatistica:getQuadraDescoberta()
  return self.quadraDescoberta;
end

function Estatistica:setQuadraDescoberta(quadraDescoberta)
  self.quadraDescoberta = quadraDescoberta;
end

function Estatistica:getAreaVerde()
  return self.areaVerde;
end

function Estatistica:setAreaVerde(areaVerde)
  self.areaVerde = areaVerde;
end

function Estatistica:getDependenciasPNE()
  return self.dependenciasPNE;
end

function Estatistica:setDependenciasPNE(dependenciasPNE)
  self.dependenciasPNE = dependenciasPNE;
end

function Estatistica:getEnsinoEspecial()
  return self.ensinoEspecial;
end

function Estatistica:setEnsinoEspecial(ensinoEspecial)
  self.ensinoEspecial = ensinoEspecial;
end

function Estatistica:getSanitarioDentroPredio()
  return self.sanitarioDentroPredio;
end

function Estatistica:setSanitarioDentroPredio(sanitarioDentroPredio)
  self.sanitarioDentroPredio = sanitarioDentroPredio;
end

function Estatistica:getSanitarioForaPredio()
  return self.sanitarioForaPredio;
end

function Estatistica:setSanitarioForaPredio(sanitarioForaPredio)
  self.sanitarioForaPredio = sanitarioForaPredio;
end


function Estatistica:getSanitarioEducInfant()
  return self.sanitarioEducInfant;
end

function Estatistica:setSanitarioEducInfant(sanitarioEducInfant)
  self.sanitarioEducInfant = sanitarioEducInfant;
end



function Estatistica:getSanitarioPNE()
  return self.sanitarioPNE;
end

function Estatistica:setSanitarioPNE(sanitarioPNE)
  self.sanitarioPNE = sanitarioPNE;
end




function Estatistica:getBanheiroChuveiro()
  return self.banheiroChuveiro;
end

function Estatistica:setBanheiroChuveiro(banheiroChuveiro)
  self.banheiroChuveiro = banheiroChuveiro;
end

function Estatistica:getAlmoxarifado()
  return self.almoxarifado;
end

function Estatistica:setAlmoxarifado(almoxarifado)
  self.almoxarifado = almoxarifado;
end

function Estatistica:getAlojamentoAluno()
  return self.alojamentoAluno;
end

function Estatistica:setAlojamentoAluno(alojamentoAluno)
  self.alojamentoAluno = alojamentoAluno;
end

function Estatistica:getAlojamentoProfessor()
  return self.alojamentoProfessor;
end

function Estatistica:setAlojamentoProfessor(alojamentoProfessor)
  self.alojamentoProfessor = alojamentoProfessor;
end

function Estatistica:getSalaDiretoria()
  return self.salaDiretoria;
end

function Estatistica:setSalaDiretoria(salaDiretoria)
  self.salaDiretoria = salaDiretoria;
end

function Estatistica:getSalaLeitura()
  return self.salaLeitura;
end

function Estatistica:setSalaLeitura(salaLeitura)
  self.salaLeitura = salaLeitura;
end

function Estatistica:getSalaProfessores()
  return self.salaProfessores;
end

function Estatistica:setSalaProfessores(salaProfessores)
  self.salaProfessores = salaProfessores;
end

function Estatistica:getSecretaria()
  return self.secretaria;
end

function Estatistica:setSecretaria(secretaria)
  self.secretaria = secretaria;
end

function Estatistica:getDespensa()
  return self.despensa;
end

function Estatistica:setDespensa(despensa)
  self.despensa = despensa;
end

function Estatistica:getCozinha()
  return self.cozinha;
end

function Estatistica:setCozinha(cozinha)
  self.cozinha = cozinha;
end

function Estatistica:getLavanderia()
  return self.lavanderia;
end

function Estatistica:setLavanderia(lavanderia)
  self.lavanderia = lavanderia;
end

function Estatistica:getAtendimentoEspecial()
  return self.atendimentoEspecial;
end

function Estatistica:setAtendimentoEspecial(atendimentoEspecial)
  self.atendimentoEspecial = atendimentoEspecial;
end


