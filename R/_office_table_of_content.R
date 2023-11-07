library(officer)
library(flextable)
library(magrittr)

mytxt <- paste(rep("The quick brown fox jumped over the lazy dog.", 30), collapse = " ")
long_cap <- "This is my table caption. It can span many lines and take up much space on the page."
tab_seq_id <- "Table"

ft <- flextable(head(mtcars))

# get_caption <- function(bookmark){
#   par <- list(
#     ftext("Table "),
#     run_word_field("STYLEREF 1 \\s"),
#     ftext("-"),
#     run_word_field("SEQ Table \u005C* Arabic")
#   )
#   run_bookmark(bookmark, par)
# }
# 
# 
# fptxt <- fpar(
#   "This is a cross reference to the first table (",
#   run_reference("my_table1"),
#   ") and this is a reference to the second table (",
#   run_reference("my_table2"), ").",
#   ") and a third table in a new section (",
#   run_reference("my_table3"), ")."
# )


rpt <- read_docx() %>% 
  body_add_toc(style = "Table Caption") %>% 
  body_add_par("A section", style = "heading 1") %>% 
  body_add_par(value = mytxt, style = "Normal") %>% 
  body_add_par("Another section", style = "heading 1") %>% 
  body_add_flextable(value = ft) %>% 
  # Add a table of contents
  body_add_toc(doc, title = "Table of Contents", level = 1:2)




print(rpt, "fig_sec_num.docx")
