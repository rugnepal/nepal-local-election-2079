
# Define UI for application
fluidPage(
  # Application title
  h2("उम्मेदवार सूची - स्थानीय तहको चुनाव"),
  h4("यो R/Shiny एप हो जसले २०७९-०१-३0 मा हुने स्थानीय तहको निर्वाचनको उम्मेदवारहरूको सूची प्रदान गर्दछ"),
  br(),
  br(),

  # sidebar ui
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
    actionButton("submit", "खोजी गर्नुस"),
    br(), br(), br(),
    tags$a(
      href = "https://github.com/rugnepal/nepal-local-election-2079", 
      "Source Data/Code: GitHub"
    )
  ),

  # main table
  mainPanel(
    dataTableOutput("table"),
    hr(),
    tags$body(style = "overflow-y:hidden;height:100%;"),
    img(
      src = "https://english.onlinekhabar.com/wp-content/uploads/2021/08/election-commission.jpg",
      align = "left", style = "position: absolute; opacity: 0.4; width:85%;"
    )
  )
)