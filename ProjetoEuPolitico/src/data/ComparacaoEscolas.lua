ComparacaoEscolas = {};

ComparacaoEscolas.idebAnosIniciais = nil;
ComparacaoEscolas.idebAnosFinais = nil;
ComparacaoEscolas.enem = nil;
ComparacaoEscolas.regiao = nil;
ComparacaoEscolas.estado = nil;
ComparacaoEscolas.cidade = nil;
ComparacaoEscolas.regulamentada = nil;
ComparacaoEscolas.dependenciasAdministrativas = nil;
ComparacaoEscolas.situacaoEmAtividade = nil;
ComparacaoEscolas.situacaoParalisada = nil;
ComparacaoEscolas.localidadeUrbana = nil;
ComparacaoEscolas.localidadeRural = nil;
ComparacaoEscolas.aguaFiltrada = nil;
ComparacaoEscolas.aguaPublica = nil;
ComparacaoEscolas.aguaPocoArtesiano = nil;
ComparacaoEscolas.aguaCacimba = nil;
ComparacaoEscolas.aguaRio = nil;
ComparacaoEscolas.aguaInexistente = nil;
ComparacaoEscolas.energiaPublica = nil;
ComparacaoEscolas.energiaGerador = nil;
ComparacaoEscolas.energiaOutros = nil;
ComparacaoEscolas.energiaInexistente = nil;
ComparacaoEscolas.esgotoPublico = nil;
ComparacaoEscolas.esgotoFossa = nil;
ComparacaoEscolas.esgotoInexistente = nil;
ComparacaoEscolas.lixoColetaPeriodica = nil;
ComparacaoEscolas.lixoQueima = nil;
ComparacaoEscolas.lixoJogaOutraArea = nil;
ComparacaoEscolas.lixoRecicla = nil;
ComparacaoEscolas.lixoEnterra = nil;
ComparacaoEscolas.lixoOutros = nil;
ComparacaoEscolas.laboratorioInformatica = nil;
ComparacaoEscolas.laboratorioCiencias = nil;
ComparacaoEscolas.biblioteca = nil;
ComparacaoEscolas.auditorio = nil;
ComparacaoEscolas.refeitorio = nil;
ComparacaoEscolas.patioCoberto = nil;
ComparacaoEscolas.patioDescoberto = nil;
ComparacaoEscolas.parqueInfantil = nil;
ComparacaoEscolas.bercario = nil;
ComparacaoEscolas.quadraCoberta = nil;
ComparacaoEscolas.quadraDescoberta = nil;
ComparacaoEscolas.areaVerde = nil;
ComparacaoEscolas.dependenciasPNE = nil;
ComparacaoEscolas.ensinoEspecial = nil;
ComparacaoEscolas.sanitarioDentroPredio = nil;
ComparacaoEscolas.sanitarioForaPredio = nil;
ComparacaoEscolas.banheiroChuveiro = nil;
ComparacaoEscolas.almoxarifado = nil;
ComparacaoEscolas.alojamentoAluno = nil;
ComparacaoEscolas.salaDiretoria = nil;
ComparacaoEscolas.salaLeitura = nil;
ComparacaoEscolas.salaProfessores = nil;
ComparacaoEscolas.secretaria = nil;
ComparacaoEscolas.despensa = nil;
ComparacaoEscolas.cozinha = nil;
ComparacaoEscolas.lavanderia = nil;


function ComparacaoEscolas:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function ComparacaoEscolas:getIdebAnosIniciais()
  return self.idebAnosIniciais;
end

function ComparacaoEscolas:setIdebAnosIniciais(idebAnosIniciais)
  self.idebAnosIniciais = idebAnosIniciais;
end

function ComparacaoEscolas:getIdebAnosFinais()
  return self.idebAnosFinais;
end

function ComparacaoEscolas:setIdebAnosFinais(idebAnosFinais)
  self.idebAnosFinais = idebAnosFinais;
end

function ComparacaoEscolas:getEnem()
  return self.enem;
end

