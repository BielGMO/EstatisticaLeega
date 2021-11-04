# Importando alturas
library(tidyverse)
library(dslabs)
data(heights)

# Criando variável
a <- ggplot(heights)
a

# Alturas do sexo masculino
index <- heights$sex == "Male"
x <- heights$height[index]

# Definindo média de desvio padrão
m <- mean(x)
s <- sd(x)
c(average = m, sd = s)

# Criando unidades padrão
z <- scale(x)

# Verificando proporção de homens com até 2 DP
mean(abs(z) < 2)

# Criando grafico QQ
## Criando vetor de proporções 
p <- seq(0.05, 0.95, 0.05)
## Obtendo quantis dos dados
sample_quantiles <- quantile(x, p)
## Obtendo quantis de amostra
theoretical_quantiles <- qnorm(p, mean = mean(x), sd = sd(x))
## Comparando ambos e desenho de linha
qplot(theoretical_quantiles, sample_quantiles) + geom_abline()
## Resumindo com unidades padrão
sample_quantiles <- quantile(z, p)
theoretical_quantiles <- qnorm(p)
qplot(theoretical_quantiles, sample_quantiles) + geom_abline()
## Usando o ggplot2 para grafícos QQ
heights %>% filter(sex == "Male") %>%
  ggplot(aes(sample = scale(height))) +
  geom_qq() +
  geom_abline()

## Analisando alturas inferiores-feminino
heights %>% filter(sex == "Female") %>%
  top_n(5, desc(height)) %>%
  pull(height)

# Gráfico de barras
ggplot(murders, aes(region)) + geom_bar()

# Gráfico de barras com proporção
data(murders)
tab <- murders %>%
  count(region) %>%
  mutate(proportion = n/sum(n))
tab
tab %>% ggplot(aes(region, proportion)) + geom_bar(stat = "identity")

## Histograma
heights %>%
  filter(sex == "Female") %>%
  ggplot(aes(height)) +
  geom_histogram(binwidth = 1, fill = "blue", col = "black") +
  xlab("Altura feminina em polegadas") +
  ggtitle("Histograma")

## Gráfico de densidade
heights %>%
  filter(sex == "Female") %>%
  ggplot(aes(height)) +
  geom_density(fill="blue", adjust = 2)

## Gráfico QQ - marculino
heights %>% filter(sex=="Male") %>%
  ggplot(aes(sample = height)) +
  geom_qq()

## Gráfico QQ 2
params <- heights %>% filter(sex=="Male") %>%
  summarize(mean = mean(height), sd = sd(height))

heights %>% filter(sex=="Male") %>%
  ggplot(aes(sample = height)) +
  geom_qq(dparams = params) +
  geom_abline()

## Gráfico QQ 3
heights %>%
  filter(sex=="Male") %>%
  ggplot(aes(sample = scale(height))) +
  geom_qq() +
  geom_abline()

## Criando dataframe umagem
x <- expand.grid(x = 1:12, y = 1:10) %>%
  mutate(z = 1:120)
## Plotando imagem
x %>% ggplot(aes(x, y, fill = z)) +
  geom_raster()
## Alterando gradiente de cores
x %>% ggplot(aes(x, y, fill = z)) +
  geom_raster() +
  scale_fill_gradientn(colors = terrain.colors(10))

## Pegando alturas femininas
x <- heights %>%
  filter(sex=="Female") %>%
  pull(height)

## qplot - histograma
qplot(x)
