library(officer)

# doc = read_docx() %>% 
#   body_add_par("This is an R tutorial on officer R package", style = "Title")
# 
# print(doc,"test.docx")

# report with logo
# Set the correct path to the image file
logo_path <- "/home/franklin/Documents/workflows/snippets/data_analysis_snippets/R/kemri.png"
# team formatting heading template
team_heading = fp_text(
  color = "#b5332a",
  bold = T,
  font.size = 25,
  # underlined = T,
  # font.family = "MV Boli"
)

format_team_heading = ftext( "Thika Level 5 Hospital", team_heading) %>% fpar()

# 600x72 pixels
doc <- read_docx() %>%
  body_add_img(src = logo_path, width = 4, height = 0.5, style = "centered", pos = "after") %>% 
  body_add_par("") %>% body_add_par("") %>% 
  body_add(format_team_heading, style = "centered") %>% 
  body_add_par("") %>% 
  
  # history of the club
  body_add_par("History of the Club", style = "heading 1") %>% 
  body_add_par("") %>% 
  body_add_par("The club started somehwere in the Year 1995") %>% 
  body_add_par("") %>% 
  
  body_add_break() %>% 
  body_add_table(mtcars, style = "table_template")
  

print(doc,"test.docx")