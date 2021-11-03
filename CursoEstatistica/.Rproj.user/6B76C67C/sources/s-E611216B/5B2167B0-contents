# Imports necessários
install.packages(c("tidyverse", "dslabs"))
library(dplyr)
library(ggplot2)
library(dslabs)

# Criando base de dados
data(murders)
murders
p <- ggplot(murders)
p

# Criando 1ª visualização - Dispersão
p + 
  geom_point(aes(population/10^6, total))

# Criando rótulos
p + geom_point(aes(population/10^6, total)) +
  geom_text(aes(population/10^6, total, label = abb))

# Aumentando pontos
p + 
  geom_point(aes(population/10^6, total), size = 3) +
  geom_text(aes(population/10^6, total, label = abb))

# Movendo rótulos para a direita
p + 
  geom_point(aes(population/10^6, total), size = 3) +
  geom_text(aes(population/10^6, total, label = abb), nudge_x = 1.5)

# Redefinindo variavel p para aes() global
p <- ggplot(murders, aes(population/10^6, total, label = abb))

# Refazendo código de maneira mais simplificada
p +
  geom_point(size = 3) +
  geom_text(nudge_x = 1.5)

# Testando mapeamento local no lugar de global
p + 
  geom_point(size = 3) +
  geom_text(aes(x = 10, y = 800, label = "Olá!"))

# Alterando as escalas para logarítmica
p + 
  geom_point(size = 3) +
  geom_text(nudge_x = 1.5) +
  scale_x_continuous(trans = "log10") +
  scale_y_continuous(trans = "log10")

# Fazendo correção de posição (nudge) e função de escala
p + geom_point(size = 3) +
  geom_text(nudge_x = 0.05) +
  scale_x_log10() +
  scale_y_log10()

# Alterando rótulos e adicionando título
p + geom_point(size = 3) +
  geom_text(nudge_x = 0.05) +
  scale_x_log10() +
  scale_y_log10() +
  xlab("População em milhões (escala logarítmica)") +
  ylab("Total de assassinatos (escala logarítmica)") +
  ggtitle("Assassinatos por armas nos EUA em 2010")

# Calculando a taxa de homícidios por milhão no país
r <- murders %>%
  summarize(rate = sum(total)/ sum(population) * 10^6) %>%
  pull(rate)

# Redefinindo p
p <- murders %>% ggplot(aes(population/10^6, total, label = abb)) +
  geom_text(nudge_x = 0.05) +
  scale_x_log10() +
  scale_y_log10() +
  xlab("População em milhões (escala logarítmica)") +
  ylab("Total de assassinatos (escala logarítmica)") +
  ggtitle("Assassinatos por armas nos EUA em 2010")

# Adicionando linha de média no gráfico
p + 
  geom_point(size = 3) +
  geom_abline(intercept = log10(r))

# Alterando ordem de camada da linha e cores
p <- p + geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  geom_point(size = 3)

# Alterando tema do gráfico
install.packages("ggthemes")
library(ggthemes)
p + theme_economist()

# Usando o ggrepel
install.packages("ggrepel")
library(ggrepel)

# Criando dois vetores com valores
data(murders)
x <- log10(murders$population)
y <- murders$total

# Criando gráfico de dispersão método padrão
data.frame(x = x, y = y) %>%
  ggplot(aes(x, y)) +
  geom_point()

# Mesmo gráfico anterior com qplot
qplot(x, y)

# Grade de gráficos
install.packages("gridExtra")
library(gridExtra)
p1 <- qplot(x)
p2 <- qplot(x,y)
grid.arrange(p1, p2, ncol = 2)
