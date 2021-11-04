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
