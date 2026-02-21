
# Basics ------------------------------------------------------------------

1 + 2
3 - 4

"Pascal"
3 * 5
3 / 2

3 ** 2
3 ^ 2

# Order of Operations -----------------------------------------------------
# PEMDAS
# BODMAS

3 - 2 + 4 * 4
(3 - 2 + 4) * 4


# Variable ----------------------------------------------------------------
my_name = "Olamide"
my_name <- "Olamide"

p1 <- "Pascal"
p2 <- "Rejoice"
p3 <- "Bashir"

print(my_name)
p3


# Data Types --------------------------------------------------------------

## typeof
## class

# Characters / Strings
comma <-  ","
my_num <- '345'

combination_chr <- "345hgsdf"

## Short exercise

num_1 <- 234 # numeric 
num_2 <- "234" # character

# Numeric
## Floats / Double
typeof(num_1)
typeof(345.5)
typeof(345)
class(345)

## Integers
typeof(345L)
class(345L)

# Booleans
# Yes
# No
## I don't know

TRUE # Yes
FALSE # No
NA # I don't know

TRUE + TRUE
FALSE + TRUE

# Function ----------------------------------------------------------------
my_rand <- rnorm(n = 100, mean = 5, sd = 0.5)
my_unif <-runif(n = 100, min = 5, max = 30)

min(my_rand)
max(my_rand)
mean(my_rand)
median(my_rand)
mode(my_rand)

sd(my_unif)
var(my_unif)

my_rand_2 <- round(my_rand)

table(my_rand_2)

# Packages
install.packages("fivethirtyeight")
install.packages("moderndive")
install.packages("tidyverse")

# Basic plots
plot(
  my_rand, 
  my_unif,
  xlab = "My Random Numbers",
  ylab = "My Uniform Numbers",
  main = "My numbers according to distribution"
)

plot(
  my_rand_2, 
  type = 'h'
)

plot(
  mpg$manufacturer,
  type = "b",
  col = "dodgerblue"
)

# Grammar of graphics

# Using ggplot2
library(tidyverse)
library(moderndive)
library(fivethirtyeight)


fivethirtyeight::airline_safety
ggplot(
  data = mpg, 
  mapping = aes(x = manufacturer)
) +
  geom_bar(fill = "dodgerblue") +
  labs(
    x = "Manufacturer",
    y = "Frequency",
    title = "The Frequency of Vehicles",
    subtitle = "Cars involved in the study",
    caption = "Chart by: Olamide Adu"
  ) +
  theme_minimal()

ggplot(
  data = mpg, 
  mapping = aes(x = manufacturer)
)