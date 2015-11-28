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

function ListaCandidatos:getCandidatos()
  return self.candidatos;
end


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
