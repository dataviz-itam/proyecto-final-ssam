## EDA 

# Libraries
library(tidyverse)
library(knitr)
library(kableExtra)
library(ggplot2)
library(plotly)
library(mice)


# Data
elecciones_2024_district_types <- read.csv("EDA/EDA_sofia/24may/Elecciones MX 2024 - Estructura_Catalog district_types.csv")
elecciones_2024_gender <- read.csv("EDA/EDA_sofia/24may/Elecciones MX 2024 - Estructura_Catalogue gender.csv")
elecciones_2024_profession <- read.csv("EDA/EDA_sofia/24may/Elecciones MX 2024 - Estructura_Catalogue profession.csv")
elecciones_2024_role_types <- read.csv("EDA/EDA_sofia/24may/Elecciones MX 2024 - Estructura_Catalogue role_types.csv")
elecciones_2024_studies <- read.csv("EDA/EDA_sofia/24may/Elecciones_MX_2024-Estructura_Catalogue degrees_of_studies.csv")
elecciones_2024_party <- read.csv("EDA/EDA_sofia/24may/Elecciones_MX_2024-Estructura_Table_party.csv")
elecciones_2024_area <- read.csv("EDA/EDA_sofia/24may/Elecciones MX 2024 - Estructura_Table area.csv")
elecciones_2024_chamber <- read.csv("EDA/EDA_sofia/24may/Elecciones MX 2024 - Estructura_Table chamber.csv")
elecciones_2024_coalition <- read.csv("EDA/EDA_sofia/24may/Elecciones MX 2024 - Estructura_Table coalition.csv")
elecciones_2024_contest <- read.csv("EDA/EDA_sofia/24may/Elecciones MX 2024 - Estructura_Table contest.csv")
elecciones_2024_role <- read.csv("EDA/EDA_sofia/24may/Elecciones MX 2024 - Estructura_Table role.csv")



# Data look
elecciones_2024_district_types %>% glimpse()
elecciones_2024_gender %>% glimpse()
elecciones_2024_profession %>% glimpse()
elecciones_2024_role_types %>% glimpse()
elecciones_2024_studies %>% glimpse()
elecciones_2024_party %>% glimpse()
elecciones_2024_area %>% glimpse()
elecciones_2024_chamber %>% glimpse()
elecciones_2024_coalition %>% glimpse()
elecciones_2024_contest %>% glimpse()
elecciones_2024_role %>% glimpse()

# Rows
nrow(elecciones_2024_district_types)
nrow(elecciones_2024_gender)
nrow(elecciones_2024_profession)
nrow(elecciones_2024_role_types)
nrow(elecciones_2024_studies)
nrow(elecciones_2024_party)
nrow(elecciones_2024_area)
nrow(elecciones_2024_chamber)
nrow(elecciones_2024_coalition)
nrow(elecciones_2024_contest)
nrow(elecciones_2024_role)

# Columns
elecciones_2024_district_types %>% colnames()
elecciones_2024_gender %>% colnames()
elecciones_2024_profession %>% colnames()
elecciones_2024_role_types %>% colnames()
elecciones_2024_studies %>% colnames()
elecciones_2024_party %>% colnames()
elecciones_2024_area %>% colnames()
elecciones_2024_chamber %>% colnames()
elecciones_2024_coalition %>% colnames()
elecciones_2024_contest %>% colnames()
elecciones_2024_role %>% colnames()

# Summary
summary(elecciones_2024_district_types)
summary(elecciones_2024_gender)
summary(elecciones_2024_profession)
summary(elecciones_2024_role_types)
summary(elecciones_2024_studies)
summary(elecciones_2024_party)
summary(elecciones_2024_area)
summary(elecciones_2024_chamber)
summary(elecciones_2024_coalition)
summary(elecciones_2024_contest)
summary(elecciones_2024_role)

# Unique values
elecciones_2024_profession %>% head() %>% unique()
elecciones_2024_profession$description %>% unique() %>% length()

############################################

colnames(elecciones_2024_gender)
colnames(elecciones_2024_role)
colnames(elecciones_2024_party)

