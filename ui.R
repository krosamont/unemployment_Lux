if(!require('ggplot2')) install.packages('ggplot2')
library('ggplot2')
if(!require('ggiraph')) install.packages('ggiraph')
library('ggiraph')  

shinyUI(
        fixedPage(
                fluidPage(
                        tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "stylesheet.css")),
                        tags$head(tags$script(src="js_part.js")),
                        fluidRow(
                                #title
                                column(width=12, 
                                       titlePanel("Unemployment rate by municipalities in Luxembourg")
                                )
                        ),
                        fluidRow(
                                column(width=12,align="center",
                                       #Show the gif when the app is loading data
                                       tags$div(id="wait",conditionalPanel(condition="$('#plot').children().length==0||$('html').hasClass('shiny-busy')",
                                                                           tags$div(id="contentLoad",tags$img( id="loading",src="busy2.gif"))
                                                                           
                                       )),
                                       tags$div(id="graph",conditionalPanel(condition="!$('#plot').children().length==0&&!$('html').hasClass('shiny-busy')", ggiraphOutput("plot",width = "100%", height = "500px"))
                                       ))
                        ),
                        fluidRow(
                                column(width=10, 
                                       align="center",
                                       helpText("Note: Click on a municipality and you will be redirected to",
                                                "its Wikipedia page. Try it once ;)"))
                        ),
                        fluidRow(
                                #The button to change the year
                                column(width=10,align="center",
                                       tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: green}")),
                                       sliderInput("year", "Year:",
                                                   min = 2001 
                                                   , max = 2015 
                                                   , value = 2015
                                                   , step= 1, sep = ""))
                        )
                )
        )
)