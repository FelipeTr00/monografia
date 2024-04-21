setwd("~/Desktop/DVA_ANALISE/ANALISE1")
pacman::p_load(ggplot2, dplyr, caret, summarytools)

df <- read.csv("dva_wide.csv")
id_ano <- df[1:2]
df_norm <- as.data.frame(scale(df[3:12]))
df_norm <- cbind(id_ano, df_norm)
glimpse(df_norm)
summary(df_norm)
descr(df_norm)


df_long <- tidyr::pivot_longer(df_norm, cols = -c(ID, ANO))

# Plotar o boxplot
# Plotar o boxplot com fonte aumentada no eixo Y
ggplot(df_long, aes(x = name, y = value)) +
  theme_test() +
  geom_boxplot(fill = "gray", color = "black") +
  labs(x = "Variáveis", y = "Valores normalizados") +
  #scale_y_continuous(breaks = seq(3, 6, by = 1))+
  theme(axis.text.x = element_text(size = 12, colour = 'black')) 


# Normalize Data with Min-Max Scaling in R
process <- preProcess(as.data.frame(df), method=c("range"))
norm_scale <- predict(process, as.data.frame(df))

df_long2 <- tidyr::pivot_longer(norm_scale, cols = -c(ID, ANO))

# Plotar o boxplot
# Plotar o boxplot com fonte aumentada no eixo Y
ggplot(df_long2, aes(x = name, y = value)) +
  theme_test() +
  geom_boxplot(fill = "gray", color = "black") +
  labs(x = "Variáveis", y = "Valores normalizados") +
  #scale_y_continuous(breaks = seq(3, 6, by = 1))+
  theme(axis.text.x = element_text(size = 12, colour = 'black')) 


log_norm_scale = log(as.data.frame(norm_scale[3:12]))


df_long3 <- tidyr::pivot_longer(log_norm_scale, cols = 1:10)
ggplot(df_long3, aes(x = name, y = value)) +
  theme_test() +
  geom_boxplot(fill = "gray", color = "black") +
  labs(x = "Variáveis", y = "Valores normalizados") +
  #scale_y_continuous(breaks = seq(3, 6, by = 1))+
  theme(axis.text.x = element_text(size = 12, colour = 'black')) 

# Processar os dados normalizados

process <- preProcess(as.data.frame(df_norm), method=c("range"))
norm_scale2 <- predict(process, as.data.frame(df_norm))

df_long4 <- tidyr::pivot_longer(norm_scale2, cols = 1:10)
ggplot(df_long3, aes(x = name, y = value)) +
  theme_test() +
  geom_boxplot(fill = "gray", color = "black") +
  labs(x = "Variáveis", y = "Valores normalizados") +
  #scale_y_continuous(breaks = seq(3, 6, by = 1))+
  theme(axis.text.x = element_text(size = 12, colour = 'black')) 


# Log e processados
process <- preProcess(as.data.frame(df), method=c("range"))
norm_scale <- predict(process, as.data.frame(df))
log_norm <- log(as.data.frame(norm_scale[3:12]))


df_long5 <- tidyr::pivot_longer(log_norm, cols = 1:10)

# Plotar o boxplot
# Plotar o boxplot com fonte aumentada no eixo Y
ggplot(df_long5, aes(x = name, y = value)) +
  theme_test() +
  geom_boxplot(fill = "gray", color = "black") +
  labs(x = "Variáveis", y = "Valores normalizados") +
  #scale_y_continuous(breaks = seq(3, 6, by = 1))+
  theme(axis.text.x = element_text(size = 12, colour = 'black')) 

log_df <- log(as.data.frame(df[3:12]))
descr(log_df)
glimpse(log_df)

names(log_df)

df_long6 <- tidyr::pivot_longer(log_df, cols = c(4,2,6,7,3))
ggplot(df_long6, aes(x = name, y = value)) +
  theme_test() +
  geom_boxplot(fill = "gray", color = "black") +
  labs(x = "Variáveis", y = "Valores normalizados") +
  #scale_y_continuous(breaks = seq(3, 6, by = 1))+
  theme(axis.text.x = element_text(size = 12, colour = 'black')) 


library(tidyr)
library(ggplot2)

# Define a ordem desejada das variáveis
ordem_desejada <- c(4, 2, 6, 7, 3)

# Converta a variável "name" para um fator com os níveis na ordem desejada
df_long6$name <- factor(df_long6$name, levels = colnames(log_df)[ordem_desejada])

# Plot com as variáveis ordenadas
ggplot(df_long6, aes(x = name, y = value)) +
  theme_test() +
  geom_boxplot(fill = "gray", color = "black",outlier.shape = NA) +
  labs(x = "", y = "Valores normalizados") +
  scale_y_continuous(breaks = seq(0, 18, by = 2))+
  theme(axis.text.x = element_text(size = 12, colour = 'black')) 


