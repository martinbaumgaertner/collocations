library(shiny)
library(tidyverse)


collocations<-readRDS(paste0("data/collocations.Rds"))

ui <- fluidPage(
  DT::dataTableOutput("collocation"),
  p("Collocations based on:"), 
  p("Blaheta, D., & Johnson, M. (2001, July). Unsupervised learning of multi-word verbs. In Proceedings of the 39th Annual Meeting of the ACL (pp. 54-60)."),
  p("Benoit K, Watanabe K, Wang H, Nulty P, Obeng A, Müller S, Matsuo A (2018). “quanteda: An R package for the quantitative analysis of textual data.” Journal of Open Source Software, 3(30), 774. doi: 10.21105/joss.00774, https://quanteda.io.")
)

server <- function(input, output) {

  output$collocation = DT::renderDataTable({collocations %>% 
      select(-count_nested,-length)})
}

shinyApp(ui = ui, server = server)
