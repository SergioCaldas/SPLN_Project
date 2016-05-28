
# SPLN: Scripting no Processamento de Linguagem Natural

A segunda tarefa do projeto da disciplina tem como principal objetivo
a análise contrastiva dos diferentes tipos de linguagem recolhidos.

Segue-se uma descrição sucinta das atividades sugeridas. Convidam-se 
os alunos a adicionar outras tarefas que lhes pareçam úteis na análise
da língua.

**A data limite para a obtenção dos primeiros resultados é de 4 de Abril**.

**Nota 1**: Embora as comparações de frequência sejam sempre feitas em valores
percentuais (frequência por milhão ou logarítmica), as frequências absolutas
devem ser, **sempre** guardas. Só assim se poderão somar com frequências
absolutas de outras origens.


## Jornais Desportivos

Para os grupos I e XI pretende-se a análise contrastiva de dois jornais
desportivos, A Bola e Record.

Na primeira etapa pretende-se a deteção de entidades, nomeadamente de
jogadores e de clubes de futebol. Posteriormente, e tendo em conta a
co-ocorrência entre nomes de jogadores e clubes, associar os nomes dos
jogadores ao clube em que estão contratados.

Tendo como base a informação anterior, calculada de forma independente
para ambos os jornais, pretende-se perceber se algum dos jornais 
privilegia algum clube (contando menções diretas ao clube, ou indiretas,
através dos nomes dos jogadores).

## Jornais Generalistas

Para os grupos II, III, VII e XVI, pretende-se uma análise contrastiva
do léxico usado nos respetivos países (Portugal, Brasil, Moçambique e
Angola).

Esta análise passará por fazer deteção de entidades (locais e pessoas),
relacionando-as com os respetivos países. Para isso, o uso de recursos
como as _infoboxes_ da Wikipedia pode ser útil.

Segue-se uma análise de frequência (por milhão, e logarítmica), quer das entidades quer
do léxico usado, tentando evidenciar as principais diferenças entre o texto
destas quatro línguas.

## Imprensa Cor-de-Rosa

Para o grupo V, sugere-se a deteção de entidades e posterior anotação de género
(masculino ou feminino). De seguida, a realização de correferência poderá permitir
se dois nomes (_Rita Pereira_ e _Rita_) se referem à mesma pessoa (contando apenas
uma ocorrência) ou se referem a pessoas distintas.

Posteriormente, calcular o número de notícias que citam apenas homens, ou apenas mulheres, ou ambos.
Poderá ainda fazer-se um balanço, no sentido de obter um valor (positivo ou negativo) de 
referência a um dos géneros.

## Literatura e Textos Técnicos

Para que a proposta aqui feita seja possível, o grupo IV deverá trabalhar na modernização da
ortografia, usando para isso dicionários de modernização ortográfica, ou outras técnicas, 
como o uso de expressões regulares, e de um corretor ortográfico ou analisador morfológico
para a validação da existência das palavras modernizadas.

Pós esta etapa, pretende-se comparar, entre o grupo IV e XV o léxico usado, calculando
frequências por milhão, e logarítmicas, das palavras ocorrentes (e seus lemas). Isto
permitirá perceber se o conjunto das palavras usadas nos dois tipos de texto é bastante
semelhante, ou com diferenças significativas.

Também se pretende fazer uma comparação de quais os os tempos verbais, e pessoas/número
mais usados em cada um destes dois tipos de texto. Para isso será necessário calcular,
para cada verbo, os tempos verbais possíveis (usando um analisador morfológico) ou o 
tempo verbal real (usando um etiquetador morfossintático), a sua frequência por milhão
e logarítmica.

Espera-se, por exemplo, que as primeiras e segundas pessoas dos verbos apareçam mais
nos textos literários que nos textos técnicos.

## Texto Legislativo

Em relação ao grupo VIII, responsável pela recolha de texto legislativo, pretende-se 
começar por aumentar a quantidade de documentos recolhidos, nem que seja através dos
resumos dos _feed RSS_. Também será importante analisar a possibilidade de converter
PDF para texto.

Posteriormente, pretende-se a deteção de entidades (nomes de pessoas e instituições)
no sentido de tentar perceber se é possível agrupar documentos tendo em conta os seus
intervenientes.

Além disso, pretende-se a comparação do léxico usado neste área com o léxico usado
noutras áreas, como o texto jornalístico (usando para isso, por exemplo, as listas
de termos do CETEMPúblico, disponibilizadas pela Linguateca).

## Imprensa Tecnológica

Em relação ao grupo X, pretende-se, num início, a deteção de entidades, nomeadamente
de produtos e empresas. Tendo estas entidades detetadas, será então possível distinguir
termos estrangeiros (como _reboot_) de entidades estrangeiras (como _Microsoft_).
Assim, após a deteção de entidades, pretende-se comparar o restante léxico com o léxico
comum da língua (sugestão de uso do CETEMPúblico, disponibilizado pela Linguateca),
para a deteção de terminologia.




