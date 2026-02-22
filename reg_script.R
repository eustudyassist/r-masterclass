# Load Packages
library(tidyverse)
library(readxl)
library(broom)

# Linear regression
math_score <- read_excel(
  path = "data/student-performance/student-math.xlsx"
)

choice_score <- math_score |> 
  select(
    school, sex, age, internet, g1:g3
  )
  
choice_score <- choice_score |> 
  mutate(
    total_score = g1 + g2 + g3,
    percent_score = total_score/60 * 100,
    internet = ifelse(internet == "no", FALSE, TRUE),
    across(where(is.character), factor)
  )

choice_score

# Ordinary Least Squares (OLS)
## Dependent variable = percent_score
## Independent variable = age
math_score_model_1 <-  lm(
  percent_score ~ age, 
  data = choice_score
)

summary(math_score_model_1)

# Multiple Linear Regression (MLR)
math_score_model_2 <-  lm(
  percent_score ~ age + sex, 
  data = choice_score
)

summary(math_score_model_2)

math_score_model_3 <-  lm(
  percent_score ~ age + sex - 1, 
  data = choice_score
)
summary(math_score_model_3)


new_data <- choice_score |> 
  slice_sample(n = 40) |> 
  select(sex, age)

new_data |> 
  mutate(
    precent_score = predict(math_score_model_3, newdata = new_data)
  )

# Quarto
# Markdown
# Dynamic data enabled reproducible documents
# Shiny?


## Table packages for quarto
knitr
gt
gtextras
fmrtable
reactable
DT