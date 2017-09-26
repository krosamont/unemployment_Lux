### Introduction

This shiny application is a map of the Luxembourg unemployment rate by county and by year between 2001 and 2015.
This application is  composed of an interface file (**ui.R**) and a server file (**server.R**).

The data folder contains all the data related to unemployment. 

The www folder regroups all files that are related to the loading animation while the application downloads data:

 - **busy2.gif** is the animation
 
 - **js_part.js** is the code to trigger the gif animation
 
 - **stylessheet.css** is the css file for the style associated to the application.

You can see the shiny application in action [here](http://www.wozametrics.com/visualization/unemployment/)




### Before running the code

You have to provide the complete path of the data folder. You have to insert the path between the quote at the line 20 of server.R

<!-- -->

    19   #The path where the data is located
    20   path="Put/Your/Path/Here/"
    

Enjoy this application and if you have any issues to make it work correctly, you can always watch my [tutorial video](https://youtu.be/GHRZaiYh2Ac) or [contact me](mailto:kevinrosamont@ymail.com).
