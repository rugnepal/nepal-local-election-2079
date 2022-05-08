library(tidyverse)
library(nepalidate)

candidates_list <- read_csv(
  "local-election-candidates/data/Candidate_Nomination_System_Entry_upto_2079_01_20_Time_6_PM - उम्मेदवारी.csv"
  ) %>% select(-8) 


labels <- names(candidates_list)


names(candidates_list) <- c("province", "district", "local_level", "ward", "designation", 
                            "candidates_list", "political_party")

attr(candidates_list, "variable.labels") <- labels

candidates_list <- nepali_number(candidates_list, var_name = ward, col=ward)

candidates_list$ward <- stringr::str_squish(candidates_list$ward)

candidates_list$ward <- ifelse(is.na(candidates_list$ward), "", candidates_list$ward) 

filter_list <- candidates_list[c(1:4)] %>% unique()

# factorize data
candidates_list$designation <- as.factor(candidates_list$designation)
candidates_list$political_party <- as.factor(candidates_list$political_party)
# candidates_list$ward <- as.factor(candidates_list$ward)


saveRDS(filter_list, "local-election-candidates/data/filter_list.rds")

saveRDS(candidates_list, "local-election-candidates/data/candidates_list.rds")



