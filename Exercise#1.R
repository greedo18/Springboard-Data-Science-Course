install.packages("readr")
library(readr)
install.packages("dplyr")
library(dplyr)
install.packages("tidyr")
library(tidyr)

refine <- read_csv("C:/Users/greed/OneDrive/Documents/Springboard/refine.csv")
View(refine)

refine_df <- tbl_df(refine)

#correct spelling after arranging in order
refine_df %>%
  arrange(company)
colnames(refine_df) <- make.names(colnames(refine_df))
refine_df$company[8:16] <-"phillips"
refine_df$company[1:7] <- "akzo"

refine_df$company[21:25] <-"van houten"
refine_df$company[17:20] <-"unilever"

# seperate prodcut code and number into 2 columns
refine_df <- refine_df %>% separate(Product.code...number, c("product code", "product number"), sep = "-")
# add product category column based on code
prod_code <- refine_df$`product code`
prod_code <- gsub("p", "Smartphone", prod_code)
prod_code <- gsub("v", "TV", prod_code)
prod_code <- gsub("x", "Laptop", prod_code)
prod_code <- gsub("q", "Tablet", prod_code)
prod_code_df <- tbl_df(prod_code)
refine_df <- cbind.data.frame(refine_df, prod_code_df)
colnames(refine_df)[8] = "Product Category"


#add full address column
refine_df <-refine_df %>% unite(full_address, address, city, country, sep = ",")


# dummy variables for company and product category
refine_df <- refine_df %>% group_by(company) %>% spread(company, `Product Category`, fill = 0)

