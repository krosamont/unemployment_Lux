#Packages that we need
if(!require('feather')) install.packages('feather')
library(feather)
if(!require('tidyverse')) install.packages('tidyverse')
library(tidyverse)
if(!require('ggiraph')) install.packages('ggiraph')
library(ggiraph)
if(!require('ggthemes')) install.packages('ggthemes')
library(ggthemes)

#Im not sure right now if we still need the 3 last packages.
if(!require('mapproj')) install.packages('mapproj')
library(mapproj)
if(!require('gdtools')) install.packages('gdtools')
library(gdtools)
if(!require('bindrcpp')) install.packages('bindrcpp')
library(bindrcpp)

#The path where the data is located
path="Put/Your/Path/Here/"

        function(input, output, session) {
                #Data that we use
                data_final <-reactive({
                        final_yy <- read_feather(path,paste("/data_feather_unemp_", input$year,".feather", sep=""))
                        
                        #Basic ggplot graph
                        p <- ggplot(final_yy, aes(x=long, y=lat)) + theme_classic() +
                                geom_polygon_interactive(aes(
                                        fill = cat_unemp,
                                        group = commune,
                                        tooltip = ttip,  # tooltip to show on over
                                        onclick = click, # javascript to run on click
                                        data_id = unemp_rate
                                )) + 
                                labs(title = " ", y = "", x = "", fill = "Unemployment Rate") +
                                scale_fill_brewer(palette = "Greens", direction = 1) +                                
                                theme_tufte(ticks = FALSE) +
                                theme(axis.text = element_blank(), axis.title = element_blank()
                                ) 
                        
                        p
                })
                
                #Adding interactivity
                output$plot <- renderggiraph({
                        ggiraph(code = {print(data_final())}, hover_css = "fill-opacity:.8;cursor:pointer;fill:#67001f;stroke-width:2;stroke:black;",
                                selected_css = "fill-opacity:1",
                                selection_type = "multiple"
                        )
                })
                
                
                
        }