function ComparacaoEscolas:setEnem(enem)
  self.enem = enem;
end

function ComparacaoEscolas:getRegiao()
  return self.regiao;
end

function ComparacaoEscolas:setRegiao(regiao)
  self.regiao = regiao;
end

function ComparacaoEscolas:getEstado()
  return self.estado;
end

function ComparacaoEscolas:setEstado(estado)
  self.estado = estado;
end

function ComparacaoEscolas:getCidade()
  return self.cidade;
end

function ComparacaoEscolas:setCidade(cidade)
	self.cidade = cidade;
end

function ComparacaoEscolas:getRegulamentada()
  return self.regulamentada
end

function ComparacaoEscolas:setRegulamentada(regulamentada)
  self.regulamentada = regulamentada;
end

function ComparacaoEscolas:getDependenciasAdministrativas()
  return self.dependenciasAdministrativas;
end

function ComparacaoEscolas:setDependenciasAdministrativas(dependenciasAdministrativas)
  self.dependenciasAdministrativas = dependenciasAdministrativas;
end

function ComparacaoEscolas:getSituacaoEmAtividade()
  return self.situacaoEmAtividade;
end

function ComparacaoEscolas:setSituacaoEmAtividade(situacaoEmAtividade)
  self.situacaoEmAtividade = situacaoEmAtividade;
end

function ComparacaoEscolas:getSituacaoParalisada()
  return self.situacaoParalisada;
end

function ComparacaoEscolas:setSituacaoParalisada(situacaoParalisada)
  self.situacaoParalisada = situacaoParalisada;
end

function ComparacaoEscolas:getLocalidadeUrbana()
  return self.localidadeUrbana;
end

function ComparacaoEscolas:setLocalidadeUrbana(localidadeUrbana)
  self.localidadeUrbana = localidadeUrbana;
end

function ComparacaoEscolas:getLocalidadeRural()
  return self.localidadeRural;
end

function ComparacaoEscolas:setLocalidadeRural(localidadeRural)
  self.localidadeRural = localidadeRural;
end


function ComparacaoEscolas:getAguaFiltrada()
  return self.aguaFiltrada;
end

function ComparacaoEscolas:setAguaFiltrada(aguaFiltrada)
  self.aguaFiltrada = aguaFiltrada;
end

function ComparacaoEscolas:getAguaPublica()
  return self.aguaPublica;
end

function ComparacaoEscolas:setAguaPublica(aguaPublica)
  self.aguaPublica = aguaPublica;
end

function ComparacaoEscolas:getAguaPocoArtesiano()
  return self.aguaPocoArtesiano;
end

function ComparacaoEscolas:setAguaPocoArtesiano(aguaPocoArtesiano)
  self.aguaPocoArtesiano = aguaPocoArtesiano;
end

function ComparacaoEscolas:getAguaRio()
  return self.aguaRio;
end

function ComparacaoEscolas:setAguaRio(aguaRio)
  self.aguaRio = aguaRio;
end

function ComparacaoEscolas:getAguaInexistente()
  return self.aguaInexistente;
end

function ComparacaoEscolas:setAguaInexistente(aguaInexistente)
  self.aguaInexistente = aguaInexistente;
end

function ComparacaoEscolas:getEnergiaPublica()
  return self.energiaPublica;
end

function ComparacaoEscolas:setEnergiaPublica(energiaPublica)
  self.energiaPublica = energiaPublica;
end

function ComparacaoEscolas:getEnergiaGerador()
  return self.energiaGerador;
end

function ComparacaoEscolas:setEnergiaGerador(energiaGerador)
  self.energiaGerador = energiaGerador;
end

function ComparacaoEscolas:getEnergiaOutros()
  return self.energiaOutros;
end

function ComparacaoEscolas:setEnergiaOutros(energiaOutros)
  self.energiaOutros = energiaOutros;
end

function ComparacaoEscolas:getEnergiaInexistente()
  return self.energiaInexistente;
end

