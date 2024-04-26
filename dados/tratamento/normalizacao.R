pacman::p_load(tidyverse, psych, dplyr)

dados <- read_csv("/home/mrs/Documents/monografia/dados/scatter1.csv", show_col_types = FALSE)
glimpse(dados)

# Selecionar todas as colunas, exceto as três primeiras e a coluna SETOR_ECON
dados_sem_categorias <- dados %>%
  select(-c(ANO, CNPJ_CIA, SETOR_ECON))

# Padronizar os dados
dados_normalizados <- dados_sem_categorias %>%
  mutate(across(where(is.numeric), scale))

# Combinar as colunas padronizadas com as três primeiras colunas
dados_normalizados <- cbind(dados[, 1:3], dados_normalizados)

# Verificar os primeiros registros dos dados normalizados
head(dados_normalizados)
summary(dados_normalizados)

#################################
#################################

# Encontrar o valor absoluto mínimo em cada coluna dos dados normalizados
min_values <- sapply(dados_normalizados[, -c(1:3)], min)

# Adicionar o valor absoluto mínimo de cada coluna aos valores normalizados
dados_normalizados_positivos <- dados_normalizados
dados_normalizados_positivos[, -c(1:3)] <- dados_normalizados[, -c(1:3)] + abs(min_values)

# Verificar os primeiros registros dos dados normalizados e positivos
head(dados_normalizados_positivos)

# Escrever os dados normalizados e positivos em um arquivo CSV em um caminho específico
#write.csv(dados_normalizados_positivos, "/home/mrs/Documents/monografia/dados/scatter1_norm.csv", row.names = FALSE)

#####################
#####################
# Selecionar as colunas desejadas
colunas_selecionadas <- dados[, c("ANO", "CNPJ_CIA", "SETOR_ECON", "Distribuição", "Pessoal", "Governo", "RCT", "RCP", "Outros")]

# Normalizar dividindo cada valor pelo valor correspondente na coluna Distribuição
dados_normalizados <- colunas_selecionadas %>%
  mutate(across(-c(ANO, CNPJ_CIA, SETOR_ECON, Distribuição), ~ . / Distribuição))

# Juntar as colunas ANO, CNPJ_CIA, SETOR_ECON novamente
dados_final <- cbind(dados[, c("ANO", "CNPJ_CIA", "SETOR_ECON")], dados_normalizados)

# Verificar os primeiros registros dos dados finalizados
head(dados_final)

write.csv(dados_final, "/home/mrs/Documents/monografia/dados/scatter1_relat.csv", row.names = FALSE)
