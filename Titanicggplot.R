# MAke titanic avaliable in your workspace
install.packages("titanic")
library(titanic)
# look at stcuture of titanic and names of col- Use training data 
str(titanic_train)
View(titanic_train)

# Use ggplot to examine the distrubution of gender/sex within each class of the ship. The independent variable is class and the dependent var is sex/gender
#Use 'dodge" to prevent overlapping beteen the class type

ggplot(titanic_train, aes(x = factor(Pclass), fill = factor(Sex))) + 
  geom_bar(position = "dodge")

# Expand on the class and sex bar graph by examining how likely one is to survive in each class based on gender/sex
ggplot(titanic_train, aes(x = factor(Pclass), fill = factor(Sex))) + 
  geom_bar(position = "dodge") + 
  facet_grid(. ~ Survived)

# jitter position
posn.j <- position_jitter(0.5, 0)

# This plot we color the plot based on the factorization of Sex, and add a geom_jitter and again add the facet. The color allows for  better visualization of gender
ggplot(titanic_train, aes(x = factor(Pclass), y = Age, col = factor(Sex))) + 
  geom_jitter(size = 3, alpha = 0.5, position = posn.j) + 
  facet_grid(. ~ Survived)