
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
  # Add mean points
  stat_summary(
    fun = mean, 
    geom = "point", 
    shape = 20, 
    size = 3, 
    color = "red"
  ) +
  # Add mean values as text
  stat_summary(
    fun = mean, 
    geom = "text", 
    aes(label = round(..y.., 1)),  # Show mean value rounded to 1 decimal
    color = "black",
    vjust = -0.5,  # Position above the mean point
    size = 3
  ) +
  labs(
    title = "Boxplot of Age of Personal arrested in Massachusetts state",
    subtitle = "Visualizing age distribution with mean values across different arrest types",
    x = "Arrest Type",
    y = "Age",
    caption = "Source:https://github.com/DACSS-Visual/tabular_bivar_catcat/raw/refs/heads/main/data/MSP%20DFS%20Arrests%2019-20Q1.xlsx"
  )+
  annotate(
    "text", 
    x = 4, 
    y = 50, 
    label = "Avg age of 34.9 arrested with warrent", 
    color = "blue", 
    size = 4
  )+
  theme_minimal()

del3Draft 

# save del3Draft ----------------------------------------------------------
saveRDS(del3Draft, file = "del3Draft.rds")



