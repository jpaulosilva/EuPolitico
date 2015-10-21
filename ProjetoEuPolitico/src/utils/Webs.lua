-- Desmonta EndereÃ§o, funÃ§Ã£o para extrair servidor, porta e script da string endereÃ§o
local function desmonta_endereco(str)
	local server, port, script
	local p1, p2
	p1 = string.find(str, '//', 1)
	if p1==nil then
		p1 = 1
	else
		p1 = p1 + 2
	end
	
	p2 = string.find(str, '/', p1+1)
	if p2==nil then
		p2 = #str
	else
		p2 = p2 - 1
	end
	
	server = string.sub(str, p1, p2)
	if p2 == #str then
		script = '/'
	else
		script = string.sub(str, p2+1, #str)
	end
	
	p1 = string.find(server, ':', 1)
		
	if p1 == nil then
		port = '80'
	else
		port = string.sub(server, p1+1, #server)
		server = string.sub(server, 1, p1-1)
	end
	
	return server, port, script 
end

-- Monta ParÃ¢metros, funÃ§Ã£o que transforma um table em string concatenando com &
function monta_parametros(tab)
	local str = ''
	
	if tab ~= nil then
		table.foreach (tab, function (k, v)
  			str = str..tostring(k)..'='..tostring(v)..'&'
			end
		)
		str = string.sub(str, 1, #str-1) -- retira Ãºltimo caractere &
	end

	return str
end

-- Webs POST, funÃ§Ã£o que retorna POST de um endereÃ§o
function webs_post(address, parameters)
 	local server, port, script, header
	
	server, port, script = desmonta_endereco(address)
	parameters = monta_parametros(parameters)
	header = "POST ".. script .." HTTP/1.1\r\n"..
			 "Host: ".. server .."\r\n"..
			 "User-Agent: HTTP/1.1\r\n"..
			 "Content-Type: application/x-www-form-urlencoded\r\n"..
			 "Content-Length: ".. #parameters .."\r\n"..
			 "Connection: close\r\n\r\n"..
			 parameters .."\r\n\r\n"
 --print("header" .. header)
	return webs_check(server,port,header)
end

-- Webs GET, funÃ§Ã£o que retorna GET de um endereÃ§o
function webs_get(address, parameters)
 	local server, port, script, header
	
	server, port, script = desmonta_endereco(address)
	parameters = monta_parametros(parameters)
	
	if parameters~='' then -- verifica se endereÃ§o jÃ¡ contÃ©m parÃ¢metros, incluindo mais corretamente
		if string.find(script, '?', 1) then
			script = script..'&'..parameters
		else
			script = script..'?'..parameters
		end
	end
	header = "GET ".. script .." HTTP/1.1\r\n"..
			 "Host: ".. server .."\r\n"..
			 "User-Agent: HTTP/1.1\r\n"..
			 "Content-Type: application/x-www-form-urlencoded\r\n"..
			 "Content-Length: ".. #parameters .."\r\n"..
			 "Connection: close\r\n\r\n"..
			 parameters .."\r\n\r\n"
	return webs_check(server,port,header)
end

-- Webs Check, funÃ§Ã£o que conecta a um servidor e retorna requisiÃ§Ã£o
function webs_check(server,port,header)
	local a
	tcp.connect (server, port)

	print ('*** ConexÃ£o para: '.. server..':'..port)
 
	a = tcp.send(header)
   
	if (a==0) then
		print('*** Erro, nÃ£o foi possÃ­vel conectar em '.. server..':'..port)
		return 0   
	else
		print ('*** RequisiÃ§Ã£o enviada.')
		
		retorno =  tcp.receive('*a')
		tcp.disconnect()
		return retorno   
	end
   
end


-- End: Webs.lua
