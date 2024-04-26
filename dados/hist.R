setwd("/home/mrs/Documents/monografia/dados")
pacman::p_load(dplyr, psych, descr)
dados <- read.csv("/home/mrs/Documents/monografia/dados/dva_long.csv")
View(dados)
glimpse(dados)
options(scipen = 999)

#########  tratamento ######
dados <- dados %>% 
  mutate(Pessoal = Pessoal / Distribuição * 100,
         Governo = Governo / Distribuição * 100,
         RCT = RCT / Distribuição * 100,
         RCP = RCP / Distribuição * 100) %>%
  na.omit() %>%
  filter(Pessoal >= 0 & Pessoal <= 100,
         Governo >= 0 & Governo <= 100,
         RCT >= 0 & RCT <= 100,
         RCP >= 0 & RCP <= 100)

# Visualizando as primeiras linhas do dataframe após a remoção
descr(dados)

# Visualizando as primeiras linhas do dataframe com as alterações
glimpse(dados)
descr(dados$Pessoal)

hist(dados$Pessoal,
     xlab = "Pessoal (% da Distribuição do Valor Adicionado)",
     ylab = "Frequência",
     main = "")
write.csv(dados, "/home/mrs/Documents/monografia/dados/dva_relat.csv")
