## EDA 

# Libraries
library(tidyverse)
library(knitr)
library(kableExtra)
library(ggplot2)
library(plotly)
library(mice)


# Data
data_2021 <- read.csv("data/Elecciones MX 2021 - Captura - TODOS.csv") %>% filter(!is.null(person_id)) %>% filter(person_id!="NA")
data_2024 <- read.csv("data/Elecciones MX 2024 - Captura - Captura.csv") %>% filter(!is.null(person_id)) %>% filter(person_id!="NA")
data_2022 <- read.csv("data/Gobernantes MX 2022 - Captura - TODOS.csv") %>% filter(!is.null(person_id)) %>% filter(person_id!="NA")


# Data look
data_2021 %>% glimpse()
data_2024 %>% glimpse()
data_2022 %>% glimpse()

# Rows
nrow(data_2021)
nrow(data_2022)
nrow(data_2024)

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

# Comparing roles
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

# Calculating the percentage of NA values for each column
na_2021 <- sapply(data_2021, function(x) sum(is.na(x)) / length(x) * 100)
na_2024 <- sapply(data_2024, function(x) sum(is.na(x)) / length(x) * 100)
na_2022 <- sapply(data_2022, function(x) sum(is.na(x)) / length(x) * 100)

# Convert the results to data frames
na_df_2021 <- data.frame(Column = names(na_2021), `2021` = na_2021)
na_df_2024 <- data.frame(Column = names(na_2024), `2024` = na_2024)
na_df_2022 <- data.frame(Column = names(na_2022), `2022` = na_2022)

# Join the data frames 
na_comparison_df <- reduce(list(na_df_2021, na_df_2022, na_df_2024), full_join, by = "Column")

# Print the table
pretty_na_table <- kable(na_comparison_df, format = "html", booktabs = TRUE, caption = "Percentage of NA Values by Year and Column") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = F) %>%
  row_spec(0, bold = TRUE, background = "#D3D3D3")  # Resaltar el encabezado de la tabla

pretty_na_table

# Identify common columns
common_columns <- list(data_2021, data_2024, data_2022) %>%
  lapply(names) %>%
  reduce(intersect)
print(common_columns)


#Data cleaning (WIP)

data_2021 %>% colnames()

data_2021$full_name %>% str_replace_all(" ", "_") %>% str_to_lower() %>% str_replace_all("á", "a") %>% str_replace_all("é", "e") %>% str_replace_all("í", "i") %>% str_replace_all("ó", "o") %>% str_replace_all("ú", "u") %>% str_replace_all("ñ", "n") %>% str_replace_all("ü", "u")


# Function to summarize both numerical and categorical data
summarize_data <- function(data) {
  num_summary <- data %>% select_if(is.numeric) %>% summary()
  cat_summary <- data %>% select_if(is.factor) %>% sapply(table)
  list(Numerical = num_summary, Categorical = cat_summary)
}

summarize_data(data_2021)
summarize_data(data_2022)
summarize_data(data_2024)


# Create the ggplot object separately
plot_gg <- data_2021 %>% 
  count(role_type) %>% 
  ggplot(aes(x = role_type, y = n, fill = role_type)) +
  geom_col() +
  coord_flip() +
  labs(title = "Distribución de Roles", x = "Roles", y = "Conteo")

# Convert ggplot object to an interactive plotly object
ggplotly(plot_gg)

# Normalize the 'full_name' column
data_2021$full_name <- data_2021$full_name %>% 
  str_replace_all(" ", "_") %>% 
  str_to_lower() %>% 
  str_replace_all("[áàäâã]", "a") %>% 
  str_replace_all("[éèëê]", "e") %>% 
  str_replace_all("[íìïî]", "i") %>% 
  str_replace_all("[óòöôõ]", "o") %>% 
  str_replace_all("[úùüû]", "u") %>% 
  str_replace_all("ñ", "n")

# Normalize the 'full_name' column
data_2022$full_name <- data_2022$full_name %>% 
  str_replace_all(" ", "_") %>% 
  str_to_lower() %>% 
  str_replace_all("[áàäâã]", "a") %>% 
  str_replace_all("[éèëê]", "e") %>% 
  str_replace_all("[íìïî]", "i") %>% 
  str_replace_all("[óòöôõ]", "o") %>% 
  str_replace_all("[úùüû]", "u") %>% 
  str_replace_all("ñ", "n")

# Normalize the 'full_name' column
data_2024$full_name <- data_2024$full_name %>% 
  str_replace_all(" ", "_") %>% 
  str_to_lower() %>% 
  str_replace_all("[áàäâã]", "a") %>% 
  str_replace_all("[éèëê]", "e") %>% 
  str_replace_all("[íìïî]", "i") %>% 
  str_replace_all("[óòöôõ]", "o") %>% 
  str_replace_all("[úùüû]", "u") %>% 
  str_replace_all("ñ", "n")

#columns 
data_2021 %>% colnames()
data_2022 %>% colnames()
data_2024 %>% colnames()

# Group and count by area and gender
gender_distribution_by_level <- data_2021 %>%
  group_by(area, gender) %>%
  summarise(count = n(), .groups = 'drop')

# Group and count by area and last degree of studies
education_distribution_by_level <- data_2021 %>%
  group_by(area, last_degree_of_studies) %>%
  summarise(count = n(), .groups = 'drop')

# Plotting gender distribution by level (area)
gender_distribution_by_level %>%
  ggplot(aes(x = area, y = count, fill = gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Gender Distribution by Level", x = "Level", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Plotting education level distribution by level (area)
education_distribution_by_level %>%
  ggplot(aes(x = area, y = count, fill = last_degree_of_studies)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Education Level Distribution by Level", x = "Level", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Role type distribution by area and gender
role_gender_area <- data_2021 %>%
  group_by(area, role_type, gender) %>%
  summarise(count = n(), .groups = 'drop')

# Plotting role type distribution by area and gender
role_gender_area %>%
  ggplot(aes(x = role_type, y = count, fill = gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~area) +
  labs(title = "Role Type Distribution by Area and Gender", x = "Role Type", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Cross-tabulation of gender and last degree of studies by area
ctab_gender_education <- table(data_2021$area, data_2021$gender, data_2021$last_degree_of_studies)

# Heatmap of the cross-tabulation
library(ggplot2)
library(reshape2)

# Melt the table for heatmap
melted_ctab <- melt(ctab_gender_education)
colnames(melted_ctab) <- c("Area", "Gender", "Education", "Count")

# Heatmap plot
ggplot(melted_ctab, aes(x = Gender, y = Education, fill = Count)) +
  geom_tile() +
  facet_wrap(~Area) +
  scale_fill_gradient(low = "white", high = "steelblue") +
  labs(title = "Heatmap of Gender and Education by Area", x = "Gender", y = "Education") +
  theme_minimal()

# Simple network visualization
library(igraph)

# Example graph data (adjust to actual relationships in your data)
edges <- data.frame(from = sample(data_2021$role_type, 20, replace = TRUE),
                    to = sample(data_2021$role_type, 20, replace = TRUE))

graph <- graph_from_data_frame(edges)
plot(graph, vertex.size = 10, vertex.label.cex = 0.8, edge.arrow.size = 0.5)
