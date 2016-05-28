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

Etapa 3- Por fim esta pasta corresponde a fase 3 e ultima deste projecto e contem o relatorio
do projecto bem como as scripts de avaliação dos algoritmos.
