setwd("/home/mrs/Documents/monografia/dados")
pacman::p_load(dplyr, psych, ggplot2, tidyr)
dados <- read.csv("/home/mrs/Documents/monografia/dados/dva_dados.csv")
glimpse(dados)
options(scipen=999)


# RECEITAS
receitas <- dados %>%  filter(DS_CONTA == "Receitas")

# Agregar os dados por ANO e DS_CONTA
receita_agregada <- receitas %>%
  group_by(ANO, DS_CONTA) %>%
  summarise(VL_CONTA = sum(VL_CONTA)/1000000,
            VL_IGPM = sum(VL_IGPM)/1000000,
            VL_IGPDI = sum(VL_IGPDI)/1000000,
            VL_IPCA = sum(VL_IPCA)/1000000,
            VL_INPC = sum(VL_MEDIO)/1000000)


# PESSOAL
pessoal <- dados %>%  filter(DS_CONTA == "Receitas")

# Agregar os dados por ANO e DS_CONTA
pessoal_agregado <- pessoal %>%
  group_by(ANO, DS_CONTA) %>%
  summarise(VL_CONTA = sum(VL_CONTA)/10000,
            VL_IGPM = sum(VL_IGPM)/10000,
            VL_IGPDI = sum(VL_IGPDI)/10000,
            VL_IPCA = sum(VL_IPCA)/10000,
            VL_INPC = sum(VL_MEDIO)/10000)


# GRÁFICO RECEITAS
# Encontre o valor máximo entre as três colunas
max_y <- max(max(receita_agregada$VL_CONTA), max(receita_agregada$VL_IGPM), max(receita_agregada$VL_IPCA))

# Crie o gráfico vazio usando plot() com o primeiro conjunto de dados
plot(receita_agregada$ANO,
     receita_agregada$VL_CONTA,
     type = "n",  # Defina type = "n" para criar um gráfico vazio
     xlab = "Ano", ylab = "Valor",
     #main = "Receita Agregada ao longo do Tempo",
     ylim = c(0, max_y)  # Definir limite do eixo y
)

# Adicione as linhas com diferentes símbolos
lines(receita_agregada$ANO, receita_agregada$VL_CONTA,
      type = "l", col = "black", lwd = 3)                 # NA
lines(receita_agregada$ANO, receita_agregada$VL_IGPM,
      type = "b", col = "black", pch = 2, lwd = 2)        # TRIANGULO
lines(receita_agregada$ANO, receita_agregada$VL_INPC,
      type = "b", col = "black", pch = 4, lwd = 2)        # QUADRADO
lines(receita_agregada$ANO, receita_agregada$VL_IPCA,
      type = "b", col = "black", pch = 0, lwd = 2)        # XIS

# Adicione uma legenda
legend("bottomright", 
       legend = c("Valor Nominal", "IGPM", "INPC", "IPCA"), 
       col = c("black", "black", "black", "black"), 
       pch = c(NA, 2, 0,4),  # Símbolos correspondentes
       lty = 1,
       lwd = 2)

# GRÁFICO PESSOAL
# Encontre o valor máximo entre as três colunas
max_y <- max(max(pessoal_agregado$VL_CONTA), max(pessoal_agregado$VL_IGPM), max(pessoal_agregado$VL_IPCA))

# Crie o gráfico vazio usando plot() com o primeiro conjunto de dados
plot(pessoal_agregado$ANO,
     pessoal_agregado$VL_CONTA,
     type = "n",  # Defina type = "n" para criar um gráfico vazio
     xlab = "Ano", ylab = "Valor",
     #main = "Salarios ao longo do Tempo",
     ylim = c(0, max_y)  # Definir limite do eixo y
)

# Adicione as linhas com diferentes símbolos
lines(pessoal_agregado$ANO, pessoal_agregado$VL_CONTA,
      type = "l", col = "black", lwd = 3)                 # NA
lines(pessoal_agregado$ANO, pessoal_agregado$VL_IGPM,
      type = "b", col = "black", pch = 2, lwd = 2)        # TRIANGULO
lines(pessoal_agregado$ANO, pessoal_agregado$VL_INPC,
      type = "b", col = "black", pch = 4, lwd = 2)        # QUADRADO
lines(pessoal_agregado$ANO, pessoal_agregado$VL_IPCA,
      type = "b", col = "black", pch = 0, lwd = 2)        # XIS

# Adicione uma legenda
legend("bottomright", 
       legend = c("Valor Nominal", "IGPM", "INPC", "IPCA"), 
       col = c("black", "black", "black", "black"), 
       pch = c(NA, 2, 0,4),  # Símbolos correspondentes
       lty = 1,
       lwd = 2)
