--------------------------------------------
-- Entidade BibliotecaAuxiliarTexto
-- Biblioteca Auxiliar de Texto

--------------------------------------------

-------------
-- Imports
-------------

-----------------
--Log
-----------------
--BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarTexto: BibliotecaAuxiliarTexto.lua');



BibliotecaAuxiliarTexto =
  {

    ------------------------------------------------
    -- tokenize()
    --
    --Parametros:
    --
    --Retorno:
    ------------------------------------------------

    tokenize = function (texto, token)

      if (texto ~= nil) then

        local retorno = {};
        local indiceInicio = 1;

        local indiceToken = string.find (texto, token,indiceInicio);

        while (indiceToken ~= nil)
        do
          valor = string.sub(texto, indiceInicio , indiceToken-1)
          table.insert(retorno,valor);

          indiceInicio = indiceToken+1;
          indiceToken = string.find (texto, token,indiceInicio);
        end

        table.insert(retorno,string.sub (texto, indiceInicio));

        return retorno;

      end

    end,


    avaliar = function (texto)
      valor = string.gsub("$return "..texto.."$", "%$(.-)%$", function (s)
        return loadstring(s)()
      end)
      return valor
    end,
    ------------------------------------------------
    -- quebrarTexto()
    --
    --Parametros:
    --
    --Retorno:
    ------------------------------------------------
    quebrarTexto = function(tb_fonte,st_texto,nb_largura_lim,quantidadeLinhas)
      --BibliotecaAuxiliarLog.registrarLog('BibliotecaAuxiliarTexto: quebrarTexto('..st_texto..')');
      retorno = {};

      --tratando parametros.
      local tabela_fonte = tb_fonte;
      local texto = st_texto or '';
      local largura_lim = nb_largura_lim or 0;

      --local tabela_texto = BibliotecaAuxiliarTexto.tokenize(st_texto,' ');

      local tabela_texto = {};
      for campo in st_texto:split(' ') do
        table.insert(tabela_texto,campo);
      end

      local indice_retorno = 1;

      if(#tabela_texto > 1) then

        local largura_total_linha = 0;
        local largura_espaco = BibliotecaAuxiliarDesenho.getLarguraTexto(tabela_fonte,' ');

        for indice = 1, #tabela_texto do
          local palavra = tabela_texto[indice];
          local largura_palavra = BibliotecaAuxiliarDesenho.getLarguraTexto(tabela_fonte,palavra);
          --Se a largura da linha + a da palavra + 1 for maior que a limite, incrementar indice, largura total = largura da palavra, concatenar a palavra com a linha;
          
          --BibliotecaAuxiliarLog.registrarLog(palavra);
          if(palavra == '\\n') then
            indice_retorno = indice_retorno + 1;
            largura_total_linha = 0;
          elseif(largura_total_linha + largura_palavra > largura_lim)then
            indice_retorno = indice_retorno + 1;
            largura_total_linha = largura_palavra;
            retorno[indice_retorno] = palavra;
          --senao concatenar a linha e somar a largura total com a largura da palavra;
          else
            largura_total_linha = largura_total_linha + largura_palavra;

            if(retorno[indice_retorno] == nil) then
              retorno[indice_retorno] = palavra;
            else
              largura_total_linha = largura_total_linha + largura_espaco;
              retorno[indice_retorno] = retorno[indice_retorno]..' '..palavra;
            end

          end

          if(quantidadeLinhas ~= nil and indice_retorno > quantidadeLinhas)then
            break;
          end

        end

      else
        tabela_texto = BibliotecaAuxiliarTexto.tokenize(st_texto,'\n');

        --BibliotecaAuxiliarLog.registrarLog('TAMANHO: '..tostring(#tabela_texto));

        if(#tabela_texto == 0)then
          retorno[indice_retorno] = st_texto;
        else
          retorno = tabela_texto;
        end

        --BibliotecaAuxiliarLog.registrarLog('STRING: '..tostring(retorno[1]));
      end

      return retorno;

    end,

    produzirChar= function(quantidade,char)
      local text = "";
      if(char ~= nil)then
        for indice = 1, quantidade do
          text = text .. char;
        end
      end

      return text;
    end,

    completarChar= function(prefixo,sufixo,char,tabela_fonte, mask)
      local largura_mask = BibliotecaAuxiliarDesenho.getLarguraTexto(tabela_fonte,mask);
      local largura_char = BibliotecaAuxiliarDesenho.getLarguraTexto(tabela_fonte,char);
      local largura_prefixo = BibliotecaAuxiliarDesenho.getLarguraTexto(tabela_fonte,prefixo);
      local largura_sufixo = BibliotecaAuxiliarDesenho.getLarguraTexto(tabela_fonte,sufixo);

      local qtdChar = (largura_mask - (largura_prefixo + largura_sufixo))/largura_char;

      local text = prefixo..BibliotecaAuxiliarTexto.produzirChar(qtdChar,char)..sufixo;






      return text;
    end,

    justificar = function(texto,prefixoChar,sufixoChar,tabela_fonte, largura_mask)

      local text = nil;

      local largura_texto = BibliotecaAuxiliarDesenho.getLarguraTexto(tabela_fonte,texto);
      local largura_mask = BibliotecaAuxiliarDesenho.getLarguraTexto(tabela_fonte,texto);

      if(largura_texto > largura_mask)then
        text = string.sub(texto,1,largura_mask)
      else
        local qtdChar = largura_mask-largura_texto;


        local qtdCharPrefixo = 0;
        local qtdCharSufixo = 0;

        if((prefixoChar ~= nil and prefixoChar ~= '') and (sufixoChar ~= nil and sufixoChar ~= ''))then
          qtdCharPrefixo = math.floor(qtdChar/2);
          qtdCharSufixo = qtdChar - qtdCharPrefixo;
        elseif((prefixoChar == nil or prefixoChar == '') and (sufixoChar ~= nil and sufixoChar ~= ''))then
          qtdCharPrefixo = 0;
          qtdCharSufixo = qtdChar;
        elseif((prefixoChar ~= nil and prefixoChar ~= '') and (sufixoChar == nil or sufixoChar == ''))then
          qtdCharPrefixo = qtdChar;
          qtdCharSufixo = 0;
        end

        text = BibliotecaAuxiliarTexto.produzirChar(qtdCharPrefixo,prefixoChar)..texto..BibliotecaAuxiliarTexto.produzirChar(qtdCharSufixo,prefixoChar);

      end


      return text;
    end
  }
