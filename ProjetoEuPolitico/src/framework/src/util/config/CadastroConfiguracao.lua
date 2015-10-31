BibliotecaAuxiliarScript.execute('framework.src.file.Cadastro');

CadastroConfiguracao = Cadastro.new();

CadastroConfiguracao.st_arquivo = SystemProperties.PROJECT_PATH.."/config/moondo-config.xml";
CadastroConfiguracao:getDados();

function CadastroConfiguracao:getNavigationsRules()
	local navigationRules = {};
	
	if(CadastroConfiguracao.tb_dados ~= nil) then
		if(CadastroConfiguracao.tb_dados.moondoConfig ~= nil) then
			if(CadastroConfiguracao.tb_dados.moondoConfig.navigations ~= nil) then
				if(CadastroConfiguracao.tb_dados.moondoConfig.navigations.navigationRule) then
					navigationRule = CadastroConfiguracao.tb_dados.moondoConfig.navigations.navigationRule;
				end	
			end
		end
	end
	
	return CadastroConfiguracao.tb_dados.moondoConfig.navigations.navigationRule;
end

function CadastroConfiguracao:getRulesView()
	local rulesView = {};
	
	local navigations_rules = CadastroConfiguracao:getNavigationsRules();

	if(navigations_rules[1] ~= nil) then
		for i,v in pairs(navigations_rules)do
			for i,v in pairs(CadastroConfiguracao:getRule(v))do
				table.insert(rulesView,v);
			end
		end
	else
		rulesView = CadastroConfiguracao:getRule(navigations_rules);
	end
	
	return rulesView;
end

function CadastroConfiguracao:getRule(navigationRule)
	local rules = {};
	
	local id_from_rule = "";
	local is_navigationRule_default = false;
	local separador = "";
	
	if(navigationRule["_attr"] ~= nil and navigationRule["_attr"].default ~= nil) then
		is_navigationRule_default = navigationRule["_attr"].default;
	end
	
	if(navigationRule.from ~= nil)then
		id_from_rule = id_from_rule..separador..navigationRule.from["_attr"].scene;
		separador = "#";
		
		if(navigationRule.from["_attr"].frame ~= nil)then
			id_from_rule = id_from_rule..separador..navigationRule.from["_attr"].frame;
			separador = "#";
		end
	end
	
	if(navigationRule.navigationCase[1] ~= nil) then
		for i,v in pairs(navigationRule.navigationCase)do
			table.insert(rules,CadastroConfiguracao:getRuleCase(v,id_from_rule,is_navigationRule_default,separador));
		end
	else
		table.insert(rules,CadastroConfiguracao:getRuleCase(navigationRule.navigationCase,id_from_rule,is_navigationRule_default,separador));		
	end
	
	return rules;
end

function CadastroConfiguracao:getRuleCase(navigationCase,id_from_rule,is_navigationRule_default,separador)
	local rule;
	
	local is_case_navigation_default = false;
	local id_rule = id_from_rule;
	local value_rule = "";
	
	if(navigationCase["_attr"] ~= nil and navigationCase["_attr"].default ~= nil) then
		is_case_navigation_default = navigationCase["_attr"].default;
	end
	
	if(navigationCase.key ~= nil)then
		if(navigationCase.key["_attr"].class ~= nil and navigationCase.key["_attr"].class == "controlKey" and navigationCase.key["_attr"].key ~= nil)then
			id_rule = id_rule..separador..navigationCase.key["_attr"].key;
		elseif(navigationCase.key["_attr"].class ~= nil and navigationCase.key["_attr"].class == "ruleKey" and navigationCase.key["_attr"].key ~= nil)then
			id_rule = id_rule..separador..navigationCase.key["_attr"].key;
		end
	end
	if(navigationCase.to["_attr"].frame ~= nil)then
		value_rule = navigationCase.to["_attr"].scene.."#"..navigationCase.to["_attr"].frame;
	else
		value_rule = navigationCase.to["_attr"].scene;
	end
	
	
	rule = {id=id_rule,value=value_rule,is_default=is_navigationRule_default and is_case_navigation_default}
	
	return rule;
end