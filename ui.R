
# Define UI for application
fluidPage(
  # Application title
  h2("उम्मेदवार सूची - स्थानीय तहको चुनाव"),
  h4("यो R/Shiny एप हो जसले २०७९-०१-३0 मा हुने स्थानीय तहको निर्वाचनको उम्मेदवारहरूको सूची प्रदान गर्दछ"),
  br(),
  br(),
  
  #sidebar ui
  sidebarPanel(
    selectizeInput(
      "province", "प्रदेश", unique(candidates_list$province)
    ),
    
    selectizeInput(
      "district", "जिल्ला", ""
    ),
    selectizeInput(
      "local_level", "स्थानीय तह", ""
    ),
    selectizeInput(
      "ward", "वार्ड नं", ""
    ),
    
    checkboxInput(
      "in_candidate", "स्वतन्त्र उम्मेदवार", FALSE
    ),
    
    actionButton("submit", "खोजी गर्नुस")
  ),

  # main table 
  mainPanel(
    dataTableOutput("table"),
    hr(),
    tags$a(href = "https://github.com/rugnepal/nepal-local-election-2079", "Source Code: GitHub")
  )
)