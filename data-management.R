library(tidyverse)
library(readxl)

# Importing data
## Flat files

## FLAT FILES 
# - csv ","
# - psv "|"
# - csv2 ";"
# - tsv "    "
# - fwf "  "

adult_data <- read_csv(
  file = "data/adult/adult.csv",
  col_names = FALSE
) |>  # %>% is the pipe |>
  set_names(c(
    "age", "workclass", "fnlwgt", "education",
    "education_num", "marital_status", "occupation",
    "relationship", "race", "sex", "capital_gain",
    "capital_loss", "hours_per_week",
    "native-country", "salary_class"
  ))

read_csv("https://raw.githubusercontent.com/eustudyassist/r-masterclass/refs/heads/main/data/adult/adult.csv")


adult_test <- read_csv(
  "data/adult/adult-test-data.csv",skip = 1
  ) |> 
  set_names(c(
    "age", "workclass", "fnlwgt", "education",
    "education_num", "marital_status", "occupation",
    "relationship", "race", "sex", "capital_gain",
    "capital_loss", "hours_per_week",
    "native-country", "salary_class"
  ))

## Spreadsheets
### Open Document Sheet .ods

### Microsoft Excel .xlsx
math_score <- read_excel(
  path = "data/student-performance/student-math.xlsx"
)

read_excel(
  path = "data/student-performance/student-math.xlsx",
  sheet = "new_sheet"
)

read_excel(
  path = "data/student-performance/student-math.xlsx",
  sheet = 2
)

### Google Sheets
library(googlesheets4)
gs4_auth("eustudyassist@gmail.com")

airline_safety <- read_sheet(
  ss = "1eOk8vOgrrDCEqRa1WWCaUQQIgEuNXs9qAcIwVwo0Nxs",
  skip = 7
)

view(airline_safety)

# Data manipulation

names(adult_data)

## Subset by Column
adult_data |> 
  select(1, 2)

adult_data |> 
  select(sex, capital_gain, `native-country`)

adult_data |> 
  select(4:10)

adult_data |> 
  select(contains("tion"))

## Subset by rows/observations/values
adult_data |> 
  select(age, education) |> 
  filter(education == "Bachelors")

adult_data |> 
  select(age, education) |> 
  filter(age < 40)

adult_data |> 
  select(age, education) |> 
  filter(age <= 40 & education == "Bachelors") |> 
  print(n = 100)

grades <- math_score |> 
  select(sex, school, g1:g3)

grades |> 
  mutate(
    total_grade = g1 + g2 + g3,
    percentage_score = total_grade/60 * 100,
    sex = factor(sex),
    school = factor(school)
  ) 

grades_school <- grades |> 
  mutate(
    total_grade = g1 + g2 + g3,
    percentage_score = total_grade/60 * 100,
    across(where(is.character), factor)
  ) 

math_score |> 
  mutate(
    across(where(is.character), factor)
  ) |> 
  str()

grades_school |> 
  group_by(sex) |> 
  summarize(
    average_score = mean(percentage_score)
  )

grades_by_gender <- grades_school |> 
  group_by(sex, school) |> 
  summarize(
    average_score = mean(percentage_score)
  )

# Reshaping data
grades_by_gender |> 
  pivot_wider(
    names_from = school,
    values_from = average_score
  )

airline_safety |>
  select(airline, contains("incident")) |> 
  pivot_longer(
      cols = incidents_85_99:incidents_00_14,
      names_to = "year",
      values_to = "incidents"
  ) |> 
  mutate(
    year = str_remove_all(year, "incidents_"),
    year = str_replace_all(year, "_", "-")
  )

# Multivariate plots
# default control
grades_school |> 
  ggplot(
    mapping = aes(x = percentage_score, fill = sex)
  ) +
  geom_histogram()

grades_school |> 
  summarize(
    .by = c(sex, school),
    gender_count = n()
  )

grades_school |> 
  ggplot(
    mapping = aes(
      x = sex, 
      y = percentage_score, 
      fill = school
    )
  ) +
  geom_boxplot(
    col = "black"
  ) +
  scale_fill_discrete(palette = "set2")

# faceting
library(scales)

grades_school |>
  mutate(
    sex = factor(sex, levels = c("F", "M"),
                 labels = c("Female", "Male")
    )
  ) |> 
  ggplot(
    mapping = aes(
      x = sex, 
      y = percentage_score, 
      fill = sex
    )
  ) +
  geom_boxplot(
    col = "black"
  ) +
  labs(
    title = paste0("Distribution of Students Performance",
                   "in GP School and MS School across Gender"),
    caption = "Data Source: UCI Machine Learning Archive"
  ) +
  scale_fill_discrete(palette = "set2") +
  scale_y_continuous(
    breaks = seq(0, 100, 25),
    labels = label_percent(scale = 1)
  ) +
  facet_wrap(~school) +
  theme(
    legend.position = "none",
    axis.title = element_blank()
  ) +
  theme_light(base_size = 8)

# Controlling axes labels

# Customizing themes
~ tilde













