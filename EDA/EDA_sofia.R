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

library(dplyr)
library(knitr)
library(kableExtra)

# Calcular los porcentajes de NA para cada conjunto de datos
na_2021 <- sapply(data_2021, function(x) sum(is.na(x)) / length(x) * 100)
na_2024 <- sapply(data_2024, function(x) sum(is.na(x)) / length(x) * 100)
na_2022 <- sapply(data_2022, function(x) sum(is.na(x)) / length(x) * 100)

# Convertir a dataframes
na_df_2021 <- data.frame(Column = names(na_2021), `2021` = na_2021)
na_df_2024 <- data.frame(Column = names(na_2024), `2024` = na_2024)
na_df_2022 <- data.frame(Column = names(na_2022), `2022` = na_2022)

# Hacer join de los dataframes para comparar
na_comparison_df <- reduce(list(na_df_2021, na_df_2022, na_df_2024), full_join, by = "Column")

# Crear la tabla con kable y personalizarla con kableExtra
pretty_na_table <- kable(na_comparison_df, format = "html", booktabs = TRUE, caption = "Percentage of NA Values by Year and Column") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = F) %>%
  row_spec(0, bold = TRUE, background = "#D3D3D3")  # Resaltar el encabezado de la tabla

# Mostrar la tabla
pretty_na_table

# Identificar columnas comunes
# Identificar columnas comunes usando reduce e intersect
common_columns <- list(data_2021, data_2024, data_2022) %>%
  lapply(names) %>%
  reduce(intersect)

# Imprimir las columnas comunes
print(common_columns)

