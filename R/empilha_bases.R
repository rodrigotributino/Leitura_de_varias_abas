# Carregando pacotes ------------------------------------------------------

library(tidyverse)

# Construindo a função ----------------------------------------------------

empilha_bases <- function(local_arquivo, quantidade_de_abas = 1, local_saida) {

  for(i in 1:quantidade_de_abas){

    if (i == 1){
      dados_empilhados <- readxl::read_xlsx(local_arquivo, sheet = i)
    } else {
      dados_empilhados <- rbind(dados_empilhados, readxl::read_xlsx(local_arquivo, sheet = i))
    }
  }

  write_csv2(
    dados_empilhados,
    paste0(local_saida,"/","dados_empilhados.csv"),
    na = "",
    col_names = TRUE
  )
}


# Testando a função -------------------------------------------------------

# No arquivo de exmplo temos 3 bases, uma em cada aba.
# Queremos empilhar essas bases, gerando a base final.

# para utilizar a função, precisamos passar 3 parâmetros:
# - o local do arquivo com várias abas
# - a quantidade de abas
# - o local de saída da base final

empilha_bases(
  local_arquivo = "./dados/arquivo_com_varias_abas.xlsx",
  quantidade_de_abas = 3,
  local_saida = "./dados/"
 )