# Gráfica de barras para tipos de distritos
district_type_plot <- ggplot(elecciones_2024_district_types, aes(x = MEANING)) +
  geom_bar() +
  labs(title = "Distribución de Tipos de Distritos", x = "Tipo de Distrito", y = "Cantidad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar gráfica
district_type_plot


# Gráfica de barras para género
gender_plot <- ggplot(elecciones_2024_gender, aes(x = MEANING)) +
  geom_bar() +
  labs(title = "Distribución de Género", x = "Género", y = "Cantidad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar gráfica
gender_plot

# Gráfica de barras para profesiones
profession_plot <- ggplot(elecciones_2024_profession, aes(x = description)) +
  geom_bar() +
  labs(title = "Distribución de Profesiones", x = "Profesión", y = "Cantidad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar gráfica
profession_plot

# Gráfica de barras para niveles educativos
studies_plot <- ggplot(elecciones_2024_studies, aes(x = MX)) +
  geom_bar() +
  labs(title = "Distribución de Niveles Educativos", x = "Nivel Educativo", y = "Cantidad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar gráfica
studies_plot


# Gráfica de barras para partidos políticos
party_plot <- ggplot(elecciones_2024_party, aes(x = name)) +
  geom_bar() +
  labs(title = "Distribución de Partidos Políticos", x = "Partido Político", y = "Cantidad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar gráfica
party_plot

# Gráfica de barras para coaliciones
coalition_plot <- ggplot(elecciones_2024_coalition, aes(x = name)) +
  geom_bar() +
  labs(title = "Distribución de Coaliciones", x = "Coalición", y = "Cantidad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar gráfica
coalition_plot


# Gráfica de barras para tipos de roles
role_type_plot <- ggplot(elecciones_2024_role_types, aes(x = MEANING)) +
  geom_bar() +
  labs(title = "Distribución de Tipos de Roles", x = "Tipo de Rol", y = "Cantidad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar gráfica
role_type_plot


# Gráfica de barras para tipos de cámaras
chamber_plot <- ggplot(elecciones_2024_chamber, aes(x = name)) +
  geom_bar() +
  labs(title = "Distribución de Tipos de Cámaras", x = "Cámara", y = "Cantidad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar gráfica
chamber_plot

# Convertir las fechas a formato Date
elecciones_2024_contest <- elecciones_2024_contest %>%
  mutate(start_date = as.Date(start_date), end_date = as.Date(end_date),
         duration = as.numeric(difftime(end_date, start_date, units = "days")))


# Agregar tipo de distrito a la tabla de roles
roles_with_district <- elecciones_2024_role %>%
  left_join(elecciones_2024_area %>% select(area_id, district_type), by = "area_id") %>%
  left_join(elecciones_2024_district_types %>% select(ID, MEANING), by = c("district_type" = "ID"))

# Gráfica de barras para roles por tipo de distrito
roles_district_plot <- ggplot(roles_with_district, aes(x = MEANING, fill = role)) +
  geom_bar(position = "dodge") +
  labs(title = "Distribución de Roles por Tipo de Distrito", x = "Tipo de Distrito", y = "Cantidad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar gráfica
roles_district_plot

# Unir profesiones con roles y partidos

colnames(elecciones_2024_role)
colnames(elecciones_2024_profession)
colnames(elecciones_2024_party)

# Unir roles con cámaras
data_role_chamber <- elecciones_2024_role %>%
  left_join(elecciones_2024_chamber, by = "chamber_id")

# Gráfica de barras para roles por cámara
role_chamber_plot <- ggplot(data_role_chamber, aes(x = name, fill = role)) +
  geom_bar(position = "dodge") +
  labs(title = "Distribución de Roles por Cámara", x = "Cámara", y = "Cantidad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar gráfica
print(role_chamber_plot)

# Simular datos de estudios
set.seed(123)
data_study_district <- elecciones_2024_role %>%
  left_join(elecciones_2024_area, by = "area_id") %>%
  mutate(study_id = sample(elecciones_2024_studies$ID, n(), replace = TRUE)) %>%
  left_join(elecciones_2024_studies, by = c("study_id" = "ID"))

# Gráfica de barras para niveles educativos por tipo de distrito
study_district_plot <- ggplot(data_study_district, aes(x = district_type, fill = MX)) +
  geom_bar(position = "dodge") +
  labs(title = "Distribución de Niveles Educativos por Tipo de Distrito", x = "Tipo de Distrito", y = "Cantidad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar gráfica
print(study_district_plot)

# Gráfica de barras para comparación de coaliciones
coalition_plot <- ggplot(elecciones_2024_coalition, aes(x = name, fill = abbreviation)) +
  geom_bar() +
  labs(title = "Comparación de Coaliciones", x = "Coalición", y = "Cantidad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar gráfica
print(coalition_plot)


