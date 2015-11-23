BibliotecaAuxiliarScript.execute('data.Regiao');
BibliotecaAuxiliarScript.execute('data.Estado');
BibliotecaAuxiliarScript.execute('data.Cidade');
BibliotecaAuxiliarScript.execute('data.Bairro');


Localizacoes = {};
Localizacoes.regioes = {};
Localizacoes.nomesRegioes = {};

Localizacoes.foiCarregada = false;

-- devido a grande quantidade de cidades carregadas da memoria (limpar cidades antes de consultar novas)
function Localizacoes:descarregaCidades()
  for i,regiao in pairs(Localizacoes.regioes) do
    for j,estado in pairs(regiao:getEstados()) do
      estado:setCidades({});
      estado.nomesCidades = {};
    end
  end

end

function Localizacoes:carregaCidades(estado)
  self:descarregaCidades();
  local nomeEstado = estado:getNome();
  local urlFile = "../media/cidades/localizacoes"..nomeEstado..".txt"
  local file = io.open(urlFile);

  if(file ~= nil) then

    local lastCidadeNome = nil;

    local cidade = nil;

    for line in file:read("*all"):split("\n")do
      local fSplit = line:split(";");

      local cidadeCodigo = fSplit();
      local cidadeNome = fSplit();

      if(estado:getCidades()[cidadeNome] == nil) then
        cidade = Cidade.new();
        cidade:setNome(cidadeNome);
        cidade:setCodigo(cidadeCodigo);
        estado:getCidades()[cidadeNome] = cidade;
        table.insert(estado.nomesCidades,cidadeNome);
      end
      lastCidadeNome = cidadeNome;

    --    if(bairroNome ~= nil)then
    --      local bairro = nil;
    --      if(cidade:getBairros()[bairroNome] ~= nil) then
    --        bairro = cidade:getBairros()[bairroNome];
    --      else
    --        bairro = Bairro.new();
    --        bairro.nome = bairroNome;
    --        cidade:getBairros()[bairroNome] = bairro;
    --      end
    --    end

    end
    
--      table.sort(estado.nomesCidades)

  else
    print("File not found: "..urlFile)
  end

end

function Localizacoes:carregarLocalizacoes()
  Localizacoes.foiCarregada = true;
  local APP = coroutine.create (function ()

      for line in io.lines("../media/estados.txt") do
        local v = BibliotecaAuxiliarTexto.tokenize(line,";")

        local regiaoNome = v[1];
        local estadoNome = v[3];
        --    local cidadeNome = v:getCidade();
        --    local bairroNome = v:getBairro();

        --print(regiaoNome,estadoNome,cidadeNome,bairroNome);

        local regiao = nil;
        if(Localizacoes.regioes[regiaoNome] ~= nil) then
          regiao = Localizacoes.regioes[regiaoNome];
        else
          regiao = Regiao.new();
          regiao.nome = regiaoNome;
          Localizacoes.regioes[regiaoNome] = regiao;
          table.insert(Localizacoes.nomesRegioes,regiaoNome);
        end

        local estado = nil;
        if(regiao:getEstados()[estadoNome] ~= nil) then
          estado = regiao:getEstados()[estadoNome];
        else
          estado = Estado.new();
          estado.nome = estadoNome;
          regiao:getEstados()[estadoNome] = estado;
          table.insert(regiao.nomesEstados,estadoNome);
        end

      end
      Localizacoes:descarregaCidades()
  end )

  coroutine.resume(APP)
end

if(not Localizacoes.foiCarregada)then
  Localizacoes:carregarLocalizacoes();
end









