--dofile("../utils/tcp.lua")
--dofile("../utils/Webs.lua")
BibliotecaAuxiliarScript.execute('utils.tcp');
BibliotecaAuxiliarScript.execute('utils.Webs');

address = {};

local function extract(str)
    --local address = {}
    address.uf = string.match(str,"<uf>(.*)</uf>")
    address.cidade = string.match(str,"<cidade>(.*)</cidade>")
    address.bairro = string.match(str,"<bairro>(.*)</bairro>")
    return address
end

function buscaCEP(cep, f)
  local result = {}
  local status = nil
  local APP = coroutine.create (
    function ()

        print('*** Localizando a partir de CEP: '.. cep)
        local url = 'cep.paicon.com.br/xml/'..cep
        local dados = webs_post(url,{})
        print(dados);
        
        result = extract(dados)
        
        if (address.uf ~= nil) then
          
          print("Endereço Encontrado!!");
          status = 1;
        else
          print("Endereço Não Encontrado!");
          status = -1;  
          
        end
        

--        if (dados ~= nil) then
--          print('Endereco encontrado!')
--          result = extract(dados)
--          status = 1 --encontrado
--        else
--          print('CEP nao encontrado!')
--          status = -1 --nao encontrado
--        end
        f(result,status)
    end
  )
  coroutine.resume(APP)
end

--local function main()
--  local cep = 50741100
--  local callback = function(table,status)
--    print(table.uf)
--    print(table.cidade)
--    print(table.bairro)
--    print(status)
--  end
--  buscaCEP(cep,callback)
  
  
--end

--main()






