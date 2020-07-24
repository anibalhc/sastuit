# libraries

# install.packages("tm")
# install.packages("SnowballC")
# install.packages("readr")
# install.packages("dplyr")
# install.packages("shinythemes")
# install.packages("shinydashboard")
# install.packages("rtweet")
# install.packages("data.table")
# install.packages(DT)
# install.packages("stringi")

#install.packages("sweetalertR")

#install.packages("shinyBS")

library(shiny)
library(rtweet)
library("shinydashboard")
library("data.table")
library("shinythemes")
library(DT)

library(shinyBS)

#Text mining packages
library(tm)
library(SnowballC)
library(readr)
library(dplyr)
library(stringi)
library(textclean)
library(stringr)


#library(caTools)

#alert
library(shinyWidgets)


library("shinyjs")

#trim
library("gdata")

library(qdap)

library(tableHTML)


library("e1071")

list.of.packages <- c("e1071", "shinyBS")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)


