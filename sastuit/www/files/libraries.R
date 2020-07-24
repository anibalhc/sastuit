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


#library("e1071")
using<-function(...) {
    libs<-unlist(list(...))
    req<-unlist(lapply(libs,require,character.only=TRUE))
    need<-libs[req==FALSE]
    if(length(need)>0){ 
        install.packages(need)
        lapply(need,require,character.only=TRUE)
    }
}

using("e1071")

library("e1071")




