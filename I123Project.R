install.packages("ggplot2")
install.packages("tidyverse")
install.packages("maps")
library(ggplot2)
library(maps)
library(dplyr)
# Load required libraries

# Import California housing dataset

data <- read.csv("california_housing_train.csv")

# Create California state boundary
ca_outline <- map_data("state") %>% 
  filter(region == "california")
# Visualize population distribution across California
ggplot() +

  geom_polygon(
    data = ca_outline,
    aes(x = long, y = lat, group = group),
    fill = "gray95",
    color = "white"
  ) +
  
  
  geom_point(
    data = data,
    aes(x = longitude, y = latitude, color = population),
    alpha = 0.6,
    size = 1
  ) +
  
  scale_color_viridis_c() +
  labs(
    title = "Population Density Across California",
    x = "Longitude",
    y = "Latitude",
    color = "Population"
  ) +
  theme_minimal()
library(ggplot2)

# Analyze relationship between median income and population

ggplot(data, aes(x = median_income, y = population)) +
  geom_bin2d(bins = 40) +
  scale_fill_viridis_c() +
  labs(
    title = "Where Income and Population Intersect in California",
    x = "Median Income",
    y = "Population",
    fill = "Density"
  ) +
  theme_minimal()

library(tidyverse)
library(ggplot2)
library(maps)

# Create combined demographic visualization
ca_outline <- map_data("state") %>%
  filter(region == "california")


ggplot() +

  geom_polygon(
    data = ca_outline,
    aes(x = long, y = lat, group = group),
    fill = "gray95",
    color = "white"
  ) +
  
  geom_point(
    data = data,
    aes(
      x = longitude,
      y = latitude,
      size = population,
      color = median_income
    ),
    alpha = 0.7
  ) +
  
  scale_size(range = c(1, 8), name = "Population") +
  scale_color_viridis_c(name = "Median Income") +
  
  labs(
    title = "High-Income, High-Population Areas in California",
    x = "Longitude",
    y = "Latitude"
  ) +
  
  theme_minimal()

# Summarize dataset variables
summary(data)
install.packages("knitr")


