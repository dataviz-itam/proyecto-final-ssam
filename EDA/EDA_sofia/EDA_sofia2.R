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


