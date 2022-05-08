
# Define UI for application
fluidPage(
  # Application title
  h2("उम्मेदवार सूची - स्थानीय तहको चुनाव"),
  h4("यो R/Shiny एप हो जसले २०७९-०१-३0 मा हुने स्थानीय तहको निर्वाचनको उम्मेदवारहरूको सूची प्रदान गर्दछ"),
  br(),
  br(),
  
  meta() %>%
    meta_social(
      title = "उम्मेदवार सूची - स्थानीय तहको चुनाव २०७९",
      description = "यो R/Shiny एप हो जसले २०७९-०१-३0 मा हुने स्थानीय तहको निर्वाचनको उम्मेदवारहरूको",
      url = "https://bjung.shinyapps.io/nepal-election-2079-candidates/",
      image = "https://english.onlinekhabar.com/wp-content/uploads/2021/08/election-commission.jpg",
      image_alt = "Local Election 2079 Nepal",
      twitter_creator = "@bjungbogati",
      twitter_card_type = "summary",
      twitter_site = "@bjungbogati"
    ),

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
    actionButton("submit", "खोजी गर्नुहोस"),
    br(), br(), br(),
    tags$a(
      href = "https://github.com/rugnepal/nepal-local-election-2079", 
      "स्रोत डाटा/कोड: नेपाल निर्वाचन आयोग/गीटहब "
    ), 
    p("डाटा अपडेट: २०७९-०१-२०")
  ),

  # main table
  mainPanel(
    dataTableOutput("table"),
    hr(),
    # tags$body(style = "overflow-y:hidden;height:100%;"),
    img(
      src = "https://english.onlinekhabar.com/wp-content/uploads/2021/08/election-commission.jpg",
      align = "left", style = "position: absolute; opacity: 0.4; width:85%;"
    )
  )
)