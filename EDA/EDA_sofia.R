## EDA 

# Libraries
library(tidyverse)
library(knitr)
library(kableExtra)


# Data
data_2021 <- read.csv("data/Elecciones MX 2021 - Captura - TODOS.csv") %>% filter(!is.null(person_id)) %>% filter(person_id!="NA")
data_2024 <- read.csv("data/Elecciones MX 2024 - Captura - Captura.csv") %>% filter(!is.null(person_id)) %>% filter(person_id!="NA")
data_2022 <- read.csv("data/Gobernantes MX 2022 - Captura - TODOS.csv") %>% filter(!is.null(person_id)) %>% filter(person_id!="NA")


# Data look
data_2021 %>% glimpse()
data_2024 %>% glimpse()
data_2022 %>% glimpse()


# Columns
data_2021 %>% colnames()
data_2024 %>% colnames()
data_2022 %>% colnames()

# Summary
summary(data_2021)
summary(data_2024)
summary(data_2022)

# Count by role_type
data_2021 %>% count(role_type)
data_2024 %>% count(role_type)
data_2022 %>% count(role_type)

# Plots
data_2021 %>% 
  count(role_type) %>% 
  ggplot(aes(x = role_type, y = n, fill = role_type)) +
  geom_col() +
  coord_flip() +
  labs(title = "Distribución de Roles", x = "Roles", y = "Conteo")


data_2022 %>% 
  count(role_type) %>% 
  ggplot(aes(x = role_type, y = n, fill = role_type)) +
  geom_col() +
  coord_flip() +
  labs(title = "Distribución de Roles", x = "Roles", y = "Conteo")


data_2024 %>% 
    count(role_type) %>% 
    ggplot(aes(x = role_type, y = n, fill = role_type)) +
    geom_col() +
    coord_flip() +
    labs(title = "Distribución de Roles", x = "Roles", y = "Conteo")

# Comparar el número de roles entre diferentes años
roles_2021 <- data_2021 %>% count(role_type)
roles_2024 <- data_2024 %>% count(role_type)
roles_2022 <- data_2022 %>% count(role_type)

combined_roles <- bind_rows(
  roles_2021 %>% mutate(year = 2021),
  roles_2022 %>% mutate(year = 2022),
  roles_2024 %>% mutate(year = 2024)
)

ggplot(combined_roles, aes(x = role_type, y = n, fill = as.factor(year))) +
  geom_col(position = "dodge") +
  coord_flip() +
  labs(title = "Evolución de Roles por Año", x = "Roles", y = "Conteo")


# NA values %
sapply(data_2021, function(x) sum(is.na(x)) / length(x)) * 100
sapply(data_2024, function(x) sum(is.na(x)) / length(x)) * 100
sapply(data_2022, function(x) sum(is.na(x)) / length(x)) * 100

# Full join 
temp_data_21_22 <- full_join(data_2021, data_2022, by = "person_id", suffix = c(".2021", ".2022"))
combined_data <- full_join(temp_data_21_22, data_2024, by = "person_id", suffix = c(".prev", ".2024"))

# Glimpse
glimpse(combined_data)

# Columns 
colnames(combined_data)

# Table
example_data <- head(combined_data, 10)

# Crear la tabla con kable y personalizarla con kableExtra
pretty_table <- kable(example_data, "html", booktabs = TRUE) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = F) %>%
  column_spec(1, bold = T, color = "red") %>%
  scroll_box(width = "100%", height = "500px")

# NA values %
sapply(combined_data, function(x) sum(is.na(x)) / length(x)) * 100
