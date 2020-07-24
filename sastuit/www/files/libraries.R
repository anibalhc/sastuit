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


install.packages(setdiff(c("e1071"), rownames(installed.packages())))