function ComparacaoEscolas:setEnergiaInexistente(energiaInexistente)
  self.energiaInexistente = energiaInexistente;
end

function ComparacaoEscolas:getEsgotoPublico()
  return self.esgotoPublico;
end

function ComparacaoEscolas:setEsgotoPublico(esgotoPublico)
  self.esgotoPublico = esgotoPublico;
end

function ComparacaoEscolas:getEsgotoFossa()
  return self.esgotoFossa;
end

function ComparacaoEscolas:setEsgotoFossa(esgotoFossa)
  self.esgotoFossa = esgotoFossa;
end

function ComparacaoEscolas:getEsgotoInexistente()
  return self.esgotoInexistente;
end

function ComparacaoEscolas:setEsgotoInexistente(esgotoInexistente)
  self.esgotoInexistente = esgotoInexistente;
end

function ComparacaoEscolas:getLixoColetaPeriodica()
  return self.lixoColetaPeriodica;
end

function ComparacaoEscolas:setLixoColetaPeriodica(lixoColetaPeriodica)
  self.lixoColetaPeriodica = lixoColetaPeriodica;
end

function ComparacaoEscolas:getLixoQueima()
  return self.lixoQueima;
end

function ComparacaoEscolas:setLixoQueima(lixoQueima)
  self.lixoQueima = lixoQueima;
end

function ComparacaoEscolas:getLixoJogaOutraArea()
  return self.lixoJogaOutraArea;
end

function ComparacaoEscolas:setLixoJogaOutraArea(lixoJogaOutraArea)
  self.lixoJogaOutraArea = lixoJogaOutraArea;
end

function ComparacaoEscolas:getLixoRecicla()
  return self.lixoRecicla;
end

function ComparacaoEscolas:setLixoRecicla(lixoRecicla)
  self.lixoRecicla = lixoRecicla;
end

function ComparacaoEscolas:getLixoEnterra()
  return self.lixoEnterra
end

function ComparacaoEscolas:setLixoEnterra(lixoEnterra)
  self.lixoEnterra = lixoEnterra;
end

function ComparacaoEscolas:getLixoOutros()
  return self.lixoOutros
end

function ComparacaoEscolas:setLixoOutros(lixoOutros)
  self.lixoOutros = lixoOutros;
end

function ComparacaoEscolas:getLaboratorioInformatica()
  return self.laboratorioInformatica;
end

function ComparacaoEscolas:setLaboratorioInformatica(laboratorioInformatica)
  self.laboratorioInformatica = laboratorioInformatica;
end

function ComparacaoEscolas:getLaboratorioCiencias()
  return self.laboratorioCiencias;
end

function ComparacaoEscolas:setLaboratorioCiencias(laboratorioCiencias)
  self.laboratorioCiencias = laboratorioCiencias;
end

function ComparacaoEscolas:getBiblioteca()
  return self.biblioteca;
end

function ComparacaoEscolas:setBiblioteca(biblioteca)
  self.biblioteca = biblioteca;
end

function ComparacaoEscolas:getAuditorio()
  return self.auditorio;
end

function ComparacaoEscolas:setAuditorio(auditorio)
  self.auditorio = auditorio;
end

function ComparacaoEscolas:getRefeitorio()
  return self.refeitorio;
end

function ComparacaoEscolas:setRefeitorio(refeitorio)
  self.refeitorio = refeitorio;
end

function ComparacaoEscolas:getPatioCoberto()
  return self.patioCoberto;
end

function ComparacaoEscolas:setPatioCoberto(patioCoberto)
  self.patioCoberto = patioCoberto;
end

function ComparacaoEscolas:getPatioDescoberto()
  return self.patioDescoberto;
end

function ComparacaoEscolas:setPatioDescoberto(patioDescoberto)
  self.patioDescoberto = patioDescoberto;
end

function ComparacaoEscolas:getParqueInfantil()
  return self.parqueInfantil;
end

function ComparacaoEscolas:setParqueInfantil(parqueInfantil)
  self.parqueInfantil = parqueInfantil;
