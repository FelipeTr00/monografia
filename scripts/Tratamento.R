setwd("/home/morais/Desktop/DVA_ANALISE")
pacman::p_load(dplyr, tidyr, psych, rpivotTable)

dados_w <- read.csv2("dva_wide_ipca.csv", sep = "," ,dec = ".")
glimpse(dados)

describe(dados_w$Receitas)
