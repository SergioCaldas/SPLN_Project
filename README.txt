#################################################
########### FICHEIRO README GRUPO 7 #############
#################################################

Este projeto é constituido por 3 partes (3 Pastas)

-------------------------------------------------
------------         Etapa 1        -------------
-------------------------------------------------

-Etapa1 - Esta pasta diz respeito à etapa 1 do projecto que se focava essencialmente na recolha 
de informação.
  
  Esta pasta é constituida por:
  - index.php 
  - aux.php
  - jb.xml
  *Os ficheiros php dizem respeito as scripts utilizadas pelo nosso grupo para a extração das noticias do 
  site www.jb.com.br.
  *O ficheiro jb.xml é o ficheiro que contem toda a informação por nós extraida do site.

-------------------------------------------------
------------         Etapa 2        -------------
-------------------------------------------------

-Etapa2 -Esta pasta corresponde a 2ª fase deste projeto que se focava essencialmente na anàlise 
do contúdo das nossas noticias, bem como o calculto das frequências e por fim uma comparação 
com os grupos 2, 3 e 16.
  
  Esta pasta é constituida por:

  - 6 pastas
    
    - DBs - contem os ficheiros com as listas de paises, nomes, cidades e palavras do léxico 
    português do Brasil.
      -paises.txt
      -nomes.txt
      -cidades.txt
      -cetenFolha_lista_palavras.txt
    
    -Scripts - contem todas as scripts por nos desenvolvidas para o tratamento, filtragem da 
    informação e comparação dos resultados.
      -reconize_paises.pl
      -reconize_nomes.pl
      -reconize_cidades.pl
      -reconize_cetenFolha.pl
      -comparison_paises_grupo2.pl
      -comparison_paises_grupo3.pl
      -comparison_paises_grupo16.pl
      -comparison_names_grupo2.pl
      -comparison_names_grupo3.pl
      -comparison_names_grupo16.pl
      -comparison_cidades_grupo2.pl
      -comparison_cidades_grupo3.pl
      -comparison_cidades_grupo16.pl

    -Tabelas - contem todas as nossas tabelas com as frequencias calculadas para paises, nomes
    cidades e lêxico, bem como um README.txt que explica o conteudo das tabelas
      -README.txt
      -tabela_paises_g7.txt  
      -tabela_nomes_g7.txt
      -tabela_cidades_g7.txt
      -analise_lexica_g7.txt

    -Grupo2 - contem todas as tabelas com as frequencias calculadas pelo grupo 2
      -tabela_localidades_g2.txt  
      -tabela_nomes_g2.txt
      -tabela_paises_g2.txt

    -Grupo3 - contem todas as tabelas com as frequencias calculadas pelo grupo 3
      -tabela_cidades.txt
      -tabela_nomes.txt
      -tabela_paises.txt

    -Grupo16 - contem todas as tabelas com as frequencias calculadas pelo grupo 16
      -tabela_cidades_brasileiras.txt  
      -tabela_nomes.txt
      -tabela_paises.txt
    
  Para alem de estas 6 pastas a pasta Etapa2 contem um ficheiro xml com a nossa informação
  extraida do site www.jb.com.br actualizada.
  -jb.xml

-------------------------------------------------
------------         Etapa 3        -------------
-------------------------------------------------

Etapa 3 - Por fim esta pasta corresponde a fase 3 e ultima deste projecto e é constituida por 8
pastas

  - Comparacoes - Contem as tabelas com as frequencias e contagem dos paises, cidades, nomes 
  e léxico comum em comum com os grupos 2, 3 e 16, bem como as mesmas tabelas so que ordenadas.
    - g2_CompNomes.txt
    - g2_CompNomes_ord.txt
    - g2_CompCidades.txt
    - g2_CompPaises.txt
    - g2_CompCidades_ord.txt
    - g2_CompPaises_ord.txt
    - g2_CompLexico.txt
    - g2_CompLexico_ord.txt
    - g3_CompLexico.txt
    - g3_CompLexico_ord.txt
    - g3_CompNomes.txt
    - g3_CompNomes_ord.txt
    - g3_CompCidades.txt
    - g3_CompPaises.txt
    - g3_CompCidades_ord.txt
    - g3_CompPaises_ord.txt
    - g16_CompCidades.txt
    - g16_CompPaises.txt
    - g16_CompCidades_ord.txt
    - g16_CompPaises_ord.txt
    - g16_CompLexico.txt
    - g16_CompLexico_ord.txt
    - g16_CompNomes.txt
    - g16_CompNomes_ord.txt

  - DB's - Pasta que contem a lista de cidades, paises, nomes e lexico.
    - cetenFolha_lista_lemas.txt     
    - cetenFolha_lista_palavras.txt  
    - cidades.txt                    
    - paises.txt
    - nomes.txt

  - Grupo02 - Pasta que contem as tabelas com as frequencias dos paises, cidades, nomes e lexico
  calculadas pelo grupo 2, bem como as nossas tabelas.
    - g2_tabela_lexico.txt
    - g2_tabela_paises.txt
    - g2_tabela_localidades.txt
    - g2_tabela_nomes.txt
    - g7_tabela_paises.txt
    - g7_tabela_localidades.txt
    - g7_tabela_nomes.txt

  - Grupo03 - Pasta que contem as tabelas com as frequencias dos paises, cidades, nomes e lexico
  calculadas pelo grupo 3.
    - tabela_cidades.txt  
    - tabela_lexico.txt   
    - tabela_nomes.txt    
    - tabela_paises.txt

  -Grupo16 - Pasta que contem as tabelas com as frequencias dos paises, cidades, nomes e lexico
  calculadas pelo grupo 16
    - tabela_cidades_angolanas_g16.txt     
    - tabela_lexico_corrigida_g16.txt
    - tabela_cidades_brasileiras_g16.txt   
    - tabela_lexico_g16.txt
    - tabela_cidades_mocambicanas_g16.txt  
    - tabela_nomes_g16.txt
    - tabela_cidades_portuguesas_g16.txt   
    - tabela_paises_g16.txt
    - tabela_entidades_g16.txt

  Scripts - Esta pasta contem todas as scripts utilizadas nesta fase do projeto.
    - cidades.pl                     
    - comparison_lexico_grupo3.pl    
    - comparison_paises_grupo3.pl
    - comparison_cidades_grupo16.pl  
    - comparison_names_grupo16.pl    
    - countWords.pl
    - comparison_cidades_grupo2.pl   
    - comparison_names_grupo2.pl     
    - names.pl
    - comparison_cidades_grupo3.pl   
    - comparison_names_grupo3.pl     
    - paises.pl
    - comparison_lexico_grupo16.pl   
    - comparison_paises_grupo16.pl   
    - reconize_cetenFolha.pl
    - comparison_lexico_grupo2.pl    
    - comparison_paises_grupo2.pl    
    - validate.pl

  Tabelas - Esta pasta contem as tabelas com as frequencias e contagens das cidades, paises,
  nomes e lexico por nos calculadas.
    - g7_lexico.txt          
    - tabela_cidades_g7.txt  
    - tabela_nomes_g7.txt    
    - tabela_paises_g7.txt
  
  -SPLN_WEBPAGE - Esta pasta contem um website desenvolvido por nós, onde se encontra toda a
  informação relativamente a este projeto. Desde a descrição das scripts como as tabelas com os
  resultados por nos calculados e comparados com os grupos 2, 3 e 16. Contem também as descrições
  e resultdos das scripts de avaliação do algoritmo. O website é prático e intuitivo para se
  navegar

