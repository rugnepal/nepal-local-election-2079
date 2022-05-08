

library(shiny)
library(DT)
library(metathis)

candidates_list <- readRDS("local-election-candidates/data/candidates_list.rds")
filter_list <- readRDS("local-election-candidates/data/filter_list.rds")
col_labels <- attr(candidates_list, "variable.labels")

# designation_list <- candidates_list$designation |> unique()
# party_list <- candidates_list$political_party |> unique()
# province_list <- unique(candidates_list$province)
# district_list <- unique(candidates_list$district)
# local_list <- unique(candidates_list$local_level)