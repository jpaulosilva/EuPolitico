BibliotecaAuxiliarScript.execute('data.FiltroCandidato');
BibliotecaAuxiliarScript.execute('data.Candidato');
BibliotecaAuxiliarScript.execute('data.CarregarCandidatos');

ListaCandidatos = {}
ListaCandidatos.candidatos = {};

function ListaCandidatos:new(o)
  o = o or {}
  setmetatable (o, self)
  self.__index = self
  return o
end

--[[Função onde se obtém o resultado da busca]]
function ListaCandidatos:getCandidatos()
  return self.candidatos;
end

--[[Função que é chamada quando se aperta o botão verde na interface
para a busca de candidatos. Aqui se chama o método 'carregaCandidatosWeb' para consumo do Web Service]]
function ListaCandidatos:pesquisarCandidatos(filtroCandidato)

  self.candidatos = {};

  local callback_candidatosWeb = function (dados,status)
    if status == 1 then
      for indice, candidato in pairs(dados) do
        table.insert(self.candidatos,candidato);
      end
    else
      print("Lista vazia!")

    end
  end
  
  params = filtroCandidato:toParams();
  
  print("Entrou pesquisar Candidatos");
  
  
  carregaCandidatosWeb(callback_candidatosWeb,params);

end
