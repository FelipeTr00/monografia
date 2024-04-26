#Tabulação
setwd("/home/mrs/Documents/monografia/dados")
pacman::p_load(dplyr, tidyr, psych, rpivotTable, summarytools)
dados <- read.csv2("dva_wide_ipca.csv", sep = "," ,dec = ".")
View(dados)
glimpse(dados)

# Supondo que 'dados' seja o seu dataframe
descr <- descr(dados)
descr <- desc[,-1]
View(descr[,-1])

write.csv(descr, "describe.csv", sep = ",", dec = ".")

# Instalar e carregar o pacote summarytools
install.packages("summarytools")
library(summarytools)

# Supondo que 'dados' seja o seu dataframe
summary <- descr(dados)

# Escrever o resumo estatístico em um arquivo CSV
write.csv(summary, "describe.csv")


