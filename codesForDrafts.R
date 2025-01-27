
# clean memory ------------------------------------------------------------
rm(list = ls())


# read in data ------------------------------------------------------------
#set working directory

filename="theFile.csv"
mydata=read.csv(filename)


# see data ----------------------------------------------------------


head(mydata)

 

# see data types ----------------------------------------------------------

str(mydata)

# deliverable 1 ----------------------------------------------------------
library(ggplot2)

base= ggplot(data=mydata) 
del1Draft= base + 
  geom_bar(aes(x = LocaleType), stat = "count") +
  labs(
    title = "Count of Schools in the state of Washington",
    subtitle = "Distribution of school in different Locale Types",
    x = "Locale Type",
    y = "Count",
    caption = "Source: Instructions given at Magallanes Reyes (2022), and Aden-Buie et al. (2024)."
  ) +
  theme_minimal() +
  
  annotate("text", x = 3, y = 820, label = "Max 800 in Suburb", color = "blue", size = 4)
  
del1Draft


# save del1Draft ----------------------------------------------------------
saveRDS(del1Draft, file = "del1Draft.rds")


# deliverable 2 ----------------------------------------------------------

del2Draft <- ggplot(data = mydata, aes(x = Student.Teacher.Ratio)) +
  geom_histogram(binwidth = 5, fill = "steelblue", color = "black") +
  labs(
    title = "Distribution of Student-Teacher Ratios in Washington State Schools",
    subtitle = "An analysis of student-teacher ratios based on data from all schools in Washington State",
    x = "Student.Teacher.Ratio",
    y = "Count",
    caption = "Source: Instructions given at Magallanes Reyes (2022), and Aden-Buie et al. (2024)."
  ) +
  theme_minimal() +
annotate("text", x = 100, y = 1000, label = "Max count for the ratio is 1030", color = "blue", size = 4)

del2Draft

# save del2Draft ----------------------------------------------------------
saveRDS(del2Draft, file = "del2Draft.rds")

# deliverable 3 ----------------------------------------------------------

library(readxl)
Arrests <- read_excel("MSP_DFS_Arrests.xlsx")
View(Arrests)

summary(Arrests)
str(Arrests)

del3Draft= ggplot(data = Arrests, aes(x = `Arrest Type`, y = Age)) +
  geom_boxplot() +
  stat_summary(
    fun = mean, 
    geom = "point", 
    shape = 20, 
    size = 3, 
    color = "red"
  ) +
  stat_summary(
    fun = mean, 
    geom = "text", 
    aes(label = round(..y.., 1)),
    color = "black",
    vjust = -0.5, 
    size = 3
  ) +
  labs(
    title = "Personal arrested in Year 2019 - 2020 ",
    subtitle = "Age of Personal arrested for different arrest types in MA state",
    x = NULL,
    y = "Age",
    caption = "Source: https://github.com/DACSS-Visual/tabular_bivar_catcat/raw/refs/heads/main/data"

  )+
  theme_minimal()

del3Draft 

# save del3Draft ----------------------------------------------------------
saveRDS(del3Draft, file = "del3Draft.rds")


# deliverable 4 -----------------------------------------------------------

library(sf)
library(ggplot2)
library(dplyr)
library(readxl)

# Load the spatial data (zip code boundaries)
zip_code <- sf::read_sf("https://raw.githubusercontent.com/DACSS-Visual/SpatialData/refs/heads/main/data/zip_codes.json")

# Load the contributions data
BostonContrib <- read_excel("BostonContrib.xlsx")

BostonContrib_normalized <- BostonContrib %>%
  group_by(Zip, TenderTypeDescription) %>%
  summarize(Average_Contribution = mean(Amount, na.rm = TRUE), .groups = "drop")

zip_code <- zip_code %>%
  mutate(ZIP5 = as.character(ZIP5))

myMapContrib <- zip_code %>%
  left_join(BostonContrib_normalized, by = c("ZIP5" = "Zip"))

subset_tender_types <- c("Cash", "Check")
myMapContrib_subset <- myMapContrib %>%
  filter(TenderTypeDescription %in% subset_tender_types)


del4Draft <- ggplot(data = myMapContrib_subset) +
  geom_sf(aes(fill = Average_Contribution), color = "white") +
  scale_fill_viridis_c(option = "plasma", name = "Avg Contribution") +
  facet_wrap(~ TenderTypeDescription ) +
  theme_void() +
  labs(
    title = "Comparing Average Contribution Patterns Across Massachusetts Zip Codes by Tender Type Cash and Check",
    
    
    caption = "Data source: BostonContrib.xlsx & zip_codes.json"
  )

del4Draft


# save del4Draft ----------------------------------------------------------
saveRDS(del4Draft, file = "del4Draft.rds")