end

function ComparacaoEscolas:getBercario()
  return self.bercario;
end

function ComparacaoEscolas:setBercario(bercario)
  self.bercario = bercario;
end

function ComparacaoEscolas:getQuadraCoberta()
  return self.quadraCoberta;
end

function ComparacaoEscolas:setQuadraCoberta(quadraCoberta)
  self.quadraCoberta = quadraCoberta;
end

function ComparacaoEscolas:getQuadraDescoberta()
  return self.quadraDescoberta;
end

function ComparacaoEscolas:setQuadraDescoberta(quadraDescoberta)
  self.quadraDescoberta = quadraDescoberta;
end

function ComparacaoEscolas:getAreaVerde()
  return self.areaVerde;
end

function ComparacaoEscolas:setAreaVerde(areaVerde)
  self.areaVerde = areaVerde;
end

function ComparacaoEscolas:getDependenciasPNE()
  return self.dependenciasPNE;
end

function ComparacaoEscolas:setDependenciasPNE(dependenciasPNE)
  self.dependenciasPNE = dependenciasPNE;
end

function ComparacaoEscolas:getEnsinoEspecial()
  return self.ensinoEspecial;
end

function ComparacaoEscolas:setEnsinoEspecial(ensinoEspecial)
  self.ensinoEspecial = ensinoEspecial;
end

function ComparacaoEscolas:getSanitarioDentroPredio()
  return self.sanitarioDentroPredio;
end

function ComparacaoEscolas:setSanitarioDentroPredio(sanitarioDentroPredio)
  self.sanitarioDentroPredio = sanitarioDentroPredio;
end

function ComparacaoEscolas:getSanitarioForaPredio()
  return self.sanitarioForaPredio;
end

function ComparacaoEscolas:setSanitarioForaPredio(sanitarioForaPredio)
  self.sanitarioForaPredio = sanitarioForaPredio;
end

function ComparacaoEscolas:getBanheiroChuveiro()
  return self.banheiroChuveiro;
end

function ComparacaoEscolas:setBanheiroChuveiro(banheiroChuveiro)
  self.banheiroChuveiro = banheiroChuveiro;
end

function ComparacaoEscolas:getAlmoxarifado()
  return self.almoxarifado;
end

function ComparacaoEscolas:setAlmoxarifado(almoxarifado)
  self.almoxarifado = almoxarifado;
end

function ComparacaoEscolas:getAlojamentoAluno()
  return self.alojamentoAluno;
end

function ComparacaoEscolas:setAlojamentoAluno(alojamentoAluno)
  self.alojamentoAluno = alojamentoAluno;
end

function ComparacaoEscolas:getSalaDiretoria()
  return self.salaDiretoria;
end

function ComparacaoEscolas:setSalaDiretoria(salaDiretoria)
  self.salaDiretoria = salaDiretoria;
end

function ComparacaoEscolas:getSalaLeitura()
  return self.salaLeitura;
end

function ComparacaoEscolas:setSalaLeitura(salaLeitura)
  self.salaLeitura = salaLeitura;
end

function ComparacaoEscolas:getSalaProfessores()
  return self.salaProfessores;
end

function ComparacaoEscolas:setSalaProfessores(salaProfessores)
  self.salaProfessores = salaProfessores;
end

function ComparacaoEscolas:getSecretaria()
  return self.secretaria;
end

function ComparacaoEscolas:setSecretaria(secretaria)
  self.secretaria = secretaria;
end

function ComparacaoEscolas:getDespensa()
  return self.despensa;
end

function ComparacaoEscolas:setDespensa(despensa)
  self.despensa = despensa;
end

function ComparacaoEscolas:getCozinha()
  return self.cozinha;
end

function ComparacaoEscolas:setCozinha(cozinha)
  self.cozinha = cozinha;
end

function ComparacaoEscolas:getLavanderia()
  return self.lavanderia;
end

function ComparacaoEscolas:setLavanderia(lavanderia)
  self.lavanderia = lavanderia;
end
