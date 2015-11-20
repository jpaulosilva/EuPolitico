FiltroPolitico = {}

FiltroPolitico.id = nil;

FiltroPolitico.regiao = nil;
FiltroPolitico.regiaoAlterado = false;

FiltroPolitico.cidade = nil;
FiltroPolitico.cidadeAlterado = false;

FiltroPolitico.uf = nil;
FiltroPolitico.ufAlterado = false;

FiltroPolitico.nomeParlamentar = nil;
FiltroPolitico.nomeParlamentarAlterado = false;

FiltroPolitico.nomeCompleto = nil;
FiltroPolitico.nomeCompletoAlterado = false;

FiltroPolitico.cargo = nil;
FiltroPolitico.cargoAlterado = false;

FiltroPolitico.partido = nil;
FiltroPolitico.partidoAlterado = false;

FiltroPolitico.mandato = nil;
FiltroPolitico.mandatoAlterado = false;

FiltroPolitico.sexo = nil;
FiltroPolitico.sexoAlterado = false;

FiltroPolitico.telefone = nil;
FiltroPolitico.telefoneAlterado = false;

FiltroPolitico.email = nil;
FiltroPolitico.emailAlterado = false;

FiltroPolitico.nascimento = nil;
FiltroPolitico.nascimentoAlterado = false;

FiltroPolitico.gastoTotal = nil;
FiltroPolitico.gastoTotalAlterado = false;

FiltroPolitico.gastoPorDia = nil;
FiltroPolitico.gastoPorDiaAlterado = false;


function FiltroPolitico:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end


function FiltroPolitico:getRegiao()
	return self.regiao;
end
function FiltroPolitico:setRegiao(regiao)
	self.regiao = regiao;
	self.regiaoAlterado = true;
end

function FiltroPolitico:getCidade()
	return self.cidade;
end
function FiltroPolitico:setCidade(cidade)
	self.cidade = cidade;
	self.cidadeAlterado = true;
end

function FiltroPolitico:getUf()
	return self.uf;
end
function FiltroPolitico:setUf(uf)
	self.uf = uf;
	self.ufAlterado = true;
end

function FiltroPolitico:getNomeParlamentar()
	return self.nomeParlamentar;
end
function FiltroPolitico:setNomeParlamentar(nomeParlamentar)
	self.nomeParlamentar = nomeParlamentar;
	self.nomeParlamentarAlterado = true;
end

function FiltroPolitico:getNomeCompleto()
	return self.nomeCompleto;
end
function FiltroPolitico:setNomeCompleto(nomeCompleto)
	self.nomeCompleto = nomeCompleto;
	self.nomeCompletoAlterado = true;
end

function FiltroPolitico:getCargo()
	return self.cargo;
end
function FiltroPolitico:setCargo(cargo)
	self.cargo = cargo;
	self.cargoAlterado = true;
end

function FiltroPolitico:getPartido()
	return self.partido;
end
function FiltroPolitico:setPartido(partido)
	self.partido = partido;
	self.partidoAlterado = true;
end

function FiltroPolitico:getMandato()
	return self.mandato;
end
function FiltroPolitico:setMandato(mandato)
	self.mandato = mandato;
	self.mandatoAlterado = true;
end

function FiltroPolitico:getSexo()
	return self.sexo;
end
function FiltroPolitico:setSexo(sexo)
	self.sexo = sexo;
	self.sexoAlterado = true;
end

function FiltroPolitico:getTelefone()
	return self.telefone;
end
function FiltroPolitico:setTelefone(telefone)
	self.telefone = telefone;
	self.telefoneAlterado = true;
end

function FiltroPolitico:getEmail()
	return self.email;
end
function FiltroPolitico:setEmail(email)
	self.email = email;
	self.emailAlterado = true;
end

function FiltroPolitico:getNascimento()
	return self.nascimento;
end
function FiltroPolitico:setNascimento(nascimento)
	self.nascimento = nascimento;
	self.nascimentoAlterado = true;
end

function FiltroPolitico:getGastoTotal()
	return self.gastoTotal;
end
function FiltroPolitico:setGastoTotal(gastoTotal)
	self.gastoTotal = gastoTotal;
	self.gastoTotalAlterado = true;
end

function FiltroPolitico:getGastoPorDia()
	return self.gastoPorDia;
end
function FiltroPolitico:setGastoPorDia(gastoPorDia)
	self.gastoPorDia = gastoPorDia;
	self.gastoPorDiaAlterado = true;
end



function FiltroPolitico:toParams()

	local params = {};
	
	if (self.regiaoAlterado) then
		params.regiao = self.regiao;
	end
	
	if (self.cidadeAlterado) then
		params.cidade = self.cidade;
	end
	
	if (self.ufAlterado) then
		params.uf = self.uf;
	end
	
	if (self.nomeParlamentarAlterado) then
		params.nomeParlamentar = self.nomeParlamentar;
	end
	
	if (self.nomeCompletoAlterado) then
		params.nomeCompleto = self.nomeCompleto;
	end
	
	if (self.cargoAlterado) then
		params.cargo = self.cargo;
	end
	
	if (self.partidoAlterado) then
		params.partido = self.partido;
	end
	
	if (self.mandatoAlterado) then
		params.mandato = self.mandato;
	end
	
	if (self.sexoAlterado) then
		params.sexo = self.sexo;
	end
	
	if (self.telefoneAlterado) then
		params.telefone = self.telefone;
	end
	
	if (self.emailAlterado) then
		params.email = self.email;
	end
	
	if (self.nascimentoAlterado) then
		params.nascimento = self.nascimento;
	end
	
	if (self.gastoTotalAlterado) then
		params.gastoTotal = self.gastoTotal;
	end
	
	if (self.gastoPorDiaAlterado) then
		params.gastoPorDia = self.gastoPorDia;
	end
	
	return params;
	
end