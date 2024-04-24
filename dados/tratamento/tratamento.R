pacman::p_load(rpivotTable, dplyr)

df <- read.csv("/home/mrs/Documents/monografia/dados/dva_dados.csv", dec = ".")
glimpse(df)

View(df)

rows <- c("CD_CONTA", "DS_CONTA")
tabela_html <- rpivotTable(df, rows = rows, cols = "ANO")


