-- Imports
BibliotecaAuxiliarScript.execute('framework.src.util.gui.Cor');
BibliotecaAuxiliarScript.execute('framework.src.gui.TFrame');
BibliotecaAuxiliarScript.execute('framework.src.gui.TLabel');
BibliotecaAuxiliarScript.execute('framework.src.gui.TText');


FrameQuemSomos = TFrame.new();
FrameQuemSomos.id = 'FrameQuemSomos';

function FrameQuemSomos:inicialize()
  -- Alterar propriedades do FrameQuemSomos
  FrameQuemSomos:setLargura(1280); --320
  FrameQuemSomos:setAltura(720);
  FrameQuemSomos:setPx(0);
  FrameQuemSomos:setPy(0);
  FrameQuemSomos:setCorFundo(CenaPrincipal.cor);

  local font_label = Fonte.new({nome='tiresias', tamanho=20, is_negrito = true,cor = Cor.new({r=255,g=255,b=255})});
  local font_data = Fonte.new({nome='tiresias', tamanho=20,is_negrito = false,cor = Cor.new({r=255,g=255,b=255})});

  local panelBackground= TPanel.new();
  panelBackground:setLargura(1270);
  panelBackground:setAltura(645);
  panelBackground:setPx(5);
  panelBackground:setPy(5);
  panelBackground:setCorFundo(Cor.new({r=0,g=255,b=0,alpha=120}));
  
  
  local imageSobre = TImage.new();
  imageSobre:setSrcArquivoExterno("../media/logo_educacao_inteligente.png")
  imageSobre:setPx(560);
  imageSobre:setPy(10);
  
  panelBackground:addComponent(imageSobre,1)
  
  local textoSobre = TText.new();
  textoSobre:setTexto("    O Educação Inteligente tem como objetivo exibir informações de todas as escolas do Brasil. Pode-se analisar: notas do ENEM, índices do IDEB, infraestrutura, estatísticas por região de uma categoria, comparações de dados entre escolas, entre outros."..
                      "Usando as regras de Dados Abertos, traz-se à sociedade uma ferramenta de análise e avaliação para a rede de ensino do país podendo, assim, ser discutida com autoridades para fins de melhorias nas instituições de ensino."..
                      "Os dados são atualizados automaticamente, originados do INEP - Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira e processados para uma apresentação de fácil acesso e entendimento."..
                      "A aplicação de TV Digital Interativa conectada foi feita conforme especificações do Ginga-NCL com canal de retorno (Internet) visando atender qualquer telespectador que deseja analisar informações das escolas da rede de ensino do país. \\n \\n "..
                      "    Responsável: Douglas Véras (dvs@cin.ufpe.br), professor do Departamento de Informática e Estatística da Universidade Federal Rural de Pernambuco (UFRPE) e Doutorando em Ciência da Computação pela Universidade Federal de Pernambuco (UFPE). \\n \\n "..
                      "    Equipe de Desenvolvimento: Douglas Véras, Thiago Prota (tmp@cin.ufpe.br) e João Paulo da Silva (aluno de bacharelado em Ciência da Computação pela UFRPE). \\n \\n "..
                      "    Esta aplicação possui uma versão Web, que pode ser acessada em: http://educacao.dadosabertosbr.com/ (responsável: Kellyton Brito - http://kellyton.com.br/)");
  textoSobre:setFonte(CenaBusca.font_data);
  textoSobre:setLargura(1250);
  textoSobre:setPx(10);
  textoSobre:setPy(180);
  textoSobre:update();
  
