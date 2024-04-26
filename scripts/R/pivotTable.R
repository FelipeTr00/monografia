setwd("/home/morais/Desktop/DVA_ANALISE")
pacman::p_load(dplyr, tidyr, psych, rpivotTable)

dados <- read.csv2("dva_dados_aj.csv", sep = ";" ,dec = ".")
glimpse(dados)

#Aplicar Setores

setores <- read.csv2("setores.csv", sep = ";")
glimpse(setores)

dados <- merge(dados, setores, by = "SETOR_ATIV", all.x = TRUE)

glimpse(dados)
View(dados)

dados <- dados[,c(1,16,2,3,4,5,6,7,8,9,10,11,12,13,14,15)]
setor_ativ <- factor(dados$SETOR_ATIV)
setores_atividade <- levels(setor_ativ)
View(setores_atividade)

dados <- read.csv("dva_dados_aj2.csv", sep = ",", dec = ".")

pivot_table_ajustada2 <- rpivotTable(dados)