--  local responsavelTitulo = TText.new();
--  responsavelTitulo:setTexto("    Responsável:");
--  responsavelTitulo:setFonte(CenaDetalharEscola.font_data);
--  responsavelTitulo:setLargura(1250);
--  responsavelTitulo:setPx(10);
--  responsavelTitulo:setPy(180);
--  responsavelTitulo:update();
--  
--  local responsavelTexto = TText.new();
--  responsavelTitulo:setTexto("Douglas Véras (dvs@cin.ufpe.br), professor do Departamento de Informática e Estatística da Universidade Federal Rural de Pernambuco (UFRPE) e Doutorando em Ciência da Computação pela Universidade Federal de Pernambuco (UFPE).");
--  responsavelTitulo:setFonte(CenaDetalharEscola.font_data);
--  responsavelTitulo:setLargura(1250);
--  responsavelTitulo:setPx(10);
--  responsavelTitulo:setPy(180);
--  responsavelTitulo:update();
--  
--  local equipe = TText.new();
--  equipe:setTexto("    O Educação Inteligente tem como objetivo exibir informações de todas as escolas do Brasil. Pode-se analisar: notas do ENEM, índices do IDEB, infraestrutura, estatísticas por região de uma categoria, comparações de dados entre escolas, entre outros."..
--                      "Usando as regras de Dados Abertos, traz-se à sociedade uma ferramenta de análise e avaliação para a rede de ensino do país podendo, assim, ser discutida com autoridades para fins de melhorias nas instituições de ensino."..
--                      "Os dados são atualizados automaticamente, originados do INEP - Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira e processados para uma apresentação de fácil acesso e entendimento."..
--                      "A aplicação de TV Digital Interativa conectada foi feita conforme especificações do Ginga-NCL com canal de retorno (Internet) visando atender qualquer telespectador que deseja analisar informações das escolas da rede de ensino do país. \\n \\n "..
--                      "    Responsável: Douglas Véras (dvs@cin.ufpe.br), professor do Departamento de Informática e Estatística da Universidade Federal Rural de Pernambuco (UFRPE) e Doutorando em Ciência da Computação pela Universidade Federal de Pernambuco (UFPE). \\n \\n "..
--                      "    Equipe de Desenvolvimento: Douglas Véras, Thiago Prota (tmp@cin.ufpe.br) e João Paulo da Silva (aluno de bacharelado em Ciência da Computação pela UFRPE). \\n \\n "..
--                      "    Esta aplicação possui uma versão Web, que pode ser acessada em: http://educacao.dadosabertosbr.com/ (responsável: Kellyton Brito - http://kellyton.com.br/)");
--  equipe:setFonte(CenaDetalharEscola.font_data);
--  equipe:setLargura(1250);
--  equipe:setPx(10);
--  equipe:setPy(180);
--  equipe:update();
--  
--  local versaoWeb = TText.new();
--  versaoWeb:setTexto("    O Educação Inteligente tem como objetivo exibir informações de todas as escolas do Brasil. Pode-se analisar: notas do ENEM, índices do IDEB, infraestrutura, estatísticas por região de uma categoria, comparações de dados entre escolas, entre outros."..
--                      "Usando as regras de Dados Abertos, traz-se à sociedade uma ferramenta de análise e avaliação para a rede de ensino do país podendo, assim, ser discutida com autoridades para fins de melhorias nas instituições de ensino."..
--                      "Os dados são atualizados automaticamente, originados do INEP - Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira e processados para uma apresentação de fácil acesso e entendimento."..
--                      "A aplicação de TV Digital Interativa conectada foi feita conforme especificações do Ginga-NCL com canal de retorno (Internet) visando atender qualquer telespectador que deseja analisar informações das escolas da rede de ensino do país. \\n \\n "..
--                      "    Responsável: Douglas Véras (dvs@cin.ufpe.br), professor do Departamento de Informática e Estatística da Universidade Federal Rural de Pernambuco (UFRPE) e Doutorando em Ciência da Computação pela Universidade Federal de Pernambuco (UFPE). \\n \\n "..
--                      "    Equipe de Desenvolvimento: Douglas Véras, Thiago Prota (tmp@cin.ufpe.br) e João Paulo da Silva (aluno de bacharelado em Ciência da Computação pela UFRPE). \\n \\n "..
--                      "    Esta aplicação possui uma versão Web, que pode ser acessada em: http://educacao.dadosabertosbr.com/ (responsável: Kellyton Brito - http://kellyton.com.br/)");
--  versaoWeb:setFonte(CenaDetalharEscola.font_data);
--  versaoWeb:setLargura(1250);
--  versaoWeb:setPx(10);
--  versaoWeb:setPy(180);
--  versaoWeb:update();
--   
  panelBackground:addComponent(textoSobre,2);
--  panelBackground:addComponent(responsavelTitulo,3);
--  panelBackground:addComponent(equipe,4);
--  panelBackground:addComponent(versaoWeb,5);




  FrameQuemSomos:addComponent(buildBackground(),1);
  FrameQuemSomos:addComponent(panelBackground,2);
  FrameQuemSomos:addComponent(buildPainelLegendas(nil,nil,nil,"MENU",nil,nil,nil),3);
end
